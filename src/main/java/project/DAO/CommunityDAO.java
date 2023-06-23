package project.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import project.VO.CommunityVO;
import project.common.DBConnect;

public class CommunityDAO {
	Connection conn;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	private CommunityDAO() {
	}

	static CommunityDAO instance = new CommunityDAO();

	public static CommunityDAO getInstance() {
		return instance;
	}

	public List<CommunityVO> readCommunityAll(int num) {
		List<CommunityVO> comList = new ArrayList<>();
		String query = "SELECT \r\n" + "*\r\n" + "FROM(SELECT ComARTICLENO ,@ROWNUM:=@ROWNUM+1 as rowNum,\r\n"
				+ "comtitle,\r\n" + "comwriter_date,\r\n" + "comwriter_id\r\n"
				+ "     FROM community ,(SELECT @ROWNUM:=0) AS R ) T\r\n" + "LIMIT 10 offset ?;";
		try {
			conn = DBConnect.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, (num - 1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				CommunityVO cv = new CommunityVO();
				cv.setComarticleno(rs.getInt("comarticleNO"));
				cv.setComtitle(rs.getString("comtitle"));
				cv.setComwriter_date(rs.getDate("comwriter_date"));
				cv.setComwriter_id(rs.getString("comwriter_id"));
				System.out.println(rs.getInt("comarticleNO"));
				comList.add(cv);
				DBConnect.closeAll(conn, pstmt, rs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return comList;
	}

	public int getListCnt() {
		String query = "select count(*) from community";
		int result = 0;
		try {
			conn = DBConnect.getConnection();
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
			}
			DBConnect.closeAll(conn, pstmt, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public void insertCommunity(CommunityVO cv) {
		String query = "insert into community(comtitle, comwriter_id, comcontent) values(?,?,?)";
		try {
			conn = DBConnect.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, cv.getComtitle());
			pstmt.setString(2, cv.getComwriter_id());
			pstmt.setString(3, cv.getComcontent());
			pstmt.executeUpdate();
			DBConnect.close(conn, pstmt);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public CommunityVO viewCommunity(int number) {
		String query = "select ComARTICLENO ,ComWRITER_ID,ComCONTENT ,ComWRITER_DATE ,ComTITLE  from community where comarticleno=?";
		CommunityVO cv = new CommunityVO();
		try {
			conn = DBConnect.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, number);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				cv.setComcontent(rs.getString("comcontent"));
				cv.setComtitle(rs.getString("comtitle"));
				cv.setComwriter_date(rs.getDate("comwriter_date"));
				cv.setComwriter_id(rs.getString("comwriter_id"));
				cv.setComarticleno(rs.getInt("comarticleno"));
			}
			DBConnect.closeAll(conn, pstmt, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cv;
	}

	public void updateCommunity(CommunityVO cv) {
		String query = "update community set ComTITLE=?,ComCONTENT=? where ComARTICLENO =?";
		try {
			conn = DBConnect.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, cv.getComtitle());
			pstmt.setString(2, cv.getComcontent());
			pstmt.setInt(3, cv.getComarticleno());
			pstmt.executeUpdate();
			DBConnect.close(conn, pstmt);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void deleteCommunity(int number) {
		String query = "delete from community where ComARTICLENO=?";
		try {
			conn = DBConnect.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, number);
			pstmt.executeUpdate();
			DBConnect.close(conn, pstmt);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
