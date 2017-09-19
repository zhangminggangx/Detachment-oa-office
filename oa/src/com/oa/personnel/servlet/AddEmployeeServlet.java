package com.oa.personnel.servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import com.oa.common.BaseServlet;
import com.oa.common.DateFormatUtil;
import com.oa.deskTop.entity.Communication;
import com.oa.deskTop.service.CommunicationService;
import com.oa.deskTop.serviceImpl.CommunicationServiceImpl;
import com.oa.personnel.entity.Employee;
import com.oa.personnel.entity.UserInfo;
import com.oa.personnel.service.DepartmentService;
import com.oa.personnel.service.EmployeeService;
import com.oa.personnel.service.FormNoService;
import com.oa.personnel.service.UserInfoService;
import com.oa.personnel.serviceImpl.DepartmentServiceImpl;
import com.oa.personnel.serviceImpl.EmployeeServiceImpl;
import com.oa.personnel.serviceImpl.FormNoServiceImpl;
import com.oa.personnel.serviceImpl.UserInfoServiceImpl;

public class AddEmployeeServlet extends BaseServlet {

	/**
	 * Constructor of the object.
	 */
	public AddEmployeeServlet() {
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
	private DepartmentService deptService = new DepartmentServiceImpl();
	private FormNoService formService = new FormNoServiceImpl();
	private EmployeeService empService = new EmployeeServiceImpl();
	private UserInfoService userService = new UserInfoServiceImpl();
	private CommunicationService communicationService = new CommunicationServiceImpl();

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		UserInfo userInfo = (UserInfo) session.getAttribute("userInfo");

		String empName = request.getParameter("empName");
		String empMobil = request.getParameter("empMobil");
		String empEmail = request.getParameter("empEmail");
		String idCard = request.getParameter("idCard");
		Date empBirth = DateFormatUtil.StringToShortDate(request
				.getParameter("empBirth"));
		String empDiploma = request.getParameter("empDiploma");
		String empExperience = request.getParameter("empExperience");
		String deptName = request.getParameter("deptName");
		String company = request.getParameter("company");
		String position = request.getParameter("position");
		int deptId = deptService.searchDeptId(deptName);
		int no = formService.searchEmpNo() + 1;
		String empNo = "YG" + no;

		// 添加新员工
		Employee employee = new Employee();
		employee.setEmpNo(empNo);
		employee.setEmpName(empName);
		employee.setEmpEmail(empEmail);
		employee.setEmpMoble(empMobil);
		employee.setIdCard(idCard);
		employee.setEmpBirth(empBirth);
		employee.setEmpDiploma(empDiploma);
		employee.setEmpExperience(empExperience);
		employee.setDeptName(deptName);
		employee.setDeptId(deptId);
		employee.setCompany(company);
		employee.setPosition(position);
		employee.setPicture("userphoto.jpg");
		int ret = empService.addEmployee(employee);
		if (ret == 1) {
			int empId = empService.searchNewAddEmpId();
			// 添加员工对应的用户
			UserInfo user = new UserInfo();
			user.setEmpNo(empNo);
			user.setUpwd("1234");
			user.setEmpName(empName);
			user.setDeptName(deptName);
			user.setEmpId(empId);
			user.setFilePath(empName);
			user.setComEmail(empEmail);
			user.setFileCapacity(10241024);

			Communication comm = new Communication();
			comm.setCreateTime(new Date());
			comm.setEmpName(empName);
			comm.setEmpMobile(empMobil);
			comm.setPosition(position);
			comm.setEmail(empEmail);
			comm.setDepartment(deptName);
			comm.setTid(1);

			formService.updateEmpNo(no);
			userService.addUser(user);
			communicationService.addCommunication(comm);
			JSONObject json = JSONObject.fromObject(employee);
			response.getWriter().print(json);
		}
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
