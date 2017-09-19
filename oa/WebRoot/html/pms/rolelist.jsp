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
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<title>角色管理</title>
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
		<script language="javascript">
$(function(){
	//删除
	$("#delRole").click(function(){
		var roleIdStrs = "";
		$("input[name='checkbox']").each(function() {
			var c = $(this).attr("checked");
			var roleId = $(this).next().val();

			if (c) {
				roleIdStrs += roleId+";";
			}
		});
	 	if(roleIdStrs!=""){
	 		var ret = window.confirm("确认要删除吗？");
			if (ret == 1) {
			$.ajax({
                type:'POST',
                data:{'roleIdStrs':roleIdStrs},
                url:'/oa/DeleteRoleServlet',
                success:function(){ 
                	$("input[name='checkbox']").each(function(){
                                 if($(this).attr("checked")=='checked'){
                                	  $(this).parent().parent().remove();
                                     }
                    	})
                    },
                dataType:'json'
         
				});
			}}else{

               $.messager.alert("提示","未选择删除项","info",function(){});

			}


	 	
		
		});


	




	
	$("#addRole").bind("click",function() {
       //  alert("ppp");
        $("#dd").css("display","block");
        $("#dd").dialog({
        	title : "新建角色",
        	width : 600,
			heigh : 800,
			collapsible : true,
			resizable : true,
			buttons : [
						{
							text : '保存',
							iconCls : 'icon-ok',
							handler : function() {
							var roleName=$("#roleName").val();
							var roleDesc=$("#roleDesc").val();
							//alert(roleName+"  "+roleDesc);
							var data={"roleName":roleName,"roleDesc":roleDesc};
								$.ajax( {
											type : 'POST',
											url : 'AddRoleServlet',
											data : data,
											success : function() {
												window.location.href = "/oa/ViewRolesServlet";

												
											},
											dataType : 'json'

										});
								alert('保存成功');
								$('#dd').dialog('close');
							}
						}]
            })
					
});

	//全选全不选
	$("#checkAll").click(function(){
		var ret=$("#checkAll").attr("value");
		//alert(ret);
		if(ret=="1")
		{
            $(":checkbox").attr("checked",true);
		$("#checkAll").attr("value","2");}
		else{
			  $(":checkbox").attr("checked",false);
		$("#checkAll").attr("value","1");}
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
									<img src="/oa/images/index_32.gif" width="9" height="9" />
								</td>
								<td valign="bottom" class="title"  align="left">
									角色管理
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			
	
			<br />
			<table width="95%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td align="right" class="td_page">
						<input id="addRole" type="button" class="buttonface02"
							value="  新建  " />
						<input id="delRole" type="submit" class="buttonface02"
							value="  删除  " />
					</td>
				</tr>
			</table>
			<form name="form1" method="post" action="">
				<table width="95%" border="0" cellspacing="2" cellpadding="0">
					<tr>
						<td class="td_title">
							当前用户所建角色列表
						</td>
					</tr>
				</table>
				<table width="95%" border="0" align="center" cellpadding="0"
					cellspacing="0" class="table01">
					<tr>
						<td align="center" class="td_top">
							<input type="checkbox" id="checkAll"  value="1" />
						</td>
						<td class="td_top">
							角色名称
						</td>
						<td class="td_top">
							可进行的操作
						</td>
					</tr>
					<c:if test="${ not empty requestScope.roles}">
						<c:forEach items="${requestScope.roles}" var="role">
							<tr>

								<td height="19" align="center" class="td_01">
									<input type="checkbox" name="checkbox" value="checkbox" />
									<input type="hidden" name="roleId" value="${role.roleId}" />
								</td>
								<td class="td_01">
									<a href="/oa/html/pms/roleinfo.jsp?roleId=${role.roleId}">${role.roleName }</a>
								</td>
								<td class="td_01">
								${role.roleDesc}
								</td>
							</tr>
						</c:forEach>
					</c:if>
				</table>
			</form>
			<div id="dd" style="display: none">
				<table width="95%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td width="90" align="center" class="td_form01">
							角色名称
						</td>
						<td colspan="3" class="td_form02">
							<input name="textfield" type="text" class="input" name="roleName"
								id="roleName" />
						</td>
					</tr>
					<tr>
						<td align="center" class="td_form01">
							角色描述
						</td>
						<td colspan="3" class="td_form02">
							<textarea name="textarea" cols="60" rows="5" name="roleDesc"
								id="roleDesc"></textarea>
						</td>
					</tr>
				</table>
			</div>
		</center>
	</body>
</html>
