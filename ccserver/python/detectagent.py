# coding:utf-8
import sys
import getopt
import os
import subprocess
import multiprocessing
import time
import urllib2
import json

from detectagent_log import *


VERSION='0.1.0'

local_config = {                                                                      \
                "detecturl":"http://games.nubesi.com/vpn/detectgame",                   \
                #"detecturl":"http://127.0.0.1/vpn/detectgame",                   \
		        "sleepinterval":14400,                   \
		        "concurrentnum":40,                    \
		        "reporturl":"http://223.202.197.12:8181/" \
		        #"reporturl":"http://127.0.0.1:8181/"      \
                };
                
if (hasattr(os, "devnull")):
    NULL_DEVICE = os.devnull
else:
    NULL_DEVICE = "/dev/null"
    
DEBUG=0     # -d option
QUIET=0     # -q option

p_need_exit = 0;

VPNID=-1    # vpnid of this node
GAMELST={}

AVA_INF=99999
LOSS_INF=100


def loginfo(fmt,*arg):
    log_message.info(fmt % arg)
    

def logerr(fmt,*arg):
    if (not QUIET):
        log_message.error(fmt % arg)

def logdebug(fmt,*arg):
    if ((not QUIET) and (DEBUG)):
        log_message.debug(fmt % arg)


def _redirectFileDescriptors():
    import resource  # POSIX resource information
    maxfd = resource.getrlimit(resource.RLIMIT_NOFILE)[1]
    if maxfd == resource.RLIM_INFINITY:
        maxfd = 1024

    for fd in range(0, maxfd):
        try:
            os.ttyname(fd)
        except:
            continue
        try:
            os.close(fd)
        except OSError:
            pass


    os.open(NULL_DEVICE, os.O_RDWR)

    os.dup2(0, 1)
    os.dup2(0, 2)



def python_daemon():

    if os.name != 'posix':
        logerr('Daemon is only supported on Posix-compliant systems.')
        return

    try:
        if(os.fork() > 0):
            os._exit(0)
    except OSError, e:
        logerr("fork failed ...");
        os._exit(1)


    os.chdir('/');
    os.setsid();
    os.umask(0);

    try:
        if(os.fork() > 0):
            os._exit(0)

        _redirectFileDescriptors()


    except OSError, e:
        logerr("fork failed ...")
        os._exit(1)





def getvpnid(ethip):
    vpnid=-1
  
    cmd = {
        'cmdid':3,
        'version':"0.1",
        'time':int(time.time())
    }
    
    headers={'Content-Type': 'application/json'}
        

    cmdparm={}
    cmdparm['vpnip']=ethip
    
    cmd['data']=cmdparm
        
    loginfo("get vpn id for ip " + ethip)
    
    try:    
        request=urllib2.Request(local_config['detecturl'],headers=headers,data=json.dumps(cmd))
        response=urllib2.urlopen(request)
        ret=response.read()
        retval=json.loads(ret)
        if retval['code'] != 0:
            logerr("getvpnid return with code " + str(retval['code']))
            return vpnid
        
        vpnid=retval['data']['vpnid']
        return vpnid
            
    except Exception,e:
        logerr("getvpnid excption:" + str(e))
        return vpnid
        
    
def getgamelst():
    global GAMELST
    
    cmd = {
        'cmdid':2,
        'version':"0.1",
        'time':int(time.time())
    }
    
    headers={'Content-Type': 'application/json'}
        
    loginfo("get gamelst")
    
    try:    
        request=urllib2.Request(local_config['detecturl'],headers=headers,data=json.dumps(cmd))
        response=urllib2.urlopen(request)
        ret=response.read()
        retval=json.loads(ret)
        if retval['code'] != 0:
            logerr("getgamelst return with code " + str(retval['code']))
            return ret
        
        GAMELST=retval['data']['gamelist']
        return            
    except Exception,e:
        logerr("getgamelst excption:" + str(e))
        return         




def getregioncfg(gameid,regionid):
    cmd = {
            'cmdid':1,
            'version':"0.1",
            'time':int(time.time())
    }

    headers={'Content-Type': 'application/json'}

    cmdparm={}
    cmdparm['gameid']=gameid
    cmdparm['regionid']=regionid
    
    cmd['data']=cmdparm
    
    try:    
        request=urllib2.Request(local_config['detecturl'],headers=headers,data=json.dumps(cmd))
        response=urllib2.urlopen(request)
        ret=response.read()
        retval=json.loads(ret)
        if retval['code'] != 0:
            logerr("getregioncfg return with code " + str(retval['code']))
            return []
        
        regioncfglst=retval['data']['detectregionlst']
        return regioncfglst
        
    except Exception,e:
        logerr("getregioncfg excption:" + str(e))
        return []


def filterloss(lineinfo):
	loss=LOSS_INF

	nr=lineinfo.find('% packet loss')
	if nr>0:
		tmpstr=lineinfo[0:nr]
		nl=tmpstr.rfind(',')
		if (nl>0):
			tmpstr=lineinfo[nl+1:nr]
			loss=int(tmpstr)
		
	return loss		
	

def filterava(lineinfo):
	ava=AVA_INF

	n=lineinfo.find('=')
	if n>0:
		tmpstr=lineinfo[n+1:]
		tmp2=tmpstr.split('/')
		ava1=float(tmp2[1])
        ava=int(ava1)

	return ava


def dopingdetect(cfglst):
    # ip/port/mask
    ava=AVA_INF
    loss=LOSS_INF
    
    cmd="ping -c 5 -W 2 " + cfglst[0]
    print(cmd)
    logdebug(cmd)
    
        
    try:
        sub_p = subprocess.Popen(cmd,shell=True,stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        cstdout = sub_p.stdout
        cstderr = sub_p.stderr
    except Exception,e:
        logerr("execute ping cmd exception:" + str(e))
        print("execute ping cmd exception:" + str(e))
        return ava,loss
	
    
    try:
        while True:
            lineinfo = cstdout.readline()
            if lineinfo:
                n=lineinfo.find('% packet loss')
                if n>0:
                    loss=filterloss(lineinfo)
                    continue
                n=lineinfo.find('min/avg/max/mdev')
                if n>0:
                    ava=filterava(lineinfo)
                
                
                if ava!=AVA_INF and loss!=LOSS_INF:
                    break
            else:
                break
        return ava,loss

    except Exception,e:
        logerr("read ping cmd out exception:" + str(e))
		print("read ping cmd out exception:" + str(e))
		return ava,loss

def dohpingdetect(cfglst):
    # ip/port/mask
    ava=AVA_INF
    loss=LOSS_INF
    
    cmd="hping -c 5 -S -p " + cfglst[1] +" " + cfglst[0]
    print(cmd)
    logdebug(cmd)
        
    try:
        sub_p = subprocess.Popen(cmd,shell=True,stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        cstdout = sub_p.stdout
        cstderr = sub_p.stderr
    except Exception,e:
        logerr("execute hping cmd exception:" + str(e))
        print("execute hping cmd exception:" + str(e))
        return ava,loss
	
    try:
        while True:
            lineinfo = cstderr.readline()
            if lineinfo:
                n=lineinfo.find('% packet loss')
                if n>0:
                    loss=filterloss(lineinfo)
                    if loss==LOSS_INF:          # if loss 100%,skip filter ava
                        break
                    continue
                
                n=lineinfo.find('min/avg/max')
                if n>0:
                    ava=filterava(lineinfo)
                
                if ava!=AVA_INF and loss!=LOSS_INF:
                	break
            else:
                break

        return ava,loss

    except Exception,e:
        logerr("read hping cmd out exception:" + str(e))
		print("read hping cmd out exception:" + str(e))
		return ava,loss


def dodetect(ipstr,queue):
    tmplst=ipstr.split('/')
    if len(tmplst)!=3:
        logerr("invalid ipstr:" + ipstr)
        print("invalid ipstr:" + ipstr)
        ipstr=ipstr+"/"+str(AVA_INF)+"/"+str(AVA_LOSS)
        queue.put(ipstr)
        return
    
    ava,loss=dopingdetect(tmplst)
    
    
    if ava==AVA_INF and loss==LOSS_INF:
        ava,loss=dohpingdetect(tmplst)
    
    ipstr=ipstr+"/"+str(ava)+"/"+str(loss)
    
    
    queue.put(ipstr)
    return
    
    

def getdetectvalue(regioncfg):
    pool = multiprocessing.Pool(processes=local_config["concurrentnum"])
    q = multiprocessing.Manager().Queue()
    
    iplst=regioncfg['iplist'].split(',')
    
    for ipstr in iplst:
        pool.apply_async(dodetect,(ipstr,q,))
    
    pool.close()
    pool.join()
    

    resultlist=[]

    while not q.empty():
        detectvalue=q.get()
        resultlist.append(detectvalue)
    
    loginfo(str(resultlist))
    

    return resultlist
    

def regionreport(gameid,regionid,resultlist):
    body = {}
    
    body['vpnid']=VPNID
    body['gameid']=gameid
    body['regionid']=regionid
    detectdatastr=','.join(resultlist)
    body['detectdata']=detectdatastr
    
    headers={'Content-Type': 'application/json'}

    
    
    try:    
        request=urllib2.Request(local_config['reporturl'],headers=headers,data=json.dumps(body))
        response=urllib2.urlopen(request)
        return
        
    except Exception,e:
        logerr("regionreport excption:" + str(e))


def detectregion(gameid,regionid):
    regioncfglst=getregioncfg(gameid,regionid)
    
    cfglstlen=len(regioncfglst)
    
    if cfglstlen>1:
        logerr("game "+str(gameid)+",region "+str(regionid)+" has more than one config,just skip it")
        return
    
    if cfglstlen==0:
        logerr("game "+str(gameid)+",region "+str(regionid)+" has no config,just skip it")
        return
    
    regioncfg=regioncfglst[0]
    
    resultlist=getdetectvalue(regioncfg)
    
    regionreport(gameid,regionid,resultlist)
    
      
    
def detectgamelst():
    for gameitem in GAMELST:
        gameid=gameitem['gameid']
        regionidstr=gameitem['regionlist']
        regionidlst=regionidstr.split(',')
        
        for regionid in regionidlst:
            detectregion(gameid,regionid)
        
        loginfo("report for game "+str(gameid) + ",region "+str(regionid))
            
        

    

def sys_command(cmd):
    f=os.popen(cmd)
    return f.read()        

def get_eth_ip():
    """
    获取本节点ip地址
    @return ip : ip地址，list类型
    """
    try:
        ip_string = sys_command("/sbin/ifconfig eth0 | grep inet\ addr")
        start = ip_string.find("inet addr:")
        if start < 0:
            return []
        ip_str = ip_string[start + len("inet addr:"):]
        ip = ip_str.split()[0]
        return [ip]
    except Exception,e:
        logerr("exception in running ifconfig " + str(e))
        ip_string = sys_command(
            "/bin/cat /etc/sysconfig/network-scripts/ifcfg-eth0 | grep IPADDR")
        ip_string = ip_string.split('\n')
        ip_string = [line for line in ip_string if '#' not in line]
        ip = ip_string[0].split('=')[1]
        if '"' in ip or '\'' in ip:
            ip = ip[1:-1]
        return [ip]

    


if __name__ == '__main__':
    try:
        opts,args = getopt.getopt(sys.argv[1:],"vdq")
    except getopt.GetoptError:
        print "illegal option(s) -- " + str(sys.argv[1:])
	sys.exit(0);


    for name,value in opts:
        if ( name == "-v" ):
            print VERSION
            sys.exit(0);
        
        if ( name == "-d" ):
            DEBUG = 1
        
        if ( name == "-q" ):
            QUIET = 1
   
    python_daemon()
    
    ethip=get_eth_ip()
    
    if len(ethip)==0:
        logerr("can't determine eth0 ip,exit...")
        sys.exit(1)
        
    loginfo("eth0 ip:" + str(ethip))
    
    VPNID=getvpnid(ethip[0])
    if VPNID<=0:
        logerr("vpn id invalid,exit...")
        sys.exit(2)    

    loginfo("vpnid=" + str(VPNID))
    
    while True:
        if(p_need_exit):
        	logerror("detectagent exit ... ...")
        	time.sleep(1)
        	sys.exit(0)
        
        getgamelst()
        detectgamelst()    
        time.sleep(local_config['sleepinterval'])
