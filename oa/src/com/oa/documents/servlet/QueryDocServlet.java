package com.oa.documents.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import com.oa.documents.entity.Documents;
import com.oa.documents.serviceImpl.DocumentsServiceImpl;
import com.oa.personnel.entity.UserInfo;

public class QueryDocServlet extends HttpServlet {

 private DocumentsServiceImpl docImpl=new DocumentsServiceImpl();
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

		String title=request.getParameter("title");
		String note=request.getParameter("note");
		HttpSession session=request.getSession();
		UserInfo userInfo=(UserInfo) session.getAttribute("userInfo");
		List<Documents> documents=docImpl.queryDoc(userInfo.getUid(), title, note);
		request.setAttribute("documents", documents);
        request.getRequestDispatcher("/html/media/applicationlist_2.jsp").forward(request, response);
	    
	}

}
