package com.oa.documents.servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oa.documents.entity.Appendix;
import com.oa.documents.entity.Documents;
import com.oa.documents.serviceImpl.AppendixServiceImpl;
import com.oa.documents.serviceImpl.DocumentsServiceImpl;
import com.oa.personnel.entity.UserInfo;

public class AddDocumentServlet extends HttpServlet {

	private DocumentsServiceImpl docuImpl = new DocumentsServiceImpl();
	private AppendixServiceImpl appendixServiceImpl = new AppendixServiceImpl();

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
		String note = request.getParameter("note");
		
		HttpSession session = request.getSession();
		
		
		UserInfo userInfo = (UserInfo) session.getAttribute("userInfo");
		String vitualPath = "/" + userInfo.getDeptName() + "/"
				+ userInfo.getEmpName();
		
    String sumName=(String)session.getAttribute("sumName");
     String[] fnameArr=sumName.split(";");
  //   System.out.println(sumName+"sunsusnsunsunssun");
    
		// String img = (String) session.getAttribute("img");
		Documents documents = new Documents();
		documents.setNote(note);
		documents.setCreateTime(new Date());
		documents.setTitle(title);
		documents.setVirtualPath(vitualPath);
		documents.setUid(userInfo.getUid());
		documents.setParentId(3);
		int addDoc = docuImpl.add(documents);
		int docId = docuImpl.findMaxId();
		int addAppendix = 0;
		int ret =0;
		for (int i = 0; i < fnameArr.length; i++) {
			Appendix appendix = new Appendix();
			appendix.setDocId(docId);
			appendix.setFname(fnameArr[i]);
			 ret+= appendixServiceImpl.add(appendix);
		}
		
		session.setAttribute("sumName", "");
		if (ret != 0)
			addAppendix += ret;
		if (addAppendix != 0 && addDoc != 0) {
			request.getRequestDispatcher("ViewMyDocServlet").forward(request,response);
		}
	}

}
