<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" " http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns=" http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
<title>角色管理</title>
<script type="text/javascript" language="JavaScript1.2" src="/oa/js/stm31.js"></script>
<script language=javascript src="/oa/js/tree2.js"></script>
<script language=javascript>
function secBoard(n)
{
  for(i=0;i<secTable.cells.length;i++)
    secTable.cells[i].className="sec1";
  secTable.cells[n].className="sec2";
  for(i=0;i<mainTable.tBodies.length;i++)
    mainTable.tBodies[i].style.display="none";
  mainTable.tBodies[n].style.display="block";
}
</script>
<link href="./oa/css/style.css" rel="stylesheet" type="text/css"/>
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<center>
  
 
  <table width="100%" border=0 cellpadding="0" cellspacing="0">
  <tr>
    <td><iframe name="label" frameborder="0" framespacing="0" width="100%" height="476" scrolling="yes" src="/oa/ViewRoleDetailServlet?roleId=<%=request.getParameter("roleId")%>" style="margin: 0px;padding: 0px;"></iframe></td>
  </tr>
</table>
</center>
</body>
</html>
