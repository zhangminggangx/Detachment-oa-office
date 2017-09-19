package com.oa.deskTop.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oa.common.BaseServlet;
import com.oa.deskTop.entity.Communication;
import com.oa.deskTop.serviceImpl.CommunicationServiceImpl;

public class UpdateCommServlet extends BaseServlet {

	/**
	 * Constructor of the object.
	 */
	public UpdateCommServlet() {
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
	CommunicationServiceImpl communicationServiceImpl=new CommunicationServiceImpl();
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	String commId=request.getParameter("commId");
	String empMobile=request.getParameter("empMobile");
	String email=request.getParameter("email");
	String department=request.getParameter("department");
	String position=request.getParameter("position");
	
	Communication communication=new Communication();
	
	communication.setCommId(Integer.parseInt(commId));
	communication.setDepartment(department);
	communication.setEmail(email);
	communication.setEmpMobile(empMobile);
	communication.setPosition(position);
	
	int ret=communicationServiceImpl.updateComm(communication);
    if(ret>0){
    	response.getWriter().print(ret);
    }
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
