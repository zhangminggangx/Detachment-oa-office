package com.oa.dispatch.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oa.common.BaseDao;
import com.oa.common.DateFormatUtil;
import com.oa.deskTop.entity.Shortmessage;
import com.oa.deskTop.serviceImpl.ShortmessageServiceImpl;
import com.oa.dispatch.entity.DisDetail;
import com.oa.dispatch.entity.Dispatch;
import com.oa.dispatch.serviceImpl.DispatchServiceImpl;
import com.oa.personnel.entity.Employee;
import com.oa.personnel.entity.UserInfo;
import com.oa.personnel.serviceImpl.EmployeeServiceImpl;
import com.oa.personnel.serviceImpl.FormNoServiceImpl;
import com.oa.travel.entity.WorkStream;
import com.oa.travel.serviceImpl.WorkStreamServiceImpl;

public class SaveOrSubmitDispatchServlet extends HttpServlet {

	private BaseDao basedao = new BaseDao();
	private EmployeeServiceImpl empImpl = new EmployeeServiceImpl();
	private FormNoServiceImpl fnsImpl = new FormNoServiceImpl();
	private DispatchServiceImpl dispatchImpl = new DispatchServiceImpl();
	private WorkStreamServiceImpl wsImpl = new WorkStreamServiceImpl();

	/**
	 * Constructor of the object.
	 */
	public SaveOrSubmitDispatchServlet() {
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
	private ShortmessageServiceImpl shortmessageServiceImpl=new ShortmessageServiceImpl();
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String disMoney = request.getParameter("disMoney");
		String disReason = request.getParameter("disReason");
		String state=request.getParameter("state");
		String[] detailMoneyArr = request.getParameterValues("detailMoney");
		String[] descriptionArr = request.getParameterValues("description");
		String[] proIdArr = request.getParameterValues("proName");
		HttpSession session = request.getSession();
		UserInfo userInfo = (UserInfo) session.getAttribute("userInfo");
		int empId = userInfo.getEmpId();
		int disNo = fnsImpl.searchDisNo();
		fnsImpl.updateDisNo(disNo + 1);
		String formNo = "BX" + (disNo + 1);
		Employee emp = empImpl.SearchById(empId);
		int deptId = emp.getDeptId();
		DateFormatUtil util = new DateFormatUtil();
		int add = 0;
		if (disMoney != null && !disMoney.equals("") && disReason != null
				&& !disReason.equals("")) {
			List<DisDetail> details = new ArrayList<DisDetail>();
			for (int i = 0; i < descriptionArr.length; i++) {
				if (proIdArr[i] != null && !proIdArr[i].equals("")
						&& detailMoneyArr[i] != null
						&& !detailMoneyArr[i].equals("")
						&& descriptionArr[i] != null
						&& !descriptionArr[i].equals("")) {
					DisDetail detail = new DisDetail();
					detail.setDescription(descriptionArr[i]);
					detail
							.setDetailMoney(Double
									.parseDouble(detailMoneyArr[i]));
					detail.setProId(Integer.parseInt(proIdArr[i]));
					details.add(detail);
				}

			}
			Dispatch dis = new Dispatch();
			dis.setFormNo(formNo);
			dis.setDeptId(deptId);
			dis.setCreateTime(new Date());
			dis.setDisMoney(Double.parseDouble(disMoney));
			dis.setEmpId(empId);
			dis.setDisReason(disReason);
			if (state.equals("2")) {
				dis.setState(2);
				
				WorkStream ws = new WorkStream();
				ws.setFormNo(formNo);
				ws.setHasApproved(false);
				Employee emp2 = empImpl.searchByDeptId(deptId, "部门经理");
				ws.setToId(emp2.getEmpId());
				ws.setFromId(empId);
				add = dispatchImpl.add(dis, details, ws);
				
				Shortmessage shortmessage=new Shortmessage();
				shortmessage.setReceiveEmail(emp2.getEmpEmail());
				shortmessage.setSendEmail(userInfo.getComEmail());
				shortmessage.setContents("您有待审核的报销单");
				shortmessage.setTitle("您有待审核的报销单");
				shortmessage.setSendTime(new Date());
				shortmessage.setUnread(true);
				shortmessageServiceImpl.send(shortmessage);
			}
			else{
				dis.setState(1);
				add=dispatchImpl.add(dis, details);
			}
		}
		request.getRequestDispatcher("SerachDisServlet?pageNo=1").forward(request,
				response);
	}

}
