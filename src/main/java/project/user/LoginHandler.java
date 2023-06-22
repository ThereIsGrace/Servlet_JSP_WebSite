package project.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import project.DAO.LoginDAO;


@WebServlet("/login.do")
public class LoginHandler extends HttpServlet {

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		LoginDAO loginDAO = LoginDAO.getInstance();
		
		String id = request.getParameter("user_id");
		String pwd = request.getParameter("user_password");
		String user = request.getParameter("user");
		HttpSession session = request.getSession();
		
		int result;
		String nextPage="";
		if(user.equals("학생용")) {
			result = loginDAO.readMentee(id,pwd);
			if(result == 1) {
				
				System.out.println(id);
				request.setAttribute("user_id",id);
				session.setAttribute("user_id", id);
				nextPage="/index.jsp";
			}else if(result == 0) {
				nextPage = "/Login.jsp";
				request.setAttribute("error_message", "id_error");
			}else {
				nextPage = "/Login.jsp";
				request.setAttribute("error_message", "pwd_error");
			}
		}else if(user.equals("강사용")) {
			result = loginDAO.readTutor(id,pwd);
			if(result == 1) {
				request.setAttribute("user_id",id);
				session.setAttribute("user_id", id);
				nextPage="/index.jsp";
			}else if(result == 0) {
				nextPage = "/Login.jsp";
				request.setAttribute("error_message", "id_error");
			}else {
				nextPage = "/Login.jsp";
				request.setAttribute("error_message", "pwd_error");
			}
		
		}
		
		RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
		dispatch.forward(request, response);
	}

}