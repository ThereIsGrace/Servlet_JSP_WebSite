package project.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import project.common.DBConnect;

public class LoginDAO {
	private LoginDAO() {}
	static LoginDAO instance = new LoginDAO();
	
	public static LoginDAO getInstance() {
		return instance;
	}
	
	
	public int readMentee(String id, String pwd) {
		
		String query = "select M_PWD from MENTEE where M_ID=?";
		String pw;
		int result = 2;
		try(Connection conn = DBConnect.getConnection();
			PreparedStatement pstsm = conn.prepareStatement(query);)
		{
			pstsm.setString(1, id); // ID를 사용자에게 입력 받음
			ResultSet rs = pstsm.executeQuery(); // DB에 입력해서 데이터를 받아옴
			if(rs.next()) {
				pw = rs.getString("M_PWD");  // 입력 받은 비밀번호와 DB에 저장된 비밀번호를 비교
				if(pwd.equals(pw)){ // 같으면 1
					result = 1; 
				}else { // 다르면 -1
					result = -1;
				}
			}else{ // 입력된 비밀번호가 없으면 0
				result=0;
			}
			DBConnect.closeAll(conn, pstsm, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result; 
	} // 아래 과정은 위 과정과 동일
	
	public int readTutor(String id, String pwd) {
		String query = "select T_PWD from TUTOR where T_ID=?";
		String pw;
		int result = 2;
		try(Connection conn = DBConnect.getConnection();
				PreparedStatement pstsm = conn.prepareStatement(query);)
		{
			pstsm.setString(1, id);
			ResultSet rs = pstsm.executeQuery();
			if(rs.next()) {
				pw = rs.getString("T_PWD");
				if(pwd.equals(pw)){
					result = 1; 
				}else {
					result = -1;
				}
			}else{
				result=0;
			}
			DBConnect.closeAll(conn, pstsm, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result; 
	}
	
	public String searchIdT(String name, String phone) {
		String query = "select T_ID from TUTOR where T_name=? and t_phone=?"; // 이름과 전화번호를 이용하여 ID 찾기
		String result = "";
		try(Connection conn = DBConnect.getConnection();
				PreparedStatement pstsm = conn.prepareStatement(query);)
			{
				pstsm.setString(1, name); // 사용자에게 이름을 입력받음
				pstsm.setString(2, phone); // 사용자에게 전화번호를 입력 받음
				ResultSet rs = pstsm.executeQuery();
				if(rs.next()) { // 입력된 값이 DB에 있으면 ID출력
					result = rs.getString("T_id");
				}else { // 없으면 null출력
					result = "null";
				}
				DBConnect.closeAll(conn, pstsm, rs);	
				}catch (Exception e) {
					e.printStackTrace();
				}
				return result;
			} // 아래 과정과 위 과정이 동일

	public String searchIdM(String name, String phone) {
		String query = "select M_ID from MENTEE where M_name=? and M_phone=?";
		String result = "";
		try(Connection conn = DBConnect.getConnection();
				PreparedStatement pstsm = conn.prepareStatement(query);)
		{
			pstsm.setString(1, name);
			pstsm.setString(2, phone);
			ResultSet rs = pstsm.executeQuery();
			if(rs.next()) {
				result = rs.getString("M_id");
			}else {
				result = "null";
			}
			DBConnect.closeAll(conn, pstsm, rs);	
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public String searchPwdT(String id, String name, String phone) {
		String query = "select T_PWD from TUTOR where T_ID=? and T_name=? and t_phone=?"; // ID와 이름, 전화번호를 사용하여 비밀번호 찾기
		String result = "";
		try(Connection conn = DBConnect.getConnection();
				PreparedStatement pstsm = conn.prepareStatement(query);)
		{
			pstsm.setString(1, id); // 사용자에게 ID를 입력받음
			pstsm.setString(2, name); // 사용자에게 이름을 입력받음
			pstsm.setString(3, phone); // 사용자에게 전화번호를 입력받음
			ResultSet rs = pstsm.executeQuery();
			if(rs.next()) { // 입력된 값이 DB에 있으면 비밀번호 출력
				result = rs.getString("T_PWD");
			}else {  // 없으면 null출력
				result = "null";
			}
			DBConnect.closeAll(conn, pstsm, rs);	
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	} // 아래 과정과 위 과정이 동일
	
	public String searchPwdM(String id, String name, String phone) {
		String query = "select 	M_PWD from mentee where M_ID=? and M_name=? and M_phone=?";
		String result = "";
		try(Connection conn = DBConnect.getConnection();
				PreparedStatement pstsm = conn.prepareStatement(query);)
		{
			pstsm.setString(1, id);
			pstsm.setString(2, name);
			pstsm.setString(3, phone);
			ResultSet rs = pstsm.executeQuery();
			if(rs.next()) {
				result = rs.getString("M_pwd");
			}else {
				result = "null";
			}
			DBConnect.closeAll(conn, pstsm, rs);	
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}
