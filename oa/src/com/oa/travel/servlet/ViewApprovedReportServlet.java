package com.oa.travel.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oa.common.BaseServlet;
import com.oa.personnel.entity.UserInfo;
import com.oa.travel.entity.TravelReport;
import com.oa.travel.entity.WorkStream;
import com.oa.travel.serviceImpl.TravelReportServiceImpl;
import com.oa.travel.serviceImpl.WorkStreamServiceImpl;

public class ViewApprovedReportServlet extends BaseServlet {

	/**
	 * Constructor of the object.
	 */
	public ViewApprovedReportServlet() {
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
	TravelReportServiceImpl travelReportServiceImpl=new TravelReportServiceImpl();
	WorkStreamServiceImpl workStreamServiceImpl = new WorkStreamServiceImpl();

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session= request.getSession();
		UserInfo userInfo=(UserInfo)session.getAttribute("userInfo");
		String spageNo=request.getParameter("pageNo");
		int pageNo=1;
		if(spageNo!=null){
			pageNo=Integer.parseInt(spageNo);
		}
	    int empId=userInfo.getEmpId();
		List<WorkStream> workStreamsList=workStreamServiceImpl.findReportedByBossId(empId, 5, pageNo);
		List<TravelReport> travelReportList=travelReportServiceImpl.searchApproveReport(workStreamsList);
		
		int total=travelReportList.size();
		int pageCount=workStreamServiceImpl.computePageCount(empId, 5, true,"BG");
		request.setAttribute("travelReportList", travelReportList);
		request.setAttribute("pageNo", pageNo);
		request.setAttribute("pageCount", pageCount);
		
		request.getRequestDispatcher("/html/worktime/d4.jsp").forward(request, response);

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
