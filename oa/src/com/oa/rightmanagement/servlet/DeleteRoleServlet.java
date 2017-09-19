package com.oa.rightmanagement.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oa.rightmanagement.serviceImpl.RoleServiceImpl;

public class DeleteRoleServlet extends HttpServlet {

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
		String roleIdStrs=request.getParameter("roleIdStrs");
		String[] roleIds=roleIdStrs.split(";");
		int delete=0;
		for(int i=0;i<roleIds.length;i++){
		if(roleIds[i]!=null)
		{
			int roleId=Integer.parseInt(roleIds[i].trim());
			 delete=roleServiceImpl.delete(roleId);
		
		}
		}
		if(delete>0){
		response.getWriter().print(delete);
		}
	}

}
