require "os"

local detect_global=require "detect_global"

local MOD_ERR_BASE = detect_global.ERR_MOD_GETVPNID_BASE

local _M = { 
    _VERSION = '1.0.1',
    
    MOD_ERR_INVALID_PARAM = MOD_ERR_BASE-1,
    MOD_ERR_GETVPNID = MOD_ERR_BASE-2,
    MOD_ERR_NOSUCHVPN = MOD_ERR_BASE-3
    
}

local log = ngx.log
local ERR = ngx.ERR
local INFO = ngx.INFO



local mt = { __index = _M}



function _M.new(self)
	return setmetatable({}, mt)
end


function _M.checkparm(self,userreq)
    local gameid,regionid
    if userreq['data']==nil then
        detect_global:returnwithcode(self.MOD_ERR_INVALID_PARAM,nil)
    end
    
    local req_param=userreq['data']
    if req_param['vpnip'] == nil then
        detect_global:returnwithcode(self.MOD_ERR_INVALID_PARAM,nil)
    end
    
    self.vpnip=req_param['vpnip']
    
 
end


function _M.getvpnid(self,db)
    local sql
    local returnlst={}
    local vpnid=-1
    
    
    sql="select id from vpn_server_tbl where vpnip='" .. self.vpnip .. "' and enabled=1"
    

    log(ERR,sql)
    
    
    local res,err,errcode,sqlstate = db:query(sql)
    
    if not res then
    	detect_global:returnwithcode(self.MOD_ERR_GETVPNID,nil)
    end
    
    
    for k,v in pairs(res) do
        log(ERR,"vpnid:",v[1])

    	-- id(1)
    	vpnid=v[1]
    	break
    	
    end
    
    if vpnid == -1 then
       detect_global:returnwithcode(self.MOD_ERR_NOSUCHVPN,nil) 
    end
    
    returnlst["vpnid"]=vpnid

    return returnlst
end


function _M.process(self,userreq)
    self.vpnip=nil
    self:checkparm(userreq)

    local db = detect_global:init_conn()
    local vpnid=self:getvpnid(db)
    detect_global:deinit_conn(db)
    
    detect_global:returnwithcode(0,vpnid)
end

return _M
