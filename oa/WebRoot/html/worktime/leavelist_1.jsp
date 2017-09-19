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
<title>出差申请查询</title>
<link href="/oa/css/style.css" rel="stylesheet" type="text/css">
<script language="javascript" src="/oa/js/clientSideApp.js"></script>
<script language="JavaScript" type="text/javascript" src="/oa/js/win_center.js"></script>


<link type="text/css" rel="stylesheet" href="JQueryeasyui/themes/default/easyui.css"/>
<link type="text/css" rel="stylesheet" href="JQueryeasyui/themes/icon.css"/>
<script type="text/javascript" src="JQueryeasyui/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="JQueryeasyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="JQueryeasyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript"> 
/*function page_tz(currpage)
{var url="/oa/ViewTravelAppServlet?pageNo="+currpage+"&&select2="${requestScope.Sstate};
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
}*/
$(function () { 
	
	
	 var mydialog=null;
	 
$(".detailA").click(function(){
   var hidFormNo=$(this).attr("name");
  // alert(hidFormNo);
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
   height:500, 
   modal: true, 
   href: "/oa/TravelAppDetailedServlet?formNo="+hidFormNo, 
   buttons: [ { 
       text: '返回', 
       iconCls: 'icon-ok', 
       handler: function () { 
   	  mydialog.dialog('close'); 
       } 
   }] 
}); 
  }else{
      mydialog.dialog({href:"/oa/TravelAppDetailedServlet?formNo="+hidFormNo});
	   mydialog.dialog('refresh');
	   
      }   
});

$("a[name='delCa']").click(function(){
	var ret=window.confirm("确认要删除吗？");
	if(ret==1){
    var hidappIdD=$(this).prev().val();
  
    $.ajax( {
		type : 'POST',
		url : '/oa/DelAppServlet',
		data :{'hidappIdD':hidappIdD},
		success : function() {
			//$("a[name='delCa']").parent().parent().remove();
			
			window.location.href = "/oa/ViewTravelAppServlet";
		},
		dataType : 'json'

	});
	}
})
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
        <td valign="bottom" class="title">出差申请查询</td>
      </tr>
    </table></td>
  </tr>
</table>
<br>
<form action="/oa/ViewTravelAppServlet" method="post"> 
      
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td class="td_page">姓名：${sessionScope.userInfo.empName}
    	
      <select name="select2">
           	  <option value ="1">草稿</option>
              <option value ="2">待审核</option>
              <option value ="3">打回</option>
              <option value ="4">审核通过</option>
      </select>
	  <input name="Submit1" type="submit" class="buttonface" value="查询  ">
    </td>
  </tr>
</table>
</form>
<br>
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td nowrap class="td_top">编号</td>
    <td nowrap class="td_top">申请日期</td>
    <td nowrap class="td_top">出差事由</td>
   <td nowrap class="td_top">状态</td>
	<td nowrap class="td_top">明细</td>
	<td  nowrap class="td_top">	我的操作</td>

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
    <td class="td_01"><%--
    <a href="#" onClick="javascript:openwindow('/oa/TravelAppDetailedServlet?formNo=${l.formNo}','',500,500)">&nbsp;&nbsp;>>></a>
      --%><a href="#" class="detailA" name="${l.formNo}">&nbsp;&nbsp;>>></a>
    </td> 
    
      <c:if test="${1==l.state||l.state==3}">
      
     <td class="td_01">
      <input type="hidden" value="${l.appId}"  name="hidappIdD"/>
     <a href="#" name="delCa">删除</a>
     </td>
     </c:if>
      <c:if test="${1!=report.state&&l.state!=3}">
     <td class="td_01"></td>
     </c:if>
    
  </tr>
  </c:forEach>

 <tr> 
<td class="td_01">&nbsp;</td>
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
     <td class="td_02">&nbsp;</td>
  </tr>
  <tr> 
 <td class="td_02">&nbsp;</td>
    <td class="td_02">&nbsp;</td>
    <td class="td_02">&nbsp;</td>
    <td class="td_02">&nbsp;</td>
    <td class="td_02">&nbsp;</td>
    <td class="td_02">&nbsp;</td>
  </tr>


</table>

<table width="95%"  border="0" cellpadding="0" cellspacing="0" class="table02" align="center">
 <tr> 
    <td nowrap width="95%" class="td_top">默认草稿箱</td>
  </tr>

                            <td align="center" bgcolor="#F6F6F6"><strong>共分${requestScope.pageCount }页&nbsp;
                              
                              &nbsp;
                               <c:if test="${1==requestScope.pageNo}">
                        
							上一页
							</c:if>
							
							
							<c:if test="${1!=requestScope.pageNo}">
							<a href="/oa/ViewTravelAppServlet?pageNo=${requestScope.pageNo-1 }&&select2=${requestScope.Sstate}">上一页&nbsp;&nbsp;</a>
							</c:if>
							
							
                            <c:if test="${requestScope.pageNo==requestScope.pageCount||requestScope.pageCount==0}">
							下一页
							</c:if>
							
							
							
							<c:if test="${requestScope.pageNo != requestScope.pageCount&&requestScope.pageCount!=0}">
							<a href="/oa/ViewTravelAppServlet?pageNo=${requestScope.pageNo+1 }&&select2=${requestScope.Sstate}">下一页&nbsp;&nbsp;</a>
							</c:if>
            </td>
                          </tr>
                        </table>
                     </div>
                       </div>
<div id="dlg" style="display: none"> 

</div> 

</body>
</html>
