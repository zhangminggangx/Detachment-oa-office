<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>TRS内容协作平台(TRSWCM)</title>
	<link rel="stylesheet" href="../style.css">
	<link href="../../css/style.css" rel="stylesheet" type="text/css" />
	<script language="javascript">
	<!---
	//检查数据输入是否有效
	function JustifyNull1(field) {
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
	
	function CheckValue() {
		var ret=true;
		
		if( !JustifyNull1(document.frmSendMail.Title) ) {
			alert("电子邮件主题不能为空！");
			document.frmSendMail.Title.focus();
			ret=false;
		}
		return ret;
	}

	function  ClearMsg() {
		frmSendMail.Title.value = "";
		frmSendMail.Content.value = "";
		frmSendMail.Title.focus();
	}
	--->
	</script>
</head>

<body topmargin="0" leftmargin="0">

<div align="center">
  <center>
  <table border="0" width="400" cellspacing="0" cellpadding="0" height="57" bgcolor="#E7E7F7">
    <tr>
      <td width="6" background="../../images/littletop-back.gif" height="8" valign="top" align="left"><img border="0" src="../../images/OWtop-addressleft.gif" width="19" height="31"></td>
      <td background="../../images/OWtop-addressback.gif" height="8" valign="middle" align="left">
      	<img border="0" src="../../images/icon-add.gif" align="absmiddle" width="14" height="14">
		发送电子邮件到用户组 <font color="red"><b>同事</b></font> 中所有成员
      </td>
      <td width="6" background="../../images/littletop-back.gif" height="8" valign="top" align="left"><img border="0" src="../../images/OWtop-addressright.gif" width="20" height="31"></td>
    </tr>
    <tr>
      <td width="6" background="../../images/OWleft-address.gif" height="29">　</td>
      <td width="100%" height="180" valign="middle" align="center">

	<!--------------------------BEGIN: 属性显示----------------------------------------------------------->
        <form name="frmSendMail" id="id_frmSendMail" method="POST" action="send_mail_succ.jsp" onsubmit="return CheckValue()">
          <table border="0" width="100%" cellpadding="2">
            <tr>
              <td width="85%" id="id_tdParent" colspan="2"></td>
            </tr>
			<tr>
              <td width="15%" valign="middle" align="left">主&nbsp;&nbsp;&nbsp;&nbsp;题：</td>
              <td width="85%"><input type="text" name="Title" size="38" title="请注意限制邮件主题的长度"> <font color="red">*</font></td>
            </tr>
            <tr>
              <td valign="top" align="left" nowrap>&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td valign="top" align="left" nowrap>内&nbsp;&nbsp;&nbsp;&nbsp;容：</td>
              <td ><textarea rows="5" name="Content" cols="40"></textarea> </td>
            </tr>
			<tr>
              <td></td>
              <td align="left">
              	<input type="image" border="0" src="../../images/button-submit.gif" width="50" height="20" alt="确定发送">&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="javascript:ClearMsg();"><img border="0" src="../../images/button-reset1.gif" width="50" height="20" alt="重新填写"></a>&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="javascript:window.close();"><img border="0" src="../../images/button-cancle.gif" width="50" height="20" alt="取消操作"></a>
			  </td>
            </tr>
          </table>
					<input type="hidden" name="GroupId" value="485">
        </form>
	<!--------------------------END: 属性显示----------------------------------------------------------->

      </td>
      <td width="6" background="../../images/OWright-address.gif" >　</td>
    </tr>
    <tr>
      <td width="6" background="../../images/littlebottom-back.gif" height="20" valign="top" align="left"><img border="0" src="../../images/OWbottom-addressleft.gif" width="19" height="33"></td>
      <td width="271" background="../../images/OWbottom-addressback.gif" height="20" valign="top" align="left">　</td>
      <td width="6" background="../../images/littlebottom-back.gif" height="20" valign="top" align="left"><img border="0" src="../../images/OWbottom-addressright.gif" width="20" height="33"></td>
    </tr>
  </table>
  </center>
</div>
</body>
</html>