package com.oa.travel.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oa.common.BaseServlet;
import com.oa.personnel.entity.Employee;
import com.oa.personnel.entity.UserInfo;
import com.oa.personnel.serviceImpl.DepartmentServiceImpl;
import com.oa.personnel.serviceImpl.EmployeeServiceImpl;
import com.oa.travel.entity.ApproveResult;
import com.oa.travel.entity.Goods;
import com.oa.travel.entity.Present;
import com.oa.travel.entity.Result;
import com.oa.travel.entity.TravelApp;
import com.oa.travel.entity.WorkStream;
import com.oa.travel.serviceImpl.ApprovedResultServiceImpl;
import com.oa.travel.serviceImpl.GoodsServiceImpl;
import com.oa.travel.serviceImpl.PresentServiceImpl;
import com.oa.travel.serviceImpl.ResultServiceImpl;
import com.oa.travel.serviceImpl.TravelAppServiceImpl;
import com.oa.travel.serviceImpl.WorkStreamServiceImpl;

public class ViewUnApproveAppDetailServlet extends BaseServlet {

	/**
	 * Constructor of the object.
	 */
	public ViewUnApproveAppDetailServlet() {
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
	
	private ResultServiceImpl resultServiceImpl=new ResultServiceImpl();
	
	private WorkStreamServiceImpl workStreamServiceImpl=new WorkStreamServiceImpl();
	private DepartmentServiceImpl departmentServiceImpl=new DepartmentServiceImpl();
	private ApprovedResultServiceImpl approvedResultServiceImpl = new ApprovedResultServiceImpl();
	
	private TravelAppServiceImpl travelAppServiceImpl = new TravelAppServiceImpl();
	private GoodsServiceImpl goodsServiceImpl = new GoodsServiceImpl();
	private EmployeeServiceImpl employeeServiceImpl = new EmployeeServiceImpl();
	private PresentServiceImpl presentServiceImpl = new PresentServiceImpl();
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session=request.getSession();
		UserInfo userInfo=(UserInfo)session.getAttribute("userInfo");
		int empId=userInfo.getEmpId();
		Employee employee2=employeeServiceImpl.SearchById(empId);
		int deptId2=employee2.getDeptId();
		String formNo=request.getParameter("formNo");
		String wsId=request.getParameter("wsId");
		if(formNo.equals(null)||formNo==""){}
		else{
		TravelApp travelApp=travelAppServiceImpl.searchByFormNo(formNo);
		 int appIp=travelApp.getAppId();
		 int tpempId = travelApp.getEmpId();
		//得到出差申请
		
		//得到物品
		List<Goods> goodsList=goodsServiceImpl.SearchViewGoodsInvName(appIp);
		List<Present> presentList = presentServiceImpl.SearchViewPresentInvName(appIp);
		//查询审核通过的出差申请
	      List<TravelApp> appList= travelAppServiceImpl.searchByEmpIdAndState(empId, 4);
	      
	     Employee employee=employeeServiceImpl.SearchById(tpempId);
	     
	   //查询审核结果
	      List<ApproveResult> approvedResults=approvedResultServiceImpl.findByFormNo(formNo);
	        for (ApproveResult approveResult1 : approvedResults) {
				Result rs=resultServiceImpl.findById(approveResult1.getResultId());
				WorkStream ws=workStreamServiceImpl.findById(approveResult1.getWsId());
				int bossId=ws.getToId();
				Employee bossEmp=null;
				if(bossId==0)
				{
					int deptId=departmentServiceImpl.searchDeptId("董事会");
					int dsId=employeeServiceImpl.searchByDeptId(deptId, "总经理").getEmpId();
					bossEmp=employeeServiceImpl.SearchById(dsId);
				}
				else{
				 bossEmp=employeeServiceImpl.SearchById(bossId);
				}
				approveResult1.setEmployee(bossEmp);
				approveResult1.setResult(rs);
			}	

	
		
		
		
	    request.setAttribute("approvedResults", approvedResults);
	    
	    request.setAttribute("deptId", deptId2);
		request.setAttribute("travelApp", travelApp);
		request.setAttribute("goodsList", goodsList);
		request.setAttribute("presentList", presentList);
		request.setAttribute("appList", appList);
		request.setAttribute("employee", employee);
		request.setAttribute("wsId", wsId);
		request.getRequestDispatcher("/html/worktime/daishenhe1.jsp").forward(request, response);
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
