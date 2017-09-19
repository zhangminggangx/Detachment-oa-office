package com.oa.dispatch.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oa.common.BaseServlet;
import com.oa.dispatch.entity.Dispatch;
import com.oa.dispatch.service.DispatchService;
import com.oa.dispatch.serviceImpl.DispatchServiceImpl;
import com.oa.personnel.entity.Employee;
import com.oa.personnel.service.EmployeeService;
import com.oa.personnel.serviceImpl.DepartmentServiceImpl;
import com.oa.personnel.serviceImpl.EmployeeServiceImpl;
import com.oa.travel.entity.ApproveResult;
import com.oa.travel.entity.Result;
import com.oa.travel.entity.WorkStream;
import com.oa.travel.serviceImpl.ApprovedResultServiceImpl;
import com.oa.travel.serviceImpl.ResultServiceImpl;
import com.oa.travel.serviceImpl.WorkStreamServiceImpl;

public class ViewMyDisServlet extends BaseServlet {

	private ResultServiceImpl rsImpl=new ResultServiceImpl();
	private ApprovedResultServiceImpl arImpl=new ApprovedResultServiceImpl();
	private EmployeeServiceImpl empImpl=new EmployeeServiceImpl();
	private WorkStreamServiceImpl wsImpl=new WorkStreamServiceImpl();
	/**
	 * Constructor of the object.
	 */
	public ViewMyDisServlet() {
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
	
	private DispatchService disService = new DispatchServiceImpl();
	private EmployeeService empService = new EmployeeServiceImpl();
	private DepartmentServiceImpl  deptService=new DepartmentServiceImpl();
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<Result> results=rsImpl.queryAll();
		String formNo = request.getParameter("formNo");
		List<ApproveResult> approvedResults=arImpl.findByFormNo(formNo);
        for (ApproveResult ar : approvedResults) {
			Result rs=rsImpl.findById(ar.getResultId());
			WorkStream ws=wsImpl.findById(ar.getWsId());
			int bossId=ws.getToId();
			Employee bossEmp=null;
			if(bossId==0)
			{
				
				int deptId=deptService.searchDeptId("财务部");
				int caiwuId=empImpl.searchByDeptId(deptId, "部门经理").getEmpId();

				bossEmp=empImpl.SearchById(caiwuId);
			}
			else{
			 bossEmp=empImpl.SearchById(bossId);
			}
			ar.setEmployee(bossEmp);
			ar.setResult(rs);
		}		
		
		Dispatch dispatch =disService.searchDisDetail(formNo);
		
		int empId = dispatch.getEmpId();
		Employee emp = empService.SearchById(empId);
		
		request.setAttribute("formNo", formNo);
		request.setAttribute("results", results);
		request.setAttribute("dispatch", dispatch);
		request.setAttribute("emp", emp);
		request.setAttribute("approvedResults", approvedResults);
		request.getRequestDispatcher("/html/dispatch/baoxiao/moreapplist_12.jsp").forward(request, response);
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
