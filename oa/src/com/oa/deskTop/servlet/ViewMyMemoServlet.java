package com.oa.deskTop.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oa.deskTop.entity.Memo;
import com.oa.deskTop.serviceImpl.MemoServiceImpl;
import com.oa.personnel.entity.UserInfo;

public class ViewMyMemoServlet extends HttpServlet {

	private MemoServiceImpl memoImpl=new MemoServiceImpl();
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

		HttpSession session=request.getSession();
		UserInfo userInfo=(UserInfo)session.getAttribute("userInfo");
		int pageNo=1;
		String pageNoStr=request.getParameter("pageNo");
		if(pageNoStr!=null)
		{
			pageNo=Integer.parseInt(pageNoStr);
		}
		
		int uId=userInfo.getUid();
		int pageCount=memoImpl.computePageCount(10, uId);
		List<Memo> memos=memoImpl.searchAll(10,pageNo,uId);
		request.setAttribute("memos", memos);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageNo",pageNo);
		request.setAttribute("size", memos.size());
		request.getRequestDispatcher("/html/Collection/PersonalCollection.jsp").forward(request, response);
	}

}
