import logging
import os
from logging.handlers import RotatingFileHandler

log_path = "/data/proclog/log/detecttoredis/"
log_file_message = "/data/proclog/log/detecttoredis/detecttoredis.log"



try:
    if(not os.path.exists(log_path)):
        cmd = str("mkdir -p %s" % log_path);
        os.system(cmd);
    
    Rthandler_message = RotatingFileHandler(log_file_message, maxBytes=100*1024*1024, backupCount=50)
    
    formatter = logging.Formatter('%(asctime)s  %(levelname)8s  %(message)s')
    Rthandler_message.setFormatter(formatter)
    
    log_message = logging.getLogger("message")
    log_message.addHandler(Rthandler_message)
    log_message.setLevel(logging.DEBUG)
    
    
except Exception,e:
    print str(e)
