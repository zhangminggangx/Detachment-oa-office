<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" " http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns=" http://www.w3.org/1999/xhtml">
	<head>
	
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>无标题文档</title>
		<link href="/oa/css/style.css" rel="stylesheet" type="text/css" />
		<script language="javascript" src="/oa/js/clientSideApp.js"></script>
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
	$(function() {
		$("input[name='delDoc']").click(function(e) {
			var docId = $(this).attr("id");
			alert(docId);
			var ret = window.confirm("确认要删除吗？");
			if (ret == 1) {
				$.ajax( {
					type : 'get',
					//contentType: 'application/json; charset=gbk',
					url : 'DeleteDocServlet?docId=' + docId,
					success : function(ret) {
						if (ret == 0)
							alert("删除失败");
						else {
							alert("删除成功");
							//$(delBtn).parent().parent().remove();
					window.location.href = "/oa/ViewMyDocServlet";
				}
			}
				});
			}
		});
	});
</script>
	</head>
	<body>
		<div  border="0" align="center" cellpadding="0"
			cellspacing="0" style="margin-top: 10px;">

		</div>
		<div id="center" border="0" align="center" cellpadding="0"
			cellspacing="0" style="margin-top: 10px;">
			<table width="95%" border="0" align="center" cellpadding="0"
				cellspacing="0" id="table1" >
				<tr>
					<td class="td_top">
						附件名称
					</td>
					
					<td class="td_top">
					   下载
					</td>
					
				</tr>
				<c:if test="${not empty requestScope.appendixs}">
					<c:forEach items="${requestScope.appendixs}" var="a">
						<tr >
							<td class="td07">
								${a.fname }
							</td>
							<td class="td07">
								<a href="/oa/DownloadAppendixServlet?appendId=${a.appendId}">download</a>
							</td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
		</div>
	</body>
</html>