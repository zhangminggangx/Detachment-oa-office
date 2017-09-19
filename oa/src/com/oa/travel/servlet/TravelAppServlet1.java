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
import com.oa.deskTop.entity.Shortmessage;
import com.oa.deskTop.serviceImpl.ShortmessageServiceImpl;
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

public class TravelAppServlet1 extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public TravelAppServlet1() {
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
private ShortmessageServiceImpl shortmessageServiceImpl=new ShortmessageServiceImpl();
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//System.out.println("app in");
		// ��������뵥���һ��Ա������д
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
		int state = Integer.parseInt(request.getParameter("state"));

		int app = formNoServiceImpl.searchAppNo();
		int a1 = app + 1;

		String formNo = "SQ" + a1;
		TravelApp travelApp = new TravelApp();
		travelApp.setFormNo(formNo);
		travelApp.setEmpId(empId);
		travelApp.setDeptId(deptId);
		travelApp.setTravelReason(travelReason);
		travelApp.setTravelPlace(travelPlace);

		travelApp.setPlanTime(planTime);
		travelApp.setLeaveTime(leaveTime);
		/* ����Ϊ������Ա��д����Ĭ�� */
		travelApp.setTrafficTools("δ��");
		travelApp.setTrafficFee(0.0);
		travelApp.setOrderTime(new Date());
		travelApp.setHotelName("δ��");
		travelApp.setRoomFee(0.0);
		travelApp.setLeavePlan("δ��");
		travelApp.setBackPlan("δ��");
		travelApp.setState(state);
		int addAppret = travelAppServiceImpl.add(travelApp);
		if (addAppret > 0) {
			int ret = formNoServiceImpl.updateAppNo(a1);
		}

		// ���goods (��Ʒ��)

		int goodsRet = 0;
		int invRet = 0;
		String[] list = request.getParameterValues("goodsName");
		TravelApp travelApp2 = new TravelApp();
		if(list!=null){
		for (int i = 0; i < list.length; i++) {
			if ((!list[i].equals(null)) && list[i] != "") {
				Inventory inventory = inventoryServiceImp.searchByNameAndType(
						list[i], "��Ʒ");
				int inventId = inventory.getInventId();
				travelApp2 = travelAppServiceImpl.searchByFormNo(formNo);
				int appId = travelApp2.getAppId();

				Goods goods = new Goods();
				goods.setAppId(appId);
				goods.setInventId(inventId);
				goods.setHasReturn(false);
				// �޸���Ʒ��
				goodsRet = goodsServiceImpl.add2(goods);
				// �޸Ŀ��
				invRet = inventoryServiceImp.reduceStore(inventory
						.getInventId());
			}
		}
		}
		// �����Ʒ��
		TravelApp travelApp3 = new TravelApp();
		String[] presentlist = request.getParameterValues("present");
		String[] numberlist = request.getParameterValues("number");
		if(presentlist!=null&&presentlist.length>=1){
			for (int i = 0; i < presentlist.length; i++) {
				if ((!presentlist[i].equals(null)) && presentlist[i] != "") {
				//System.out.println(presentlist[i] + "return goods service");
				Inventory inventory = inventoryServiceImp.searchByNameAndType(
						presentlist[i], "��Ʒ");
				int inventId = inventory.getInventId();
				travelApp3 = travelAppServiceImpl.searchByFormNo(formNo);
				int appId = travelApp2.getAppId();
				Present present = new Present();

				present.setInventId(inventId);
				present.setAppId(appId);
				// �޸���Ʒ��
				int pn = presentServiceImpl.add(present);
				// �޸Ŀ��
				int number = Integer.parseInt(numberlist[i]);
				invRet = inventoryServiceImp.reducePStore(number, inventory
						.getInventId());

				}
			}
		}
		// �����������
		if (state == 2) {
			WorkStream stream = new WorkStream();

			EmployeeServiceImpl empSI = new EmployeeServiceImpl();
			Employee emp = empSI.searchByDeptId(2, "���ž���");
			stream.setFormNo(formNo);
			stream.setHasApproved(false);
			stream.setFromId(empId);
			stream.setToId(emp.getEmpId());
			workStreamServiceImpl.add(stream);
			
			Shortmessage shortmessage=new Shortmessage();
			shortmessage.setReceiveEmail(emp.getEmpEmail());
			shortmessage.setSendEmail(userInfo.getComEmail());
			shortmessage.setContents("���д���˵ĳ������뵥");
			shortmessage.setTitle("���д���˵ĳ������뵥");
			shortmessage.setSendTime(new Date());
			shortmessage.setUnread(true);
			shortmessageServiceImpl.send(shortmessage);
		

		}
		request.getRequestDispatcher("/html/worktime/createleavelist1.jsp").forward(request, response);
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
