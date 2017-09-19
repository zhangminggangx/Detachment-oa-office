<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.oa.dispatch.entity.DisProject"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>录入报销信息</title>
<link href="/oa/css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/oa/js/jquery-1.4.2.js"></script>
<link rel="stylesheet" type="text/css" href="/oa/JQueryeasyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="/oa/JQueryeasyui/themes/icon.css">
	<script type="text/javascript" src="/oa/JQueryeasyui/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="/oa/JQueryeasyui/jquery.easyui.min.js"></script>
	
	
	
	


<script language="javascript">


$(document).ready(function(){
		$("#buttonAdd").click(function(){	 
             var trObj=$("<tr>").insertAfter($('#newTr'));
           var tdObj1=trObj.append("<td width='90' height='24' class='td_form02'><select name='proName'><c:forEach items='${requestScope.projects}' var='p'><option value='${p.proId}'>${p.proName }</option></c:forEach></select></td><td class='td_form02'><input type='text' name='detailMoney'  class='input_01' onblur='computeDisMoney()'/></td><td  width='90' class='td_form02'><input type='text' name='description'  class='input_01' /></td><td  class='td_form02'><a href='#' id='del' onclick='delRow(this)' >删除</a></td>");
				});
		$("img[name='tdSave']").click(function(){
			var td3=$(this).parent().prev();
		    td3.html(td3.children().val())
		     var td2=td3.prev();
			 td2.html(td2.children().val())
			 alert(td2.html());
			 var td1=td2.prev();
			 td1.html(td1.children().html())
		});
		$("#buttonSave").click(function(){
             $("form[name='form1']").attr("action","/oa/SaveOrSubmitDispatchServlet?state=1");
             
			});
		$("#del").click(function(){
			$(this).parent().parent().remove();
			
			});
		
	});
  function computeDisMoney(){
	  var disMoney=0;
		$("input[name='detailMoney']").each(function(){
			disMoney+=parseFloat($(this).val());						 
			});
			$("#disMoney").val(disMoney);
	  }
  function delRow(ele){
		var idx=ele.parentNode.parentNode.rowIndex;
		document.getElementById("table3").deleteRow(idx);
		
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
			<td height="25" align="center" valign="bottom" class="td06">
				<table width="98%" border="0" cellspacing="3" cellpadding="0">
					<tr>
						<td width="15"><img src="/oa/images/index_32.gif" width="9" height="9"></td>
						<td valign="bottom"><span class="title">录入报销信息</span></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<form name="form1" method="post" action="/oa/SaveOrSubmitDispatchServlet?state=2" onsubmit="return checkForm()">
		<table width=95% border=0 align=center cellpadding=0 cellspacing=0>
			<tr align="left" nowrap>
				<td width="80" height="24" align="center"  class=td_form01>报 销 人：</td>
				<td class="td_form02">${sessionScope.userInfo.empName }</td>
				<td width="80" height="24" align="center"  class=td_form01>报 销 单位：</td>
				<td class="td_form02">${sessionScope.userInfo.deptName }</td>

			</tr>
		</table>
		<table  width=95% border=0 align=center cellpadding=0 cellspacing=0 id="table3">
			
			<tr id="firstTr"  align="left" nowrap>
				<td width="90" height="24" class="td_form01">项目</td>
				<td class="td_form01">费用</td>
				<td width="90" class="td_form01">说明</td>
				<td class="td_form01">&nbsp;</td>
			</tr>
			
			
			<tr id="newTr">
				<td  width="90" height="24" class="td_form02">
					<select name="proName"  class="input_01">
					<c:forEach items="${requestScope.projects}" var="p" >
						<option value="${p.proId}">${p.proName }</option>
						</c:forEach>
					</select>
				</td>
				<td class="td_form02" name="detailMoney">
					<input type="text" name="detailMoney"  class="input_01" onblur='computeDisMoney()'/>
				</td>
				<td width="90" class="td_form02">
					<input type="text" name="description" class="input_01" />
				</td>
				<td  class="td_form02"><a href="#" id="del" onclick="delRow(this)">删除</a></td>
			</tr>
			  <!--报销单事由-->
                   <tr><td colspan="4" class="td_form02">
                    <label>事  由：</label><textarea name="disReason"  cols="100" rows="5"></textarea>
                   </td></tr> 
                   <tr><td colspan="4" class="td_form02">
                   <label>报销金额：</label><input type="text" size="20" id="disMoney" name="disMoney" class="easyui-validatebox" required="true" missingMessage="必填" />
                   </td></tr> 
			
		</table>
		<br>
		<table width=95% border=0 align=center cellpadding=0 cellspacing=0 width='100%'>
			<tr>
				 <td colspan="4" align="center">
                    <input type="submit"  id="buttonSave" value="保 存" class="submit_01" />
                    <input type="submit" id="buttonSub" value="保存并提交" class="submit_01" />
                    <input type="button"  id="buttonAdd" value="添加明细" class="submit_01" />
                    </td>
			</tr>
			
		</table>
	</form>
</center>
   
</body>
</html>
