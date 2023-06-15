package project.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import project.VO.ReviewVO;
import project.common.DBConnect;
public class BoardDAO {
	private BoardDAO() {}
	static BoardDAO instance = new BoardDAO();

	public static BoardDAO getInstance() {
		return instance;
	}
	
	
	public List<ReviewVO> readBoard(){
		List<ReviewVO> reviewList = new ArrayList<>();
		String query = "select articleNO, writer_id, content, grade, writer_date, t_name from review";
		try(Connection conn = DBConnect.getConnection(); 
				PreparedStatement pstmt = conn.prepareStatement(query);) {
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				ReviewVO rv = new ReviewVO();
				rv.setArticleno(rs.getInt("articleNO"));
				rv.setWriter_id(rs.getString("writer_id"));
				rv.setContent(rs.getString("content"));
				rv.setGrade(rs.getInt("grade"));
				rv.setWriter_date(rs.getDate("writer_date"));
				rv.setT_name(rs.getString("t_name"));
				reviewList.add(rv);
				DBConnect.closeAll(conn, pstmt, rs);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return reviewList;
	}
	
	public int insertBoard(ReviewVO rv) {
		int result = 0;
		String query = "insert into review(write_id, content, grade, t_name)"
				+ " values(?,?,?,?)";
		try(Connection conn = DBConnect.getConnection(); 
				PreparedStatement pstmt = conn.prepareStatement(query); ) {
			pstmt.setString(1, rv.getWriter_id());
			pstmt.setString(2, rv.getContent());
			pstmt.setInt(3, rv.getGrade());
			pstmt.setString(4, rv.getT_name());
			result = pstmt.executeUpdate();
			DBConnect.close(conn, pstmt);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int updateBoard(ReviewVO rv) {
		int result = 0;
		String query = "update review set content=? , grade = ?;";
		try(Connection conn = DBConnect.getConnection(); 
				PreparedStatement pstmt = conn.prepareStatement(query); ) {
			pstmt.setString(1, rv.getContent());
			pstmt.setInt(2, rv.getGrade());
			result = pstmt.executeUpdate();;
			DBConnect.close(conn, pstmt);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int deleteBoard(ReviewVO rv) {
		int result = 1;
		String query = "delete from review where articleNO = ?";
		try(Connection conn = DBConnect.getConnection(); 
				PreparedStatement pstmt = conn.prepareStatement(query); ){
			pstmt.setInt(1, rv.getArticleno());
			result = pstmt.executeUpdate();
			DBConnect.close(conn, pstmt);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
