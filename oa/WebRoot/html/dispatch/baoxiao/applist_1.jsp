<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">


<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<title>查看结果</title>
		<script language="javascript" src="/oa/js/clientSideApp.js"></script>
		<script language="JavaScript" type="text/javascript" src="/oa/js/win_center.js"></script>
		<script type="text/javascript" src="/oa/js/jquery-1.4.2.js"></script>
		
		<link type="text/css" rel="stylesheet" href="JQueryeasyui/themes/default/easyui.css"/>
		<link type="text/css" rel="stylesheet"
			href="JQueryeasyui/themes/icon.css" />
		<script type="text/javascript" src="JQueryeasyui/jquery-1.4.4.min.js"></script>
		<script type="text/javascript" src="JQueryeasyui/jquery.easyui.min.js"></script>
		<script type="text/javascript"
			src="JQueryeasyui/locale/easyui-lang-zh_CN.js"></script>
		<script language=JavaScript type=text/JavaScript>
	$(function(){
		$(".del").click(function(e) {
			var ret=window.confirm("确认要删除吗？");
			var formNo = $(this).attr("name");
			if(ret==1){
				window.location.href="/oa/DeleteDispatchServlet?formNo="+formNo; 
			}
			
		});


		$(".sub").click(function(e) {
			var ret=window.confirm("确认要提交吗？");
			var formNo = $(this).attr("name");
			if(ret==1){
				window.location.href="/oa/SubmitDispatchServlet?formNo="+formNo; 
			}
			
		});

   	 var mydialog=null;
	 
     $(".detailA").click(function(){
         var hidFormNo=$(this).attr("name");
      //   alert(hidFormNo);
        if(mydialog==null){
         
     	$("#dlg").css("display", "block");	
     	 //   alert("!!!!!!");
         mydialog=$("#dlg").dialog({ 
         title: '对话框', 
         iconCls:"icon-edit", 
         collapsible: true, 
         minimizable: true, 
         maximizable: true, 
         resizable: true, 
         width: 600, 
         height: 400, 
         modal: true, 
         href: "/oa/ViewMyDisServlet?formNo="+hidFormNo, 
         buttons: [ { 
             text: '返回', 
             iconCls: 'icon-ok', 
             handler: function () { 
         	  mydialog.dialog('close'); 
             } 
         }] 
     }); 
        }else{
            mydialog.dialog({href:"/oa/ViewMyDisServlet?formNo="+hidFormNo });
     	   mydialog.dialog('refresh');
     	   
            }   
     });




	 var mydialog2=null;
	 
     $(".detailA2").click(function(){
         var hidFormNo=$(this).attr("name");
      //   alert(hidFormNo);
        if(mydialog2==null){
         
     	$("#dlg2").css("display", "block");	
     	 //   alert("!!!!!!");
         mydialog2=$("#dlg2").dialog({ 
         title: '对话框', 
         iconCls:"icon-edit", 
         collapsible: true, 
         minimizable: true, 
         maximizable: true, 
         resizable: true, 
         width: 600, 
         height: 400, 
         modal: true, 
         href: "/oa/GetModifyDispatchServlet?formNo="+hidFormNo, 
         buttons: [{ 
             text: '取消', 
             iconCls: 'icon-ok', 
             handler: function () { 
         	  mydialog2.dialog('close'); 
             } 
         }] 
     }); 
        }else{
            mydialog2.dialog({href:"/oa/GetModifyDispatchServlet?formNo="+hidFormNo });
     	   mydialog2.dialog('refresh');
     	   
            }   
     });

     

     

		
	});
		
	
</script>
		<link href="/oa/css/style.css" rel="stylesheet" type="text/css">
	</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="25" align="center" valign="bottom" class="td06">
					<table width="98%" border="0" cellspacing="3" cellpadding="0">
						<tr>
							<td width="15">
								<img src="/oa/images/index_32.gif" width="9" height="9">
							</td>
							<td valign="bottom">
								<span class="title">我的报销</span>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<br>
		<form action="/oa/SerachDisServlet?pageNo=1" method="post">
		<table width="95%" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<tr>
				<td class="td_page">
					状态：
					<select name="sel" id="sel">
					<option value="0">
							选择表单状态
						</option>
						<option value="1">
							新创建
						</option>
						<option value="2">
							待审核
						</option>
						<option value="3">
							打回
						</option>
						<option value="4">
							审核完毕
						</option>
					</select>
					<input name="Submit" type="submit" class="buttonface" value="查询 " >
				</td>
			</tr>
		</table>
		</form>
	
		<table width="95%" border="0" align="center" cellpadding="0"cellspacing="0" class="table01">
			<tr>

				<td class="td_top">
					编号
				</td>
				<td class="td_top">
					报销日期
				</td>
				<td class="td_top">
					报销金额
				</td>
				<td class="td_top">
					状态
				</td>
				<td class="td_top">
					详细信息
				</td>
			</tr>
			<c:if test="${not empty requestScope.disList}">
				<c:forEach items="${requestScope.disList}" var="dis">
					<tr>
						<td class="td07">
							${ dis.formNo}
						</td>
						<td class="td07">
							${dis.createTime}
						</td>
						<td class="td07">
							￥${dis.disMoney}
						</td>
						<c:if test="${dis.state==1}">
							<td class="td07">
								新创建
								&nbsp;&nbsp;&nbsp;
								<%--<a href="#" style="color:green;" onClick= "javascript: openwindow('/oa/GetModifyDispatchServlet?formNo=${dis.formNo}', '', 500, 500);">&nbsp;&nbsp;&nbsp;修改</a>
								--%>
								<a href="#" class="detailA2" name="${dis.formNo}">&nbsp;&nbsp;修改</a>
								&nbsp;&nbsp;&nbsp;<a href="#" style="color:red;" class="sub" name="${ dis.formNo }">提交</a>
								&nbsp;&nbsp;&nbsp;
								<a href="#" style="color:green;" class="del" name="${ dis.formNo }">删除</a>
							</td>
						</c:if>
						<c:if test="${dis.state==2}">
							<td class="td07">
								待审核
							</td>
						</c:if>
						<c:if test="${dis.state==3}">
							<td class="td07">
								打&nbsp;&nbsp;&nbsp;回&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<a href="#" class="detailA2" name="${dis.formNo}">&nbsp;&nbsp;修改</a>
							    &nbsp;&nbsp;&nbsp;
							    <a href="#" style="color:red;"   class="sub" name="${ dis.formNo }">提交</a>
							   
							</td>
						</c:if>
						<c:if test="${dis.state==4}">
							<td class="td07">
								审核完毕
							</td>
						</c:if>
						<td class="td07">
							<%--<a href="#" onClick= "javascript: openwindow('/oa/ViewMyDisServlet?formNo=${dis.formNo}', '', 500, 500);">&nbsp;&nbsp;&nbsp;>>></a>
							--%>
							<a href="#" class="detailA" name="${dis.formNo}">&nbsp;&nbsp;>>></a>
						</td>
					</tr>
				</c:forEach>
			</c:if>

		</table>
		<table width="95%" border="0" cellpadding="0" cellspacing="0"
			class="table02" align="center">
			<tr>
				<td height="30" align="right">
					<img src="/oa/images/1.gif" width="4" height="5" align="absmiddle">
					<a href="/oa/SerachDisServlet?pageNo=1">首页</a>
					<c:if test="${requestScope.pageNo==1}">
						<img src="/oa/images/2.gif" width="3" height="5" align="absmiddle"> 上一页　 
     </c:if>
					<c:if test="${requestScope.pageNo!=1}">
						<img src="/oa/images/2.gif" width="3" height="5" align="absmiddle">
						<a href="/oa/SerachDisServlet?pageNo=${requestScope.pageNo-1}">上一页</a>
					</c:if>
					<c:if test="${requestScope.pageNo==requestScope.pageCount}">
						<img src="/oa/images/2-2.gif" width="3" height="5"
							align="absmiddle"> 下一页　
     </c:if>
					<c:if test="${requestScope.pageNo!=requestScope.pageCount}">
						<img src="/oa/images/2-2.gif" width="3" height="5"
							align="absmiddle">
						<a href="/oa/SerachDisServlet?pageNo=${requestScope.pageNo+1}">下一页</a>
					</c:if>

					<img src="/oa/images/3.gif" width="4" height="5" align="absmiddle">
					<a href="/oa/SerachDisServlet?pageNo=${ requestScope.pageCount}">末页</a>
					共 ${requestScope.pageCount} 页 ${requestScope.disCount} 条记录
				</td>
			</tr>
		</table>
		<div id="dlg" style="display: none"> </div> 
		<div id="dlg2" style="display: none"> </div> 
	</body>
</html>
