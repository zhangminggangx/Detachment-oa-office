package com.oa.dispatch.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oa.dispatch.entity.DisDetail;
import com.oa.dispatch.entity.Dispatch;
import com.oa.dispatch.serviceImpl.DisDetailServiceImpl;
import com.oa.dispatch.serviceImpl.DispatchServiceImpl;

public class ModifyDispatchServlet extends HttpServlet {

	private DisDetailServiceImpl detailImpl=new DisDetailServiceImpl();
	private DispatchServiceImpl disImpl=new DispatchServiceImpl();
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
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
       String disIdStr=request.getParameter("disId");
       String formNo=request.getParameter("formNo");
       String disMoney=request.getParameter("disMoney");
       String[] detailMoneyArr=request.getParameterValues("detailMoney");
       String[] descriptionArr=request.getParameterValues("description");
       PrintWriter out=response.getWriter();
       if(disIdStr!=null){
    	   int disId=Integer.parseInt(disIdStr);
    	   Dispatch dis=disImpl.searchFormNoDis(formNo);
    	   dis.setDisMoney(Double.parseDouble(disMoney));
    	   List<DisDetail> details=detailImpl.searchByDisId(disId);
    	   List<DisDetail> newDetails=new ArrayList<DisDetail>();
			for (int i = 0; i < details.size(); i++) {
				DisDetail detail = details.get(i);
				if (detailMoneyArr[i] != null && !detailMoneyArr[i].equals("")
						&& descriptionArr[i] != null
						&& !descriptionArr[i].equals("")) {
					double detailMoney = Double.parseDouble(detailMoneyArr[i]);
					String description = descriptionArr[i];
					detail.setDetailMoney(detailMoney);
					detail.setDescription(description);
					newDetails.add(detail);
				} else {
					out.write("<script>alert('由于您的数据不完整，无法提交，请重新填写');</script>");
					return;
				}

			}
			int ret=disImpl.update(dis, newDetails);
			if(ret!=0)
			{
				request.getRequestDispatcher("/SerachDisServlet").forward(request, response);
			}
       }
	}

}
