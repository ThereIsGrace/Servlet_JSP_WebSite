package project.common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBConnect {
	static DataSource dataSource = null;  // 서버를 통해 커넥션 풀을 만들고 반환하는 객체 
	static Connection conn = null;        // 데이터베이스와의 연결이 성공하면 반환
	

	public static Connection getConnection() {
		try {
			Context context = new InitialContext();

			DataSource ds = (DataSource)context.lookup("java:comp/env/jdbc/mariaDB");

			conn = ds.getConnection();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return conn; 
	}
	
	public static void closeAll(Connection conn, PreparedStatement pstmt, ResultSet rs) {
		if(rs != null) {
			try {
				rs.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		if(pstmt != null) {
			try {
				pstmt.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		if(conn != null) {
			try {
				conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	public static void close(Connection conn, PreparedStatement pstmt) {
		if(pstmt != null) {
			try {
				pstmt.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		if(conn != null) {
			try {
				conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
}
