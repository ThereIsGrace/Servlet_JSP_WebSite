package project.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.DAO.LoginDAO;


@WebServlet("/lo.do")
public class UserLogoutHandler extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandler(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	doHandler(request, response);
	}
	protected void doHandler(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		
		request.getSession().invalidate(); // 세션 삭제
<<<<<<< HEAD
		RequestDispatcher dispatch = request.getRequestDispatcher("/index.jsp");
=======
		RequestDispatcher dispatch = request.getRequestDispatcher("/index.html");
>>>>>>> master
		dispatch.forward(request, response);
		
	}

}
