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
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<title>用户管理</title>
		<link href="../../css/style.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" language="JavaScript1.2"
			src="/oa/js/stm31.js"></script>
		<script>
function windowOpen(theURL,winName,features,width,hight,scrollbars,top,left) 
{
  var parameter="top="+top+",left="+left+",width="+width+",height="+hight;
  if(scrollbars=="no")
 {parameter+=",scrollbars=no";}
  else
 {parameter+=",scrollbars=yes";}
  window.open(theURL,winName,parameter);
}
</script>
		<script language=JavaScript type=text/JavaScript>

function selectAllByChk(chk,checkbox) {     
	var size = checkbox.length;
    if(size == null)
        checkbox.checked =chk.checked;
    else{
        for (i = 0; i < checkbox.length; i++) {
            checkbox[i].checked =chk.checked;
        }
	}
}

</SCRIPT>
	</head>

	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<center>

			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="25" align="center" valign="bottom" class="td06">
						<table width="98%" border="0" cellspacing="3" cellpadding="0">
							<tr>
								<td width="15">
									<img src="/oa/images/index_32.gif" width="9" height="9" />
								</td>
								<td valign="bottom" class="title">
									用户管理
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<form action="">
					<tr>
						<td align="center">
							<br />
							<table width="95%" border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td class="td_page">
										姓名：
										<input name="queryName" type="text" alt="姓名|0|s" id=10 next=15
											onFocus="{obtainFocus(this),this.select()}"
											onKeyPress="gotoNextInput(this)" class="input" size="40" />
										<div style="display: none">
											<input type="text" />
										</div>
										<input name="simple" type="button" id=15 next=20
											class="buttonface02" value="  查询  " />
										<input name="advance" type="button" id=20 class="buttonface"
											value="高级查询" />
										<input name="viewsys" type="button" class="buttonface"
											onClick="javascript:window.location.href='syslist.jsp'"
											value="查看系统管理员" />
									</td>
								</tr>
							</table>
							<br />
							<table width="95%" border="0" cellspacing="2" cellpadding="0">
								<tr>
									<td align="right">
										<input name="Submit" type="button" class="buttonface"
											onClick="windowOpen('rolelist2.jsp','','','340','270','no','50','50')"
											value="分配角色" />
										<input name="Submit" type="button" class="buttonface"
											value="分配系统管理员" />
										<input name="Submit" type="button" class="buttonface"
											onClick="javascript:window.location.href='userpms.jsp'"
											value="查看用户权限" />
									</td>
								</tr>
							</table>
							<table width="95%" border="0" cellpadding="2" cellspacing="0"
								class="table01">
								<tr>
									<td class="td_top">
										<input name="chk" type="checkbox" id="chk"
											onClick="selectAllByChk(chk,checkbox)" value="checkbox0" />
									</td>
									<td class="td_top">
										姓名
									</td>
									<td class="td_top">
										部门
									</td>
									<td class="td_top">
										性别
									</td>
									<td class="td_top">
										出生日期
									</td>
									<td class="td_top">
										职务级别
									</td>
								</tr>
								<tr>
									<td class="td_01">
										<span class="td01"> <input name="checkbox"
												type="checkbox" id="checkbox" value="checkbox01" /> </span>
									</td>
									<td class="td_01">
										<a href="modifyinfo.jsp">李董</a>
									</td>
									<td class="td_01">
										人事部
									</td>
									<td class="td_01">
										男
									</td>
									<td class="td_01">
										1972-10-20
									</td>
									<td class="td_01">
										主任科员
									</td>
								</tr>
								<tr>
									<td class="td_02">
										<input type="checkbox" name="checkbox" value="checkbox" />
									</td>
									<td class="td_02">
										<a href="modifyinfo.jsp">王峰</a>
									</td>
									<td class="td_02">
										管理信息部
									</td>
									<td class="td_02">
										男
									</td>
									<td class="td_02">
										1972-11-14
									</td>
									<td class="td_02">
										主任科员
									</td>
								</tr>
								<tr>
									<td class="td_01">
										<input type="checkbox" name="checkbox" value="checkbox" />
									</td>
									<td class="td_01">
										<a href="modifyinfo.jsp">江碧</a>
									</td>
									<td class="td_01">
										法律部
									</td>
									<td class="td_01">
										男
									</td>
									<td class="td_01">
										1960-05-06
									</td>
									<td class="td_01">
										处长
									</td>
								</tr>
								<tr>
									<td class="td_02">
										<input type="checkbox" name="checkbox" value="checkbox" />
									</td>
									<td class="td_02">
										<a href="modifyinfo.jsp">张鹏</a>
									</td>
									<td class="td_01">
										人事部
									</td>
									<td class="td_02">
										男
									</td>
									<td class="td_02">
										1969-07-01
									</td>
									<td class="td_02">
										处长
									</td>
								</tr>
								<tr>
									<td class="td_01">
										<input type="checkbox" name="checkbox" value="checkbox" />
									</td>
									<td class="td_01">
										<a href="modifyinfo.jsp">李丽</a>
									</td>
									<td class="td_02">
										管理信息部
									</td>
									<td class="td_01">
										女
									</td>
									<td class="td_01">
										1974-10-14
									</td>
									<td class="td_01">
										科员
									</td>
								</tr>
								<tr>
									<td class="td_02">
										<input type="checkbox" name="checkbox" value="checkbox" />
									</td>
									<td class="td_02">
										<a href="modifyinfo.jsp">欧阳小强</a>
									</td>
									<td class="td_01">
										法律部
									</td>
									<td class="td_02">
										男
									</td>
									<td class="td_02">
										1977-09-08
									</td>
									<td class="td_02">
										科员
									</td>
								</tr>
								<tr>
									<td class="td_01">
										<input type="checkbox" name="checkbox" value="checkbox" />
									</td>
									<td class="td_01">
										<a href="modifyinfo.jsp">刘宇</a>
									</td>
									<td class="td_01">
										法律部
									</td>
									<td class="td_01">
										男
									</td>
									<td class="td_01">
										1977-09-18
									</td>
									<td class="td_01">
										科员
									</td>
								</tr>
								<tr>
									<td class="td_02">
										<input type="checkbox" name="checkbox" value="checkbox" />
									</td>
									<td class="td_02">
										<a href="modifyinfo.jsp">吴华</a>
									</td>
									<td class="td_02">
										管理信息部
									</td>
									<td class="td_02">
										女
									</td>
									<td class="td_02">
										1979-09-08
									</td>
									<td class="td_02">
										办事员
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</form>
			</table>
		</center>
	</body>
</html>
