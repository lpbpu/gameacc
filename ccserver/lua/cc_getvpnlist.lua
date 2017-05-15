require "os"

local cc_global=require "cc_global"

local MOD_ERR_BASE = cc_global.ERR_MOD_GETVPNIPLIST_BASE

local _M = { 
    _VERSION = '1.0.1',
    MOD_ERR_ALLOC = MOD_ERR_BASE-1,
    MOD_ERR_DBINIT = MOD_ERR_BASE-2,
    MOD_ERR_GETVPNLIST = MOD_ERR_BASE-3,
    MOD_ERR_DBDEINIT = MOD_ERR_BASE-4
}

local log = ngx.log
local ERR = ngx.ERR
local INFO = ngx.INFO



local mt = { __index = _M}



function _M.new(self)
	return setmetatable({}, mt)
end


function _M.getvpnlist(self,db)
    local serverip={}
    local sql="select vpnip from vpn_server_tbl where enabled=1 order by id"
    
    --log(ERR,sql)
    
    local res,err,errcode,sqlstate = db:query(sql)
    
    if not res then
    	cc_global:returnwithcode(self.MOD_ERR_GETVPNLIST,nil)
    end
    
    counter=1
    local ipinfo={}
    
    
    for k,v in pairs(res) do
        --log(ERR,"iplist:",v[1])
        -- vpnip(1)
        ipinfo[counter]=v[1]
        counter=counter+1
    end
    
    ipstr=table.concat(ipinfo,",")
    
    
    serverip['iplist']=ipstr
    return serverip
end

function _M.process(self,userreq)
    local db = cc_global:init_conn()
    local serverip=self:getvpnlist(db)
    cc_global:deinit_conn(db)
    cc_global:returnwithcode(0,serverip)

end

return _M
