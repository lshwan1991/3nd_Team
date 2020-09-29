package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class storescoreDAO {
	Connection conn = null;
	PreparedStatement pst = null;
	
	int cnt = 0;
	
	public void getConn() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
			String dbid = "hr";
			String dbpw = "hr";
			
			conn = DriverManager.getConnection(url, dbid, dbpw);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void close() {
		try {
			
			pst.close();
			conn.close();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
public storescoreVO oneselect(String title) {
		
		storescoreVO vo = null;
		
		try {
			
			getConn();
			
			String sql = "select * from storescore where STORE_NAME = ?";
			
			pst =  conn.prepareStatement(sql);
			pst.setString(1, title);
			
			ResultSet rs = pst.executeQuery();
			
			while(rs.next()) {
				int STORE_MASK1 = rs.getInt(2);
				int STORE_MASK2 = rs.getInt(3);
				int STORE_MASK3 = rs.getInt(4);
				
				int STORE_PREVENTION1 = rs.getInt(5);
				int STORE_PREVENTION2 = rs.getInt(6);
				int STORE_PREVENTION3 = rs.getInt(7);
				
				
				vo = new storescoreVO(title, STORE_MASK1, STORE_MASK2, STORE_MASK3, STORE_PREVENTION1, STORE_PREVENTION2, STORE_PREVENTION3);
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}finally {
			
			close();
			
		}
		return vo;
	
	}
}
