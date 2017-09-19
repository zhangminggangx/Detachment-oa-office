package com.oa.travel.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oa.personnel.entity.Employee;
import com.oa.travel.entity.TravelReport;
import com.oa.travel.serviceImpl.TravelReportServiceImpl;

public class ViewTravelReportServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ViewTravelReportServlet() {
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
	TravelReportServiceImpl travelReportServiceImpl=new TravelReportServiceImpl();
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
        
		HttpSession session=request.getSession();
		Employee employee=(Employee)session.getAttribute("employee");
		String curState=request.getParameter("curState");
		if(curState==null){curState="1";}
		//System.out.println(curState+"~~~~~~~");
		String spageNo=request.getParameter("pageNo");
		int pageNo=1;
		if(spageNo!=null){
			pageNo=Integer.parseInt(spageNo);
		}
		//List<TravelReport> travelReportList=travelReportServiceImpl.sreachAll(5, pageNo);
		List<TravelReport> travelReportList=travelReportServiceImpl.searchByEmpIdAndState(employee.getEmpId(), Integer.parseInt(curState), 5, pageNo);
	//	int pageCount=travelReportServiceImpl.computePageCount(5);
		int pageCount=travelReportServiceImpl.computePageCountByState(5, Integer.parseInt(curState));
		
		request.setAttribute("travelReportList", travelReportList);
		request.setAttribute("pageNo", pageNo);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("curState", curState);
		request.getRequestDispatcher("/html/worktime/leavelist_2.jsp").forward(request, response);
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
