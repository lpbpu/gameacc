# coding:utf-8
from BaseHTTPServer import HTTPServer, BaseHTTPRequestHandler
#from SocketServer import ThreadingMixIn
import threading
import sys
import getopt
import os
import json
import Queue
import time
import redis

from detecttodb_log import *


VERSION='0.1.0'


if (hasattr(os, "devnull")):
    NULL_DEVICE = os.devnull
else:
    NULL_DEVICE = "/dev/null"


DEBUG=0     # -d option
QUIET=0     # -q option

p_need_exit = 0;

main_thread_info = {};

reports = Queue.Queue()




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
    

class ReportHandler(BaseHTTPRequestHandler):
    def check_report(self,report):
        if report.has_key("vpnid") == False:
            return 0
        if report.has_key("gameid") == False:
            return 0
        if report.has_key("regionid") == False:
            return 0
        if report.has_key("detectdata") == False:
            return 0
        return 1
        
    
    def do_POST(self):
        global reports
        
        length = int(self.headers['Content-Length'])
        try:
            data=self.rfile.read(length)
            print(data)
            report=json.loads(data)
            if self.check_report(report):
                reports.put(report)
                self.send_response(200)
                self.end_headers()
            else:
                logerr("check report failed")
                self.send_error(400,'Bad Request')
            return
                        
        except Exception,e:
            logerr("exception in doPOST:" + str(e))
            self.send_error(400,'Bad Request')
        
        
        

#class ThreadedHTTPServer(ThreadingMixIn, HTTPServer):
#    """Handle requests in a separate thread."""

class ThreadedHTTPServer(HTTPServer):
    """Handle requests in a separate thread."""

def server_func():
    global p_need_exit

    try:
        server = ThreadedHTTPServer(('0.0.0.0', 8181), ReportHandler)
        server.serve_forever()
    except Exception,e:
        print("server exit with exception:" + str(e))
        logerr("server exit with exception:" + str(e))
        p_need_exit = 1;

def server_thread_func():
    global main_thread_info;
    tid = threading.Thread(target = server_func);
    tid.setDaemon(True);
    main_thread_info["server_thread"] = tid;

    tid.start();


def deal_report(r,report):
    vpnid=report["vpnid"]
    gameid=report["gameid"]
    regionid=report["regionid"]
    detectstr=report["detectdata"]
    
    try:
        loginfo("deal request for vpn " + str(vpnid) + ",game " + str(gameid) + ",region " + str(regionid))
		
		# get active id
		activeid_key="vpn_"+str(vpnid)+"_detect_activeid"
		activeid_field="game_"+str(gameid)+"_region_"+str(regionid)+"_activeid"

		exist=r.hexist(activeid_key,activeid_field)
		if exist==False:
			print("vpnid,gameid or regionid may not correct,skip this record")
			return

		activeid=r.hget(activeid_key,activeid_field)
		
		if activeid==-1:
			activeid=0
		else if activeid==0:
			activeid=1
		else
			activeid=0

		# set data
		detectlst=detectstr.split(',')
		if len(detectlst)==0:
			return

		detect_data_key="vpn_"+str(vpnid)+"_game_"+str(gameid)+"_region_"+str(regionid)+"_detect_data_"+str(activeid)
		r.delete(detect_data_key)

		for detectdata in detectlst:
			datalst=detectdata.split('/')
			#ip/port/mask/rtt/loss
			detect_data_value=datalst[0]+":"+datalst[1]+"/"+datalst[2]
			r.zadd(detect_data_key,datalst[3],detect_data_value)

		r.hset(activeid_key,activeid_field,activeid)
		

    
    except Exception,e:
        print("except in in deal_report:"+str(e))
        logerr("except in in deal_report:"+str(e))
        return
    
    
    


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
    
    
    try:
	   	r = redis.StrictRedis(host='192.168.14.157', port=6379, db=0,password='redis',encoding='utf-8')
        server_thread_func()
	
    except Exception,e:
        print("exception in main:"+str(e))
        logerr("exception in main:"+str(e))
        p_need_exit=1
    
    
    
    
	    
    
    while True:
        if(p_need_exit):
        	logerror("detecttodb exit ... ...")
        	time.sleep(1)
        	sys.exit(0)
        
        while not reports.empty():
            report=dict(reports.get())
            deal_report(r,report)

        time.sleep(5)
        
    
    
    
    
    
    
