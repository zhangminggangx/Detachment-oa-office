package com.oa.deskTop.servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oa.deskTop.entity.Shortmessage;
import com.oa.deskTop.serviceImpl.ShortmessageServiceImpl;
import com.oa.personnel.entity.UserInfo;

public class AddMessageServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AddMessageServlet() {
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
	ShortmessageServiceImpl shortmessageServiceImpl=new ShortmessageServiceImpl();
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

           HttpSession session=		request.getSession();
          UserInfo userInfo=(UserInfo) session.getAttribute("userInfo");
          String title=request.getParameter("title");
          String contents=request.getParameter("contents");
          String receiveEmails=request.getParameter("receiveEmail");
          String[] receiveEmailStrs=receiveEmails.split(";");
          Date sendTime=new Date();
         String sendEmail=userInfo.getComEmail();
          
          Shortmessage shortmessage=new Shortmessage();
          
          shortmessage.setContents(contents);
          shortmessage.setSendEmail(sendEmail);
          shortmessage.setSendTime(sendTime);
          shortmessage.setTitle(title);
          shortmessage.setUnread(true);
          int ret=0;
          for(int i=0;i<receiveEmailStrs.length;i++){
        	String receiveEmail=  receiveEmailStrs[i];
        	 shortmessage.setReceiveEmail(receiveEmail);
        	  ret+=shortmessageServiceImpl.send(shortmessage);
          }
         
         
          if(ret==receiveEmailStrs.length){
        	  request.getRequestDispatcher("/html/shortmessage/mid.jsp").forward(request,response);
          }else{
        	System.out.println("·¢ËÍÊ§°Ü");
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
