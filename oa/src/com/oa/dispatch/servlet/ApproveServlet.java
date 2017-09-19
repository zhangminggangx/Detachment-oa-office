package com.oa.dispatch.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oa.common.BaseServlet;
import com.oa.deskTop.entity.Shortmessage;
import com.oa.deskTop.serviceImpl.ShortmessageServiceImpl;
import com.oa.dispatch.serviceImpl.DispatchServiceImpl;
import com.oa.personnel.entity.Employee;
import com.oa.personnel.entity.UserInfo;
import com.oa.personnel.serviceImpl.EmployeeServiceImpl;
import com.oa.travel.entity.ApproveResult;
import com.oa.travel.entity.WorkStream;
import com.oa.travel.serviceImpl.ApprovedResultServiceImpl;
import com.oa.travel.serviceImpl.WorkStreamServiceImpl;

public class ApproveServlet extends BaseServlet {

	private WorkStreamServiceImpl wsImpl = new WorkStreamServiceImpl();
	private ApprovedResultServiceImpl arImpl = new ApprovedResultServiceImpl();
	private DispatchServiceImpl disImpl = new DispatchServiceImpl();
	private EmployeeServiceImpl empImpl = new EmployeeServiceImpl();

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
	private ShortmessageServiceImpl shortmessageServiceImpl = new ShortmessageServiceImpl();

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// �½�����Ϣ
		Shortmessage shortmessage1 = new Shortmessage();
		shortmessage1.setSendTime(new Date());
		shortmessage1.setUnread(true);

		Shortmessage shortmessage2 = new Shortmessage();
		shortmessage2.setSendTime(new Date());
		shortmessage2.setUnread(true);

		String formNo = request.getParameter("formNo");
		String resultId = request.getParameter("resultId");
		String approveReason = request.getParameter("approveReason");
		HttpSession session = request.getSession();
		UserInfo userInfo = (UserInfo) session.getAttribute("userInfo");
		int empId = userInfo.getEmpId();
		Employee emp = empImpl.SearchById(empId);
		int approve = 0;
		if (resultId != null) {
			ApproveResult ar = new ApproveResult();
			ar.setApproveReason(approveReason);
			ar.setApproveTime(new Date());
			ar.setFormNo(formNo);
			ar.setResultId(Integer.parseInt(resultId));
			WorkStream ws = wsImpl.findByFormNo(formNo);
			Employee fromEmp = empImpl.SearchById(ws.getFromId());
			int wsId = ws.getWsId();
			ar.setWsId(wsId);
			WorkStream newWs = new WorkStream();
			if (Integer.parseInt(resultId) == 1) {
				int zongBossId = empImpl.searchByPosition("�ܾ���").getEmpId();
				Employee bigManager = empImpl.SearchById(zongBossId);
				int caiwuId = empImpl.searchByDeptId(4, "���ž���").getEmpId();
				Employee caiwuEmp = empImpl.SearchById(caiwuId);
				if (empId == zongBossId) {
					newWs.setToId(caiwuId);// ��ǰ��½�û����ܾ����ʱ���ύ������

					newWs.setFormNo(formNo);
					newWs.setFromId(ws.getFromId());

					newWs.setHasApproved(false);
					// ʵ���ⲽ������Ҫ��ws������һ����¼�����ʱ����Ҫ����������״̬�޸�Ϊͨ��
					approve = disImpl.approveDis(ar, wsId, newWs, 4);
					// ����Ϣ
					shortmessage1.setContents("���ı������ܾ����Ѿ�����������ͨ��");
					shortmessage1.setTitle("���ı������ܾ���������");
					shortmessage1.setReceiveEmail(fromEmp.getEmpEmail());
					shortmessage1.setSendEmail(bigManager.getEmpEmail());
					shortmessageServiceImpl.send(shortmessage1);
					shortmessage2.setContents("���д���˵ı�����");
					shortmessage2.setTitle("���д���˵ı�����");
					shortmessage2.setReceiveEmail(caiwuEmp.getEmpEmail());
					shortmessage2.setSendEmail(bigManager.getEmpEmail());
					shortmessageServiceImpl.send(shortmessage2);

				} else if (empId == caiwuId) {
					newWs.setToId(0);// ��ǰ��½�û��ǲ����ʱ�������������
					newWs.setFormNo(formNo);
					newWs.setFromId(ws.getFromId());
					newWs.setHasApproved(false);
					// ʵ���ⲽ������Ҫ��ws������һ����¼
					approve = disImpl.approveDis(ar, wsId, newWs, 4);

					// ����Ϣ
					shortmessage1.setContents("���ı����������Ѿ�����������ͨ��");
					shortmessage1.setTitle("���ı���������������");
					shortmessage1.setReceiveEmail(fromEmp.getEmpEmail());
					shortmessage1.setSendEmail(caiwuEmp.getEmpEmail());
					shortmessageServiceImpl.send(shortmessage1);

				} else {
					newWs.setToId(4);// ��ǰ��½�û��ǲ��ž�����ʱ���ύ���ܾ���
					newWs.setFormNo(formNo);
					newWs.setFromId(ws.getFromId());

					newWs.setHasApproved(false);
					// ʵ���ⲽ������Ҫ��ws������һ����¼
					approve = disImpl.approveDis(ar, wsId, newWs, 2);

					// ����Ϣ
					shortmessage1.setContents("���ı��������ž����Ѿ�����������ͨ��");
					shortmessage1.setTitle("���ı��������ž���������");
					shortmessage1.setReceiveEmail(fromEmp.getEmpEmail());
					shortmessage1.setSendEmail(userInfo.getComEmail());
					shortmessageServiceImpl.send(shortmessage1);

					shortmessage2.setContents("���д���˵ı�����");
					shortmessage2.setTitle("���д���˵ı�����");
					shortmessage2.setReceiveEmail(bigManager.getEmpEmail());
					shortmessage2.setSendEmail(userInfo.getComEmail());
					shortmessageServiceImpl.send(shortmessage2);
				}

			} else {
				approve = disImpl.approveDis(ar, wsId);
				// ����Ϣ
				shortmessage1.setTitle("���ı����������");
				shortmessage1.setContents("���ı���������أ�ע���޸�");
				shortmessage1.setReceiveEmail(fromEmp.getEmpEmail());
				shortmessage1.setSendEmail(userInfo.getComEmail());
				shortmessageServiceImpl.send(shortmessage1);
			}
		}
		if (approve == 1) {
			request.getRequestDispatcher("/UnApprovedDisServlet").forward(
					request, response);
		}
	}
}
