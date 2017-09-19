package com.oa.dispatch.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oa.deskTop.entity.Shortmessage;
import com.oa.deskTop.serviceImpl.ShortmessageServiceImpl;
import com.oa.dispatch.service.DispatchService;
import com.oa.dispatch.serviceImpl.DispatchServiceImpl;
import com.oa.personnel.entity.Department;
import com.oa.personnel.entity.Employee;
import com.oa.personnel.entity.UserInfo;
import com.oa.personnel.serviceImpl.DepartmentServiceImpl;
import com.oa.personnel.serviceImpl.EmployeeServiceImpl;

public class SubmitDispatchServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public SubmitDispatchServlet() {
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
	private DispatchService disService = new DispatchServiceImpl();
	private ShortmessageServiceImpl shortmessageServiceImpl=new ShortmessageServiceImpl();
	private DepartmentServiceImpl departmentServiceImpl=new DepartmentServiceImpl();
	private EmployeeServiceImpl employeeServiceImpl=new EmployeeServiceImpl();
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session=request.getSession();
		UserInfo userInfo=(UserInfo)session.getAttribute("userInfo");
		String position = "部门经理";
		Department department=departmentServiceImpl.findByDeptName(userInfo.getDeptName());
		//申请人的部门经理
		Employee emp2=employeeServiceImpl.searchByDeptId(department.getDeptId(), position);
		String formNo = request.getParameter("formNo");
		
		
		int ret =disService.submitDis(formNo, 2, position);
		//发送短消息
		Shortmessage shortmessage=new Shortmessage();
		shortmessage.setReceiveEmail(emp2.getEmpEmail());
		shortmessage.setSendEmail(userInfo.getComEmail());
		shortmessage.setContents("您有待审核的报销单");
		shortmessage.setTitle("您有待审核的报销单");
		shortmessage.setSendTime(new Date());
		shortmessage.setUnread(true);
		shortmessageServiceImpl.send(shortmessage);
		
		
		request.getRequestDispatcher("/SerachDisServlet?pageNo=1").forward(request, response);
		
		
		
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
