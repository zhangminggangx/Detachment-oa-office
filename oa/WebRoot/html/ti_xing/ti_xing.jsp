<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
 <head>
 <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
 <title>接待室界面</title>
 <link href="../../css/style.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style2 {
	color: #009900;
	font-weight: bold;
}
.style3 {
	color: #FF0000;
	font-weight: bold;
}
-->
</style>
 </head>

 <body  leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
 <center>
   <table width="100%" border="0" cellspacing="0" cellpadding="0">
     <tr>
       <td height="25" align="center" valign="bottom" class="td06"><table width="98%" border="0" cellspacing="3" cellpadding="0">
           <tr>
             <td width="15"><img src="../../images/index_32.gif" width="9" height="9"></td>
             <td valign="bottom" class="title">提醒信息</td>
           </tr>
       </table></td>
     </tr>
   </table>
   <table width="760"  border="0" cellspacing="0" cellpadding="0">
   <tr>
     <td height="1" class="td01"><img src="/images/spacer.gif" width="1" height="1"></td>
   </tr>
 </table>
   <br>
   <table width="95%"  border="0" cellpadding="5" cellspacing="0" class="table01">
   <tr>
     <td class="td_top" width="55" align="center">序号</td>
     <td width="330" class="td_top">手续名称</td>
     <td class="td_top">&nbsp;详细信息</td>
     </tr>
      <tr>
         <td align="center" class="td07">1</td>
         <td class="td07">  刘岳 提交新闻申报以通过时间 2005-10-15</a></td>
		 <td class="td_01"><a href="xiang_xi_xinxi.htm" target="_blank" onClick="javascript:openwindow('moremessage.htm','',400,500)">查看</a></td>
 
         <td class="td07">&nbsp;</td>
      </tr>
      <tr>
        <td align="center" class="td07">2</td>
        <td class="td07">  张三 提交新闻申报未通过时间 2005-09-30</a></td>
<td class="td_01"><a href="xiang_xi_xinxi.htm" target="_blank" onClick="javascript:openwindow('moremessage.htm','',400,500)">查看</a></td>
 
      </tr>
      <tr>
        <td align="center" class="td07">3</td>
        <td class="td07">张三 提交请假申请退回时间 2005-09-30</a></td>
   <td class="td_01"><a href="xiang_xi_xinxi.htm" target="_blank" onClick="javascript:openwindow('moremessage.htm','',400,500)">查看</a></td>
 
      </tr>
      <tr>
        <td align="center" class="td07">4</td>
        <td class="td07">张三 提交撤消请假通过时间 2005-09-30</a></td>
  <td class="td_01"><a href="xiang_xi_xinxi.htm" target="_blank" onClick="javascript:openwindow('moremessage.htm','',400,500)">查看</a></td>
 
      </tr>
      <tr>
        <td align="center" class="td07">5</td>
        <td class="td07">张三 提交申报成果通过时间 2005-09-30</a></td>
    <td class="td_01"><a href="xiang_xi_xinxi.htm" target="_blank" onClick="javascript:openwindow('moremessage.htm','',400,500)">查看</a></td>
 
      </tr>
      <tr>
        <td align="center" class="td07">6</td>
        <td class="td07">张三 提交课题借款申请通过时间 2005-09-30</a></td>
      <td class="td_01"><a href="xiang_xi_xinxi.htm" target="_blank" onClick="javascript:openwindow('moremessage.htm','',400,500)">查看</a></td>
 
      </tr>
      <tr>
        <td align="center" class="td07">7</td>
        <td class="td07">张三 提交课题报销申请通过时间 2005-09-30</a></td>
    <td class="td_01"><a href="xiang_xi_xinxi.htm" target="_blank" onClick="javascript:openwindow('moremessage.htm','',400,500)">查看</a></td>
 
      </tr>
      <tr>
        <td align="center" class="td07">8</td>
        <td class="td07">张三 提交医疗借款未通过时间 2005-09-30</a></td>
    <td class="td_01"><a href="xiang_xi_xinxi.htm" target="_blank" onClick="javascript:openwindow('moremessage.htm','',400,500)">查看</a></td>
 
      </tr>
      <tr>
        <td align="center" class="td07">9</td>
        <td class="td07">张三提交医疗报销申请未通过时间 2005-09-30</a></td>
      <td class="td_01"><a href="xiang_xi_xinxi.htm" target="_blank" onClick="javascript:openwindow('moremessage.htm','',400,500)">查看</a></td>
 
      </tr>
      <tr>
        <td align="center" class="td07">10</td>
        <td class="td07">张三提交课题借款未通过时间 2005-09-30</a></td>
   <td class="td_01"><a href="xiang_xi_xinxi.htm" target="_blank" onClick="javascript:openwindow('moremessage.htm','',400,500)">查看</a></td>
 
      </tr>
 </table>
 <table width="95%"  border="0" cellpadding="0" cellspacing="0" class="table02" align="center">
  <tr>
    <td height="30" align="right"><img src="../../images/1.gif" width="4" height="5" align="absmiddle"> 首页　 <img src="../../images/2.gif" width="3" height="5" align="absmiddle"> 上一页　 <img src="../../images/2-2.gif" width="3" height="5" align="absmiddle"> 下一页　 <img src="../../images/3.gif" width="4" height="5" align="absmiddle"> 末页　　共 1 页 1 条记录</td>
  </tr>
</table>
 <br>
 </center>
 </body>
</html>
