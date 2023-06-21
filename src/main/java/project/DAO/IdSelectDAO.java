package project.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import project.common.DBConnect;

public class IdSelectDAO {
	
	private IdSelectDAO() {}
	static IdSelectDAO instance = new IdSelectDAO();

	public static IdSelectDAO getInstance() {
		return instance;
	}
	
	public List<String> SelectId(){
		 String query="select t_id from tutor UNION all select m_id from mentee";
		 List<String> id=new ArrayList<>();
		 try {
			Connection conn=DBConnect.getConnection();
			PreparedStatement pstmt=conn.prepareStatement(query);
			ResultSet rs=pstmt.executeQuery();
			id.add("1");
			while(rs.next()) {
				id.add(rs.getString("t_id"));
				System.out.println(rs.getString("t_id"));
			}
			id.add("1");
			DBConnect.closeAll(conn, pstmt, rs); 
		 }catch (Exception e) {
			 e.printStackTrace();
		}
		 
		 return id;
				
		 
	}

}
