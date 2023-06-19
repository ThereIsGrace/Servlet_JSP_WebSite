package project.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import project.VO.MenTeeVO;
import project.VO.TutorVO;
import project.common.DBConnect;

public class MembershipDAO {
	private MembershipDAO() {}
	static MembershipDAO instance = new MembershipDAO();
	
	public static MembershipDAO getInstance() {
		return instance;
	}
	
	public void insertMenTee(MenTeeVO mv) {
		String query = "insert into mentee values(?,?,?,?,?,?,?)";
		try(Connection conn = DBConnect.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(query); ) {
			pstmt.setString(1, mv.getM_id());
			pstmt.setString(2, mv.getM_pwd());
			pstmt.setString(3, mv.getM_name());
			pstmt.setInt(4, mv.getM_age());
			pstmt.setString(5, mv.getM_area());
			pstmt.setString(6, mv.getM_phonum());
			pstmt.setString(7, mv.getM_subject());
			pstmt.executeUpdate();
			DBConnect.close(conn, pstmt);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public void insertTutor(TutorVO mv) {
		String query = "insert into TUTOR values(?,?,?,?,?,?,?,?)";
		try(Connection conn = DBConnect.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(query); ) {
			pstmt.setString(1, mv.getT_id());
			pstmt.setString(2, mv.getT_pwd());
			pstmt.setString(3, mv.getT_name());
			pstmt.setInt(4, mv.getT_age());
			pstmt.setString(5, mv.getT_area());
			pstmt.setString(6, mv.getT_phonum());
			pstmt.setString(7, mv.getT_subject());
			pstmt.setString(8, mv.getT_suiv());
			pstmt.executeUpdate(); //db에 입력함 값을 안 받아옴
			DBConnect.close(conn, pstmt);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public int insertId(String id) {
		String query = "select M_id from mentee where M_id=?";
		String query1 = "select T_id from tutor where T_id=?";
		try(Connection conn = DBConnect.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(query);){
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();//db에 입력해서 값을 받아옴
			if(rs.next()) {
				return 1;
			}
			Connection conn1 = DBConnect.getConnection();
			PreparedStatement pstmt1=conn1.prepareStatement(query1);
			pstmt1.setString(1, id);
			ResultSet rs1 =pstmt.executeQuery();
			if(rs.next()) {
				return 1;
			}
			
			DBConnect.closeAll(conn, pstmt, rs);
			DBConnect.closeAll(conn1, pstmt1, rs1);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
		}
}