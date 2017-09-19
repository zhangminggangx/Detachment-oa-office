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
		<title>报销查询</title>
		<link href="/oa/css/style.css" rel="stylesheet" type="text/css">
		<script language="javascript" src="/oa/js/clientSideApp.js"></script>
		<script language="JavaScript" type="text/javascript"
			src="/oa/js/win_center.js"></script>
		<link type="text/css" rel="stylesheet" href="JQueryeasyui/themes/default/easyui.css"/>
		<link type="text/css" rel="stylesheet"
			href="JQueryeasyui/themes/icon.css" />
		<script type="text/javascript" src="JQueryeasyui/jquery-1.4.4.min.js"></script>
		<script type="text/javascript" src="JQueryeasyui/jquery.easyui.min.js"></script>
		<script type="text/javascript"
			src="JQueryeasyui/locale/easyui-lang-zh_CN.js"></script>

	<script type="text/javascript"> 
    $(function () { 
    	
    	
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
								<img src="/oa/images/index_32.gif" width="9" height="9">
							</td>
							<td valign="bottom">
								<span class="title">报销查询</span>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<br>
		<table width="95%" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<tr>
				<td class="td_page">
					报销人：
					<input name="textfield" type="text" class="input" size="20">
					申请时间： 从
					<input name="PARA_YM_NOW" size="10" type="text" class="input"
						id="PARA_YM_NOW" next="A001014" alt="查询年月|0|d|||" value=""
						onFocus="{obtainFocus(this),this.select()}"
						onKeyPress="gotoNextInput(this)" onBlur="matchInput(this)"
						readonly>
					<input type="button" class="button_select"
						onClick="fPopUpCalendarDlg('PARA_YM_NOW')">
					到
					<input name="PARA_YM_NOW1" size="10" type="text" class="input"
						id="PARA_YM_NOW" next="A001014" alt="查询年月|0|d|||" value=""
						onFocus="{obtainFocus(this),this.select()}"
						onKeyPress="gotoNextInput(this)" onBlur="matchInput(this)"
						readonly>
					<input type="button" class="button_select"
						onClick=
	fPopUpCalendarDlg('PARA_YM_NOW1');
>

					<input name="Submit" type="submit" class="buttonface"
						value="  查询  ">
					<input name="Submit" type="submit" class="buttonface" value="查询全部">
					<!--<a href="#" onClick="javascript:openwindow('../../org/QUERY/index.html','',500,500)"><input name="Submit2" type="submit" class="buttonface02" value="高级查询"></a>-->
				</td>
			</tr>
		</table>
		<br>

		<table width="95%" border="0" align="center" cellpadding="0"
			cellspacing="0" class="table01">
			<tr>

				<td class="td_top">
					编号
				</td>
				<td class="td_top">
					申请人
				</td>
				<td class="td_top">
					报销日期
				</td>
				<td class="td_top">
					报销金额
				</td>
				<td class="td_top">
					我的操作
				</td>
                <td class="td_top">
					详细信息
				</td>
			</tr>
			
			<c:forEach items="${requestScope.wsList}" var="ws">
				<tr>
					<td class="td07">
						${ws.formNo }
						
					</td>
					<td class="td07">
						${ws.dispatch.employee.empName }
					</td>
					<td class="td07">
						${ws.dispatch.createTime }
					</td>
					<td class="td07">
						￥${ws.dispatch.disMoney }
					</td>
					<td class="td07">
						${ws.appResult.result.resName }
					</td>
					<td class="td07">
							<%--<a href="#" onClick= "javascript: openwindow('/oa/ViewMyDisServlet?formNo=${ws.formNo}', '', 500, 500);">&nbsp;&nbsp;&nbsp;>>></a>
					--%>
					 <a href="#" class="detailA" name="${ws.formNo}">&nbsp;&nbsp;>>></a>
					</td>

				</tr>
				</c:forEach>
			

		</table>
		<table width="95%" border="0" cellpadding="0" cellspacing="0"
			class="table02" align="center">
						<tr>
				<td height="30" align="right">
					<img src="/oa/images/1.gif" width="4" height="5" align="absmiddle">
					<a href="/oa/ApprovedDisServlet">首页</a>
					<c:if test="${requestScope.pageNo==1}">
						<img src="/oa/images/2.gif" width="3" height="5" align="absmiddle"> 上一页　 
     </c:if>
					<c:if test="${requestScope.pageNo!=1}">
						<img src="/oa/images/2.gif" width="3" height="5" align="absmiddle">
						<a href="/oa/ApprovedDisServlet?pageNo=${requestScope.pageNo-1}">上一页</a>
					</c:if>
					<c:if test="${requestScope.pageNo==requestScope.pageCount}">
						<img src="/oa/images/2-2.gif" width="3" height="5"
							align="absmiddle"> 下一页　
     </c:if>
					<c:if test="${requestScope.pageNo!=requestScope.pageCount}">
						<img src="/oa/images/2-2.gif" width="3" height="5"
							align="absmiddle">
						<a href="/oa/ApprovedDisServlet?pageNo=${requestScope.pageNo+1}">下一页</a>
					</c:if>

					<img src="/oa/images/3.gif" width="4" height="5" align="absmiddle">
					<a href="/oa/ApprovedDisServlet?pageNo=${ requestScope.pageCount}">末页</a>
					共 ${requestScope.pageCount} 页 ${requestScope.disCount} 条记录
				</td>
			</tr>
		</table>
		<div id="dlg" style="display: none"> </div>
	</body>
</html>
