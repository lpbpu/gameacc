local detect_global=require "detect_global"
local cjson = require "cjson"

local request_method = ngx.var.request_method

if "POST"==request_method then
    ngx.req.read_body()
    local body_str=ngx.req.get_body_data()
    
    if body_str==nil then
        detect_global:returnwithcode(detect_global.ERR_NO_BODYDATA,nil)
    end
    
    local status,userdata=pcall(cjson.decode,body_str)
    if status == false then
        detect_global:returnwithcode(detect_global.ERR_INVALID_JSON_FORMAT,nil)
    end
    
    if userdata['cmdid'] == nil or userdata['version'] == nil or userdata['time'] == nil then
        detect_global:returnwithcode(detect_global.ERR_INVALID_PARAM,nil)
    end
    
    local cmdid = tonumber(userdata['cmdid'])
    local version = tostring(userdata['version'])
    local reqtime = tonumber(userdata['time'])
    
    if cmdid == nil or version == nil or reqtime == nil then
        detect_global:returnwithcode(detect_global.ERR_PARAM_TYPE,nil)
    end
    
    if version == "0.1" then
        if cmdid == 1 then
            local detect_getgamelistport_obj = require "detect_getgamelistport"
			local detect_getgamelistport = detect_getgamelistport_obj:new()
            detect_getgamelistport:process(userdata)
        elseif cmdid == 2 then
            local detect_getgameregion_obj = require "detect_getgameregion"
            local detect_getgameregion = detect_getgameregion_obj:new()
            detect_getgameregion:process(userdata)
        elseif cmdid == 3 then
            local detect_getvpnid_obj = require "detect_getvpnid"
            local detect_getvpnid = detect_getvpnid_obj:new()
            detect_getvpnid:process(userdata)
        else
            detect_global:returnwithcode(detect_global.ERR_UNSUPPORT_CMD,nil)
        end
    else
        detect_global:returnwithcode(detect_global.ERR_UNSUPPORT_VERSION,nil)
    end
    
else
    detect_global:returnwithcode(detect_global.ERR_INVALID_METHOD,nil)
end
