package project.review;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.DAO.ReviewDAO;
import project.VO.ReviewVO;

@WebServlet("/ReviewReadHandler.do")
public class ReviewReadHandler extends HttpServlet {
	ReviewVO rv;
	ReviewDAO rdao;
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	doHandle(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	doHandle(request, response);
	}
	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		rdao=ReviewDAO.getInstance();
		rv=new ReviewVO();
		List <ReviewVO> review=new ArrayList<>();
		review=rdao.selectReview();
		request.setAttribute("review", review);
		String nextPage = "/board/reviweboard.jsp";
		RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
		dispatch.forward(request, response);
	}

}
