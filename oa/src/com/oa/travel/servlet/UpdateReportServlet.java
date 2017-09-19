package com.oa.travel.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oa.personnel.entity.Department;
import com.oa.personnel.entity.Employee;
import com.oa.personnel.entity.UserInfo;
import com.oa.personnel.serviceImpl.DepartmentServiceImpl;
import com.oa.personnel.serviceImpl.EmployeeServiceImpl;
import com.oa.personnel.serviceImpl.FormNoServiceImpl;
import com.oa.travel.entity.Goods;
import com.oa.travel.entity.Received;
import com.oa.travel.entity.TravelApp;
import com.oa.travel.entity.TravelReport;
import com.oa.travel.entity.WorkStream;
import com.oa.travel.serviceImpl.GoodsServiceImpl;
import com.oa.travel.serviceImpl.ReceivedServiceImpl;
import com.oa.travel.serviceImpl.TravelAppServiceImpl;
import com.oa.travel.serviceImpl.TravelReportServiceImpl;
import com.oa.travel.serviceImpl.WorkStreamServiceImpl;

public class UpdateReportServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public UpdateReportServlet() {
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
	EmployeeServiceImpl employeeServiceImpl = new EmployeeServiceImpl();
	FormNoServiceImpl formNoServiceImpl = new FormNoServiceImpl();
	TravelReportServiceImpl travelReportServiceImpl = new TravelReportServiceImpl();
	TravelAppServiceImpl travelAppServiceImpl = new TravelAppServiceImpl();
	ReceivedServiceImpl receivedServiceImpl = new ReceivedServiceImpl();
	GoodsServiceImpl goodsServiceImpl = new GoodsServiceImpl();
	WorkStreamServiceImpl workStreamServiceImpl = new WorkStreamServiceImpl();
	DepartmentServiceImpl departmentServiceImpl=new DepartmentServiceImpl();
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setCharacterEncoding("utf-8");
		String strState = request.getParameter("state");
		// ���浥Ҫ�޸�Ϊ��״̬
		int state = Integer.parseInt(strState);

		HttpSession session = request.getSession();

		UserInfo userInfo = (UserInfo) session.getAttribute("userInfo");
		int empId = userInfo.getEmpId();

		// Ҫ�޸ĵı��浥�ź�id
		String reportFormNo = request.getParameter("reportFormNo");
		String reportId = request.getParameter("reportId");

		// ͨ��Ա��id�õ�����id
		Employee employee = employeeServiceImpl.SearchById(empId);
		// �õ��Ĳ���id
		int deptId = employee.getDeptId();
		// ��ѯ���ű� ��������

		String realTime = request.getParameter("realTime");
		String trafficTools = request.getParameter("trafficTools");
		String trafficFee = request.getParameter("trafficFee");
		String hotelName = request.getParameter("hotelName");
		// ������
		Department department=departmentServiceImpl.findByDeptName("������");
		int politicId = department.getDeptId();
		String disMoney = request.getParameter("disMoney");
		String appFormNo = request.getParameter("appFormNo");
		TravelApp travelApp = travelAppServiceImpl.searchByFormNo(appFormNo);
		int appId = travelApp.getAppId();

		String[] customs = request.getParameterValues("custom");
		StringBuffer sbCus = new StringBuffer();
		for (int i = 0; i < customs.length; i++) {
			sbCus.append(customs[i]);
		}
		String[] summerys = request.getParameterValues("summery");
		StringBuffer sbSum = new StringBuffer();
		for (int i = 0; i < summerys.length; i++) {
			sbSum.append(summerys[i]);
		}

		/*----����Ϊ���������----*/
		TravelReport report = new TravelReport();
		report.setEmpId(empId);
		report.setDeptId(deptId);
		report.setFormNo(reportFormNo);
		report.setRealTime(Integer.parseInt(realTime));
		report.setTrafficTools(trafficTools);
		report.setTrafficFee(Double.parseDouble(trafficFee));
		report.setHotelName(hotelName);
		report.setPoliticId(politicId);
		report.setDisMoney(Double.parseDouble(disMoney));
		report.setAppId(appId);
		report.setCustoms(sbCus.toString());
		report.setSummery(sbSum.toString());
		report.setState(state);

		/*----�޸�һ�����浥----*/

		int updateReportRet = travelReportServiceImpl.update(Integer
				.parseInt(reportId), report);// travelReportServiceImpl.add(report);

		/*----�������̱����----*/
		WorkStream workStream = new WorkStream();
		workStream.setHasApproved(false);
		workStream.setFormNo(reportFormNo);
		// ������id
		workStream.setFromId(empId);
		// ����������������id
		Employee employeeXing = employeeServiceImpl.searchByDeptId(2, "���ž���");
		workStream.setToId(employeeXing.getEmpId());

		if (2 == state) {
			int workRet = workStreamServiceImpl.add(workStream);
		}

		/*---������Ʒ�޸�-----*/
		/* �ݸ�״̬�����״̬ */
		String[] goodsName = request.getParameterValues("goods");
		//  System.out.println("~~~~~~~~~~~~~~~~~`"+goodsName[0]);
		// ɾ����Ʒʱ�ѽ�������Ʒ��ص����״̬
		// int delRet=goodsServiceImpl.deleteByAppId(appId);
		// System.out.println(delRet+"ɾ����Ʒ-----------");
		/* ����֮ǰ�Ĳ��� */

		List<Goods> oldGoodsList= goodsServiceImpl.searchByAppId(appId);
		int falseRet=goodsServiceImpl.updateReturnFalse(oldGoodsList, appId);
		// ���·�����Ʒ
		if(!(goodsName==null)){
		int goodsRet = goodsServiceImpl.returnGoods(goodsName, appId);
		}
		/*---������Ʒ�޸�---*/
		String receivedName = request.getParameter("receivedName");
		String receivedCount = request.getParameter("receivedCount");
		/* �½�������Ʒ */

		Received received = new Received();
		// δ���
		received.setHasPut(false);
		received.setReccount(Integer.parseInt(receivedCount));
		received.setRecName(receivedName);
		// ������ǰ�ı��浥
		TravelReport travelReport = travelReportServiceImpl
				.searchByFormNo(reportFormNo);
		received.setReportId(travelReport.getReportId());
		// �����޸�
		Received receivedOld = receivedServiceImpl.searchByReportId(Integer
				.parseInt(reportId));
		int receivedRet = receivedServiceImpl.update(receivedOld.getRecId(),
				received);
		
		
		// response.getWriter().print("<script  language=javascript> window.close();</script>");
		request.getRequestDispatcher("/ViewTravelReportServlet").forward(request, response);
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
