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
		<title>个人通讯录</title>
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
		<script language=JavaScript type=text/JavaScript>
	$(function() {
		$("#allForm input[name=submitAll]").click(function() {
			$("#allForm").attr("action", "/oa/SearchAllCommunicationServlet");
		});

		$("#allForm input[name=submitSelect]").click(function() {
			$("#allForm").attr("action", "/oa/SearchCommunicationByServlet");
		});

		$(".del").click(function(e) {
			var ret = window.confirm("确认要删除吗？");
			var commId = $(this).attr("name");
			if (ret == 1) {
				window.location.href = "/oa/RemoveSinComm?commId=" + commId;
			}
		});

		$(".add")
				.bind(
						"click",
						function() {
							var commId = $(this).prev().val();
							ff.name.value = $(this).prev().prev().val();
							ff.commId.value = commId;
							$("#dd").css("display", "block");
							$("#dd")
									.dialog(
											{
												title : "添加个人通讯录",
												width : 300,
												heigh : 400,
												collapsible : true,
												resizable : true,
												buttons : [
														{
															text : '保存',
															iconCls : 'icon-ok',
															handler : function() {
																var typeId = $(
																		"select[name='typeName']")
																		.val();
																var data = {
																	'commId' : commId,
																	'typeId' : typeId
																};
																$.ajax( {
																			type : 'POST',
																			url : 'AddSinCommServlet',
																			data : data,
																			success : function() {
																				window.location.href = "/oa/html/tongxunlu/tongxunlu.jsp";

																			},
																			dataType : 'json'

																		});

																alert('保存成功');
																$('#dd')
																		.dialog(
																				'close');
															}
														},
														{
															text : '取消',
															iconCls : 'icon-cancel',
															handler : function() {
																$('#dd')
																		.dialog(
																				'close');
															}
														} ]
											});

						});
	});
</script>

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
							<td valign="bottom" class="title" align="left">
								个人通讯录
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<br />
		<!-- Tab切换开始 -->
		<div id="tt" class="easyui-tabs"  style="height:800px;">

			<!-- 公司内部通讯录-->

			<div title="公司通讯录" closable="true">
				<iframe src="/oa/SearchCommServlet?state=0" width="100%" frameborder="0"
					scrolling="no" height="500px"></iframe>
			</div>
			<!-- 公司内部通讯录结束 -->


			<!-- 个人通讯录开始 -->
			<div title="个人通讯录" closable="true">
				<iframe src="/oa/SearchSinCommServlet" width="100%" frameborder="0" scrolling="no" height="500px"></iframe>
			</div>
			<!-- 个人通讯录结束 -->


		</div>
		<!-- tab切换结束 -->

		<!-- 弹出窗口 -->


	</body>
</html>
