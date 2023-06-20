package project.bulletin;

import java.io.IOException;
import java.nio.file.spi.FileSystemProvider;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.DAO.CommunityDAO;
import project.VO.CommunityVO;
import project.common.makeJSON;

/**
 * Servlet implementation class BulletinReadHandler
 */
@WebServlet("/bulletinListread.do")
public class BulletinListReadHandler extends HttpServlet {
	CommunityDAO cd;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		cd = CommunityDAO.getInstance();
		List<CommunityVO> cdList = cd.readCommunity();
		String cd = makeJSON.makeJson(cdList);
		request.setAttribute("cdList", cd);
		String nextPage = "/board/comboardlist.jsp";
		RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
		dispatch.forward(request, response);
	}
}
