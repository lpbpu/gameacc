require "os"

local cc_global=require "cc_global"

local MOD_ERR_BASE = cc_global.ERR_MOD_UPLOADINFO_BASE

local _M = { 
    _VERSION = '1.0.1',
    MOD_ERR_ALLOC = MOD_ERR_BASE-1,
    MOD_ERR_DBINIT = MOD_ERR_BASE-2,
    MOD_ERR_UPLOADINFO = MOD_ERR_BASE-3,
    MOD_ERR_DBDEINIT = MOD_ERR_BASE-4
}

local log = ngx.log
local ERR = ngx.ERR
local INFO = ngx.INFO



local mt = { __index = _M}



function _M.new(self)
	return setmetatable({}, mt)
end


function _M.init_conn(self)
    local mysql = require "resty.mysql"
    local db,err = mysql.new()
    if not db then
        cc_global:returnwithcode(self.MOD_ERR_ALLOC,nil)
    end
    
    db:set_timeout(5000)
    
    local ok,err,errcode,sqlstate = db:connect {
    	host = "127.0.0.1",
    	port = 3306,
    	database = "game",
    	user = "root",
    	password = "",
    	max_packet_size= 1024*1024,
    	compact_arrays = true }
    
    if not ok then
    	cc_global:returnwithcode(self.MOD_ERR_DBINIT,nil)
    end
    
    return db
end

function _M.deinit_conn(self,db)
    local ok,err = db:close()
    if not ok then
    	cc_global:returnwithcode(self.MOD_ERR_DBDEINIT,nil)
    end
end

function _M.uploadinfo(self,db,userreq)
    local cjson=require "cjson"
    local infostr=cjson.encode(userreq)
    
    local sql="insert into game_sdk_upload_tbl(content) values ('"..infostr.."')"
    log(ERR,sql)
    
    local res,err,errcode,sqlstate = db:query(sql)
    
    
    if not res then
    	cc_global:returnwithcode(self.MOD_ERR_UPLOADINFO,nil)
    end
    
    
end

function _M.process(self,userreq)
    local db = self:init_conn()
    self:uploadinfo(db,userreq)
    self:deinit_conn(db)
    cc_global:returnwithcode(0,nil)

end

return _M