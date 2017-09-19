package com.oa.deskTop.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oa.deskTop.entity.Shortmessage;
import com.oa.deskTop.serviceImpl.ShortmessageServiceImpl;
import com.oa.personnel.entity.UserInfo;

public class ViewShortMessageServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ViewShortMessageServlet() {
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

	ShortmessageServiceImpl shortmessageServiceImpl = new ShortmessageServiceImpl();

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		UserInfo userInfo = (UserInfo) session.getAttribute("userInfo");
		String stitle = request.getParameter("tabName");
		int title = 1;
		String tabName="收件箱";
		if (stitle != null) {
			stitle=stitle.substring(0, stitle.indexOf('?'));
			title = Integer.parseInt(stitle);
	
		}
		if(title!=1){
			tabName="发件箱";
		}
	
		List<Shortmessage> receivedMessages = shortmessageServiceImpl
				.findReceive(userInfo);
		List<Shortmessage> sendMessages = shortmessageServiceImpl
				.findSend(userInfo);
		request.setAttribute("receivedMessages", receivedMessages);
		request.setAttribute("sendMessages", sendMessages);
		request.setAttribute("tabName", tabName);
		request.getRequestDispatcher("/html/shortmessage/mid.jsp").forward(
				request, response);

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
