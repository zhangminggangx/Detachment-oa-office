<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@page import="com.jspsmart.upload.SmartUpload"%>
<%@page import="com.jspsmart.upload.Files"%>
<%@page import="com.jspsmart.upload.File"%>

<%@page import="com.jspsmart.upload.Request"%>
<%@page import="com.oa.common.RandomFile"%>
<%@page import="com.oa.personnel.serviceImpl.EmployeeServiceImpl"%>



<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

	<body>
   
	<%
     
     SmartUpload su = new SmartUpload();
     
     su.initialize(pageContext);//�����ȳ�ʼ����д�����
     
     //�ϴ��ļ�����
     su.setAllowedFilesList("jpg,gif,bmp");//ֻ��������������
     
     //��ȡ���е���������     
     Request req= su.getRequest();
     su.upload();
     String name = "";//
     //su.save("/uploadfile",SmartUpload.SAVE_VIRTUAL);
      Files files = su.getFiles();//�����ż�ļ���Ϣ����
      for(int i =0;i<files.getCount();i++){
    	   File file = files.getFile(i);
    	   if(file.isMissing()){
    		   continue;
    	   }   
    	   String ext = file.getFileExt();
    	   name=RandomFile.createFileName()+"."+ext;
    	   String empId=request.getParameter("empId");
    	   EmployeeServiceImpl empImpl=new  EmployeeServiceImpl();
    	   empImpl.updatePic(Integer.parseInt(empId),name);
    	   String fileName="/images/photo/"+name;
    	   file.saveAs(fileName,SmartUpload.SAVE_VIRTUAL);
    	   request.getRequestDispatcher("/ViewEmployeeListServlet").forward(request,response);
      }
  %>
	</body>

</html>
