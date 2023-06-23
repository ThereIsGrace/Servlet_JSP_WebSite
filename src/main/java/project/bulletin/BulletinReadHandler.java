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

/**
 * Servlet implementation class BulletinReadHandler
 */
@WebServlet("/viewread.do")
public class BulletinReadHandler extends HttpServlet {
	
	CommunityDAO cd;
	CommunityVO vo;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		int number=Integer.parseInt(request.getParameter("articleno"));
		cd=CommunityDAO.getInstance();
		vo=new CommunityVO();
		vo=cd.viewCommunity(number);
		request.setAttribute("view", vo);
		String nextPage = "/board/viewboard.jsp";
		RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
		dispatch.forward(request, response);
	}
}
