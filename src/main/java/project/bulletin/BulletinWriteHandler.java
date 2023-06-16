package project.bulletin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.DAO.CommunityDAO;
import project.VO.CommunityVO;



@WebServlet("/bulletinwrite.do")
public class BulletinWriteHandler extends HttpServlet {
	CommunityVO cv;
	CommunityDAO cd;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		cv = new CommunityVO();
		cd = CommunityDAO.getInstance();
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String userId = request.getParameter("userId");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		System.out.println(userId);
		System.out.println(content);
		System.out.println(title);
		cv.setComwriter_id(userId);
		cv.setComcontent(content);
		cv.setComtitle(title);
		cd.insertCommunity(cv);
		String nextPage = "/bulletinread.do";
		RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
		dispatch.forward(request, response);
	}
}
