<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<title>报销详细信息</title>
		<link href="/oa/css/style.css" rel="stylesheet" type="text/css">



	</head>

	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<center>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="25" align="center" valign="bottom" class="td06">
						<table width="98%" border="0" cellspacing="3" cellpadding="0">
							<tr>
								<td width="15">
									<img src="/oa/images/index_32.gif" width="9" height="9">
								</td>
								<td valign="bottom">
									<span class="title">报销详细信息</span>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<form name="form1" method="post"
				action="/oa/ApproveServlet?formNo=${requestScope.formNo}">
				<table width=95% border=0 align=center cellpadding=0 cellspacing=0>
					<tr align="left" nowrap>
						<tr align="left" nowrap>
							<td width="80" height="24" align="center" class=td_form01>
								报 销 人：
							</td>
							<td class="td_form02">
								${requestScope.emp.empName }
							</td>
							<td width="80" height="24" align="center" class=td_form01>
								报销时间:
							</td>
							<td class="td_form02">
								${requestScope.dispatch.createTime }
							</td>
						</tr>
					</tr>
				</table>

				<table width=95% border=0 align=center cellpadding=0 cellspacing=0>
					<tr align="left" nowrap>
						<tr>
							<td width="90" height="24" class="td_form01">
								项目
							</td>
							<td class="td_form01">
								费用
							</td>
							<td width="90" class="td_form01">
								描述
							</td>

						</tr>
						<c:if test="${not empty requestScope.dispatch.disDetailList}">
							<c:forEach items="${requestScope.dispatch.disDetailList}"
								var="detail">
								<tr>
									<td width="90" height="24" class="td_form02">
										${detail.disProject.proName}
									</td>
									<td width="90" class="td_form02">
										￥${detail.detailMoney}
									</td>
									<td width="90" class="td_form02">
										${detail.description}
									</td>

								</tr>
							</c:forEach>
						</c:if>
				</table>
				<br>

				<br>
				<table width=95% border=0 align=center cellpadding=0 cellspacing=0>
					<tr align="left" nowrap>
						<tr>
							<td width="90" height="24" class="td_form01">
								审批人
							</td>
							<td width="180" class="td_form01">
								意见
							</td>
							<td class="td_form01">
								情况
							</td>
							<td class="td_form01">
								时间
							</td>

						</tr>
						<c:forEach items="${requestScope.approvedResults}" var="ar">
							<tr>
								<td width="90" height="24" class="td_form02">
									${ar.employee.empName }
								</td>
								<td width="180" class="td_form02">
									${ar.approveReason }
								</td>
								<td class="td_form02">
									${ar.result.resName }
								</td>
								<td class="td_form02">
									${ar.approveTime }
								</td>

							</tr>

						</c:forEach>
				</table>

			</form>
		</center>
	</body>
</html>
