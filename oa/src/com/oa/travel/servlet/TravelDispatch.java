package com.oa.travel.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oa.dispatch.daoImpl.DisProjectDaoImpl;
import com.oa.dispatch.entity.DisProject;
import com.oa.personnel.entity.UserInfo;
import com.oa.travel.entity.TravelApp;
import com.oa.travel.entity.TravelReport;
import com.oa.travel.serviceImpl.TravelAppServiceImpl;
import com.oa.travel.serviceImpl.TravelReportServiceImpl;

public class TravelDispatch extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public TravelDispatch() {
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
	
	private TravelAppServiceImpl travelAppServiceImpl = new TravelAppServiceImpl();
	private TravelReportServiceImpl travelReportServiceImpl = new TravelReportServiceImpl();
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		 DisProjectDaoImpl impl=new DisProjectDaoImpl();
	       List<DisProject>projects=impl.findAll();
	     
	      
		HttpSession session=request.getSession();
		UserInfo userInfo=(UserInfo)session.getAttribute("userInfo");
		int empId=userInfo.getEmpId();
		List<TravelReport> repList=travelReportServiceImpl.searchByEmpIdAndState(empId, 4);
		
		for (TravelReport travelReport : repList) {
			int appId=travelReport.getAppId();
			TravelApp	travelApp=travelAppServiceImpl.searchById(appId);
			String formNo= travelApp.getFormNo();
		}
			
		 request.setAttribute("projects", projects);
		request.setAttribute("repList", repList);
		
		request.getRequestDispatcher("/html/worktime/del_livelist.jsp").forward(request, response);
		
		
	

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
