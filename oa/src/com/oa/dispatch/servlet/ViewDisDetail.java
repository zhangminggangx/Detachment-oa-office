package com.oa.dispatch.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oa.dispatch.entity.Dispatch;
import com.oa.dispatch.service.DispatchService;
import com.oa.dispatch.serviceImpl.DispatchServiceImpl;
import com.oa.personnel.entity.Employee;
import com.oa.personnel.entity.UserInfo;
import com.oa.personnel.service.EmployeeService;
import com.oa.personnel.serviceImpl.EmployeeServiceImpl;

public class ViewDisDetail extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ViewDisDetail() {
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
	private DispatchService disService = new DispatchServiceImpl();
	private EmployeeService empService = new EmployeeServiceImpl();
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String formNo = request.getParameter("formNo");
		Dispatch dispatch =disService.searchDisDetail(formNo);
		int empId = dispatch.getEmpId();
		Employee emp = empService.SearchById(empId);
		
		request.setAttribute("dispatch", dispatch);
		request.setAttribute("emp", emp);
		request.getRequestDispatcher("/html/dispatch/baoxiao/moreapplist_1.jsp").forward(request, response);
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
