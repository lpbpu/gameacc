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
        

def getvpnid():
    vpnid=-1
    
    cmd = {
        'cmdid':3,
        'version':"0.1",
        'time':int(time.time())
    }
    
    headers={'Content-Type': 'application/json'}
    
    cmdparm={}
    cmdparm['vpnip']="223.202.197.136"
    
    cmd['data']=cmdparm
        
    loginfo("get vpn id for ip 223.202.197.11")
    
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
    
    vpnid=getvpnid()
    
    print("vpnid="+str(vpnid))
    
    
    while True:
        if(p_need_exit):
            logerror("detectagent exit ... ...");
            time.sleep(1);
            sys.exit(0);

	    
        
        time.sleep(local_config['sleepinterval']);                
