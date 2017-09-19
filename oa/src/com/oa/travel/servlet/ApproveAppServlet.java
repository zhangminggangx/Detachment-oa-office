package com.oa.travel.servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oa.common.BaseServlet;
import com.oa.common.DateFormatUtil;
import com.oa.deskTop.entity.Shortmessage;
import com.oa.deskTop.serviceImpl.ShortmessageServiceImpl;
import com.oa.personnel.entity.Department;
import com.oa.personnel.entity.Employee;
import com.oa.personnel.entity.UserInfo;
import com.oa.personnel.serviceImpl.DepartmentServiceImpl;
import com.oa.personnel.serviceImpl.EmployeeServiceImpl;
import com.oa.travel.entity.ApproveResult;
import com.oa.travel.entity.TravelApp;
import com.oa.travel.entity.WorkStream;
import com.oa.travel.serviceImpl.ApprovedResultServiceImpl;
import com.oa.travel.serviceImpl.InventoryServiceImp;
import com.oa.travel.serviceImpl.ReceivedServiceImpl;
import com.oa.travel.serviceImpl.TravelAppServiceImpl;
import com.oa.travel.serviceImpl.WorkStreamServiceImpl;

public class ApproveAppServlet extends BaseServlet {

	/**
	 * Constructor of the object.
	 */
	public ApproveAppServlet() {
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
	private DateFormatUtil dateFormatUtil = new DateFormatUtil();
	EmployeeServiceImpl employeeServiceImpl = new EmployeeServiceImpl();
	ApprovedResultServiceImpl approvedResultServiceImpl = new ApprovedResultServiceImpl();
	private TravelAppServiceImpl travelAppServiceImpl = new TravelAppServiceImpl();
	WorkStreamServiceImpl workStreamServiceImpl = new WorkStreamServiceImpl();
	DepartmentServiceImpl departmentServiceImpl = new DepartmentServiceImpl();
	ReceivedServiceImpl receivedServiceImpl = new ReceivedServiceImpl();
	InventoryServiceImp inventoryServiceImp = new InventoryServiceImp();
	 ShortmessageServiceImpl shortmessageServiceImpl=new ShortmessageServiceImpl();
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//新建短消息
		Shortmessage shortmessage1=new Shortmessage();
		shortmessage1.setSendTime(new Date());
		shortmessage1.setUnread(true);
		
		Shortmessage shortmessage2=new Shortmessage();
		shortmessage2.setSendTime(new Date());
		shortmessage2.setUnread(true);
		
		
		HttpSession session = request.getSession();
		UserInfo userInfo = (UserInfo) session.getAttribute("userInfo");
		// 审批人
		Employee employee = employeeServiceImpl.SearchById(userInfo.getEmpId());
		// 操作
		String strState = request.getParameter("state");

		String appReason = request.getParameter("approveReason");
		String appFormNo = request.getParameter("appFormNo");
		String strWsId = request.getParameter("wsId");
		int wsId = Integer.parseInt(strWsId);
		// 得到审批人职位、部门
		String empPosition = employee.getPosition();
		String empDept = employee.getDeptName();

		// 2--待审核（本人审核通过）
		// 3---打回
		int state = Integer.parseInt(strState);

		// 审批结果
		ApproveResult approveResult = new ApproveResult();

		approveResult.setEmployee(employee);

		approveResult.setApproveReason(appReason);
		approveResult.setApproveTime(new Date());
		approveResult.setFormNo(appFormNo);
		approveResult.setWsId(wsId);

		TravelApp travelApp = travelAppServiceImpl.searchByFormNo(appFormNo);

		int wsRet = workStreamServiceImpl.updateHasApproved(wsId);
		WorkStream oldWorkStream = workStreamServiceImpl.findById(wsId);

		// 提交人信息
		Employee fromEmployee = employeeServiceImpl.SearchById(oldWorkStream
				.getFromId());
		int fromEmpDeptId = fromEmployee.getDeptId();
		Employee fromEmployeeManager = employeeServiceImpl.searchByDeptId(
				fromEmpDeptId, "部门经理");

		// 提交通过时--添加新的工作流程
		WorkStream newWorkStream = new WorkStream();
		// newWorkStream.setToId(toId);--不同审批toid不同
		newWorkStream.setFormNo(appFormNo);
		newWorkStream.setHasApproved(false);
		newWorkStream.setFromId(oldWorkStream.getFromId());

		// 人力资源的部门经理
		Department department = departmentServiceImpl.findByDeptName("董事会");
		int depId = department.getDeptId();
		Employee bigManager = employeeServiceImpl.searchByDeptId(depId, "总经理");
		if (empPosition.equals("总经理") && empDept.equals("董事会")) {

			if (2 == state) {// 通过

				// //结果信息表1--通过
				approveResult.setResultId(1);
				// 报告单修改状态已完毕
				travelAppServiceImpl.updateAppState(travelApp.getAppId(), 4);
				// 工作流程表--已完成
				newWorkStream.setToId(0);
				workStreamServiceImpl.add(newWorkStream);
				
				
				//短消息填写
	             shortmessage1.setTitle("您的出差申请审核通过");
	             shortmessage1.setContents("总经理已审核完毕，通过");
	              //新建短消息
	  		     shortmessage1.setReceiveEmail(fromEmployee.getEmpEmail());
	  		     shortmessage1.setSendEmail(userInfo.getComEmail());
	  		     shortmessageServiceImpl.send(shortmessage1);

			}
			if (3 == state) {// 打回

				// //结果信息表2--打回
				approveResult.setResultId(2);
				travelAppServiceImpl.updateAppState(travelApp.getAppId(), 3);
				
				//短消息填写
	             shortmessage1.setTitle("您的出差申请被打回");
	             shortmessage1.setContents("总经理已审核完毕，打回");
	           //新建短消息
	  		   shortmessage1.setReceiveEmail(fromEmployee.getEmpEmail());
	  		   shortmessage1.setSendEmail(userInfo.getComEmail());
	  		   shortmessageServiceImpl.send(shortmessage1);
	          

			}
		} else {// 部门经理或行政部审核

			if (2 == state) {// 通过(，通过--)

				approveResult.setResultId(1);
				// 报告单状态修改
				int reportUpdateRet = travelAppServiceImpl.updateAppState(
						travelApp.getAppId(), 2);
				System.out.println("报告单状态修改" + reportUpdateRet);

				// 工作流插入新的
				if (employee.getDeptName().equals("行政部")) {// --------------------------行政部通过
					// 行政通过提交给部门经理
					newWorkStream.setToId(fromEmployeeManager.getEmpId());
					int wsXingAddRet = workStreamServiceImpl.add(newWorkStream);
					//System.out.println("行政部通过工作流插入" + wsXingAddRet);

					String trafficTools = request.getParameter("trafficTools");
					double trafficFee = Double.parseDouble(request
							.getParameter("trafficFee"));

					Date orderTime = DateFormatUtil.StringToShortDate(request.getParameter("orderTime"));
					String hotelName = request.getParameter("hotelName");
					double roomFee = Double.parseDouble(request
							.getParameter("roomFee"));
					String leavePlan = request.getParameter("leavePlan");
					String backPlan = request.getParameter("backPlan");
					int appId = Integer.parseInt(request.getParameter("appId"));
					if(trafficTools!=null){
					travelAppServiceImpl.adupdate(appId, trafficTools,
							trafficFee, orderTime, hotelName, roomFee,
							leavePlan, backPlan);
					}
					
					
					//短消息填写
		             shortmessage1.setTitle("您的出差申请行政部已通过");
		             shortmessage1.setContents("您的出差申请行政部已通过，部门经理待审核中");
		  		   shortmessage1.setReceiveEmail(fromEmployee.getEmpEmail());
		  		   shortmessage1.setSendEmail(userInfo.getComEmail());
		  		   shortmessageServiceImpl.send(shortmessage1);
		             //发给部门经理
		            Employee deptMangerEmp= employeeServiceImpl.SearchById(fromEmployeeManager.getEmpId());
		             shortmessage2.setTitle("您有待审核的出差申请");
		             shortmessage2.setContents("您有待审核的出差申请");
                    shortmessage2.setReceiveEmail(deptMangerEmp.getEmpEmail());
         		   shortmessage2.setSendEmail(userInfo.getComEmail());
         		   shortmessageServiceImpl.send(shortmessage2);
				}
				// 工作流插入新的
				else {// 部门经理---通过(总经理)
					newWorkStream.setToId(bigManager.getEmpId());
					workStreamServiceImpl.add(newWorkStream);
					
					//短消息填写
		             shortmessage1.setTitle("您的出差申请部门经理已通过");
		             shortmessage1.setContents("您的出差申请部门经理已通过，人力资源待审核中");
		  		   shortmessage1.setReceiveEmail(fromEmployee.getEmpEmail());
		  		   shortmessage1.setSendEmail(userInfo.getComEmail());
		  		   shortmessageServiceImpl.send(shortmessage1);
		             
		           //发给总经理
			            Employee bigMangerEmp= employeeServiceImpl.SearchById(bigManager.getEmpId());
			            shortmessage2.setTitle("您有待审核的出差申请");
			             shortmessage2.setContents("您有待审核的出差申请");
	                     shortmessage2.setReceiveEmail(bigMangerEmp.getEmpEmail());
	          		   shortmessage2.setSendEmail(userInfo.getComEmail());
	          		   shortmessageServiceImpl.send(shortmessage2);
				}

			}
			if (3 == state) {// 打回

				approveResult.setResultId(2);
				travelAppServiceImpl.updateAppState(travelApp.getAppId(), 3);

				if (employee.getDeptName().equals("行政部")) {// --------------------------行政部打回
					// 行政部打回时为草稿---不新存工作流程表
					//短消息填写
		             shortmessage1.setTitle("您的出差申请被打回");
		             shortmessage1.setContents("您的出差申请被行政部打回");
		  		   shortmessage1.setReceiveEmail(fromEmployee.getEmpEmail());
		  		   shortmessage1.setSendEmail(userInfo.getComEmail());
		  		   shortmessageServiceImpl.send(shortmessage1);
				}else {// 部门经理
					//短消息填写
		             shortmessage1.setTitle("您的出差报告被打回");
		             shortmessage1.setContents("您的出差报告被部门经理打回");
		  		     shortmessage1.setReceiveEmail(fromEmployee.getEmpEmail());
		  		     shortmessage1.setSendEmail(userInfo.getComEmail());
		  		   shortmessageServiceImpl.send(shortmessage1);
				}

			}
		}
		// 审核信息表添加审核信息
		approvedResultServiceImpl.add(approveResult);
		request.getRequestDispatcher("/ViewUnApproveAppServlet").forward(request, response);
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
