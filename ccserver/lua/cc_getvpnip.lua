require "os"

local cc_global=require "cc_global"

local MOD_ERR_BASE = cc_global.ERR_MOD_GETVPNIP_BASE

local _M = { 
    _VERSION = '1.0.1',
    MOD_ERR_ALLOC = MOD_ERR_BASE-1,
    MOD_ERR_DBINIT = MOD_ERR_BASE-2,
    MOD_ERR_DBDEINIT = MOD_ERR_BASE-3
}

local log = ngx.log
local ERR = ngx.ERR
local INFO = ngx.INFO



local mt = { __index = _M}



function _M.new(self)
	return setmetatable({}, mt)
end


function _M.getvpnip(self,db)
    local serverip={}
    serverip['serverip']='223.202.197.11'
    return serverip
end

function _M.process(self,userreq)
    local db = cc_global:init_conn()
    local serverip=self:getvpnip(db)
    cc_global:deinit_conn(db)
    cc_global:returnwithcode(0,serverip)

end

return _M
