<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" " http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns=" http://www.w3.org/1999/xhtml">
	<head>

		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>人事管理</title>
		<link rel="stylesheet" type="text/css" href="/oa/jquery.uploadify/uploadify.css" />
		<script type="text/javascript"src="/oa/jquery.uploadify/jquery-1.4.2.min.js"></script>
		<script type="text/javascript" src="/oa/jquery.uploadify/swfobject.js"></script>
		<script type="text/javascript" src="/oa/jquery.uploadify/jquery.uploadify.v2.1.4.min.js"></script>


		<link href="/oa/css/last.css" type="text/css" rel="stylesheet" />
		<link href="/oa/css/style.css" rel="stylesheet" type="text/css" />
		<link type="text/css" rel="stylesheet"href="/oa/JQueryeasyui/themes/default/easyui.css" />
		<link type="text/css" rel="stylesheet"href="/oa/JQueryeasyui/themes/icon.css" />
		<script type="text/javascript"src="/oa/JQueryeasyui/jquery.easyui.min.js"></script>
		<script type="text/javascript"src="/oa/JQueryeasyui/locale/easyui-lang-zh_CN.js"></script>

	<script type="text/javascript">
	function windowOpen(theURL, winName, features, width, hight, scrollbars,
			top, left) {
		var parameter = "top=" + top + ",left=" + left + ",width=" + width
				+ ",height=" + hight;
		if (scrollbars == "no") {
			parameter += ",scrollbars=no";
		} else {
			parameter += ",scrollbars=yes";
		}
		window.open(theURL, winName, parameter);
	}
	
	
	$(function() {
		$("input[name='upload']").click(function(){
             // alert($(this).prev().val());
             $("#uploadPic").attr("action","/oa/html/personnel/uploadPic.jsp?empId="+$(this).prev().val());
             
			});
		$(".del")
				.click(
						function(e) {
							var ret = window.confirm("确认要删除吗？");
							var empNo = $(this).attr("name");
							if (ret == 1) {
								window.location.href = "/oa/DeleteEmployeeServlet?empNo="
										+ empNo;
							}
						});
		$("#add").bind(
						"click",
						function() {

							$("#dd").css("display", "block");
							$("#dd")
									.dialog(
											{
												title : "新建人事",
												width : 300,
												heigh : 800,
												collapsible : true,
												resizable : true,
												 draggable:true,
												buttons : [
														{
															text : '保存',
															iconCls : 'icon-ok',
															handler : function() {
																var empName = $(
																		"input[name='empName']")
																		.val();
																var empMobil = $(
																		"input[name='empMobil']")
																		.val();
																var empEmail = $(
																		"input[name='empEmail']")
																		.val();
																var idCard = $(
																		"input[name='idCard']")
																		.val();
																var empDiploma = $(
																		"input[name='empDiploma']")
																		.val();
																var empBirth = $(
																		"input[name='empBirth']")
																		.val();
																var empExperience = $(
																		"input[name='empExperience']")
																		.val();
																var deptName = $(
																		"select[name='deptName']")
																		.val();
																var company = $(
																		"input[name='company']")
																		.val();
																var position = $(
																		"input[name='position']")
																		.val();
																var data = {
																	'empName' : empName,
																	'empMobil' : empMobil,
																	'empEmail' : empEmail,
																	'idCard' : idCard,
																	'empDiploma' : empDiploma,
																	'empBirth' : empBirth,
																	'empExperience' : empExperience,
																	'deptName' : deptName,
																	'company' : company,
																	'position' : position
																};
																if(empName==""){
																	alert("姓名不能为空");
																}else if(empMobil==""){
																	alert("电话不能为空");
																}else if(empBirth==""){
																	alert("生日不能为空");
																}else{
																$.ajax( {
																			type : 'POST',
																			url : 'AddEmployeeServlet',
																			data : data,
																			success : function() {
																				window.location.href = "/oa/ViewEmployeeListServlet";
																			},
																			dataType : 'json'

																		});
																alert('保存成功');
																$('#dd').dialog('close');
																}
															}
														},
														{
															text : '取消',
															iconCls : 'icon-cancel',
															handler : function() {
																$('#dd').dialog('close');
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
								人事管理
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<br />
		<form enctype="multipart/form-data" action="" method="post" id="uploadPic">
			<table width="95%" border="0" align="center" cellpadding="0"
				cellspacing="0" class="table01">
				<tr>
					<td width="70" class="td_top">
						<lable>
						删除
						</lable>
					</td>
					<td width="70" class="td_top">
						员工编号
					</td>
					<td width="70" class="td_top">
						员工姓名
					</td>
					<td width="70" class="td_top">
						员工部门
					</td>
					<td width="70" class="td_top">
						详细
					</td>
					<td width="70" class="td_top">
						上传图片
					</td>

				</tr>
				<c:if test="${not empty requestScope.empList}">
					<c:forEach items="${requestScope.empList}" var="emp">
						<tr>
							<td class="td07">
								<a href="#" style="color: green;" class="del"
									name="${ emp.empNo}">删除</a>
							</td>
							<td class="td07">
								${emp.empNo}
							</td>
							<td class="td07">
								${emp.empName}
							</td>
							<td class="td07">
								${emp.deptName}
							</td>
							<td class="td07">
								<a href="/oa/ViewEmployeeDetailServlet?empNo=${emp.empNo}">>>></a>
							</td>
							<td class="td07">
								<input type="file" id="doc" name="doc" />
								<input type="hidden" name="empId" value="${emp.empId }"/>
								<input type="submit" value="上传" name="upload"/>
							</td>
					</c:forEach>
				</c:if>
			</table>
		</form>
		<table width="95%" border="0" cellpadding="0" cellspacing="0"
			class="table02" align="right">
			<tr>
				<td height="30">

					<input name="Submit" type="button" class="buttonface"
						value="  添加  " id="add" />
				</td>
				<td align="right">
					<img src="/oa/images/1.gif" width="4" height="5" align="absmiddle" />
					<a href="/oa/ViewEmployeeListServlet?pageNo=1">首页</a>
					<c:if test="${requestScope.pageNo==1}">
						<img src="/oa/images/2.gif" width="3" height="5" align="absmiddle" /> 上一页　 
     				</c:if>
					<c:if test="${requestScope.pageNo!=1}">
						<img src="/oa/images/2.gif" width="3" height="5" align="absmiddle" />
						<a
							href="/oa/ViewEmployeeListServlet?pageNo=${requestScope.pageNo-1}">上一页</a>
					</c:if>
					<c:if test="${requestScope.pageNo==requestScope.pageCount}">
						<img src="/oa/images/2-2.gif" width="3" height="5"
							align="absmiddle" /> 下一页　
    				 </c:if>
					<c:if test="${requestScope.pageNo!=requestScope.pageCount}">
						<img src="/oa/images/2-2.gif" width="3" height="5"
							align="absmiddle" />
						<a
							href="/oa/ViewEmployeeListServlet?pageNo=${requestScope.pageNo+1}">下一页</a>
					</c:if>

					<img src="/oa/images/3.gif" width="4" height="5" align="absmiddle" />
					<a
						href="/oa/ViewEmployeeListServlet?pageNo=${ requestScope.pageCount}">末页</a>
					共 ${requestScope.pageCount} 页 ${requestScope.listCount} 条记录
				</td>
			</tr>
		</table>
		<div id="dd" icon="icon-save" style="display: none">
			<div style="float: left">
				<table id="lst">
					<tr>
						<td class=td_form01>
							员工姓名:
						</td>
						<td class="td_form02">
							<input type="text" name="empName" class="easyui-validatebox" required="true" missingMessage="必填" />
							<div id="empNameError"></div>
						</td>
					</tr>
					<tr>
						<td class=td_form01>
							员工电话:
						</td>
						<td class="td_form02">
							<input type="text" name="empMobil" class="easyui-validatebox" required="true" missingMessage="必填"/>
						</td>
					</tr>
					<tr>
						<td class=td_form01> 
							Email:
						</td>
						<td class="td_form02">
							<input type="text" name="empEmail" class="easyui-validatebox" required="true" missingMessage="必填" />
						</td>
					</tr>
					<tr>
						<td class=td_form01>
							身份证:
						</td>
						<td class="td_form02">
							<input type="text" name="idCard" class="easyui-validatebox" required="true" missingMessage="必填"/>
						</td>
					</tr>
					<tr>
						<td class=td_form01>
							员工学历:
						</td>
						<td class="td_form02">
							<input type="text" name="empDiploma" />
						</td>
					</tr>
					<tr>
						<td class=td_form01>
							员工生日:
						</td>
						<td class="td_form02">
							<input type="text" name="empBirth" />
						</td>
					</tr>
					<tr>
						<td class=td_form01>
							工作经历:
						</td>
						<td class="td_form02">
							<input type="text" name="empExperience" />
						</td>
					</tr>
					<tr>
						<td class=td_form01> 
							所属部门：
						</td>
						<td >
							<select name="deptName">
								<c:if test="${not empty requestScope.deptList}">
									<c:forEach items="${requestScope.deptList}" var="dept">
										<option value="${dept.deptName}">
											${dept.deptName}
										</option>
									</c:forEach>
								</c:if>
							</select>
						</td>
					</tr>
					<tr>
						<td class=td_form01>
							所属公司：
						</td>
						<td class="td_form02">
							<input type="text" name="company" />
						</td>
					</tr>
					<tr>
						<td class=td_form01>
							职&nbsp;&nbsp;&nbsp;&nbsp;位：
						</td>
						<td class="td_form02">
							<input type="text" name="position" class="easyui-validatebox" required="true" missingMessage="必填"/>
						</td>
					</tr>
					
				</table>
			</div>
			
			
			
		</div>
	</body>
</html>
