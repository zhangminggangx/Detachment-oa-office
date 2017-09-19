package com.oa.rightmanagement.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oa.personnel.entity.UserInfo;
import com.oa.personnel.serviceImpl.UserInfoServiceImpl;
import com.oa.rightmanagement.entity.Role;
import com.oa.rightmanagement.serviceImpl.RoleServiceImpl;

public class ViewUsersServlet extends HttpServlet {

	private UserInfoServiceImpl userInfoServiceImpl=new UserInfoServiceImpl();
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
		List<UserInfo> userInfos=userInfoServiceImpl.searchAll();
		List<Role> roles=roleServiceImpl.searchAll();
        request.setAttribute("userInfos", userInfos);
        request.setAttribute("roles",roles);
        request.getRequestDispatcher("/html/pms/roleuserlist.jsp").forward(request, response);
	}

}
