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
		// 得到下载文件的名字
		
		// 设置response的编码方式
		response.setContentType("application/x-msdownload");
		// 发送到客户端的文章
		//response.setHeader("Content-Disposition", "attachment;filename="+ filename);
		response.setHeader("Content-Disposition", "attachment; filename=" + java.net.URLEncoder.encode(filename, "UTF-8"));
		// 读出文件到i/o流
		FileInputStream fis = new FileInputStream(file);
		//DataInputStream buff = new DataInputStream(fis);
		//byte[] b = new byte[1024];// 相当于我们的缓存
		//long k = 0;// 该值用于计算当前实际下载了多少字节
		// 从response对象中得到输出流,准备下载
		OutputStream myout = response.getOutputStream();
		// 开始循环下载
		int c=0;
		while((c=fis.read())!=-1){
			myout.write(c);
			
		}
		
		// 将写入到客户端的内存的数据,刷新到磁盘
		myout.flush();
		myout.close();
	
	}
}
