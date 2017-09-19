package com.oa.travel.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oa.personnel.entity.Employee;
import com.oa.personnel.entity.UserInfo;
import com.oa.personnel.serviceImpl.DepartmentServiceImpl;
import com.oa.personnel.serviceImpl.EmployeeServiceImpl;
import com.oa.travel.entity.ApproveResult;
import com.oa.travel.entity.Goods;
import com.oa.travel.entity.Received;
import com.oa.travel.entity.Result;
import com.oa.travel.entity.TravelApp;
import com.oa.travel.entity.TravelReport;
import com.oa.travel.entity.WorkStream;
import com.oa.travel.serviceImpl.ApprovedResultServiceImpl;
import com.oa.travel.serviceImpl.GoodsServiceImpl;
import com.oa.travel.serviceImpl.ReceivedServiceImpl;
import com.oa.travel.serviceImpl.ResultServiceImpl;
import com.oa.travel.serviceImpl.TravelAppServiceImpl;
import com.oa.travel.serviceImpl.TravelReportServiceImpl;
import com.oa.travel.serviceImpl.WorkStreamServiceImpl;

public class TravelReportDetailServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public TravelReportDetailServlet() {
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
	TravelAppServiceImpl travelAppServiceImpl=new TravelAppServiceImpl();
	GoodsServiceImpl goodsServiceImpl=new GoodsServiceImpl();
	ReceivedServiceImpl receivedServiceImpl=new ReceivedServiceImpl();
	
	private ResultServiceImpl resultServiceImpl=new ResultServiceImpl();
	private ApprovedResultServiceImpl approvedResultServiceImpl=new ApprovedResultServiceImpl();
	private EmployeeServiceImpl employeeServiceImpl=new EmployeeServiceImpl();
	private WorkStreamServiceImpl workStreamServiceImpl=new WorkStreamServiceImpl();
	private DepartmentServiceImpl departmentServiceImpl=new DepartmentServiceImpl();
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session=request.getSession();
		UserInfo userInfo=(UserInfo)session.getAttribute("userInfo");
		int empId=userInfo.getEmpId();
		
		String formNo=request.getParameter("formNo");
		if(formNo.equals(null)||formNo==""){}
		else{
		TravelReport travelReport=travelReportServiceImpl.searchByFormNo(formNo);
		//�õ���������
		TravelApp travelApp=travelAppServiceImpl.searchById(travelReport.getAppId());
		//�õ���Ʒ
		List<Goods> goodsList=goodsServiceImpl.searchUnReturnByAppId(travelApp.getAppId());
		//�õ�������Ʒ
		Received received=receivedServiceImpl.searchByReportId(travelReport.getReportId());
		//��ѯ���ͨ���ĳ�������
	      List<TravelApp> appList= travelAppServiceImpl.searchByEmpIdAndState(empId, 4);
	      
	      //��ѯ��˽��
	      List<ApproveResult> approvedResults=approvedResultServiceImpl.findByFormNo(formNo);
	        for (ApproveResult approveResult : approvedResults) {
				Result rs=resultServiceImpl.findById(approveResult.getResultId());
				WorkStream ws=workStreamServiceImpl.findById(approveResult.getWsId());
				int bossId=ws.getToId();
				Employee bossEmp=null;
				if(bossId==0)
				{
					int deptId=departmentServiceImpl.searchDeptId("������Դ");
					int renliId=employeeServiceImpl.searchByDeptId(deptId, "���ž���").getEmpId();
					bossEmp=employeeServiceImpl.SearchById(renliId);
				}
				else{
				 bossEmp=employeeServiceImpl.SearchById(bossId);
				}
				approveResult.setEmployee(bossEmp);
				approveResult.setResult(rs);
			}	
	  
		request.setAttribute("travelReport", travelReport);
		request.setAttribute("travelApp", travelApp);
		request.setAttribute("goodsList", goodsList);
		request.setAttribute("received", received);
		request.setAttribute("appList", appList);
		request.setAttribute("approvedResults", approvedResults);
		request.getRequestDispatcher("/html/worktime/moreleavelist_1.jsp").forward(request, response);
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
