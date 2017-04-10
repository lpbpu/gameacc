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
                #"detecturl":"http://games.nubesi.com/vpn/detectgame",                   \
                "detecturl":"http://127.0.0.1/vpn/detectgame",                   \
		        "sleepinterval":3600,                   \
		        "concurrentnum":200,                    \
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




def detectregion(gameid,regionid):
    regioncfglst=getregioncfg(gameid,regionid)
    
    if len(regioncfglst)>1:
        logerr("game "+str(gameid)+",region "+str(regionid)+" has more than one config,just skip it")
        return
    
    regioncfg=regioncfglst[0]
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
            
        
    
def detectgamelst():
    for gameitem in GAMELST:
        gameid=gameitem['gameid']
        regionidstr=gameitem['regionlist']
        regionidlst=regionidstr.split(',')
        
        for regionid in regionlst:
            detectregion(gameid,regionid)
            
        

    

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
   
    #python_daemon()
    
    ethip=get_eth_ip()
    
    ethip=["223.202.197.11"]

    
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
