package com.oa.common;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oa.personnel.entity.UserInfo;
import com.oa.rightmanagement.service.FunACLService;
import com.oa.rightmanagement.serviceImpl.FunACLServiceImpl;

public class BaseServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public BaseServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}
	private FunACLService funAclService = new FunACLServiceImpl();
	@Override
	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 接收fcode，获取用户的roleId，调用业务功能boolean hasPermission（fcode，roleId）
		// 实现权限校验
		HttpSession session = request.getSession();
		UserInfo userInfo =(UserInfo)session.getAttribute("userInfo");
		int roleId=userInfo.getRoleId();
		String fCode=request.getParameter("fcode");
	
		if(fCode==null){
			super.service(request, response);
		}else{
			boolean ret = funAclService.hasPermission(fCode, roleId);
			if (ret) {
				super.service(request, response);
			} else {
				request.getRequestDispatcher("/rightError.jsp").forward(request, response);
			}
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
