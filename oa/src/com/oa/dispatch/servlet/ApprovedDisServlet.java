package com.oa.dispatch.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oa.common.BaseServlet;
import com.oa.personnel.entity.UserInfo;
import com.oa.travel.entity.WorkStream;
import com.oa.travel.service.WorkStreamService;
import com.oa.travel.serviceImpl.WorkStreamServiceImpl;

public class ApprovedDisServlet extends BaseServlet {

	/**
	 * Constructor of the object.
	 */
	public ApprovedDisServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	private WorkStreamService wsImpl = new WorkStreamServiceImpl();
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session=request.getSession();
		UserInfo userInfo = (UserInfo) session.getAttribute("userInfo");
		String pageNoStr=request.getParameter("pageNo");
		int pageNo =1;
		if(pageNoStr!=null)
			pageNo=Integer.parseInt(pageNoStr);
		int empId= userInfo.getEmpId();
		List<WorkStream> wsList = wsImpl.searchApprovedDis(empId, 10,pageNo);
		int pageCount = wsImpl.computePageCount(empId, 10,true);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageNo", pageNo);
		request.setAttribute("wsList", wsList);
		request.getRequestDispatcher("/html/dispatch/baoxiao/applist_2.jsp").forward(request, response);
	    
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
