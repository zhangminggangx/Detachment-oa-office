package com.oa.deskTop.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import com.oa.deskTop.entity.SinComm;
import com.oa.deskTop.service.SinCommService;
import com.oa.deskTop.serviceImpl.SinCommServiceImpl;
import com.oa.personnel.entity.UserInfo;

public class AddSinCommServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AddSinCommServlet() {
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
	private SinCommService sinService = new SinCommServiceImpl();

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		UserInfo userInfo = (UserInfo) session.getAttribute("userInfo");
		int uId = userInfo.getUid();
		int typeId = Integer.parseInt(request.getParameter("typeId"));
		int commId = Integer.parseInt(request.getParameter("commId"));
		SinComm sinComm = new SinComm();
		sinComm.setCommId(commId);
		sinComm.setTid(typeId);
		sinComm.setUid(uId);
		int ret = sinService.AddSinComm(sinComm);
		if(ret==1){
			JSONObject  json =JSONObject.fromObject(ret);
			response.getWriter().print(json);
		}
		//request.getRequestDispatcher("/SearchAllCommunicationServlet").forward(request, response);

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
