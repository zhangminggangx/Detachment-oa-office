package com.oa.rightmanagement.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oa.rightmanagement.entity.Role;
import com.oa.rightmanagement.serviceImpl.RoleServiceImpl;

public class AddRoleServlet extends HttpServlet {

	private RoleServiceImpl roleServiceImpl=new RoleServiceImpl();
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
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	String roleName=request.getParameter("roleName");
	String roleDesc=request.getParameter("roleDesc");
	Role role=new Role();
	role.setRoleName(roleName);
	role.setRoleDesc(roleDesc);
	int add=roleServiceImpl.add(role);
	if(add!=0)
		response.getWriter().print(add);
	
	}

}
