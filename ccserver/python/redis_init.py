# coding:utf-8
import MySQLdb
import redis


VPN_ACTIVE_IP_TO_ID_DIC="vpn_active_ip_to_id"
ACTIVE_GAMEID_SET="active_game_id"
	
# dic: vpn_acitve_ip_to_id: vpn ip to id ,field:vpnip,value:id
# dic: vpn_x_ava_rtt: game y region z avaerage rtt value field:game_y_region_z_ava_rtt,value:rttvalue
# set: game_y_region: game regionid set  value: regionid
# set: active_game_id: active game id in game_name_tbl value: gameid




def init_vpn_info(conn,cur,r):
	try:
		sql="select vpn_node_ip_tbl.vpnip,vpn_node_tbl.nodeid from vpn_node_ip_tbl,vpn_node_tbl where vpn_node_tbl.nodeid=vpn_node_ip_tbl.nodeid and vpn_node_tbl.enabled=1"
		ncnt=cur.execute(sql)
		vpnresult=cur.fetchall()

		for vpninfo in vpnresult:
			r.hset(VPN_ACTIVE_IP_TO_ID_DIC,vpninfo[0],vpninfo[1])

		
	except Exception,e:
		print ("exception init_vpn_info:" + str(e))

def init_game_region(conn,cur,r):
	try:
		sql="select nodeid from vpn_node_tbl order by nodeid"
		ncnt1=cur.execute(sql)
		idresult=cur.fetchall()

		sql="select distinct(gameid) from game_region_tbl order by gameid"
		ncnt2=cur.execute(sql)
		gameidresult=cur.fetchall()

		sql="select game_id from game_name_tbl where admin_enable=1 order by game_id"
		ncnt3=cur.execute(sql)
		activeidresult=cur.fetchall()

		for vpnid in idresult:
			vpn_ava_rtt_key="vpn_"+str(vpnid[0])+"_ava_rtt"
			vpn_detect_active_id_key="vpn_"+str(vpnid[0])+"_detect_activeid"

			for gameid in gameidresult:
				field="game_"+str(gameid[0])+"_region_0_rtt"
				r.hset(vpn_ava_rtt_key,field,0)			# set ava rtt region 0

				sql="select regionid from game_region_tbl where gameid=" + str(gameid[0]) + " order by regionid"
				ncnt3=cur.execute(sql)
				regionresult=cur.fetchall()

				game_region_key="game_" + str(gameid[0]) + "_region"

				for regionid in regionresult:
					field="game_"+str(gameid[0])+"_region_" + str(regionid[0]) + "_rtt"
					r.hset(vpn_ava_rtt_key,field,0)		# set ava rtt region

					field="game_"+str(gameid[0])+"_region_" + str(regionid[0]) + "_activeid"
					r.hset(vpn_detect_active_id_key,field,-1)	# set active id
		
		for gameid in gameidresult:
			game_region_key="game_" + str(gameid[0]) + "_region"
			for regionid in regionresult:
				r.sadd(game_region_key,str(regionid[0]))

		for activeid in activeidresult:
			r.sadd(ACTIVE_GAMEID_SET,str(activeid[0]))

		

	except Exception,e:
		print("exception in init_game_region_rtt:" + str(e))

	

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
		init_vpn_info(conn,cur,r)
		init_game_region(conn,cur,r)
       
    except Exception,e:
        print("exception in main:"+str(e))
        

