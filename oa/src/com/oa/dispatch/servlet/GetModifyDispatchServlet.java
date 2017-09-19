package com.oa.dispatch.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oa.dispatch.entity.DisDetail;
import com.oa.dispatch.entity.DisProject;
import com.oa.dispatch.entity.Dispatch;
import com.oa.dispatch.serviceImpl.DisDetailServiceImpl;
import com.oa.dispatch.serviceImpl.DisProjectServiceImpl;
import com.oa.dispatch.serviceImpl.DispatchServiceImpl;

public class GetModifyDispatchServlet extends HttpServlet {

	/**
	 * 
	 */
	private DispatchServiceImpl disImpl=new DispatchServiceImpl();
	private DisDetailServiceImpl detailImpl=new DisDetailServiceImpl();
	private DisProjectServiceImpl proImpl=new DisProjectServiceImpl();
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

		String formNo=request.getParameter("formNo");
		Dispatch dis=disImpl.searchFormNoDis(formNo);
		List<DisDetail> details=detailImpl.searchByDisId(dis.getDisId());
		for(DisDetail detail:details)
		{
			int proId=detail.getProId();
			DisProject pro=proImpl.searchById(proId);
			detail.setDisProject(pro);
		}
		request.setAttribute("dispatch",dis);
		request.setAttribute("details",details);
		request.getRequestDispatcher("/html/dispatch/baoxiao/modifyDis.jsp").forward(request, response);
		
	}

}
