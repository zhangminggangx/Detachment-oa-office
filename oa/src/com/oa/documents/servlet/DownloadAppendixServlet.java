package com.oa.documents.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oa.documents.entity.Appendix;
import com.oa.documents.serviceImpl.AppendixServiceImpl;
import com.oa.personnel.entity.UserInfo;

public class DownloadAppendixServlet extends HttpServlet {
	private AppendixServiceImpl appendixServiceImpl=new AppendixServiceImpl();

	private static final String CONTENT_TYPE = "text/html; charset=utf-8";

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
		int  appendId =Integer.parseInt( request.getParameter("appendId"));
		
		HttpSession session = request.getSession();
		UserInfo userInfo =(UserInfo)session.getAttribute("userInfo");
		response.setContentType(CONTENT_TYPE);
		Appendix appendix=appendixServiceImpl.searchById(appendId);
		String filename=appendix.getFname();
		String filePath=getServletContext().getRealPath("/fileUpload/uploadFile/"+userInfo.getDeptName()+"\\"+userInfo.getEmpName()+"\\")+"\\"+filename;
		File file=new File(filePath );
	//	System.out.println(filePath);
		//System.out.println("D://software/apache-tomcat-6.0.33/webapps/oa/fileUpload/uploadFile/"+userInfo.getEmpName()+"/91111065820.jpg" );
		// �õ������ļ�������
		
		// ����response�ı��뷽ʽ
		response.setContentType("application/x-msdownload");
		// ���͵��ͻ��˵�����
		//response.setHeader("Content-Disposition", "attachment;filename="+ filename);
		response.setHeader("Content-Disposition", "attachment; filename=" + java.net.URLEncoder.encode(filename, "UTF-8"));
		// �����ļ���i/o��
		FileInputStream fis = new FileInputStream(file);
		//DataInputStream buff = new DataInputStream(fis);
		//byte[] b = new byte[1024];// �൱�����ǵĻ���
		//long k = 0;// ��ֵ���ڼ��㵱ǰʵ�������˶����ֽ�
		// ��response�����еõ������,׼������
		OutputStream myout = response.getOutputStream();
		// ��ʼѭ������
		int c=0;
		while((c=fis.read())!=-1){
			myout.write(c);
			
		}
		
		// ��д�뵽�ͻ��˵��ڴ������,ˢ�µ�����
		myout.flush();
		myout.close();
	
	}
}
