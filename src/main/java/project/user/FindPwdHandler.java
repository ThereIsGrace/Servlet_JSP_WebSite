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
public class FindPwdHandler extends HttpServlet {
	
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
		String user = request.getParameter("user"); // Login.jsp에서 선택된 user_level값 받아오기
		
		if(user.equals("학생용")) { // user_level이 학생용 일 때
			String id = request.getParameter("id");
			String name = request.getParameter("name");
			String phone = request.getParameter("phone");
			String M_pwd=loginDAO.searchPwdM(id, name, phone); // Login.DAO에서 serchPwdM 실행
			System.out.println("값 받아옴"); // 작동 확인용 코드
			System.out.println(id); // 작동 확인용 코드
			System.out.println(name); // 작동 확인용 코드
			request.setAttribute("M_pwd", M_pwd);
			nextPage = "Login.jsp";
		}else if(user.equals("강사용")){ // user_level이 강사용 일 때
			String id = request.getParameter("id");
			String name = request.getParameter("name");
			String phone = request.getParameter("phone");
			String T_pwd=loginDAO.searchPwdT(id,name, phone); // Login.DAO에서 serchPwdT 실행
			System.out.println(T_pwd);
			request.setAttribute("T_pwd", T_pwd);
			nextPage = "Login.jsp";
		}
		RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
		dispatch.forward(request, response);
	}	
	
}
