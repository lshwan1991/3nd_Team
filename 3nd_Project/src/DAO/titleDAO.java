package DAO;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class titleDAO {
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
	
public titleVO oneselect(String title) {
		
		titleVO vo = null;
		
		try {
			
			getConn();
			
			String sql = "select * from place where title = ?";
			
			pst =  conn.prepareStatement(sql);
			pst.setString(1, title);
			
			ResultSet rs = pst.executeQuery();
			
			while(rs.next()) {
				String score = rs.getString(2);
				String tel = rs.getString(3);
				String address = rs.getString(4);
				
				vo = new titleVO(title, score, tel, address);
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}finally {
			
			close();
			
		}
		return vo;
	
	}
	


}
