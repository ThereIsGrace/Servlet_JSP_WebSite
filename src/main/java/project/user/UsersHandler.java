package project.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.DAO.MembershipDAO;
import project.VO.MenTeeVO;
import project.VO.TutorVO;


@WebServlet("/UsersHandler.do")
public class UsersHandler extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doHandle(request, response);
	}
	protected void doHandle(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		if(request.getParameter("men").equals("tutor"))//멘토의 정보를 입력받음
		{
			TutorVO vo = new TutorVO(); 
			// 사용자가 입력한 정보를 가져와서 set으로 전달
			vo.setT_id(request.getParameter("id")); 
			vo.setT_pwd(request.getParameter("pw"));
			vo.setT_age(request.getParameter("age"));
			vo.setT_phonum(request.getParameter("phone"));
			vo.setT_area(request.getParameter("ad"));
			vo.setT_name(request.getParameter("name"));
			vo.setT_subject(request.getParameter("subject"));
			vo.setT_suiv(request.getParameter("uni"));
			MembershipDAO dao = MembershipDAO.getInstance();
			dao.insertTutor(vo);
			String nextPgae="./board/login.jsp";
			RequestDispatcher dispatch = request.getRequestDispatcher(nextPgae);
			dispatch.forward(request, response);
		}else if(request.getParameter("men").equals("mentee")) //멘티의 정보를 입력받음
		{
			MenTeeVO vo = new MenTeeVO();
			vo.setM_id(request.getParameter("id"));
			vo.setM_pwd(request.getParameter("pw"));
			vo.setM_age(request.getParameter("age"));
			vo.setM_phonum(request.getParameter("phone"));
			vo.setM_area(request.getParameter("ad"));
			vo.setM_name(request.getParameter("name"));
			vo.setM_subject(request.getParameter("subject"));
			MembershipDAO dao = MembershipDAO.getInstance();
			dao.insertMenTee(vo);
			String nextPgae="./board/login.jsp";
			RequestDispatcher dispatch = request.getRequestDispatcher(nextPgae);
			dispatch.forward(request, response);
			
		}			
	}
	
}
