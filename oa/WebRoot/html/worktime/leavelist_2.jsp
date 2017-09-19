<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" " http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns=" http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>出差报告查询</title>
<link href="/oa/css/style.css" rel="stylesheet" type="text/css"/>
<script language="javascript" src="/oa/js/clientSideApp.js"></script>
<script language="JavaScript" type="text/javascript" src="/oa/js/win_center.js"></script>

<link type="text/css" rel="stylesheet" href="JQueryeasyui/themes/default/easyui.css"/>
<link type="text/css" rel="stylesheet" href="JQueryeasyui/themes/icon.css"/>
<script type="text/javascript" src="JQueryeasyui/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="JQueryeasyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="JQueryeasyui/locale/easyui-lang-zh_CN.js"></script>

<script type="text/javascript"> 
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
            height: 500, 
            modal: true, 
            href: "/oa/TravelReportDetailServlet?formNo="+hidFormNo, 
            buttons: [ { 
                text: '返回', 
                iconCls: 'icon-ok', 
                handler: function () { 
            	  mydialog.dialog('close'); 
                } 
            }] 
        }); 
           }else{
               mydialog.dialog({href:"/oa/TravelReportDetailServlet?formNo="+hidFormNo });
        	   mydialog.dialog('refresh');
        	   
               }   
        });
    
        $("a[name='delCa']").click(function(){
            var ret=window.confirm("确认要删除吗？");
        	if(ret==1){
                var hidrepIdD=$(this).prev().val();
              
                $.ajax( {
					type : 'POST',
					url : '/oa/DelReportServlet',
					data :{'hidrepIdD':hidrepIdD},
					success : function() {
						//$("a[name='delCa']").parent().parent().remove();
						window.location.href = "/oa/ViewTravelReportServlet";
					},
					dataType : 'json'

				});
        	}
            })
            
    }); 
</script>
</head>

<body>
 <div>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="25" align="center" valign="bottom" class="td06"><table width="98%" border="0" cellspacing="3" cellpadding="0">
      <tr>
        <td width="15"><img src="/oa/images/index_32.gif" width="9" height="9"/></td>
        <td valign="bottom" class="title" align="left">出差报告查询</td>
      </tr>
    </table></td>
  </tr>
</table>
<br>
<form action="/oa/ViewTravelReportServlet" method="post"> 
<table width="95%"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td class="td_page">
      报告状态：
      <select name="curState" >
           	  <option value="1">草稿</option>
              <option value="2">待审核</option>
              <option value="3">打回</option>
              <option value="4">审核通过</option>
      </select>
        <input name="Submit1" type="submit" class="buttonface" value="查询  "/>
    </td>

  </tr>
</table>
</form>
<br/>
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td nowrap class="td_top">编号</td>
    <td nowrap class="td_top">实际用时</td>
    <td nowrap class="td_top">状态</td>
    <td nowrap class="td_top">申请金额</td>
    <td nowrap class="td_top">明细</td>
   <td  nowrap class="td_top">
					我的操作
				</td>
	
  </tr>
   <c:forEach items="${requestScope.travelReportList}" var="report">
  <tr> 
 
    <td class="td_01">${report.formNo}</td>
    <td class="td_01">${report.realTime}</td>
    <td class="td_01"><c:if test="${1==report.state}">草稿</c:if>
                    <c:if test="${2==report.state}">待审核</c:if>
                    <c:if test="${3==report.state}">打回</c:if>
                    <c:if test="${4==report.state}">审核完毕</c:if>
</td>
  <td class="td_01">${report.disMoney}</td>
  
     <td class="td_01">
     <input type="hidden" value="${report.formNo}"  name="hidFormNo"/>
     <%--
     <a href="#" onClick="javascript:openwindow('/oa/TravelReportDetailServlet?formNo=${report.formNo}','',500,500)">&nbsp;&nbsp;>>></a>
     --%>
     <a href="#" class="detailA" name="${report.formNo}">&nbsp;&nbsp;>>></a>
     </td>
      
       <c:if test="${1==report.state||report.state==3}">
      
     <td class="td_01">
      <input type="hidden" value="${report.reportId}"  name="hidrepIdD"/>
     <a href="#" name="delCa">删除</a>
     </td>
     </c:if>
     <c:if test="${1!=report.state&&report.state!=3}">
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
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td nowrap width="95%" class="td_top">默认草稿箱</td>
  </tr>
</table>
<%--<table width="95%"  border="0" cellpadding="0" cellspacing="0" class="table02" align="center">
  <tr>
    <td height="30" align="right"><img src="/oa/images/1.gif" width="4" height="5" align="absmiddle"> 首页　 <img src="/oa/images/2.gif" width="3" height="5" align="absmiddle"> 上一页　 <img src="/oa/images/2-2.gif" width="3" height="5" align="absmiddle"> 下一页　 <img src="/oa/images/3.gif" width="4" height="5" align="absmiddle"> 末页　　共 1 页 1 条记录</td>
  </tr>
</table>
--%><table width="95%"  border="0" cellpadding="0" cellspacing="0" class="table02" align="center">
                          <tr>
                            <td align="center" bgcolor="#F6F6F6"><strong>共分${requestScope.pageCount }页&nbsp;
                              
                              &nbsp;
                               <c:if test="${1==requestScope.pageNo}">
							上一页
							</c:if>
							<c:if test="${1!=requestScope.pageNo}">
							<a href="/oa/ViewTravelReportServlet?pageNo=${requestScope.pageNo-1 }&&curState=${requestScope.Sstate}">上一页&nbsp;&nbsp;</a>
							</c:if>
                          <c:if test="${requestScope.pageNo==requestScope.pageCount||requestScope.pageCount==0}">
							下一页
							</c:if>
								<c:if test="${requestScope.pageNo != requestScope.pageCount&&requestScope.pageCount!=0}">
							<a href="/oa/ViewTravelReportServlet?pageNo=${requestScope.pageNo+1 }&&curState=${requestScope.Sstate}">下一页&nbsp;&nbsp;</a>
							</c:if>
        </td>
                          </tr>
                        </table>
                        
                       </div>
<div id="dlg" style="display: none"> 

</div> 

</body>
</html>

