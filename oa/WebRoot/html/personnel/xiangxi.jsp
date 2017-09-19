<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>人事详细</title>
		<link href="/oa/css/style.css" rel="stylesheet" type="text/css" />

	</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="25" align="center" valign="bottom" class="td06">
					<table width="98%" border="0" cellspacing="3" cellpadding="0">
						<tr>
							<td width="15">
								<img src="/oa/images/index_32.gif" width="9" height="9" />
							</td>
							<td valign="bottom" class="title">
								详细信息
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<br />
		<div>
			<table width="95%" border="0" align="center" cellpadding="0"
				cellspacing="0" class="table01" id="info">
				<c:if test="${not empty requestScope.emp}">
				<tr>
					<td class="td_07">
						员工编号：<label>${requestScope.emp.empNo }</label>
					</td>
					<td rowspan="2">
						<img src="/oa/images/photo/${requestScope.emp.picture }" alt="alt" height="160px" width="145px"  />
					</td>
				</tr>
				<tr>
					<td>
						员工姓名：<label>${requestScope.emp.empName }</label>
					</td>
				</tr>
				<tr>
					<td>
						所属部门：<label>${requestScope.emp.deptName }</label>
					</td>
					<td>
						职&nbsp;&nbsp;&nbsp;&nbsp;位：<label>${requestScope.emp.position }</label>
					</td>
				</tr>
				<tr>
					<td>
						生&nbsp;&nbsp;&nbsp;&nbsp;日：<label>${requestScope.emp.empBirth}</label>
					</td>
					<td>
						学&nbsp;&nbsp;&nbsp;&nbsp;历：<label>${requestScope.emp.empDiploma}</label>
					</td>
				</tr>
				
				<tr>
					<td>
						联系方式：<label>${requestScope.emp.empMoble}</label>
					</td>
					<td>
						身份证号：<label>${requestScope.emp.idCard}</label>
					</td>
				</tr>
				</c:if>
			</table>
		</div>
	</body>
</html>

