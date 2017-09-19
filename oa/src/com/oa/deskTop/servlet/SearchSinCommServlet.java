package com.oa.deskTop.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oa.deskTop.entity.CommTypes;
import com.oa.deskTop.entity.Communication;
import com.oa.deskTop.entity.SinComm;
import com.oa.deskTop.service.CommTypesService;
import com.oa.deskTop.service.CommunicationService;
import com.oa.deskTop.service.SinCommService;
import com.oa.deskTop.serviceImpl.CommTypesServiceImpl;
import com.oa.deskTop.serviceImpl.CommunicationServiceImpl;
import com.oa.deskTop.serviceImpl.SinCommServiceImpl;
import com.oa.personnel.entity.Department;
import com.oa.personnel.entity.UserInfo;
import com.oa.personnel.service.DepartmentService;
import com.oa.personnel.serviceImpl.DepartmentServiceImpl;

public class SearchSinCommServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public SearchSinCommServlet() {
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
	private CommunicationService commService = new CommunicationServiceImpl();
	private DepartmentService deptService = new DepartmentServiceImpl();
	private SinCommService sinService = new SinCommServiceImpl();
	private CommTypesService commTypesService = new CommTypesServiceImpl();
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		UserInfo userInfo = (UserInfo)session.getAttribute("userInfo");
		List<CommTypes> typeList = commTypesService.searchAll();
		
		//个人通讯录
		int uId= userInfo.getUid();

		List<SinComm> sinList = sinService.searchAllSinComm( uId);
		request.setAttribute("sinList", sinList);
		request.setAttribute("typeList", typeList);
		
		request.getRequestDispatcher("/html/tongxunlu/sinComm.jsp").forward(request, response);
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
