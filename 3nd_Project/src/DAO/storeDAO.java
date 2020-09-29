package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class storeDAO {
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
	
public storeVO oneselect(String title) {
		
		storeVO vo = null;
		
		try {
			
			getConn();
			
			String sql = "select * from store where STORE_NAME = ?";
			
			pst =  conn.prepareStatement(sql);
			pst.setString(1, title);
			
			ResultSet rs = pst.executeQuery();
			
			while(rs.next()) {
				String STORE_TYPE = rs.getString(2);
				String STORE_LOCATION = rs.getString(3);
				String STORE_TEL = rs.getString(4);
				
				
				vo = new storeVO(title, STORE_TYPE, STORE_LOCATION, STORE_TEL);
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}finally {
			
			close();
			
		}
		return vo;
	
	}
}
