<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>我已审批出差申请查询</title>
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
{var url="/oa/ViewApproveAppServlet?pageNo="+currpage;
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
            draggable:true,
            width: 600, 
            height: 500, 
            modal: true, 
            href: "/oa/ViewApprovedAppDetailServlet?formNo="+hidFormNo, 
            buttons: [ { 
                text: '返回', 
                iconCls: 'icon-ok', 
                handler: function () { 
            	  mydialog.dialog('close'); 
                } 
            }] 
        }); 
           }else{
               mydialog.dialog({href:"/oa/ViewApprovedAppDetailServlet?formNo="+hidFormNo });
        	   mydialog.dialog('refresh');
        	   
               }   
        });
    }); 
</script>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="25" align="center" valign="bottom" class="td06"><table width="98%" border="0" cellspacing="3" cellpadding="0">
      <tr>
        <td width="15"><img src="/oa/images/index_32.gif" width="9" height="9"></td>
        <td valign="bottom" class="title">我已审批的出差申请查询</td>
      </tr>
    </table></td>
  </tr>
</table>
<br>
<form action="">


<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td nowrap class="td_top">编号</td>
    <td nowrap class="td_top">申请日期</td>
    <td nowrap class="td_top">出差事由</td>
   <td nowrap class="td_top">状态</td>
	<td nowrap class="td_top">明细</td>

  </tr>
   <c:forEach items="${requestScope.travelAppList}" var="l">
  <tr> 
 
    <td class="td_01">${l.formNo}</td>
    <td class="td_01">${l.leaveTime}</td>
    <td class="td_01">${l.travelReason}</td>
    <td class="td_01"><c:if test="${l.state==1}">草稿</c:if>
                    <c:if test="${l.state==2}">待审核</c:if>
                    <c:if test="${l.state==3}">打回</c:if>
                    <c:if test="${l.state==4}">审核完毕</c:if></td>
    <td class="td_01">
    <%--<a href="#" onClick="javascript:openwindow('/oa/ViewApprovedAppDetailServlet?formNo=${l.formNo}&wsId=${l.wsId}','',500,500)">&nbsp;&nbsp;>>></a>
       --%>
       <a href="#" class="detailA" name="${l.formNo}&wsId=${l.wsId}">&nbsp;&nbsp;>>></a>
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
    <td nowrap width="95%" class="td_top">已审核的出差申请</td>
  </tr>
</table>
<table width="95%"  border="0" cellpadding="0" cellspacing="0" class="table02" align="center">
                          <tr>
                            <td align="center" bgcolor="#F6F6F6"><strong>共分${requestScope.pageCount}页&nbsp;
                              
                              &nbsp;
                               <c:if test="${1==requestScope.pageNo}">
                        
							上一页
							</c:if>
							<c:if test="${1!=requestScope.pageNo}">
							<a href="/oa/ViewApproveAppServlet?pageNo=${requestScope.pageNo-1 }">上一页&nbsp;&nbsp;</a>
							</c:if>
                            <c:if test="${requestScope.pageNo==requestScope.pageCount||requestScope.pageCount==0}">
							下一页
							</c:if>
								<c:if test="${requestScope.pageNo != requestScope.pageCount&&requestScope.pageCount!=0}">
							<a href="/oa/ViewApproveAppServlet?pageNo=${requestScope.pageNo+1 }">下一页&nbsp;&nbsp;</a>
							</c:if>
       </td>
                          </tr>
                        </table>
</form>
<div id="dlg" style="display: none"> 

</div> 
</body>
</html>