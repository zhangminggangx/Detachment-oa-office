<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>帮助中心</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    	<div id="dd" >
    	<h1 style="color: #6e9abe"><img alt="hj" src="/oa/images/hjian.jpg" width="60" height="50">出差帮助流程</h1>
			<img alt="travel" src="/oa/images/h2.jpg"/>
			<h1 style="color: #6e9abe"><img alt="hj" src="/oa/images/hjian.jpg">报销帮助流程</h1>
			<img alt="dispatch" src="/oa/images/h1.jpg"/>
		</div>
  </body>
</html>
