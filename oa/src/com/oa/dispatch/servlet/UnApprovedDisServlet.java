package com.oa.dispatch.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oa.common.BaseServlet;
import com.oa.dispatch.entity.Dispatch;
import com.oa.dispatch.serviceImpl.DispatchServiceImpl;
import com.oa.personnel.entity.Employee;
import com.oa.personnel.entity.UserInfo;
import com.oa.personnel.serviceImpl.EmployeeServiceImpl;
import com.oa.travel.entity.WorkStream;
import com.oa.travel.serviceImpl.WorkStreamServiceImpl;

public class UnApprovedDisServlet extends BaseServlet {

	private EmployeeServiceImpl empImpl=new EmployeeServiceImpl();
	private DispatchServiceImpl disImpl=new DispatchServiceImpl();
	private WorkStreamServiceImpl wsImpl=new WorkStreamServiceImpl();

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
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session=request.getSession();
		String pageNoStr=request.getParameter("pageNo");
		int pageNo =1;
		if(pageNoStr!=null)
			pageNo=Integer.parseInt(pageNoStr);
		UserInfo userInfo = (UserInfo) session.getAttribute("userInfo");
		List<WorkStream> wsList = wsImpl.findByBossId(userInfo.getEmpId(), 100,pageNo);
		for (WorkStream workStream : wsList) {
			
				Dispatch dispatch = disImpl.searchFormNoDis(workStream.getFormNo());
				Employee emp = empImpl.SearchById(dispatch.getEmpId());
				dispatch.setEmployee(emp);
				workStream.setDispatch(dispatch);
			
			
		}
		
		int pageCount = wsImpl.computePageCount(userInfo.getEmpId(), 100,false);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageNo", pageNo);
		request.setAttribute("wsList", wsList);
		request.getRequestDispatcher("/html/dispatch/baoxiao/applist_4.jsp").forward(request, response);
	
	}

}
