<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" " http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns=" http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<title>Loading</title>
		<style >
		body{ background-image: url("/oa/images/wiixii.gif"); background-repeat: no-repeat; text-align: center; background-position: 350px 0px; }
		#imgDiv{margin-top: 300px;}
		
		</style>
	</head>
	<body>
		<form name="loading"  id="imgDiv">
			<p align="center">
				账号或密码错误，正在为您重新跳转回登陆界面，请稍后...
			</p>
			<p align="center">
				<input type="text" name="bar"
					style="border-style: none; background-color: #D3E8D0; font-weight: bold;" />
				<input type="text" name="percentage"
					style="border-style: none; background-color: #FFFFFF; max-width: 25x" />
			</p>
			<p align="center">
				如果您的浏览器不支持跳转，请点击
				<a href="/oa/login.jsp">这里</a>手动跳转
			</p>
			<script language="javascript" type="text/javascript">
	var percent = 0; //百分比进度，显示在滚动条后面 
	var element = "||||"; //滚动条单元竖线 
	var elements = "||||"; //滚动条当前竖线 
	count(); //开始调用循环 

	function count() {
		percent = percent + 10; //每次百分比加10 
		elements = elements + element; //滚动条当前竖线增加一个滚动条单元竖线 
		document.loading.bar.value = elements; //设置窗体loading表单中bar元素的当前值 
		document.loading.percentage.value = percent + "%"; //设置窗体loading表单中percentage元素的当前值 
		if (percent < 99) { //percent小于99则继续循环 
			setTimeout("count()", 500); //每500ms进行一次count() 
		} else {
			window.location.href("/oa/login.jsp"); //percent达到100时跳转 
		}
	}
</script>
		</form>
		
	</body>
</html>