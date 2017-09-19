<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" " http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns=" http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
<title>报销详细信息</title>
<link href="/oa/css/style.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="/oa/js/jquery-1.4.2.js"></script>


<link rel="stylesheet" type="text/css" href="/oa/JQueryeasyui/themes/default/easyui.css"/>
	<link rel="stylesheet" type="text/css" href="/oa/JQueryeasyui/themes/icon.css"/>
	<script type="text/javascript" src="/oa/JQueryeasyui/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="/oa/JQueryeasyui/jquery.easyui.min.js"></script>

<script type="text/javascript">
function checkDetailMoney(){
	$("input[name='detailMoney']").each(function(){
		if($(this).val()==""||$(this).val().length==0){
			alert("明细费用不能为空");
			return false;
			}
		else{
			return true;
		}					 
		});
}
$(document).ready(function(){
	
		$("#subBtn").click(function(){
			var disMoney=0;
			$("input[name='detailMoney']").each(function(){
				
				//alert($(this).html());
				disMoney+=parseFloat($(this).val());						 
				});
				//alert(disMoney);
				$("#disMoney").val(disMoney);
			});
		
	});
function computeDisMoney(){
	  var disMoney=0;
		$("input[name='detailMoney']").each(function(){
			
			//alert($(this).html());
			disMoney+=parseFloat($(this).val());						 
			});
			//alert(disMoney);
			$("#disMoney").val(disMoney);
	  }

function checkIsNumber(){
	var flag=true;
	var reg=/^[0-9]+$/;
	$("input[name='detailMoney']").each(function(){
		//alert($(this).val());
             if(!reg.test($(this).val()))
             {
            	 alert('明细金额必须是数字请正确填写');
            	 flag= false;
            }
		});
	return flag;
	}
function checkForm(){
return $("form[name='form1']").form('validate')&&checkIsNumber();
	
}
</script>
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<center>
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="25" align="center" valign="bottom" class="td06"><table width="98%" border="0" cellspacing="3" cellpadding="0">
          <tr>
            <td width="15"><img src="/oa/images/index_32.gif" width="9" height="9"></td>
            <td valign="bottom"><span class="title">报销详细信息</span></td>
          </tr>
      </table></td>
    </tr>
  </table>
  <form name="form1" method="post" action="/oa/ModifyDispatchServlet" onsubmit="return checkForm()">
    <table width=95% border=0 align=center cellpadding=0 cellspacing=0>
      <tr align="left" nowrap>
       <tr align="left" nowrap>
				<td width="80" height="24" align="center"  class=td_form01>报 销 编号：</td>
				<td class="td_form02">${requestScope.dispatch.formNo }</td>
				<td width="80" height="24" align="center"  class=td_form01>报销时间:</td>
				<td class="td_form02">${requestScope.dispatch.createTime}</td>
				<input type="hidden" value="${requestScope.dispatch.formNo}" name="formNo"/>
				<input type="hidden" value="${requestScope.dispatch.disId}" name="disId"/>
			</tr>
      </tr>
    </table>
	
	<table  width=95% border=0 align=center cellpadding=0 cellspacing=0>
			<tr align="left" nowrap>
			<tr>
				<td width="90" height="24" class="td_form01">项目</td>
				<td width="90" class="td_form01">费用</td>
				<td width="90" class="td_form01">描述</td>
			    
			</tr>
			<c:if test="${not empty requestScope.details}">
			<c:forEach items="${requestScope.details}" var="detail">
			<tr>
				<td width="90" height="24" class="td_form02">${detail.disProject.proName}</td>
				<td width="90" class="td_form02"><input type="text" name="detailMoney" value="${detail.detailMoney}" onblur="computeDisMoney()"></td>
				<td width="90" class="td_form02"><input type="text" name="description" value="${detail.description}"></td>
				
			</tr>
			</c:forEach>
			</c:if>
			<tr ><td width="90" height="24" class="td_form02">报销总金额为:</td><td width="90" height="24" class="td_form02"><input type="text" name="disMoney" id="disMoney" value="${requestScope.dispatch.disMoney }" class="easyui-validatebox" required="true" missingMessage="必填" /></td></tr>
			<tr><td colspan="3" align="center"><input type="submit" id="subBtn" value="修改" /></td></tr>
			
			
		</table>
    <br>
     
    <br>
  </form>
</center>
</body>
</html>
