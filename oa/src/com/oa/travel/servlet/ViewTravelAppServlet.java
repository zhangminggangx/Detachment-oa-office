package com.oa.travel.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oa.personnel.entity.UserInfo;
import com.oa.travel.entity.TravelApp;
import com.oa.travel.serviceImpl.TravelAppServiceImpl;

public class ViewTravelAppServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ViewTravelAppServlet() {
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
	private TravelAppServiceImpl imp = new TravelAppServiceImpl();
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session=request.getSession();
		session.getAttribute("empId");
		UserInfo userInfo=(UserInfo)session.getAttribute("userInfo");
		int empId=userInfo.getEmpId();
   String spageNo=request.getParameter("pageNo");
   String Sstate = request.getParameter("select2");
	int pageNo=1;
	if(spageNo!=null){
		pageNo=Integer.parseInt(spageNo);
	}
	int state =1;
	if(Sstate!=null){
		state=Integer.parseInt(Sstate);
	}
	List<TravelApp> travelAppList=imp.searchAllByEmpIdAndState(5, pageNo, empId, state);
	int pageCount=imp.computePageCountByState(5, state);

	request.setAttribute("travelAppList", travelAppList);
	request.setAttribute("pageNo", pageNo);
	request.setAttribute("pageCount", pageCount);
	request.setAttribute("Sstate", Sstate);
	request.getRequestDispatcher("/html/worktime/leavelist_1.jsp").forward(request, response);
		
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
