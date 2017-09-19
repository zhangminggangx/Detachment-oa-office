package com.oa.deskTop.servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import com.oa.deskTop.entity.Memo;
import com.oa.deskTop.serviceImpl.MemoServiceImpl;
import com.oa.personnel.entity.UserInfo;
public class AddMemoServlet extends HttpServlet {

	private MemoServiceImpl memoImpl=new MemoServiceImpl();
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
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String title = request.getParameter("title");
		String contents = request.getParameter("contents");
		java.net.URLDecoder urlDecoder = new java.net.URLDecoder();     
		 title = urlDecoder.decode(title,"UTF-8");
		contents = urlDecoder.decode(contents,"UTF-8");
		HttpSession session=request.getSession();
		UserInfo userInfo=(UserInfo)session.getAttribute("userInfo");
		Memo memo=new Memo();
		memo.setContents(contents);
		memo.setCreateTime(new Date());
		memo.setTitle(title);
		memo.setUid(userInfo.getUid());
        JSONObject json=JSONObject.fromObject(memoImpl.add(memo));
        response.getWriter().print(json);
	}

}
