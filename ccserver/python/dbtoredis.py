# coding:utf-8
import MySQLdb
import redis

def loaddbtoredis(conn,cur,r):
    sql="select game_id,game_name,game_icon_url,game_list_Percent,admin_enable from game_name_tbl order by game_id"
    try:
        ngame=cur.execute(sql)
        gameresult=cur.fetchall()
        
        for game in gameresult:
			gameid=game[0]
			print("fetch game "+str(gameid))


			key="gamelist"
			value="game_" + str(gameid)
			r.rpush(key,value)
            
			key=value
			value=game[1]+","+game[2]+","+str(game[3])+","+str(game[4])
			r.rpush(key,value)

			sql="select regionid,regionname,ispname from game_region_tbl where gameid=" + str(gameid) +" order by regionid"
			nregion=cur.execute(sql)
			regionresult=cur.fetchall()
			
			for region in regionresult:
				key="game_"+str(gameid)+"_regionlist"
				regionid=region[0]
				value="game_"+str(gameid)+"_region_"+str(regionid)
				r.rpush(key,value)

				key="game_"+str(gameid)+"_region_"+str(regionid)
				value=region[1]+","+region[2]
				
				r.rpush(key,value)
				
				sql="select gameip,gameport,gamemask from game_server_tbl where gameid=" + str(gameid) + " and gameregionid=" + str(regionid)
				nserver=cur.execute(sql)
				serverresult=cur.fetchall()

				key="game_"+str(gameid)+"_region_"+str(regionid)+"_serverlist"				
				for server in serverresult:
					value=server[0]+","+str(server[1])+","+str(server[2])
					r.rpush(key,value)
				
				sql="select gameip,gameport,gamemask from game_server_tbl where gameid=" + str(gameid) + " and gameregionid=" + str(regionid) + " and gamedetect=1"
				ndetect=cur.execute(sql)
				detectresult=cur.fetchall()
				
				
				
        
        
    except Exception,e:
        print ("exception in loaddbtoredis:" + str(e))


def deleteallkeys(r):
	try:
		r.flushdb()

	except Exception,e:
		print("exception in deleteallkey:" + str(e))

if __name__ == '__main__':
    try:
		conn=MySQLdb.connect(host='localhost', port=3306, user='root', passwd='root', db='game1',charset="utf8")
		cur=conn.cursor()
        
		r = redis.StrictRedis(host='192.168.14.157', port=6379, db=0,password='redis',encoding='utf-8')
		
		deleteallkeys(r)
		loaddbtoredis(conn,cur,r)
       
    except Exception,e:
        print("exception in main:"+str(e))
        

