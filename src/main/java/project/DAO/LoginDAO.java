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
			pstsm.setString(1, id);
			ResultSet rs = pstsm.executeQuery();
			if(rs.next()) {
				pw = rs.getString("M_PWD");
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
		String query = "select T_ID from TUTOR where T_name=? and t_phone=?";
		String result = "";
		try(Connection conn = DBConnect.getConnection();
				PreparedStatement pstsm = conn.prepareStatement(query);)
			{
				pstsm.setString(1, name);
				pstsm.setString(2, phone);
				ResultSet rs = pstsm.executeQuery();
				if(rs.next()) {
					result = rs.getString("T_id");
				}else {
					result = "null";
				}
				DBConnect.closeAll(conn, pstsm, rs);	
				}catch (Exception e) {
					e.printStackTrace();
				}
				return result;
			}

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
		String query = "select T_PWD from TUTOR where T_ID=? and T_name=? and t_phone=?";
		String result = "";
		try(Connection conn = DBConnect.getConnection();
				PreparedStatement pstsm = conn.prepareStatement(query);)
		{
			pstsm.setString(1, id);
			pstsm.setString(2, name);
			pstsm.setString(3, phone);
			ResultSet rs = pstsm.executeQuery();
			if(rs.next()) {
				result = rs.getString("T_PWD");
			}else {
				result = "null";
			}
			DBConnect.closeAll(conn, pstsm, rs);	
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
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
