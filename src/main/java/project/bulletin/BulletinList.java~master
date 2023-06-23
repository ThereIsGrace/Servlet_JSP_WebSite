package project.bulletin;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.DAO.CommunityDAO;
import project.VO.CommunityVO;

/**
 * Servlet implementation class BulletinReadHandler
 */
@WebServlet("/list.do")
public class BulletinList extends HttpServlet {
	CommunityDAO cd;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		cd = CommunityDAO.getInstance();
		int guswo=Integer.parseInt(request.getParameter("paginno")==null?"1":request.getParameter("paginno"));
		List<CommunityVO> cdList = cd.readCommunityAll(guswo);
		Map pagingMap=new HashMap();
		int totno=(int)Math.ceil(cd.getListCnt()/10)+1;
		pagingMap.put("cdlist",cdList);
		pagingMap.put("totno",totno);
		pagingMap.put("guswo", guswo);
		request.setAttribute("cd", pagingMap);
		String nextPage = "/board/comboardlist.jsp";
		RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
		dispatch.forward(request, response);
	}
}
