<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<HEAD>
<TITLE>社科院电子所务::::::::::</TITLE>
 <LINK href="style.css" rel=stylesheet>
 <link href="../../css/style.css" rel="stylesheet" type="text/css" />
 <script language="JavaScript" src="../../include/js/string-relate.js"></script>
 <script language="JavaScript" src="../open_win.js"></script>
 <SCRIPT>
 <!--
	var bCheck = false;
		
	function checkAll() {
		bCheck = !bCheck;
		var ChkEls = document.getElementsByName("ChkUser");
		for (var i=0;i<ChkEls.length;i++) {
			ChkEls.item(i).checked = bCheck;
		}
		if (bCheck)
			frmAddrGrp.idCheckAll.alt = "全部取消";
		else
			frmAddrGrp.idCheckAll.alt = "全部选中";
	}

	function IsCheck() {
		var i;
		var result=false;
		for (i=0; document.frmAddrGrp.elements[i]; i++) 
		{
			if ( (document.frmAddrGrp.elements[i].type=="checkbox") && (document.frmAddrGrp.elements[i].checked) )
			{
				result = true;
			}
		}
		return result;
	}

	function DeleteCheckAll() {
		//addrId = "";
		sParam = "";
		sGroupIds = "";
		if ( IsCheck() )
		{
			for (i=0; document.frmAddrGrp.elements[i]; i++) 
			{
				if ((document.frmAddrGrp.elements[i].type=="checkbox") && (document.frmAddrGrp.elements[i].checked))
				{
					sGroupIds = sGroupIds + document.frmAddrGrp.elements[i].value + ",";
				}
			}
			sParam = "?AddrIds=&GroupId=&GroupIds="+sGroupIds+"&Pg=1";

			if( !confirm("您确定要删除选定的记录吗？") )
				return;
			location.replace("del_addr.jsp"+sParam);
		}
		else { alert("请先选择需要删除的记录！"); }
	}
	
	function gotoPage( p_nPageIndex ) {
		var frm = document.frmLink;
		frmLink.Pg.value = p_nPageIndex;
		frmLink.submit();
	}//END:gotoPage

	function refreshMe() {
		frmAddrGrp.submit();
	}
	function openwin6(){
	window.open ("tian_jia_yong_hu_zu.htm", "newwindow2", "height=500, width=400, top=100, left=100,toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, status=no") 

	}
 -->
 </SCRIPT>
</HEAD>

<BODY aLink=#ffffcc bgColor=#ffffff link=#000000 text=#000000 vLink=#666666>
  <TABLE cellSpacing=0 cellPadding=0 width="98%" align=center border=0 valign="top">
  <TR>
	<TD align="right" valign="bottom">
  	
	</TD>
  </TR>
  </TABLE>
  <TABLE cellSpacing=0 cellPadding=0 width="98%" align=center border=0 valign="top">
  <TBODY>
  <TR>
    <TD width="100%" height=43>
	  <TABLE cellSpacing=0 cellPadding=0 width="100%"  background=../../images/item-addressrightback.gif border=0>
        <TBODY>
        <tr>
          <td width="10" valign="bottom" align="right"><img border="0" src="../../images/item-addressleft.gif" width="9" height="39"></td>
          <td width="150" background="../../images/item-addressleftback.gif"><img border="0" src="../../images/icon16-address.gif" align="absmiddle" width="16" height="16">  
              <font color="null">我的用户组</font></td>    
          <td width="28"><img border="0" src="../../images/item-addresscenter.gif" width="28" height="39"></td>
          <td width="813" valign="bottom" align="right"><img border="0" src="../../images/icon-add.gif" align="absmiddle" width="14" height="14"> 
              <!--<a href=# onclick="window.open('dowith_group.jsp?ifEdit=0','CtrlWindow','toolbar=no,menubar=no,location=no,reSIZE=yes,scrollbars=yes,width=318,height=248')">添加用户组</a>&nbsp;&nbsp;-->
			  <a href=# onclick="openwin6()('dowith_group.jsp?ifEdit=0','','添加用户组',272,307,true);">添加用户组</a>&nbsp;&nbsp;
			<img border="0" src="../../images/icon-delete.gif" align="absmiddle" width="14" height="14">
				<a href="javascript:DeleteCheckAll()">删除</a>
			&nbsp;&nbsp;<img border="0" src="../../images/icon-teamedit.gif" align="absmiddle" width="14" height="14">
			  <a href="index.htm">我的通讯录</a>
          </td>
          <td width="7" valign="bottom" align="left" bgcolor="#FFFFFF"><img border="0" src="../../images/item-addressright.gif" width="7" height="39"></td>
        </tr>
        </TBODY>
      </TABLE>
    </TD>
  </TR>
  <TR>
    <TD width="100%" height=115>
		<TABLE height=149 cellSpacing=1 borderColorDark=#ffffff cellPadding=0 width="100%" bgColor=#dad8e2 borderColorLight=#000000 border=1>
        <TBODY>
        <TR>
          <TD vAlign=center align=middle width="100%" height=145>
            <FORM name="frmAddrGrp"  method="post" action="list_group.jsp">
			<TABLE height=62 cellSpacing=1 borderColorDark=#999999 cellPadding=2 width="95%" borderColorLight=#77677c border=0>
              <TBODY>
              <TR>
                <TD colSpan=4 class=listTitle vAlign=center align=right width=900  height=8>&nbsp;</TD>
              </TR>
              <TR bgColor=#abaec5>
                <TD class=listTitle vAlign=center align=middle width=20 height=1>
                      <img id="idCheckAll" border="0" src="../../images/icon16-select.gif" width="16" height="16" alt="全部选中" onclick="checkAll();" style="cursor:hand;">
                </TD>
                <TD class=listTitle vAlign=center align=left width=131 height=1>用户组名称</TD>
                <TD class=listTitle vAlign=center align=left width=323 height=1>简要描述</TD>
				<TD class=listTitle vAlign=center align=left width=223 height=1>群组发送操作</TD>
                <TD class=listTitle vAlign=center align=left width=71 height=1>编 辑</TD>
              </TR>
			
              <TR bgColor=#ebf0f1>
                <TD class=black vAlign=center align=middle width=20 height=18>
                	<input type="checkbox" name="ChkUser" value="485"><font color="blue">1</font>
                </TD>
                <TD class=black vAlign=top align=left width=131 height=18>
					<a href="tong_shi.htm?GroupId=485" title="查看该组成员">同事</a>
				</TD>
                <TD class=black vAlign=top align=left width=323 height=18>
					同事者，顾名思义也。
				</TD>
				<TD class=listTitle valign=bottom align=left width=223 height=1>					&nbsp;&nbsp;&nbsp;&nbsp;
					<a href=# onclick="showNewHtmlDlg('send_mail.jsp?GroupId=485','','发送电子邮件',270,422,true);" title="给该用户组中所有成员发送电子邮件"><img src="../../images/email.gif" border="0" alt="给该用户组中所有成员发送电子邮件"></a>
				</TD>
                <TD class=black vAlign=top align=left width=71 height=18>
					<!--<A href=# onclick="window.open('dowith_group.jsp?ifEdit=485','CtrlWindow','toolbar=no,menubar=no,location=no,reSIZE=yes,scrollbars=yes,width=318,height=248')"><IMG src="../images/icon-edit.gif" border=0 width=18 height=18 alt="对用户组进行修改"></A>-->
					<a href=# onclick="showNewHtmlDlg('dowith_group.jsp?ifEdit=485','','添加用户组',272,307,true);"><IMG src="../../images/icon-edit.gif" border=0 width=18 height=18 alt="对用户组属性进行修改"></A></a>&nbsp;&nbsp;
				</TD>
			  </TR>
			
			  </TABLE>

			  <input type="hidden" name="BackUrl" id="BackUrl" value="list_group.jsp">
			  
			  <TABLE cellSpacing=1 borderColorDark=#999999 cellPadding=2 width="95%" borderColorLight=#77677c border=0>
              <TR bgColor=#abaec5>
                <TD align=left width=35% height=1>&nbsp;
			
                    <span style="background-color: #2D809F"><font color="#FFFF00">1</font></span>
			
				</TD>
				<TD align=right width=65% height=1>
			
               共 1 页&nbsp;1 条记录
            
                </TD>
              </TR>
              </TABLE>
            </FORM>
			<form name="frmLink" method="post" action="list_group.jsp">
				<input type="hidden" name="Pg"       value="1">
				<input type="hidden" name="PgSize"   value="10">
			</form>
          </TD>
         </TR>
         </TBODY>
       </TABLE>
	 </TD>
  </TR>
  <TR>
    <TD width="100%" height=14>
      <TABLE cellSpacing=0 cellPadding=0 width="100%" background=../../images/bottom-addressback.gif border=0>
        <TBODY>
        <TR>
          <TD vAlign=top align=right width="1%" bgColor=#ffffff>
          	<IMG height=16 src="../../images/bottom-addressleft.gif" width=15 border=0>
          </TD>
          <TD width="98%">　</TD>
          <TD vAlign=top align=left width="1%" bgColor=#ffffff>
          	<IMG height=16 src="../../images/bottom-addressright.gif" width=13 border=0>
          </TD>
        </TR>
        </TBODY>
      </TABLE>
	</TD>
  </TR>
  </TBODY>
 </TABLE>
</BODY>
</HTML>