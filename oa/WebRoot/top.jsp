<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<title>Untitled Document</title>
		<link href="/oa/css/style.css" rel="stylesheet" type="text/css" />
		<script language="JavaScript" type="text/javascript"
			src="/oa/js/win_center.js"></script>

		<link type="text/css" rel="stylesheet"
			href="/oa/JQueryeasyui/themes/default/easyui.css" />
		<link type="text/css" rel="stylesheet"
			href="/oa/JQueryeasyui/themes/icon.css" />
		<script type="text/javascript"
			src="/oa/JQueryeasyui/jquery-1.8.0.min.js"></script>
		<script type="text/javascript"
			src="/oa/JQueryeasyui/jquery.easyui.min.js"></script>
		<script type="text/javascript"
			src="/oa/JQueryeasyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">

</script>
	</head>
	<body>
		<table width="100%" border="0" cellpadding="0" cellspacing="0"
			background="/oa/images/index_02.gif">
			<tr>
				<td width="40">
					<img src="/oa/images/index_01.gif" width="260" height="40">
				</td>
				<td align="right" valign="bottom">
					<table border="0" cellspacing="7" cellpadding="0">
						<tr>
							<td width="50" valign="bottom">
								<img src="/oa/images/index_05.gif" width="20" height="16"
									align="absbottom">
								<a href="javaScript:window.history.back()" class="a02">后退</a>
							</td>
							<td width="50" valign="bottom">
								<img src="/oa/images/index_07.gif" width="20" height="16"
									align="absbottom">
								<a href="javaScript:window.history.foword()" class="a02">前进</a>
							</td>
							<td width="50" valign="bottom">
								<img src="/oa/images/index_09.gif" width="20" height="16"
									align="absbottom">
								<a href="main.jsp" target="mainFrame" class="a02">首页</a>
							</td>
							<td width="50" valign="bottom">
								<img src="/oa/images/index_11.gif" width="20" height="16"
									align="absbottom">
								<a href="login.jsp" target="_parent" class="a02">退出</a>
							</td>

						</tr>
					</table>
				</td>
			</tr>
		</table>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="8">
					<img src="/oa/images/spacer.gif" width="1" height="1">
				</td>
			</tr>
		</table>
		<table width="100%" border="0" cellpadding="0" cellspacing="0"
			background="/oa/images/index_21.gif">
			<form name="form1" method="post" action="">
				<tr>
					<td width="20" height="30">
						&nbsp;
					</td>
					<td class="F02">
						<img src="/oa/images/index_23.gif" width="26" height="30"
							align="absmiddle">
						淡定OA办公系统:&nbsp;${sessionScope.userInfo.empName}
						，您好！职位：${sessionScope.employee.position}
					</td>
					<td align="right" class="F02">
						<a href="/oa/help.jsp" class="a01" id="help" target="mainFrame">帮助中心</a>|
						<a href="/oa/html/online/online.jsp" target="mainFrame"
							class="a01">当前在线</a> ｜
						<a href="/oa/html/schedule/schedule.jsp" target="mainFrame"
							class="a01">日程安排</a> ｜
						<a href="/oa/ViewMyMemoServlet" target="mainFrame" class="a01">我的便签</a>｜
						<a href="/oa/ViewShortMessageServlet" target="mainFrame"
							class="a01">短消息</a>
					</td>
					<td width="14" class="F02"></td>
				</tr>
			</form>
		</table>
	
	</body>
</html>

