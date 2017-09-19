package com.oa.travel.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oa.common.DateFormatUtil;
import com.oa.personnel.entity.Employee;
import com.oa.personnel.entity.UserInfo;
import com.oa.personnel.serviceImpl.EmployeeServiceImpl;
import com.oa.personnel.serviceImpl.FormNoServiceImpl;
import com.oa.travel.entity.Goods;
import com.oa.travel.entity.Inventory;
import com.oa.travel.entity.Present;
import com.oa.travel.entity.TravelApp;
import com.oa.travel.entity.WorkStream;
import com.oa.travel.serviceImpl.GoodsServiceImpl;
import com.oa.travel.serviceImpl.InventoryServiceImp;
import com.oa.travel.serviceImpl.PresentServiceImpl;
import com.oa.travel.serviceImpl.TravelAppServiceImpl;
import com.oa.travel.serviceImpl.WorkStreamServiceImpl;

public class UpdateTravelAppServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public UpdateTravelAppServlet() {
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
	private FormNoServiceImpl formNoServiceImpl = new FormNoServiceImpl();
	private EmployeeServiceImpl employeeServiceImpl = new EmployeeServiceImpl();
	private TravelAppServiceImpl travelAppServiceImpl = new TravelAppServiceImpl();

	private DateFormatUtil dateFormatUtil = new DateFormatUtil();
	private GoodsServiceImpl goodsServiceImpl = new GoodsServiceImpl();
	private List<Goods> l = new ArrayList<Goods>();
	private InventoryServiceImp inventoryServiceImp = new InventoryServiceImp();
	private PresentServiceImpl presentServiceImpl = new PresentServiceImpl();
	private WorkStreamServiceImpl workStreamServiceImpl = new WorkStreamServiceImpl();

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 出差申请修改
		int appNo = formNoServiceImpl.searchAppNo();
		HttpSession session = request.getSession();
		session.getAttribute("empId");
		UserInfo userInfo = (UserInfo) session.getAttribute("userInfo");
		int empId = userInfo.getEmpId();
		Employee employee = employeeServiceImpl.SearchById(empId);
		int deptId = employee.getDeptId();
		String travelReason = request.getParameter("travelReason");
		String travelPlace = request.getParameter("travelPlace");
		int planTime = Integer.parseInt(request.getParameter("planTime"));
		String lTime = request.getParameter("leaveTime");
		Date leaveTime = dateFormatUtil.StringToShortDate(lTime);
		int appId = Integer.parseInt(request.getParameter("appId"));
		int state =Integer.parseInt(request.getParameter("state"));
		travelAppServiceImpl.appupdate(appId, travelReason, travelPlace,
				planTime, leaveTime,state);
		// 修改物品
		

		// 1库存加回去 物品表删除
		goodsServiceImpl.deleteByAppId(appId);
		// 2存入再次申请的物品
		TravelApp travelApp = travelAppServiceImpl.searchById(appId);
		String formNo = travelApp.getFormNo();
		int goodsRet = 0;
		int invRet = 0;
		String[] list = request.getParameterValues("Name");
		TravelApp travelApp2 = new TravelApp();
		if(list!=null){
		for (int i = 0; i < list.length; i++) {
			if ((!list[i].equals(null)) && list[i] != "") {
				Inventory inventory = inventoryServiceImp.searchByNameAndType(
						list[i], "物品");
				int inventId = inventory.getInventId();
				travelApp2 = travelAppServiceImpl.searchByFormNo(formNo);
				Goods goods = new Goods();
				goods.setAppId(appId);
				goods.setInventId(inventId);
				goods.setHasReturn(false);
				// 修改物品表
				goodsRet = goodsServiceImpl.add2(goods);
				// 修改库存
				invRet = inventoryServiceImp.reduceStore(inventory
						.getInventId());
			}
		}
		}
		
		
				// 修改礼品
				String[] oldPresentName = request.getParameterValues("oldn");

				int prelength = Integer.parseInt(request
					.getParameter("oldlength"));
				for (int j = 0; j < prelength; j++) {
					Inventory inventory2 = inventoryServiceImp
							.searchByNameAndType(oldPresentName[j], "礼品");
					int inventId2 = inventory2.getInventId();
					int number = presentServiceImpl
							.searchCountByInventIdAndAppId(inventId2, appId);
					// 把库存加回去
					inventoryServiceImp.addPStore(number, inventId2);
					// 删除礼品表
					int delret=presentServiceImpl.delete(inventId2, appId);
				}
				
				
				
				//TODO
				
				// 添加礼品表
				TravelApp travelApp3 = new TravelApp();
				String[] presentlist = request.getParameterValues("present");
				String[] numberlist = request.getParameterValues("number");

				for (int a = 0; a < presentlist.length; a++) {
					if ((!presentlist[a].equals(null)) && presentlist[a] != "") {
						Inventory inventory3 = inventoryServiceImp
								.searchByNameAndType(presentlist[a], "礼品");
						int inventId3 = inventory3.getInventId();
						travelApp3 = travelAppServiceImpl
								.searchByFormNo(formNo);
						int appId3 = travelApp3.getAppId();
						Present present = new Present();

						present.setInventId(inventId3);
						present.setAppId(appId3);
						// 修改礼品表
						int pn = presentServiceImpl.add(present);
						// 修改库存
						int number = Integer.parseInt(numberlist[a]);
						invRet = inventoryServiceImp.reducePStore(number,
								
								inventory3.getInventId());

					}
				}

			//修改工作流
				if(state==2)
				{
					WorkStream stream = new WorkStream();
					
					EmployeeServiceImpl empSI = new EmployeeServiceImpl();
					Employee emp=empSI.searchByDeptId(2,"部门经理" );
					stream.setFormNo(formNo);
					stream.setHasApproved(false);
					stream.setFromId(empId);
					stream.setToId(emp.getEmpId());
					workStreamServiceImpl.add(stream);	
					
				}
				request.getRequestDispatcher("/ViewTravelAppServlet").forward(request, response);
		

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
