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


@WebServlet("/bulletinUpdate.do")
public class BulletinUpdateHandler extends HttpServlet {
	CommunityVO cv;
	CommunityDAO cd;
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
		cv = new CommunityVO();
		cd = CommunityDAO.getInstance();
		String articleno=request.getParameter("articleno");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		System.out.println(articleno);
		System.out.println(title);
		System.out.println(content);
		cv.setComarticleno(Integer.parseInt(articleno));
		cv.setComcontent(content);
		cv.setComtitle(title);
		cv.setComwriter_id(request.getParameter("userid"));
		cd.insertCommunity(cv);
		request.setAttribute("view", cv);
		String nextPage = "/board/viewboard.jsp";
		RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
		dispatch.forward(request, response);
		
		}
 	}
