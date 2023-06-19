package project.user;

import java.io.IOException;
import java.security.KeyStore.PasswordProtection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.DAO.LoginDAO;


@WebServlet("/findId")
public class FindMIdHandler extends HttpServlet {
	
	protected void init(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("findmid 생성");
	}
	
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
		String nextPage= "";
		
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String M_id=loginDAO.searchIdM(name, phone);
		System.out.println(M_id);
		request.setAttribute("M_id", M_id);
		nextPage = "Login.jsp";
		
		RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
		dispatch.forward(request, response);
	}	
	
}
