<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="/WEB-INF/lib/pager-taglib.jar" prefix="pg"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" " http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<base href="<%=basePath%>" />

		<title>My JSP 'sendBox.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<link href="/oa/css/last.css" type="text/css" rel="stylesheet" />
		<link href="/oa/css/style.css" rel="stylesheet" type="text/css" />
		<link type="text/css" rel="stylesheet"
			href="/oa/JQueryeasyui/themes/default/easyui.css" />
		<link type="text/css" rel="stylesheet"
			href="/oa/JQueryeasyui/themes/icon.css" />
		<script type="text/javascript"
			src="/oa/JQueryeasyui/jquery-1.4.4.min.js"></script>
		<script type="text/javascript"
			src="/oa/JQueryeasyui/jquery.easyui.min.js"></script>
		<script type="text/javascript"
			src="/oa/JQueryeasyui/locale/easyui-lang-zh_CN.js"></script>
			
			<script type="text/javascript" src="/oa/ueditor/editor_config.js"></script>
<script type="text/javascript" src="/oa/ueditor/editor_all.js"></script>
<link rel="stylesheet" href="/oa/ueditor/themes/default/ueditor.css"/>
		<style type="text/css">
#writeDiv {
	text-align: center;
	width: 900px;
}

form {
	width: 700px;
}

#subBut {
	padding-left: 0px;
}

.inp {
	width: 100%;
}
</style>

		<script type="text/javascript">
		$(function(){

			 var editorOption = {
			            toolbars:[['Source', 'Undo', 'Redo','Bold']],
			            autoClearinitialContent:false,
			            wordCount:false,
			            elementPathEnabled:false

			            //更多其他参数，请参考editor_config.js中的配置项

			        };

			        var editor_a = new baidu.editor.ui.Editor(editorOption);

			        editor_a.render('myEditSend');
			
		$("tr.Megtr td:nth-child(4)")
		.bind(
				"click",
				function() {
					$("input[name='title']").val($(this).html());
					$("input[name='receiveEmail']").val(
							$(this).parent().children("#receiveEmailTd")
									.html());
					$("input[name='sendTime']").val(
							$(this).parent().children("#sendTimeTd")
									.html());
					$("textarea[name='contents']").val(
							$(this).parent().children("#contentTd")
									.html());

					$("textarea[name='contents']").html(
							$(this).parent().children("#contentTd")
									.html());
					editor_a.setContent($("textarea[name='contents']").html());


					
					var msgId = $(this).parent().children("#messageId")
							.html();
					$("#dlg").css("display", "block");

					$("#dlg")
							.dialog(
									{
										title : "详细",
										collapsible : true,
										resizable : true,
										height:500,
										width:440,
										buttons : [ {
											text : '已读 ',
											iconCls : 'icon-ok',
											handler : function() {
												var data = {
													'msgId' : msgId
												};
												$
														.ajax( {
															type : 'POST',
															url : '/oa/UpdateShortMessageServlet',
															data : data,
															success : function() {
																window.location.href = "/oa/ViewsenddMessageServlet";
															},
															dataType : 'json'

														});

												$("#dlg").dialog(
														'close');
											}
										} ]
									});

				});
// 全选全不选
		$("#all").click(function() {
			var c = $(this).attr("checked");
			$(":checkbox").attr("checked", c);
		});
		// 删除
		$("#delMsg").click(function() {
			var msgIdStrs = "";
			$("input[name='product']").each(function() {
				var c = $(this).attr("checked");
				var msgId = $(this).parent().next().html();
		// 		alert(msgId);
				if (c) {
					msgIdStrs += msgId+";";
				}
			});
		// 	alert(msgIdStrs);
			if(msgIdStrs!=""){
				 $.ajax({
                     type:'post',
                     url:'/oa/DeleteMegServlet',
                     data:{
                    'msgIdStrs':msgIdStrs
                      },
                     success:function(){
                      	window.location.href = "/oa/ViewsenddMessageServlet";
                         },
                         dataType:'json'
                 });
				}else{

                    $.messager.alert("提示","未选择删除项","info",function(){});
	
				}
		})
		})
</script>
	</head>

	<body>
		<div>
			<pg:pager maxPageItems="10" maxIndexPages="4"
				url="/oa/ViewsenddMessageServlet" export="currentNumber=pageNumber"
				index="center">
				<table width="100%" border="0" cellpadding="0" cellspacing="0"
					class="table01">
					<tr >
						<td class="td_top">
							<input id="all" type="checkbox" value="全选" 
/>
							选择
						</td>
						<td class="td_top">
							标题
						</td>
						<td class="td_top">
							收信人
						</td>
						<td class="td_top">
							发信时间
						</td>
					</tr>

					<c:forEach items="${requestScope.sendMessages}" var="sendItem">
						<pg:item>

							<tr class="Megtr" >
								<td class="td07">
									<input type="checkbox" value="checkbox" name="product" />
								</td>
								<td style="display: none;" id="messageId">
										${sendItem.messageId}
									</td>
								<td style="display: none;" id="contentTd">
									${sendItem.contents}
								</td>
								<td class="td07" id="titleTd">
									${sendItem.title}
								</td>
								<td class="td07" id="receiveEmailTd">
									${sendItem.receiveEmail}
								</td>
								<td class="td07" id="sendTimeTd">
									${sendItem.sendTime}
								</td>
							</tr>
						</pg:item>
					</c:forEach>
				</table>
				<table width="100%" border="0" cellpadding="0" cellspacing="0"
					class="table02" align="center">
					<tr>
					<td height="30">
							<input name="addMemo" type="button" class="buttonface"
								value=" 删除 " id="delMsg" />
						</td>
						<td align="center">
							<pg:index>
								<pg:first>
									<a href="${pageUrl}">第一页</a>
								</pg:first>
								<pg:prev>
									<a href="${pageUrl}">上一页</a>
								</pg:prev>
								<pg:pages>
									<c:if test="${pageNumber!=currentNumber}">
										<%--判断如果循环的页码号不是当前页号，则页号可导航 --%>
										<a href="${pageUrl}">[${pageNumber }]</a>
									</c:if>
									<c:if test="${pageNumber==currentNumber}">
										<%--判断如果循环的页码号是当前页号，则页号不可导航并显示红色 --%>
										<font color="red">[${pageNumber }]</font>
									</c:if>
								</pg:pages>

								<pg:next>
									<a href="${pageUrl}">下一页</a>
								</pg:next>
								<pg:last>
									<a href="${pageUrl }">最后一页</a>
								</pg:last>
							</pg:index>
						</td>
					</tr>
				</table>
			</pg:pager>
		</div>
		<div id="dlg" style="display: none">
			<table width="400" height="400" class="table01">
				<tr height="50">
					<td class="td07">
						标题：
					</td>
					<td class="td07">
						<input type="text" name="title" />
					</td>
				</tr>
				<tr height="50">
					<td class="td07">
						收信人：
					</td>
					<td class="td07">
						<input type="text" name="receiveEmail" />
					</td>
				</tr>
				<tr height="50">
					<td class="td07">
						发送时间:
					</td>
					<td class="td07">
						<input type="text" name="sendTime" />
					</td>
				</tr>
				<tr>
					<td class="td07">
						内容：
					</td>
					<td class="td07">
						<textarea rows="15" cols="45" name="contents" id="myEditSend"></textarea>
					</td>
				</tr>
			</table>
		</div>
	</body>
</html>
