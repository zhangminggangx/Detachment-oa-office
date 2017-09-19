package com.oa.personnel.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oa.common.BaseServlet;
import com.oa.personnel.entity.Department;
import com.oa.personnel.entity.Employee;
import com.oa.personnel.entity.UserInfo;
import com.oa.personnel.service.DepartmentService;
import com.oa.personnel.service.EmployeeService;
import com.oa.personnel.serviceImpl.DepartmentServiceImpl;
import com.oa.personnel.serviceImpl.EmployeeServiceImpl;

public class ViewEmployeeListServlet extends BaseServlet {

	/**
	 * Constructor of the object.
	 */
	public ViewEmployeeListServlet() {
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
	private EmployeeService empService = new EmployeeServiceImpl();
	private DepartmentService deptService = new DepartmentServiceImpl();
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession sesion = request.getSession();
		String pageNoStr=request.getParameter("pageNo");
		int pageNo =1;
		if(pageNoStr!=null)
			pageNo=Integer.parseInt(pageNoStr);
		UserInfo userInfo = (UserInfo)sesion.getAttribute("userInfo");
		int pageCount=empService.computerPageCount(3);
			List<Employee> empList = empService.searchAllEmployee(3, pageNo);
			List<Employee> list = empService.searchAllEmployee();
			List<Department> deptList =deptService.searchAll();
			int listCount = list.size();
			request.setAttribute("empList", empList);
			request.setAttribute("deptList", deptList);
			request.setAttribute("pageCount", pageCount);
			request.setAttribute("pageNo", pageNo);
			request.setAttribute("listCount", listCount);
			request.getRequestDispatcher("/html/personnel/personControl.jsp").forward(request, response);
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
