package com.oa.deskTop.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import com.oa.deskTop.entity.Schedule;
import com.oa.deskTop.serviceImpl.ScheduleServiceImpl;
import com.oa.personnel.entity.UserInfo;

public class UpdateScheduleServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public UpdateScheduleServlet() {
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
	ScheduleServiceImpl scheduleServiceImpl=new ScheduleServiceImpl();
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session=request.getSession();
		UserInfo userInfo=(UserInfo)session.getAttribute("userInfo");
		
		String scdId=request.getParameter("scdId");
		int oldScdId=Integer.parseInt(scdId);
		String startTime=request.getParameter("startTime");
		String endTime=request.getParameter("endTime");
		String title=request.getParameter("title");
		String place=request.getParameter("place");
		String content=request.getParameter("content");
		
		Schedule schedule=new Schedule();
		
		schedule.setStart(startTime);
		schedule.setEnd(endTime);
		schedule.setContents(content);
		schedule.setTitle(title);
		schedule.setPlace(place);
		schedule.setUid(userInfo.getUid());
		int ret=scheduleServiceImpl.update(oldScdId, schedule);
		if(ret==1){
			JSONObject  json =JSONObject.fromObject(schedule);
			response.getWriter().print(json);
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
