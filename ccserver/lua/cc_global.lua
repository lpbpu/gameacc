require "os"

local ERR_BASE_ERROR = -20000
local _M = { 
    _VERSION = '1.0.1',
    ERR_INVALID_METHOD = ERR_BASE_ERROR-1,
    ERR_NO_BODYDATA = ERR_BASE_ERROR-2,
    ERR_INVALID_PARAM = ERR_BASE_ERROR-3,
    ERR_PARAM_TYPE = ERR_BASE_ERROR-4,
    ERR_UNSUPPORT_VERSION = ERR_BASE_ERROR-5,
    ERR_UNSUPPORT_CMD = ERR_BASE_ERROR-6,
    ERR_UNSUPPORT_DEVICE = ERR_BASE_ERROR-7,
    ERR_UNSUPPORT_USERTYPE = ERR_BASE_ERROR-8,
    ERR_INVALID_JSON_FORMAT = ERR_BASE_ERROR-9,

    ERR_MOD_GETGAMELIST_BASE = ERR_BASE_ERROR-100,
    ERR_MOD_UPLOADINFO_BASE = ERR_BASE_ERROR-200,
    ERR_MOD_GETVPNIP_BASE = ERR_BASE_ERROR-300,
    ERR_MOD_GETLISTVERSION_BASE = ERR_BASE_ERROR-400,
    ERR_MOD_GETGAMELISTPORT_BASE = ERR_BASE_ERROR-600,
    
    
    
    
}
local mt = { __index = _M}
local cjson = require "cjson"

function _M.new(self)
	return setmetatable({}, mt)
end

-- error function

function _M.makereturninfo(self,errcode,data)
    local retinfo={}
    local retstr
    retinfo["code"]=errcode
    retinfo["time"]=os.time()
    if data~=nil then
        retinfo["data"]=data
    end
    retstr=cjson.encode(retinfo)
    return retstr
end

function _M.returnwithcode(self,errcode,data)
    local retstr
    retstr=self:makereturninfo(errcode,data)
    ngx.say(retstr)
    ngx.exit(200)
end





return _M
