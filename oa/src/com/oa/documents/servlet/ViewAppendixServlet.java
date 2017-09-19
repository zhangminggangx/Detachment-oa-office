package com.oa.documents.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oa.documents.entity.Appendix;
import com.oa.documents.serviceImpl.AppendixServiceImpl;

public class ViewAppendixServlet extends HttpServlet {

	private AppendixServiceImpl appendixServiceImpl =new AppendixServiceImpl();
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
      String str=request.getParameter("docId");
      if(str!=null)
      {
    	  int docId=Integer.parseInt(str);
    	  List<Appendix> appendixs=appendixServiceImpl.searchByDocId(docId);
    	  request.setAttribute("appendixs",appendixs);
    	  
    	  request.getRequestDispatcher("/html/media/appendixList.jsp").forward(request, response);
      }
	}

}
