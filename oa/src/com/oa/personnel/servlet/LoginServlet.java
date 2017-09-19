package com.oa.personnel.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oa.deskTop.entity.Shortmessage;
import com.oa.deskTop.serviceImpl.ShortmessageServiceImpl;
import com.oa.personnel.dao.UserInfoDao;
import com.oa.personnel.daoImpl.UserInfoDaoImpl;
import com.oa.personnel.entity.Employee;
import com.oa.personnel.entity.UserInfo;
import com.oa.personnel.serviceImpl.EmployeeServiceImpl;
import com.oa.personnel.serviceImpl.UserInfoServiceImpl;
import com.oa.rightmanagement.entity.ModuleAcl;
import com.oa.rightmanagement.serviceImpl.ModuleAclServiceImpl;

public class LoginServlet extends HttpServlet {

	private UserInfoServiceImpl impl = new UserInfoServiceImpl();
	private ModuleAclServiceImpl moduleAclServiceImpl=new ModuleAclServiceImpl();

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
	EmployeeServiceImpl employeeServiceImpl = new EmployeeServiceImpl();
	ShortmessageServiceImpl shortmessageServiceImpl = new ShortmessageServiceImpl();

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uname = request.getParameter("uname");
		String upwd = request.getParameter("upwd");
		HttpSession session=request.getSession();
		UserInfoDao dao = new UserInfoDaoImpl();
		UserInfo userInfo = impl.login(uname, upwd);
		if (userInfo != null) {
			Employee employee = employeeServiceImpl.SearchById(userInfo.getEmpId());
			session.setAttribute("userInfo", userInfo);
			session.setAttribute("employee", employee);
			// ∂Ãœ˚œ¢Ã·–—
			List<Shortmessage> unMessagesList = new ArrayList<Shortmessage>();
			unMessagesList = shortmessageServiceImpl.findUnRead(userInfo);
			
			
			String haveUnMegTitle="";
			for (Shortmessage shortmessage : unMessagesList) {
				haveUnMegTitle+="<a href='/oa/ViewShortMessageServlet'>"+shortmessage.getTitle()+"</a><br/>";
			}

			session.setAttribute("haveUnMeg",unMessagesList.size());
			session.setAttribute("haveUnMsgList", unMessagesList);
			session.setAttribute("haveUnMegTitle",haveUnMegTitle);
			List<ModuleAcl> moduleAcls=moduleAclServiceImpl.findByRoleId(userInfo.getRoleId());
			session.setAttribute("moduleAcls", moduleAcls);
			request.getRequestDispatcher("/index.jsp").forward(request,response);
		} else
			request.getRequestDispatcher("/error.jsp").forward(request,
					response);
	}

}
