package project.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import project.VO.ReviewVO;
import project.common.DBConnect;
public class ReviewDAO {
	Connection conn;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	private ReviewDAO() {
	}

	static ReviewDAO instance = new ReviewDAO();

	public static ReviewDAO getInstance() {
		return instance;
	}
	
	public List<ReviewVO> selectReview(){
		String query="select * from review ";
		
		List<ReviewVO> dao=new ArrayList<>();
		try {
			conn=DBConnect.getConnection();
			pstmt=conn.prepareStatement(query);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				ReviewVO vo=new ReviewVO();
				vo.setArticleno(rs.getInt("articleno"));
				vo.setContent(rs.getString("content"));
				vo.setGrade(rs.getInt("grade"));
				vo.setSubject(rs.getString("subject"));
				vo.setT_name(rs.getString("t_name"));
				vo.setWriter_date(rs.getDate("writer_date"));
				vo.setWriter_id(rs.getString("writer_id"));
				dao.add(vo);
			}
			DBConnect.closeAll(conn, pstmt, rs);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return dao;
	}
}
