<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<TITLE>社科院电子所务::::::::::</TITLE>
<META http-equiv=Content-Type content="text/html; charset=GBK">
<LINK href="style.css" rel=stylesheet>

<link href="../../css/style.css" rel="stylesheet" type="text/css" />
 <SCRIPT src="input_user.js"></SCRIPT>
</head>

<BODY leftMargin=0 topMargin=0>
<DIV align=center>
<CENTER>

<TABLE cellSpacing=0 cellPadding=0 width=300 bgColor=#e7e7f7 border=0>
  <TBODY>
  <TR>
    <TD vAlign=top align=left width=6 background="../../images/littletop-back.gif" height=8><IMG height=31 src="../../images/OWtop-addressleft.gif" width=19 border=0></TD>
    <TD vAlign=center align=left width=271 background="../../images/OWtop-addressback.gif" height=8><IMG height=14 src="../../images/icon-add.gif" width=14 align=absMiddle border=0> 导入系统用户</TD>
    <TD vAlign=top align=left width=6 background="../../images/littletop-back.gif" height=8><IMG height=31 src="../../images/OWtop-addressright.gif" width=20 border=0></TD>
  </TR>
  <TR>
    <TD width=6 background="../../images/OWleft-address.gif" height=29>　</TD>
    <TD vAlign=center align=middle width=271 height=29>
      <FORM name="frmAddress" method="post" action="input_user_succ.jsp" onsubmit="return  CheckValue()">
	  <TABLE height=272 cellSpacing=0 cellPadding=0 width="95%" borderColorLight=#008000 border=0>
        <TBODY>
		<TR>
          <TD borderColor=#008000 width="100%" height=16>&nbsp;</TD>
		</TR>
        <TR>
          <TD borderColor=#008000 width="100%" height=18 bgColor=#f4f2f9>
			<INPUT type="checkbox" name="ChkUser"  value="1"  onclick="selUser()" checked>选择用户<BR>
            <CENTER></CENTER>
            <DIV id=div3 name="div3" style="display">
            <TABLE cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
              <TBODY>
              <TR>
                <TD vAlign=top align=center width="33%">
                  <P>可选用户</P>
				</TD>
                <CENTER>
                <TD vAlign=top align=left width="33%">　</TD></CENTER>
                <TD vAlign=top align=center width="34%">
                  <P>&nbsp;已选用户</P>
				</TD>
			  </TR>
              <CENTER>
              <TR>
                <TD align=middle width="33%">
				  <SELECT name="AllUser" size="8" multiple style="width:65pt"> 
				
					<option value="824">net</option>
				
					<option value="946">test1</option>
				
					<option value="947">test2</option>
				
					<option value="948">test3</option>
				
					<option value="943">办公室主任</option>
				
					<option value="944">科研处处长</option>
				
					<option value="950">中心出纳</option>
				
					<option value="949">中心会计</option>
				
					<option value="945">中心主任</option>
				
				  </SELECT> 
				</TD>
				<TD width="33%">
                  <P align=center><IMG height=20 src="../../images/button-add1.gif" width=50 border=0 alt="增加" onMouseOver="this.style.cursor='hand'" onclick="AddItem('AllUser', 'SelUser', '')"></P>
                  <P align=center><IMG height=20 src="../../images/button-delete1.gif" width=50 border=0 alt="删除" onMouseOver="this.style.cursor='hand'" onclick="DeleteItem('SelUser')"></P>
				</TD>
                <TD align=middle width="34%">
					<SELECT name="SelUser" id="id_SelUser" size=8 multiple style="width:65pt"> 
						
							<option value="948">test3</option>
						
							<option value="943">办公室主任</option>
						
							<option value="944">科研处处长</option>
						
							<option value="949">中心会计</option>
						
							<option value="946">test1</option>
						
					</SELECT> 
                </TD>
			  </TR>
			  </TBODY>
			</TABLE>
		  </DIV>
		  </CENTER>
		  </TD>
		</TR>
        <TR>
          <TD borderColor=#008000 width="100%" height=16>&nbsp;</TD>
		</TR>
        <TR>
          <TD borderColor=#008000 width="100%" bgColor=#f4f2f9 height=18>
		  <INPUT name="SearchUser" type="checkbox" value="1" onclick="searchUser()">查找用户
            <DIV id=div1 name="div1" style="display:none">
            <TABLE height=65 cellSpacing=0 width="100%" align=center border=0>
              <TBODY>
              <TR>
                <TD width="100%" height=29>请输入用户名称：<BR>
					<INPUT type="text" name="UserName" size="32"><BR>(多用户请用半角,分隔)&nbsp;
                </TD>
			  </TR>
			  </TBODY>
			</TABLE>
			</DIV>
		  </TD>
		</TR>
        <TR>
          <TD borderColor=#008000 width="100%" height=23>&nbsp;</TD>
		</TR>
        <TR>
          <TD borderColor=#008000 width="100%" height=37>
            <P align=center>
				<input type="image" src="../../images/button-input.gif" height=20 width=50 border=0 alt="导入" >&nbsp;&nbsp;&nbsp;&nbsp;
				<IMG  src="../../images/button-cancle.gif" height=20 width=50 border=0 alt="关闭" onMouseOver="this.style.cursor='hand'" onclick="javascript:window.close()" > 
			</P>
		  </TD>
		</TR>
		</TBODY>
	  </TABLE> 
				<input type="hidden" name="GroupId"  value="0">
				<input type="hidden" name="SelValue" value="">
	  </FORM>
    </TD>
    <TD width=6 background="../../images/OWright-address.gif" height=29>　</TD>
  </TR>
  <TR>
    <TD vAlign=top align=left width=6 background="../../images/littlebottom-back.gif" height=20><IMG height=33 src="../../images/OWbottom-addressleft.gif" width=19 border=0></TD>
    <TD vAlign=top align=left width=271 background="../../images/OWbottom-addressback.gif" height=20>　</TD>
    <TD vAlign=top align=left width=6 background="../../images/littlebottom-back.gif" height=20><IMG height=33 src="../../images/OWbottom-addressright.gif" width=20 border=0></TD>
  </TR>
  </TBODY>
  </TABLE>
		
</DIV>
</CENTER>
</BODY>
</html> 