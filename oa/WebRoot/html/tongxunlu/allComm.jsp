<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
			$("#allForm").attr("action", "/oa/SearchCommServlet");
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

		$(".add").bind("click", function() {
			var commId = $(this).prev().val();
			ff.name.value = $(this).prev().prev().val();
			ff.commId.value = commId;
			$("#dd").css("display", "block");
			$("#dd").dialog( {
				title : "添加个人通讯录",
				width : 300,
				heigh : 400,
				collapsible : true,
				resizable : true,
				draggable : true,
				buttons : [ {
					text : '保存',
					iconCls : 'icon-ok',
					handler : function() {
						var typeId = $("select[name='typeName']").val();
						var data = {
							'commId' : commId,
							'typeId' : typeId
						};
						$.ajax( {
							type : 'POST',
							url : 'AddSinCommServlet',
							data : data,
							success : function() {
								// window.location.href="/oa/html/tongxunlu/tongxunlu.jsp"; 
							//window.location.href="/oa/SearchCommServlet"; 

						},
						dataType : 'json'

						});

						alert('保存成功');
						$('#dd').dialog('close');
					}
				}, {
					text : '取消',
					iconCls : 'icon-cancel',
					handler : function() {
						$('#dd').dialog('close');
					}
				} ]
			});

		});

		 var mydialog=null;
		$(".updateCommA")
				.bind(
						"click",
						function() {
							var commId=$(this).parent().prev().children(":nth-child(2)").val();
							var empName = $(this).parent().parent().children(
									":first-child").html();
							var empMobile = $(this).parent().parent().children(
									":nth-child(2)").html();
							var email = $(this).parent().parent().children(
									":nth-child(3)").html();
							var department = $(this).parent().parent()
									.children(":nth-child(4)").html();
							var position = $(this).parent().parent().children(
									":nth-child(5)").html();

							 $("input[name='empName1']").val(empName);
							$("input[name='empMobile1']").val(empMobile);
							$("input[name='email1']").val(email);
							$("input[name='department1']").val(department);
							$("input[name='position1']").val(position);


							   if(mydialog==null){
							$("#dupdate").css("display", "block");
							 mydialog=$("#dupdate").dialog({
												title : "修改信息",
												width : 300,
												heigh : 500,
												collapsible : true,
												resizable : true,
												draggable : true,
												buttons : [
														{
															text : '修改',
															iconCls : 'icon-ok',
															handler : function() {
																var data = {
																	'commId' : commId,
																	'empMobile':$("input[name='empMobile1']").val(),
																	'email':$("input[name='email1']").val(),
																	'department':$("input[name='department1']").val(),
																	'position':$("input[name='position1']").val()
																};
																$.ajax( {
																			type : 'POST',
																			url : '/oa/UpdateCommServlet?fcode=04002',
																			data : data,
																			success : function() {
																				// window.location.href="/oa/html/tongxunlu/tongxunlu.jsp"; 
																				window.location.href="/oa/SearchCommServlet"; 

																			},
																			error:function(){window.location.href="/oa/rightError.jsp";},
																			dataType : 'json'

																		});

															
																$('#dupdate').dialog('close');
															}
														},
														{
															text : '取消',
															iconCls : 'icon-cancel',
															handler : function() {
																$('#dupdate').dialog('close');
															}
														} ]
											});  }else{
									              //  mydialog.dialog({href:"/oa/TravelReportDetailServlet?formNo="+hidFormNo });
									        	   mydialog.dialog('refresh');
									        	   
									               }   

						});
	});
</script>


	</head>

	<body>
		<form action="" id="allForm" method="post">
			<table width="95%" border="0" align="center" cellpadding="0"
				cellspacing="0">
				<tr>
					<td class="td_page">
						姓名：
						<input name="empName" type="text" class="input" size="20" />
						部门：
						<select id="sel" name="deptName">
							<option></option>
							<c:forEach items="${requestScope.deptList}" var="dept">
								<option value="${dept.deptName }">
									${dept.deptName }
								</option>
							</c:forEach>
						</select>
						职位：
						<input type="text" name="position" />
						联系电话：
						<input type="text" name="empMobile" />
						<input name="submitSelect" type="submit" class="buttonface"
							value="查询  " />
						<input name="submitAll" type="submit" class="buttonface"
							value="查询公司全部通讯录" />
					</td>
				</tr>
			</table>
		</form>
		<div style="height: 400px;">
			<pg:pager maxPageItems="10" url="/oa/SearchCommServlet">

				<%--
      pager 两个常用属性maxPageItems：显示最多的纪录数/页 ，实现一页中出现item元素的数量控制
      url:分页的链接地址（表示当你单击分页导航所转向的页面）
    --%>
				<table width="95%" border="0" align="center" cellpadding="0"
					cellspacing="0" class="table01">
					<tr>
						<td class="td_top">
							姓名
						</td>
						<td class="td_top">
							联系电话
						</td>
						<td class="td_top">
							Email
						</td>
						<td class="td_top">
							部门
						</td>
						<td class="td_top">
							职位
						</td>
						<td class="td_top">
							添加到个人通讯录
						</td>
						<td class="td_top">
							我的操作
						</td>
					</tr>
					<c:if test="${not empty requestScope.commList}">
						<c:forEach items="${requestScope.commList}" var="comm">
							<pg:item>
								<tr>
									<td class="td07" name="name">
										${comm.empName }
									</td>
									<td class="td07">
										${comm.empMobile }
									</td>
									<td class="td07">
										${comm.email }
									</td>
									<td class="td07">
										${comm.department }
									</td>
									<td class="td07">
										${comm.position }
									</td>
									<td class="td07">
										<input type="hidden" value="${comm.empName}" />
										<input type="hidden" value="${comm.commId}" />
										<a href="#" class="add">添加</a>

									</td>
									<td class="td07">
										<a href="#" class="updateCommA">修改</a>
									</td>
								</tr>
							</pg:item>
						</c:forEach>
					</c:if>
					<tr>
						<td align="right" colspan="7">
							<pg:index>
								<pg:first>
									<a href="${pageUrl}">第一页</a>
								</pg:first>
								<%--pageUrl内容的构成由pager的url属性以及在其后面附加offset参数
			该参数的值是导航标签（first、last、next、prev，pages）根据当前页和maxPageItems的值计算出的偏移量
			 --%>
								<pg:prev>
									<a href="${pageUrl}">上一页</a>
								</pg:prev>
								<pg:pages>

									<a href="${pageUrl}">[${pageNumber }]</a>
									<%--pageNumber是pg:pages标签输出的变量，用于存放每次循环的页码号的变量，
			加上超链接表示到单击这个页码号就可以导航到指定的页面上 --%>
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

		<div id="dd" icon="icon-save" style="display: none">
			<br />
			<form action="" name="ff">
				姓名：
				<input type="text" name="name" />
				<input type="hidden" name="commId" />
				<br />
				请选择要添加的类型：
				<select name="typeName">
					<c:if test="${not empty requestScope.typeList}">
						<c:forEach items="${ requestScope.typeList}" var="type">
							<c:if test="${type.tname!='公司内部'}">
								<option value="${type.tid}">
									${type.tname}
								</option>
							</c:if>
						</c:forEach>
					</c:if>
				</select>
			</form>

		</div>
		<div id="dupdate" icon="icon-save" style="display: none">
				<table>
					<tr>
						<td>
							姓名：
						</td>
						<td>
							<input type="text" name="empName1" disabled="disabled" />
							
						</td>
					</tr>
					<tr>
						<td>
							联系电话：
						</td>
						<td>
							<input type="text" name="empMobile1" />
						</td>
					</tr>
					<tr>
						<td>
							Email：
						</td>
						<td>
							<input type="text" name="email1" />
						</td>
					</tr>
					<tr>
						<td>
							部门
						</td>
						<td>
							<input type="text" name="department1" />
						</td>
					</tr>
					<tr>
						<td>
							职位
						</td>
						<td>
							<input type="text" name="position1" />
						</td>
					</tr>
				</table>

		</div>
	</body>
</html>
