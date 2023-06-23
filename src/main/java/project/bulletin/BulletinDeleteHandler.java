package project.bulletin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.DAO.CommunityDAO;

@WebServlet("/bulletinDelete.do")
public class BulletinDeleteHandler extends HttpServlet {

	CommunityDAO cd;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		cd = CommunityDAO.getInstance();
		int articleno=Integer.parseInt(request.getParameter("articleno"));
		cd.deleteCommunity(articleno);
		BulletinList list=new BulletinList();
		list.doHandle(request, response);
		}

}
