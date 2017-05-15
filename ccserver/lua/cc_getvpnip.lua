require "os"

local cc_global=require "cc_global"

local MOD_ERR_BASE = cc_global.ERR_MOD_GETVPNIP_BASE

local _M = { 
    _VERSION = '1.0.1',
    MOD_ERR_ALLOC = MOD_ERR_BASE-1,
    MOD_ERR_DBINIT = MOD_ERR_BASE-2,
    MOD_ERR_DBDEINIT = MOD_ERR_BASE-3,
	MOD_ERR_INVALID_PARAM = MOD_ERR_BASE-4,
	MOD_ERR_GETVPNIP = MOD_ERR_BASE-5,
	MOD_ERR_SAVEUSERRTT = MOD_ERR_BASE-6
}

local log = ngx.log
local ERR = ngx.ERR
local INFO = ngx.INFO



local mt = { __index = _M}



function _M.new(self)
	return setmetatable({}, mt)
end


function _M.saveuserrtt(self,userreq,serverip)
	local cjson=require "cjson"
    local infostr=cjson.encode(self.qoslst)
	local nowstr=os.date("%Y-%m-%d %H:%M:%S")

	local db = cc_global:init_conn()
	


	local sql="insert into game_user_rtt_tbl(clientip,username,rttinfo,vpnserver,updatetime) values "
	
	sql=sql .. "('" .. ngx.var.remote_addr .. "','" .. tostring(userreq['uid']) .. "','" .. infostr .. "','" .. serverip['serverip'] .. "','" .. nowstr .."')"
	
	log(ERR,sql)

	local res,err,errcode,sqlstate = db:query(sql)
	if not res then
		cc_global:deinit_conn(db)
		cc_global:returnwithcode(self.MOD_ERR_SAVEUSERRTT,nil)
	end

	cc_global:deinit_conn(db)



end


function _M.getvpnip(self,userreq)
    local serverip={}

	local id=0
	local rttmin=99999
	local item

	for k,v in pairs(self.qoslst) do
		if tonumber(v['rtt'])<tonumber(rttmin)  and tonumber(v['lose'])==0 then
			rttmin=v['rtt']	
			id=k
		end	
	end

	if id==0 then
		serverip['serverip']=''
		self:saveuserrtt(userreq,serverip)
	else
		item=self.qoslst[id]
		serverip['serverip']=item['ip']
		
		if tonumber(item['rtt'])>50 then
			self:saveuserrtt(userreq,serverip)
		end

	end

    return serverip
end


function _M.checkparm(self,userreq)
    local gameid,regionid

    if userreq['data']==nil then
        cc_global:returnwithcode(self.MOD_ERR_INVALID_PARAM,nil)
    end


    local req_param=userreq['data']
    if req_param['info'] == nil then
        cc_global:returnwithcode(self.MOD_ERR_INVALID_PARAM,nil)
    end
    
	return req_param['info']

end


function _M.process(self,userreq)
	self.qoslst=nil
	
	self.qoslst=self:checkparm(userreq)


    local serverip=self:getvpnip(userreq)


    cc_global:returnwithcode(0,serverip)

end

return _M
