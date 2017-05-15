# coding:utf-8
import MySQLdb
import sys




def verifyvpnid(cur,vpnid):
	verify=0


	sql="select vpnname,vpnip from vpn_server_tbl where id=" + str(vpnid)
	n=cur.execute(sql)
	if n>0:
		verify=1

	return verify
		
		

	
	

def createactivetbl(cur,vpnid):

	tablename="vpn_" + str(vpnid) + "_regiondetect_active_tbl"


	sql="create table " + tablename +  " (\
		id INT NOT NULL AUTO_INCREMENT,\
		gameid INT NOT NULL,\
		gameregionid INT NOT NULL,\
		activeid INT NOT NULL,\
		PRIMARY KEY(id)\
		)"

	#print(sql)

	cur.execute(sql)


	sql="select gameid,regionid from game_region_tbl order by gameid"

	cur.execute(sql)

	result=cur.fetchall()

	for r in result:
		sql="insert into " + tablename + " (gameid,gameregionid,activeid) values (" + str(r[0]) + "," + str(r[1]) + ",-1)"
		#print(sql)

		cur.execute(sql)


def createdetectdatatbl(cur,vpnid):
	tablename="vpn_" + str(vpnid) + "_regiondetect_data_tbl"

	sql="create table " + tablename + " (\
		id INT NOT NULL AUTO_INCREMENT,\
		gameid INT NOT NULL,\
		gameregionid INT NOT NULL,\
		gameip VARCHAR(20) NOT NULL,\
		gamemask INT NOT NULL,\
		gameport INT NOT NULL,\
		pingvalue INT NOT NULL,\
		loss INT NOT NULL,\
		PRIMARY KEY(id)\
		)"

	#print(sql)


	cur.execute(sql)

	tablename="vpn_" + str(vpnid+5000) + "_regiondetect_data_tbl"
		
	
	sql="create table " + tablename + " (\
		id INT NOT NULL AUTO_INCREMENT,\
		gameid INT NOT NULL,\
		gameregionid INT NOT NULL,\
		gameip VARCHAR(20) NOT NULL,\
		gamemask INT NOT NULL,\
		gameport INT NOT NULL,\
		pingvalue INT NOT NULL,\
		loss INT NOT NULL,\
		PRIMARY KEY(id)\
		)"

	#print(sql)
	
	cur.execute(sql)
 






		



if __name__ == '__main__':
	if len(sys.argv)!=2:
		print("Usage:"+sys.argv[0]+" <vpnid>")
		sys.exit(1)

	try:
		vpnid=int(sys.argv[1])
	except Exception,e:
		print("invalid vpnid.")
		sys.exit(2)


	try:
		conn=MySQLdb.connect(host='localhost', port=3306, user='root', passwd='root', db='game2',charset="utf8")
		cur=conn.cursor()


		if verifyvpnid(cur,vpnid):
			print("create table for vpn "+str(vpnid))
			createactivetbl(cur,vpnid)
			createdetectdatatbl(cur,vpnid)
		else:
			print("vpnid "+str(vpnid)+" not exist in db")
			sys.exit(3)	




		cur.close()
		conn.close()

		
	except Exception,e:
		print("Exception:" + str(e))
	

