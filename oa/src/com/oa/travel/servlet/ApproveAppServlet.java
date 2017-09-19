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
		
		//�½�����Ϣ
		Shortmessage shortmessage1=new Shortmessage();
		shortmessage1.setSendTime(new Date());
		shortmessage1.setUnread(true);
		
		Shortmessage shortmessage2=new Shortmessage();
		shortmessage2.setSendTime(new Date());
		shortmessage2.setUnread(true);
		
		
		HttpSession session = request.getSession();
		UserInfo userInfo = (UserInfo) session.getAttribute("userInfo");
		// ������
		Employee employee = employeeServiceImpl.SearchById(userInfo.getEmpId());
		// ����
		String strState = request.getParameter("state");

		String appReason = request.getParameter("approveReason");
		String appFormNo = request.getParameter("appFormNo");
		String strWsId = request.getParameter("wsId");
		int wsId = Integer.parseInt(strWsId);
		// �õ�������ְλ������
		String empPosition = employee.getPosition();
		String empDept = employee.getDeptName();

		// 2--����ˣ��������ͨ����
		// 3---���
		int state = Integer.parseInt(strState);

		// �������
		ApproveResult approveResult = new ApproveResult();

		approveResult.setEmployee(employee);

		approveResult.setApproveReason(appReason);
		approveResult.setApproveTime(new Date());
		approveResult.setFormNo(appFormNo);
		approveResult.setWsId(wsId);

		TravelApp travelApp = travelAppServiceImpl.searchByFormNo(appFormNo);

		int wsRet = workStreamServiceImpl.updateHasApproved(wsId);
		WorkStream oldWorkStream = workStreamServiceImpl.findById(wsId);

		// �ύ����Ϣ
		Employee fromEmployee = employeeServiceImpl.SearchById(oldWorkStream
				.getFromId());
		int fromEmpDeptId = fromEmployee.getDeptId();
		Employee fromEmployeeManager = employeeServiceImpl.searchByDeptId(
				fromEmpDeptId, "���ž���");

		// �ύͨ��ʱ--����µĹ�������
		WorkStream newWorkStream = new WorkStream();
		// newWorkStream.setToId(toId);--��ͬ����toid��ͬ
		newWorkStream.setFormNo(appFormNo);
		newWorkStream.setHasApproved(false);
		newWorkStream.setFromId(oldWorkStream.getFromId());

		// ������Դ�Ĳ��ž���
		Department department = departmentServiceImpl.findByDeptName("���»�");
		int depId = department.getDeptId();
		Employee bigManager = employeeServiceImpl.searchByDeptId(depId, "�ܾ���");
		if (empPosition.equals("�ܾ���") && empDept.equals("���»�")) {

			if (2 == state) {// ͨ��

				// //�����Ϣ��1--ͨ��
				approveResult.setResultId(1);
				// ���浥�޸�״̬�����
				travelAppServiceImpl.updateAppState(travelApp.getAppId(), 4);
				// �������̱�--�����
				newWorkStream.setToId(0);
				workStreamServiceImpl.add(newWorkStream);
				
				
				//����Ϣ��д
	             shortmessage1.setTitle("���ĳ����������ͨ��");
	             shortmessage1.setContents("�ܾ����������ϣ�ͨ��");
	              //�½�����Ϣ
	  		     shortmessage1.setReceiveEmail(fromEmployee.getEmpEmail());
	  		     shortmessage1.setSendEmail(userInfo.getComEmail());
	  		     shortmessageServiceImpl.send(shortmessage1);

			}
			if (3 == state) {// ���

				// //�����Ϣ��2--���
				approveResult.setResultId(2);
				travelAppServiceImpl.updateAppState(travelApp.getAppId(), 3);
				
				//����Ϣ��д
	             shortmessage1.setTitle("���ĳ������뱻���");
	             shortmessage1.setContents("�ܾ����������ϣ����");
	           //�½�����Ϣ
	  		   shortmessage1.setReceiveEmail(fromEmployee.getEmpEmail());
	  		   shortmessage1.setSendEmail(userInfo.getComEmail());
	  		   shortmessageServiceImpl.send(shortmessage1);
	          

			}
		} else {// ���ž�������������

			if (2 == state) {// ͨ��(��ͨ��--)

				approveResult.setResultId(1);
				// ���浥״̬�޸�
				int reportUpdateRet = travelAppServiceImpl.updateAppState(
						travelApp.getAppId(), 2);
				System.out.println("���浥״̬�޸�" + reportUpdateRet);

				// �����������µ�
				if (employee.getDeptName().equals("������")) {// --------------------------������ͨ��
					// ����ͨ���ύ�����ž���
					newWorkStream.setToId(fromEmployeeManager.getEmpId());
					int wsXingAddRet = workStreamServiceImpl.add(newWorkStream);
					//System.out.println("������ͨ������������" + wsXingAddRet);

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
					
					
					//����Ϣ��д
		             shortmessage1.setTitle("���ĳ���������������ͨ��");
		             shortmessage1.setContents("���ĳ���������������ͨ�������ž���������");
		  		   shortmessage1.setReceiveEmail(fromEmployee.getEmpEmail());
		  		   shortmessage1.setSendEmail(userInfo.getComEmail());
		  		   shortmessageServiceImpl.send(shortmessage1);
		             //�������ž���
		            Employee deptMangerEmp= employeeServiceImpl.SearchById(fromEmployeeManager.getEmpId());
		             shortmessage2.setTitle("���д���˵ĳ�������");
		             shortmessage2.setContents("���д���˵ĳ�������");
                    shortmessage2.setReceiveEmail(deptMangerEmp.getEmpEmail());
         		   shortmessage2.setSendEmail(userInfo.getComEmail());
         		   shortmessageServiceImpl.send(shortmessage2);
				}
				// �����������µ�
				else {// ���ž���---ͨ��(�ܾ���)
					newWorkStream.setToId(bigManager.getEmpId());
					workStreamServiceImpl.add(newWorkStream);
					
					//����Ϣ��д
		             shortmessage1.setTitle("���ĳ������벿�ž�����ͨ��");
		             shortmessage1.setContents("���ĳ������벿�ž�����ͨ����������Դ�������");
		  		   shortmessage1.setReceiveEmail(fromEmployee.getEmpEmail());
		  		   shortmessage1.setSendEmail(userInfo.getComEmail());
		  		   shortmessageServiceImpl.send(shortmessage1);
		             
		           //�����ܾ���
			            Employee bigMangerEmp= employeeServiceImpl.SearchById(bigManager.getEmpId());
			            shortmessage2.setTitle("���д���˵ĳ�������");
			             shortmessage2.setContents("���д���˵ĳ�������");
	                     shortmessage2.setReceiveEmail(bigMangerEmp.getEmpEmail());
	          		   shortmessage2.setSendEmail(userInfo.getComEmail());
	          		   shortmessageServiceImpl.send(shortmessage2);
				}

			}
			if (3 == state) {// ���

				approveResult.setResultId(2);
				travelAppServiceImpl.updateAppState(travelApp.getAppId(), 3);

				if (employee.getDeptName().equals("������")) {// --------------------------���������
					// ���������ʱΪ�ݸ�---���´湤�����̱�
					//����Ϣ��д
		             shortmessage1.setTitle("���ĳ������뱻���");
		             shortmessage1.setContents("���ĳ������뱻���������");
		  		   shortmessage1.setReceiveEmail(fromEmployee.getEmpEmail());
		  		   shortmessage1.setSendEmail(userInfo.getComEmail());
		  		   shortmessageServiceImpl.send(shortmessage1);
				}else {// ���ž���
					//����Ϣ��д
		             shortmessage1.setTitle("���ĳ���汻���");
		             shortmessage1.setContents("���ĳ���汻���ž�����");
		  		     shortmessage1.setReceiveEmail(fromEmployee.getEmpEmail());
		  		     shortmessage1.setSendEmail(userInfo.getComEmail());
		  		   shortmessageServiceImpl.send(shortmessage1);
				}

			}
		}
		// �����Ϣ����������Ϣ
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
