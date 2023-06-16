package project.membership;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.do")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private void doProcess(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException{
		//실제로 처리해야 할 요청을 처리하는 로직 구현
		//클라이언트로부터 요청 정보 추출 (HttpServletRequest 객체를 사용하여 
		// 클라이언트로부터 전달된 요청 파라미터, 헤더, 쿠키 등의 정보를 추출함)
		// 비즈니스 로직 처리, 응답 생성 및 전송
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		
		Action action = null;
		ActionForward forward = null; 
		
		//회원가입 폼
		if (command.equals("MemberJoinForm.do")) {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./member/memberJoinForm.jsp");
		}
		//회원가입
		else if (command.equals("/MemberJoin.do"))
		{
			try {
				action = new MemberJoin();
				forward = action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		//페이지 이동
		if (forward != null) {
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			}else {
				RequestDispatcher dispatcher = 
						request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}

}
