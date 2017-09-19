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
<title>出差报销</title>
<link href="/oa/css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/oa/js/jquery-1.4.2.js"></script>
<link rel="stylesheet" type="text/css" href="/oa/JQueryeasyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="/oa/JQueryeasyui/themes/icon.css">
	<script type="text/javascript" src="/oa/JQueryeasyui/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="/oa/JQueryeasyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="/oa/travelJs/travelapp.js"></script>

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
function checkDetailMoney(){
	$("input[name='detailMoney']").each(function(){
		if($(this).val()==""||$(this).val().length==0){
			alert("明细费用不能为空");
			return false;
			}
		else{return true;}				 
		});
}

</script>
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="25" align="center" valign="bottom" class="td06"><table width="98%" border="0" cellspacing="3" cellpadding="0">
      <tr>
        <td width="15"><img src="/oa/images/index_32.gif" width="9" height="9"></td>
        <td valign="bottom" class="title" align="left">出差报销</td>
      </tr>
    </table></td>
  </tr>
</table>
<br>
	<form name="form1" method="post" action="/oa/SaveOrSubmitDispatchServlet?state=2" onsubmit="return checkDetailMoney()">
		<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr class="b">
				<td colspan="6" id="b1"><p class="sp1"><strong></strong></p></td>
			</tr>
			<tr class="b" >
				<td class="td_form01">出差人</td>
				<td class="td_form02">${sessionScope.userInfo.empName }</td>
				<td class="td_form01">部门</td>
				<td class="td_form02" colspan="3">${sessionScope.userInfo.deptName }</td>
				
			</tr>
		
			<tr class="b">
				<td class="td_form01">同行人员</td>
				<td colspan="5" class="td_form02">
					<input type="text" />
				</td>
				<td class="td_form01">天数</td>
				<td class="td_form02"><input type="text"/></td>
			</tr>
			<tr class="b">
				<td class="td_form01">关联出差报告单</td>
				<td  width="90" height="24" class="td_form02" colspan="3"> 
					<select name=""  class="input_01">
					<c:forEach items="${requestScope.repList}" var="p" >
						<option value="${p.formNo}" class="app" >${p.formNo }</option>
						</c:forEach>
					</select>
				
	          </td> 
		  </tr>
			<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
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
                   <tr>
                   <td colspan="4" class="td_form02">
                    <label>事  由：</label><textarea name="disReason"  cols="100" rows="5"></textarea>
                   </td>
                   </tr> 
                   <tr>
                   <td colspan="4" class="td_form02">
                   <label>报销金额：</label><input type="text" size="20" id="disMoney" name="disMoney" class="easyui-validatebox" required="true"
			missingMessage="必填" /><label style="color:red">此处必填而且必须是数字</label>
                   </td>
                   </tr> 
		</table>
		<%--
		<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr class="b">
				<td class="td_form01">
					<td width="90" class="td_form01">
					<input type="button" value="增加" id="add"/>
					<input type="button" value="删除" id="del">
				</td>
				</td>
				<td colspan="7" class="td_form01"><p class="sp2"><strong>事项</strong></p></td>
			</tr>
			<tr>
				<td class="td_form01">时间</td>
				<td class="td_form01">类别</td>
				<td class="td_form01">事由</td>
				<td class="td_form01">金额</td>
				<td class="td_form01">票据张数</td>
				<td class="td_form01">备注</td>
				<td colspan="2" class="td_form01">操作</td>
			</tr>
			<tr id="del1">
				<td class="td_form02"><input type="text"/></td>
				<td class="td_form02"><input type="text"/></td>
				<td class="td_form02"><input type="text"/></td>
				<td class="td_form02"><input type="text"></td>
				<td class="td_form02"><input type="text"/></td>
				<td class="td_form02"><input type="text"/></td>
				<td colspan="2" class="td_form02"></td>
			</tr>
		</table>

  --%>
  <br/>
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
</body>
</html>