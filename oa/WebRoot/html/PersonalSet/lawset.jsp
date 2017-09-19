<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<%@taglib uri="http://jsptags.com/tags/navigation/pager"  prefix="pg"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" " http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns=" http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
		<title>个人设置</title>
		<link href="/oa/css/style.css" rel="stylesheet" type="text/css"/>
		<script type="text/javascript">
function windowOpen(theURL,winName,features,width,hight,scrollbars,top,left) 
{
  var parameter="top="+top+",left="+left+",width="+width+",height="+hight;
  if(scrollbars=="no")
 {parameter+=",scrollbars=no";}
  else
 {parameter+=",scrollbars=yes";}
  window.open(theURL,winName,parameter);
}



function check1()
{
  
   var oldpass=document.getElementById("textName1").value;
   var up=document.getElementById("up").value;
   var ckoldp=document.getElementById("ckoldp");
   if(oldpass!=up)
	   {
	  
	   ckoldp.innerHTML="&nbsp;&nbsp;不是本人的密码！";
		return false;
	   }else
		{
		ckoldp.innerHTML="";
			return true;
		}
  

}
function check2(){
	 var pwd=document.getElementById("textName2").value;
	 var cknewp=document.getElementById("cknewp");		
	   if(pwd==""){
			
			cknewp.innerHTML="&nbsp;&nbsp;密码不能为空!";
			return false;
			}
	   else if(pwd.length<3){
		   cknewp.innerHTML="&nbsp;&nbsp;密码必须等于或大于3个字符!";
			return false;
			}else
				{
				cknewp.innerHTML="";
				return true;
				
				
				}
	
}
function check3(){
	var pwd=document.getElementById("textName2").value;
	var cknewgp=document.getElementById("cknewgp");
	var repwd=document.getElementById("textName3").value;	


	if(pwd!=repwd){
		cknewgp.innerHTML="&nbsp;&nbsp;两次输入的密码不一致！";
		
		return false;
		}
	else
		{
		cknewgp.innerHTML="";
		return true;}
	
}

function check()
{
	
if(check1()&&check2()&&check3()){
	confirm("您确定要修改吗？");
	return true;
	
}
else
{
  return false;
}


	}
</script>


		<style type="text/css">

.style1 {
	font-size: 14px
}

#f2{
float: left;}
#f3{
float: left;}#f1{
float: left;}#f2{
float: left;}#ckoldp{
float: left;}#cknewp{
float: left;}#cknewgp{
float: left;}
</style>
	</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="25" align="center" valign="bottom" class="td06">
					<table width="98%" border="0" cellspacing="3" cellpadding="0">
						<tr>
							<td width="15" height="23">
								<img src="/oa/images/index_32.gif" width="9" height="9"/>
							</td>
							<td valign="bottom" class="title">
								个人设置
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<br>
		<table width="95%" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<td width="79%" class="td_page style1">
				--
				<a href="showset.jsp">基本信息</a>--用户密码修改--
			</td>
		</table>
		<form action="/oa/UpdatePassWordSerlvet" method="post" name="myform"
			onsubmit="return check()">
			<table width="95%" border="0" cellpadding="2" cellspacing="0"
				align="center">
				<tr>
					<td width="272" class="td_form01">
						<div align="right">
							旧密码：
						</div>
					</td>
					<td width="481" class="td_form02">
						<div align="left" id="f1">
							<input name="textfield1" type="password" class="input"
								id="textName1" size="30" onblur="check1()" />
							<input type="hidden" value="${sessionScope.userInfo.upwd}"
								id="up" />
								
						</div>
						<div id="ckoldp" class="ck"></div>
					</td>
				</tr>
				<tr>
					<td width="272" class="td_form01">
						<div align="right">
							新密码：
						</div>
					</td>
					<td width="481" class="td_form02">
						<div align="left" id="f2">
							<input name="textfield2" type="password" class="input"	id="textName2" size="30" onblur="check2()" />
							
							
						</div>
						<div id="cknewp" class="ck">（8--20位有效字符）</div>
					</td>
				</tr>
				<tr>
					<td width="272" class="td_form01">
						<div align="right">
							密码确认：
						</div>
					</td>
					<td width="481" class="td_form02">
						<div align="left" id="f3">
							<input name="textfield3" type="password" class="input" id="textName3" size="30" onblur="check3()" />
							
							
						</div>
						<div id="cknewgp" class="ck">（8--20位有效字符）</div>
					</td>
				</tr>
			</table> 

			<table width="95%" border="0" cellspacing="0" cellpadding="0"align="center">

				<tr>
					<td>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						
						<input name="Submit1" type="submit" class="buttonface02"value="  确定  "/>
						&nbsp;&nbsp;&nbsp;
						<input name="Submit2" type="button" class="buttonface02"value="  取消  " onClick="javascript:window.location.href='/oa/html/PersonalSet/showset.jsp';"/>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>