<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="../css/personnel.css" type="text/css" rel="stylesheet" />
<title>无标题文档</title>
</head>

<body>
<div class="main">
	<div class="global-width">
		<div class="action">
			<div class="t">员工信息</div>
			<div class="pages">
				<h6>员工信息列表</h6>
				<hr />
				<table class="personneldetil">
					<tr>
						<td>员工号：YG0001</td>
						<td>姓名：张三</td>
						<td>生日：1990-10-10</td>
						<td>学历：本科</td>
						<td>部门：研发部</td>
						<td>职务：部门经理</td>
						<td><a><img src="../images/addMemo.jpg" /></a></td>
						<td><a><img src="../images/delete.gif" /></a></td>
						<td><a><img src="../images/edit.gif"/></a></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</div>
<div class="copyright">Copyright  &nbsp;   &copy;  &nbsp; </div>
</body>
</html>

