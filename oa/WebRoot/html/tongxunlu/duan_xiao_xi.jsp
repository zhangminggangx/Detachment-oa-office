<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<title>社科院电子所务 ::::::::::</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<link rel="stylesheet" href="style.css">

<link href="../../css/style.css" rel="stylesheet" type="text/css" />
 <script language="JavaScript">
 <!--
 function JustifyNull1(field)
  {
   var Ret = true
   var str = "" + field.value
   if(str.length)
      { for(var i=0;i<str.length;i++)
        if(str.charAt(i)!=" ")
	           break
        if(i>=str.length)
		field.value = ""
      }	   
      
   if (field.value.length==0)
	Ret = false
   return (Ret)
  }// 判断输入字段是否为空

 function CheckValue()
 {
   var ret=true;
   if ( !JustifyNull1(document.frmSMS.MsgContent) )
    {
     alert("短信息内容不能为空！");
     document.frmSMS.MsgContent.focus();
	 ret=false;
    }
   return ret;
 }
 -->
 </script>
</head>

<body topmargin="0" leftmargin="0">
<div align="center">
  <center>
  <form name="frmSMS" method="POST" action="send_group_succ.jsp" onsubmit="return CheckValue()">
  <table border="0" width="300" cellspacing="0" cellpadding="0" height="57" bgcolor="#E7F3EF">
    <tr>
      <td width="6" background="../../images/littletop-back.gif" height="8" valign="top" align="left"><img border="0" src="../../images/OWtop-messageleft.gif" width="19" height="31"></td>
      <td width="271" background="../../images/OWtop-messageback.gif" height="8" valign="middle" align="left"><img border="0" src="../../images/icon16-messagewrite.gif" align="absmiddle" width="16" height="16"> 
        发送手机短信息</td>
      <td width="6" background="../../images/littletop-back.gif" height="8" valign="top" align="left"><img border="0" src="../../images/OWtop-messageright.gif" width="20" height="31"></td>
    </tr>
    <tr>
      <td width="6" background="../../images/OWleft-message.gif" height="29">　</td>
      <td width="271" height="29" valign="middle" align="center">
		  <table border="0" width="100%" cellpadding="2" bordercolorlight="#3684AD" bordercolordark="#FFFFFF" cellspacing="0">
            <tr>
              <td width="17%" valign="middle" align="left">&nbsp;</td>
              <td width="83%">&nbsp; </td>
            </tr>
            <tr>
              <td width="17%" valign="middle" align="left"></td>
              <td width="83%"></td>
            </tr>
			<tr>
              <td colspan="2">
				发送短信息到用户组<font color="red"><b>同事</b></font>中所有成员，对于手机号码不符合条件的用户，系统将自动跳过。
			  </td>
            </tr>
			<tr>
              <td width="17%" valign="middle" align="left">&nbsp;</td>
              <td width="83%">&nbsp;</td>
            </tr>
            <tr>
              <td width="17%" valign="top" align="left">内容：</td>
              <td width="83%" valign="top" align="left"><textarea rows="4" name="MsgContent" cols="27"></textarea><br>
				&nbsp;&nbsp;&nbsp;<font color="red">*</font> （超过50个汉字将分条发送）
			  </td>
            </tr>
			<tr>
              <td width="17%" valign="middle" align="left">&nbsp;</td>
              <td width="83%">&nbsp;</td>
            </tr>
            <tr>
              <td colspan="2" width="100%" align="center">
				<input type="image" border="0" src="../../images/button-send.gif" title="确定发送">&nbsp;&nbsp;&nbsp;&nbsp;
                <img border="0" src="../../images/button-cancle.gif" OnMouseOver="this.style.cursor='hand'" onclick="javascript:window.close()" title="取消操作"></td>    
            </tr>
          </table>
      </td>
      <td width="6" background="../../images/OWright-message.gif" height="29">　</td>
    </tr>
    <tr>
      <td width="6" background="../../images/littlebottom-back.gif" height="20" valign="top" align="left"><img border="0" src="../../images/OWbottom-messageleft.gif" width="19" height="33"></td>
      <td width="271" background="../../images/OWbottom-messageback.gif" height="20" valign="top" align="left">　</td>
      <td width="6" background="../../images/littlebottom-back.gif" height="20" valign="top" align="left"><img border="0" src="../../images/OWbottom-messageright.gif" width="20" height="33"></td>
    </tr>
  </table>
			<input type="hidden" name="GroupId" value="485">
  </form>
  </center>
</div>
</body>
</html>