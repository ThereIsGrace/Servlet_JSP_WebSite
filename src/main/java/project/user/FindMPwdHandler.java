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


@WebServlet("/findPwd")
public class FindMPwdHandler extends HttpServlet {
	
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
		  
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String M_pwd=loginDAO.searchPwdM(id, name, phone);
		System.out.println("값 받아옴");
		System.out.println(id);
		System.out.println(name);
		request.setAttribute("M_pwd", M_pwd);
		nextPage = "Login.jsp";
		
		RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
		dispatch.forward(request, response);
	}	
	
}
