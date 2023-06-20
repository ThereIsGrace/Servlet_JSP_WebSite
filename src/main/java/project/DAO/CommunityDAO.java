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
	private CommunityDAO() {}
	static CommunityDAO instance = new CommunityDAO();

	public static CommunityDAO getInstance() {
		return instance;
	}
	
	public List<CommunityVO> readCommunity() {
		List<CommunityVO> comList = new ArrayList<>();
		String query = "select * from community order by articleNum desc";
		try {
			conn = DBConnect.getConnection();
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				CommunityVO cv = new CommunityVO();
				cv.setComarticleno(rs.getInt("comarticleNO"));
				cv.setComtitle(rs.getString("comtitle"));
				cv.setComwriter_date(rs.getDate("comwriter_date"));
				cv.setComwriter_id(rs.getString("comwriter_id"));
				comList.add(cv);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return comList;
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
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
