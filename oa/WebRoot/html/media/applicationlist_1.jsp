<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>无标题文档</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">

		<link rel="stylesheet" type="text/css" href="/oa/jquery.uploadify/uploadify.css">
		<script type="text/javascript" src="/oa/jquery.uploadify/jquery-1.4.2.min.js"></script>
		<script type="text/javascript" src="/oa/jquery.uploadify/swfobject.js"></script>
		<script type="text/javascript" src="/oa/jquery.uploadify/jquery.uploadify.v2.1.4.min.js"></script>

		<link href="/oa/css/style.css" rel="stylesheet" type="text/css">
		<script language="javascript" src="/oa/js/clientSideApp.js"></script>
		<script language="JavaScript" type="text/javascript"src="/oa/js/win_center.js"></script>
		<script type="text/javascript">
	$(document).ready(function() {
						$("#uploadify").uploadify(
										{
											'uploader' : '../../jquery.uploadify/uploadify.swf',//指定uploadify.swf路径
											'script' : '../../FileUploadServlet',//后台处理的请求的servlet,同时传递参数,由于servlet只能接收一个参数，所以将两个参数合并成一个。
											'cancelImg' : '../../jquery.uploadify/cancel.png',//取消的按钮图片
											'queueID' : 'fileDiv',//与下面的id对应
											'queueSizeLimit' : 5,//当允许多文件生成时，设置选择文件的个数
											//'fileDesc' : 'jpg、gif、doc、docx、tif、pdf文件',
											'fileExt' : '*.*', //控制可上传文件的扩展名，启用本项时需同时声明fileDesc
											'auto' : true,//是否自动上传，即选择了文件即刻上传。
											'multi' : true, //是否允许同时上传多文件，默认false
											'simUploadLimit' : 3,//多文件上传时，同时上传文件数目限制
											//'buttonText'     : 'BROWSE',//按钮文字
											'buttonImg' : '../../jquery.uploadify/button_browse.png',//按钮图片
											'displayData' : 'percentage',//上传效果
											'removeCompleted' : false,//完成后，是否取消进度条
											'sizeLimit' : 1024 * 1024 * 1024,//文件大小限制 byte
											onError : function(id, fileObj,errorObj) {
												alert("Upload Failed!Only allowed upload size less than 1M of jpg, gif, doc, docx, tif, pdf file!");
											}
										});
					});
</script>
	</head>
	<body>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="25" align="center" valign="bottom" class="td06">
					<table width="98%" border="0" cellspacing="3" cellpadding="0">
						<tr>
							<td width="15">
								<img src="/oa/images/index_32.gif" width="9" height="9" />
							</td>
							<td valign="bottom" class="title" align="left">
								上传文档
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<div width="95%" border="0" align="center" cellpadding="0"
			cellspacing="0">
			&nbsp;
		</div>
		<div id="h">
			<form action="/oa/AddDocumentServlet" method="post">
				<table width="95%" border="0" align="center" cellpadding="0"
					cellspacing="0">
					<tr>
						<td class="td_top" colspan="2" align="center">
						</td>
					</tr>
					<tr>
						<td class="td_form01">
							文档主题
						</td>
						<td class="td_form02">
							<input type="text" name="title" />
						</td>
					</tr>
					<tr>
						<td class="td_form01">
							位置
						</td>
						<td class="td_form02">
							<input type="text" name="vitualPath" value="/${sessionScope.userInfo.deptName }/${sessionScope.userInfo.empName }" disabled="disabled"/>
						</td>
					</tr>
					<tr>
						<td class="td_form01">
							备注
						</td>
						<td class="td_form02">
							<input type="text" name="note" />
						</td>
					</tr>
					<tr>
						<td class="td_form01">
							所有者&nbsp;&nbsp;
						</td>
						<td class="td_form02">
							${sessionScope.userInfo.empName }
						</td>
					</tr>
					<tr>
						<td class="td_form01">
							附件：
						</td>
						<td >
							<div id="fileDiv"></div>
							<div id="uploadDiv">
								<input type="file" name="uploadify" id="uploadify" />
							</div>
						</td>
					</tr>
					<tr>
						<td></td>
						<td>
							<input type="submit"
								value="&nbsp;&nbsp;&nbsp;&nbsp;提交&nbsp;&nbsp;&nbsp;&nbsp;" />
						</td>
					</tr>
				</table>

			</form>

		</div>
		

	</body>
</html>