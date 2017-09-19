package com.oa.documents.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.oa.common.Common;
import com.oa.personnel.entity.UserInfo;


public class FileUploadServlet extends HttpServlet {
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
		
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession session=request.getSession();
		String sumName=(String)session.getAttribute("sumName");
		if(sumName==null){
			sumName="";
		}
		UserInfo userInfo=(UserInfo) session.getAttribute("userInfo");
		
		String savePath = getServletContext().getRealPath("/fileUpload/uploadFile/"+userInfo.getDeptName()+"\\"+userInfo.getEmpName())+"\\";// 生成存放文件的路径
		File f1 = new File(savePath);
		if (!f1.exists()) {
			f1.mkdirs();
		}
		DiskFileItemFactory fac = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(fac);
		upload.setHeaderEncoding("utf-8");
		List fileList = null;
		try {
			fileList = upload.parseRequest(request);//得到请求的文件list
		} catch (FileUploadException ex) {
			return;
		}
		Iterator<FileItem> it = fileList.iterator();
		String name = "";
		String oldName = "";
		String extName = "";
		while (it.hasNext()) {
			FileItem item = it.next();
			if (!item.isFormField()) {
				name = item.getName();
				long size = item.getSize();
				String type = item.getContentType();
				if (name == null || name.trim().equals("")) {
					continue;
				}
				oldName = name;
				sumName+=oldName+";";
				// 扩展名格式：
				if (name.lastIndexOf(".") >= 0) {
					extName = name.substring(name.lastIndexOf("."));
				}
				File file = null;
				// 生成文件名：
				name = new String(oldName.getBytes("utf-8"),"utf-8");
				file = new File(savePath + name);
				File saveFile = new File(savePath + name );//指定文件
				try {
					item.write(saveFile);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		
		session.setAttribute("img", name);
		session.setAttribute("sumName", sumName);
//		System.out.println((String)session.getAttribute("sumName")+"sesion中的sumString");
		response.getWriter().print(name + extName+";");//返回新文件名
		response.getWriter().print(new String(oldName.getBytes("utf-8"),"utf-8"));//返回原来文件名
		
	}

}
