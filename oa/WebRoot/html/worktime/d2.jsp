<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>待我审核的出差报告单</title>
<link href="/oa/css/style.css" rel="stylesheet" type="text/css">
<script language="javascript" src="/oa/js/clientSideApp.js"></script>
<script language="JavaScript" type="text/javascript" src="/oa/js/win_center.js"></script>


<link type="text/css" rel="stylesheet" href="JQueryeasyui/themes/default/easyui.css"/>
<link type="text/css" rel="stylesheet" href="JQueryeasyui/themes/icon.css"/>
<script type="text/javascript" src="JQueryeasyui/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="JQueryeasyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="JQueryeasyui/locale/easyui-lang-zh_CN.js"></script>

<%--<SCRIPT language=JavaScript type=text/JavaScript>
function page_tz(currpage)
{var url="/oa/ViewUnApproveReportServlet?pageNo="+currpage;
window.location.href=url;
}
function windowOpen(theURL,winName,features,width,hight,scrollbars,top,left) 
{
  var parameter="top="+top+",left="+left+",width="+width+",height="+hight;
  if(scrollbars=="no")
 {parameter+=",scrollbars=no";}
  else
 {parameter+=",scrollbars=yes";}
  window.open(theURL,winName,parameter);
}
</SCRIPT>
--%>

<script type="text/javascript"> 
    $(function () { 
    	
    	
        	 var mydialog=null;
        	 
        $(".detailA").click(function(){
            var hidFormNo=$(this).attr("name");
          //  alert(hidFormNo);
           if(mydialog==null){
            
        	$("#dlg").css("display", "block");	
        	 //   alert("!!!!!!");
            mydialog=$("#dlg").dialog({ 
            title: '对话框', 
            iconCls:"icon-edit", 
            collapsible: true, 
            minimizable: true, 
            maximizable: true, 
            draggable:true,
            resizable: true, 
            width: 600, 
            height: 500, 
            modal: true, 
            href: "/oa/ViewUnApproveReportDetailServlet?formNo="+hidFormNo, 
            buttons: [ { 
                text: '返回', 
                iconCls: 'icon-ok', 
                handler: function () { 
            	  mydialog.dialog('close'); 
                } 
            }] 
        }); 
           }else{
               mydialog.dialog({href:"/oa/ViewUnApproveReportDetailServlet?formNo="+hidFormNo });
        	   mydialog.dialog('refresh');
        	   
               }   
        });
    }); 
</script>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<div>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="25" align="center" valign="bottom" class="td06"><table width="98%" border="0" cellspacing="3" cellpadding="0">
      <tr>
        <td width="15"><img src="/oa/images/index_32.gif" width="9" height="9"></td>
        <td valign="bottom" class="title">待审核的报告单</td>
      </tr>
    </table></td>
  </tr>
</table>

<br>
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td nowrap class="td_top">编号</td>
    <td nowrap class="td_top">实际用时</td>
    <td nowrap class="td_top">审核状态</td>
     <td nowrap class="td_top">申请金额</td>
     <td nowrap class="td_top">明细</td>
	
  </tr>
  <%--<tr> 
    <td class="td_01">HD4534745</td>
    <td class="td_01">2009-9-31</td>
    <td class="td_01">见客户</td>
    <td class="td_01">上海</td>
     <td class="td_01"><a href="#" onClick="javascript:openwindow('daishenhe2.jsp','',500,500)">&nbsp;&nbsp;>>></a></td>
  </tr>
  --%><c:forEach items="${requestScope.travelReportList}" var="report">
  <tr> 
 
    <td class="td_01">${report.formNo}</td>
    <td class="td_01">${report.realTime}</td>
    <td class="td_01"><c:if test="${1==report.state}">草稿</c:if>
                    <c:if test="${2==report.state}">待审核</c:if>
                    <c:if test="${3==report.state}">打回</c:if>
                    <c:if test="${4==report.state}">审核完毕</c:if>
</td>
 <td class="td_01">${report.disMoney}</td>
     <td class="td_01"><%--
     <a href="#" onClick="javascript:openwindow('/oa/ViewUnApproveReportDetailServlet?formNo=${report.formNo}&wsId=${report.wsId}','',500,500)">&nbsp;&nbsp;>>></a>
      --%>
      <a href="#" class="detailA" name="${report.formNo}&wsId=${report.wsId}">&nbsp;&nbsp;>>></a>
     </td>
  </tr>
  </c:forEach>
  
  
  <tr> 
<td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
   
  </tr>
  <tr>
 <td class="td_02">&nbsp;</td>
    <td class="td_02">&nbsp;</td>
    <td class="td_02">&nbsp;</td>
    <td class="td_02">&nbsp;</td>
    <td class="td_02">&nbsp;</td>
    
  </tr>
  <tr> 
 <td class="td_02">&nbsp;</td>
    <td class="td_02">&nbsp;</td>
    <td class="td_02">&nbsp;</td>
    <td class="td_02">&nbsp;</td>
    <td class="td_02">&nbsp;</td>
   
  </tr>
</table>
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td nowrap width="95%" class="td_top">待审核的报告单</td>
  </tr>
</table>
<table width="95%"  border="0" cellpadding="0" cellspacing="0" class="table02" align="center">
                          <tr>
                            <td align="center" bgcolor="#F6F6F6"><strong>共分${requestScope.pageCount }页&nbsp;
                              
                              &nbsp;
                               <c:if test="${1==requestScope.pageNo}">
							上一页
							</c:if>
							<c:if test="${1!=requestScope.pageNo}">
							<a href="/oa/ViewUnApproveReportServlet?pageNo=${requestScope.pageNo-1 }">上一页&nbsp;&nbsp;</a>
							</c:if>
                            <c:if test="${requestScope.pageNo==requestScope.pageCount}">
							下一页
							</c:if>
							<c:if test="${requestScope.pageNo != requestScope.pageCount}">
							<a href="/oa/ViewUnApproveReportServlet?pageNo=${requestScope.pageNo+1 }">下一页&nbsp;&nbsp;</a>
							</c:if>
                              
          </td>
                          </tr>
                        </table>
                        </div>
                        <div id="dlg" style="display: none"> 

</div> 
                        
</body>
</html>