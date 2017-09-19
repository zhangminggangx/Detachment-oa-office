<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" " http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns=" http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>用户管理</title>
		<link href="/oa/css/style.css" rel="stylesheet" type="text/css" />
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
		<script language="javascript" src="/oa/js/clientSideApp.js"></script>
		<script language="javascript">
	$(function() {
		$(".updateRole").click(

		function(e) {
			var ret = window.confirm("确认要为该用户修改权限吗？");
			var uId = $(this).attr("name");
			var empName = $(this).next().val();
			$("#empName").val(empName);
			if (ret == 1) {
				$("#dd").css("display", "block");
				$("#dd").dialog( {
					title : "修改权限",
					width : 300,
					heigh : 200,
					collapsible : true,
					resizable : true,
					buttons : [ {
						text : '保存',
						iconCls : 'icon-ok',
						handler : function() {
						var roleId=$("select[name='roleName']").val();
                         $.ajax( {
								type : 'POST',
								url : 'ModifyUserRoleServlet?uId='+uId+"&roleId="+roleId,
								success : function() {
								     alert('修改成功');
									window.location.href = "/oa/ViewUsersServlet";
                         }
							});
  
						}
	

					} ]

				})
			}
		});

	});
</script>
	</head>

	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<center>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="25" align="center" valign="bottom" class="td06">
						<table width="98%" border="0" cellspacing="3" cellpadding="0">
							<tr>
								<td width="15">
									<img src="/oa/images/index_32.gif" width="9" height="9" alt="" />
								</td>
								<td valign="bottom" class="title" align="left">
									用户管理
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<br />
			<!-- tabs切换开始 -->
			<div id="tt" class="easyui-tabs" style="height: 800px;">
				<!-- 普通用户开始 -->
				<c:forEach items="${requestScope.roles}" var="role">
					<div title="${role.roleName }" closable="true">
						<br />
						<table width="95%" border="0" align="center" cellpadding="0"
							cellspacing="0" class="table01">
							<tr>
								<td nowrap class="td_top">
									修改权限
								</td>
								<td nowrap class="td_top">
									登录名
								</td>
								<td nowrap class="td_top">
									部门
								</td>
								<td nowrap class="td_top">
									姓名
								</td>
								<td nowrap class="td_top">
									email
								</td>
								<td nowrap class="td_top">
									角色
								</td>
								<td nowrap class="td_top">
									角色描述
								</td>


							</tr>
							<c:if test="${not empty requestScope.userInfos}">
								<c:forEach items="${requestScope.userInfos}" var="u">
									<c:if test="${u.roleId==role.roleId}">
										<tr>
											<td class="td_01">
												<a href="#" style="color: green;" class="updateRole"
													name="${u.uid}">修改权限</a>
												<input name="empName" type="hidden" value="${u.empName}" />
											</td>
											<td class="td_01">
												${u.empNo }
											</td>
											<td class="td_01">
												${u.deptName }
											</td>
											<td class="td_01">
												${u.empName }
											</td>
											<td class="td_01">
												${u.comEmail}
											</td>
											<td class="td_01">
												${u.role.roleName }
											</td>
											<td class="td_01">
												${u.role.roleDesc}
											</td>

										</tr>
									</c:if>
								</c:forEach>
							</c:if>

						</table>
					</div>
				</c:forEach>
			</div>
		</center>

		<div id="dd" style="display: none">
			<label>
				用户名称
			</label>
			<input id="empName" value="" />
			<br />
			<br />
			<label>
				角色名称
			</label>
			<select name="roleName">
				<c:forEach items="${requestScope.roles}" var="role">
					<option value="${role.roleId }">
						${role.roleName }
					</option>
				</c:forEach>
			</select>
		</div>

	</body>
</html>
