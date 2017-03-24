require "os"

local cc_global=require "cc_global"

local MOD_ERR_BASE = cc_global.ERR_MOD_GETGAMELISTPORT_BASE

local _M = { 
    _VERSION = '1.0.1',
    MOD_ERR_INVALID_PARAM = MOD_ERR_BASE-1,
    MOD_ERR_PARAM_TYPE = MOD_ERR_BASE-2,
    MOD_ERR_ALLOC = MOD_ERR_BASE-3,
    MOD_ERR_DBINIT = MOD_ERR_BASE-4,
    MOD_ERR_GETGAMELIST = MOD_ERR_BASE-5,
    MOD_ERR_SAVEUSERHISTORY = MOD_ERR_BASE-6,
    MOD_ERR_DBDEINIT = MOD_ERR_BASE-7
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
        cc_global:returnwithcode(self.MOD_ERR_INVALID_PARAM,nil)
    end
    
    local req_param=userreq['data']
    if req_param['gameid'] == nil or req_param['regionid'] == nil then
        cc_global:returnwithcode(self.MOD_ERR_INVALID_PARAM,nil)
    end
    
    gameid=tonumber(req_param['gameid'])
    regionid=tonumber(req_param['regionid'])
    
    if gameid == nil or regionid==nil then
        cc_global:returnwithcode(self.MOD_ERR_PARAM_TYPE,nil)
    end
    
    self.gameid=gameid
    self.regionid=regionid
    self.uid=tostring(userreq['uid'])
 
end

function _M.getgameiplist(self,db)
    local sql
    local gameiplist={}

    gameiplist['iplist']={}

    if self.regionid~= 0 then
        sql = "select gameip,gamemask,gameport from game_server_tbl where gameregionid in (select id from game_region_tbl where gameid=" .. self.gameid .. " and id=" .. self.regionid .. " )"
        -- sql = "select distinct gameip,gamemask from game_server_tbl where gameregionid in (select id from game_region_tbl where gameid=" .. self.gameid .. " and id=" .. self.regionid .. " )"
    else
        sql = "select gameip,gamemask,gameport from game_server_tbl where gameregionid in (select id from game_region_tbl where gameid=" .. self.gameid .. " )"
        -- sql = "select distinct gameip,gamemask from game_server_tbl where gameregionid in (select id from game_region_tbl where gameid=" .. self.gameid .. " )"
    end

    log(ERR,sql)
    
    
    local res,err,errcode,sqlstate = db:query(sql)
    
    if not res then
    	cc_global:returnwithcode(self.MOD_ERR_GETGAMELIST,nil)
    end
    
    -- gameip(1),gamemask(2),gameport(3)
    -- gameip(1),gamemask(2)
    
    local ipstr=""
    
    for k,v in pairs(res) do
        log(ERR,"iplist:",v[1]," ",v[2]," ",v[3])
        --log(ERR,"iplist:",v[1]," ",v[2])
    	--ipstr=ipstr..v[1].."/"..tostring(v[2])..","
    	ipstr=ipstr..v[1]..":"..tostring(v[3]).."/"..tostring(v[2])..","
    end
    
    gameiplist['iplist']=ipstr

    return gameiplist
end

function _M.saveuserhistory(self,db)
    local nowstr
    nowstr=os.date("%Y-%m-%d %H:%M:%S")


    local sql = "insert into game_user_history_tbl(username,starttime,gameid,gameregionid) values ('" .. self.uid .."','".. nowstr.."',"..self.gameid..","..self.regionid..")"
    
    log(ERR,sql)
    
    local res,err,errcode,sqlstate = db:query(sql)
    
    
    if not res then
    	cc_global:returnwithcode(self.MOD_ERR_SAVEUSERHISTORY,nil)
    end
    
end

function _M.process(self,userreq)
    self.uid=nil
    self.gameid=0
    self.regionid=0
    
    
    self:checkparm(userreq)
    local db = cc_global:init_conn()
    local gameiplist=self:getgameiplist(db)
    self:saveuserhistory(db)
    cc_global:deinit_conn(db)
    
    cc_global:returnwithcode(0,gameiplist)
end

return _M
