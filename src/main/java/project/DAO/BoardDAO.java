package project.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import project.ReviewVO;

public class BoardDAO {
	private DataSource dataFactory;
	Connection conn;
	PreparedStatement pstmt;
	
	public BoardDAO() {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");
			dataFactory = (DataSource) envContext.lookup("jdbc/oracle");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<ReviewVO> readBoard(String write_id){
		List<ReviewVO> reviewList = new ArrayList<>();
		String query = "select from review where write_id = ?";
		try {
			conn = dataFactory.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, write_id);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				ReviewVO rv = new ReviewVO();
				rv.setArticleno(rs.getInt("articleNO"));
				rv.setSubject(rs.getString("subject"));
				rv.setWriter_id(rs.getString("writer_id"));
				rv.setT_name(rs.getString("t_name"));
				rv.setTitle(rs.getString("title"));
				rv.setContent(rs.getString("content"));
				rv.setGrade(rs.getInt("grade"));
				rv.setWriter_date(rs.getDate("writer_date"));
				reviewList.add(rv);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return reviewList;
	}
	
	public int insertBoard(ReviewVO rv) {
		String query = "insert into review(subject, write_id, t_name, title, content, grade)"
				+ " values(?,?,?,?,?)";
		try {
			System.out.println(query);
			conn = dataFactory.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, rv.getSubject());
			pstmt.setString(2, rv.getWriter_id());
			pstmt.setString(3, rv.getT_name());
			pstmt.setString(4, rv.getTitle());
			pstmt.setString(5, rv.getContent());
			pstmt.setInt(6, rv.getGrade());
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int updateBoard(ReviewVO rv) {
		String query = "update review set content=? , grade = ?;"
				+ " CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP";
		try {
			conn = dataFactory.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, rv.getContent());
			pstmt.setInt(2, rv.getGrade());
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int deleteBoard(ReviewVO rv) {
		String query = "delete from review where articleNO = ?";
		try {
			conn = dataFactory.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, rv.getArticleno());
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}
