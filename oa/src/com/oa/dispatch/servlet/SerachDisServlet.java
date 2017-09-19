package com.oa.dispatch.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oa.dispatch.entity.Dispatch;
import com.oa.dispatch.service.DispatchService;
import com.oa.dispatch.serviceImpl.DispatchServiceImpl;
import com.oa.personnel.entity.UserInfo;
import com.oa.personnel.service.EmployeeService;
import com.oa.personnel.serviceImpl.EmployeeServiceImpl;

public class SerachDisServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public SerachDisServlet() {
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
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to
	 * post.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	DispatchService disService = new DispatchServiceImpl();
	EmployeeService empService = new EmployeeServiceImpl();

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String pageNoStr=request.getParameter("pageNo");
		int pageNo =1;
		if(pageNoStr!=null)
			pageNo=Integer.parseInt(pageNoStr);
		UserInfo userInfo = (UserInfo) session.getAttribute("userInfo");
		int empId = userInfo.getEmpId();
		List<Dispatch> disList = null;
		List<Dispatch> disListCount = null;
		int pageCount = 0;
		int disCount = 0;
		if (request.getParameter("sel") == null) {
			disList = disService.searchEmpDis(empId, 10, pageNo);
			disListCount = disService.searchEmpDis(empId);
			pageCount = disService.computePageCount(10, empId);
			disCount = disListCount.size();
		}else{
			int state = Integer.parseInt(request.getParameter("sel"));
			disList =disService.searchEmpStateDis(empId, state, 10, pageNo);
			disListCount = disService.searchEmpStateDis(empId, state);
			pageCount = disService.computePageCount(10, empId, state);
			disCount = disListCount.size();
		}

		request.setAttribute("disCount", disCount);
		request.setAttribute("pageNo", pageNo);
		request.setAttribute("pageCount", pageCount);

		request.setAttribute("disList", disList);
		request.getRequestDispatcher("/html/dispatch/baoxiao/applist_1.jsp")
				.forward(request, response);

	}

	/**
	 * Initialization of the servlet. <br>
	 * 
	 * @throws ServletException
	 *             if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
