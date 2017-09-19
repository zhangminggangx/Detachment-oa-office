<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>出差申请</title>
<link href="/oa/css/style.css" rel="stylesheet" type="text/css">
<script language="javascript" src="/oa/js/clientSideApp.js"></script>
<script type="text/javascript" src="/oa/js/jquery-1.4.2.js"></script>
<script type="text/javascript" src="/oa/travelJs/travelapp.js"></script>



<link rel="stylesheet" type="text/css" href="/oa/JQueryeasyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="/oa/JQueryeasyui/themes/icon.css">

<script type="text/javascript" src="/oa/JQueryeasyui/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="/oa/JQueryeasyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/oa/JQueryeasyui/locale/easyui-lang-zh_CN.js"></script>
 


<script  type=text/JavaScript>
 

function windowOpen(theURL,winName,features,width,hight,scrollbars,top,left) 
{
  var parameter="top="+top+",left="+left+",width="+width+",height="+hight;
  if(scrollbars=="no")
 {parameter+=",scrollbars=no";}
  else
 {parameter+=",scrollbars=yes";}
  window.open(theURL,winName,parameter);
}


/*function ckplanTime() {
		var planTime = $("input[name='planTime']").val();
		if (planTime.length < 1 || planTime == null) {
			return false;
		} else {
			return true;
		}
	}
	function ckleaveTime() {
		var leaveTime = $("input[name='leaveTime']").val();
		if (leaveTime.length < 1 || leaveTime == null) {
			return false;
		} else {
			return true;
		}
	}*/
	
	function ckform() {
		if ($("form[name='infoForm']").form('validate')) {
			return true;
		} else {
		
			return false;
	}
	}
	function butSub(state)
	{
		if(ckform()){
		infoForm.action='/oa/TravelAppServlet1?state='+state;
		infoForm.submit();
	    }
	    else{
               alert("注意必填项 ");
		    }
	}

</script>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td height="25" align="center" valign="bottom" class="td06">
			<table width="98%" border="0" cellspacing="3" cellpadding="0">
				<tr>
					<td width="15"><img src="../../images/index_32.gif" width="9" height="9"></td>
					<td valign="bottom" class="title">我要出差</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<br>
<form  name="infoForm" method="post" >
<table align="center" width="95%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td width="182" height="24" class="td_form01">出差人</td>
		<td nowrap class=td_form02>${sessionScope.userInfo.empName}</td>
		<td width="182" class="td_form01">部门</td>
		<td nowrap class=td_form02>${sessionScope.userInfo.deptName}</td>
	</tr>
	<tr>
		<td height="24" class="td_form01">出差目的</td>
		<td nowrap class=td_form02><input type="text"name="travelReason" class="easyui-validatebox" required="true" missingMessage="必填" /></td>
		<td class="td_form01">出差地点</td>
		<td nowrap class=td_form02><input type="text" name="travelPlace" class="easyui-validatebox" required="true" missingMessage="必填" /></td>
	</tr>
	<tr >
	<td height="24" class="td_form01">计划用时(天)<div id="pt_prompt" class="prompt"></div></td>
	<td nowrap class="td_form02">
		<input type="text" name="planTime" class="easyui-validatebox" required="true" missingMessage="大于0的整数"/>
	</td>
	<td height="24" class="td_form01">离烟时间</td>
	<td nowrap class=td_form02>
		<input type="text" name="leaveTime" id="lt"/>
	</td>
</tr>
</table>
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
<tr class="b">
	<td rowspan="3" height="24" class="td_form01">随带物品</td>
	<td nowrap class=td_form02 colspan="3">
		<input type="checkbox" name="goodsName" value="相机" />
		相机 
	
		<input type="checkbox" name="goodsName" value="U盘" />
		U盘 
		<input type="checkbox" name="goodsName" value="无线网卡" />
		无线网卡 
		<input type="checkbox" name="goodsName" value="笔记本电脑 "/>
		笔记本电脑 
		<input type="checkbox" name="goodsName" value="录音笔" />
		录音笔
		</td>
</tr>
</table>
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr class="b">
				<td width="90" class="td_form01">
					<input type="button" value="增加" id="add"/>
					<input type="button" value="删除" id="del">
				</td>
				<td colspan="6" class="td_form01"><strong >申请礼品</strong></td>
			</tr>
			<tr >
				<td  class="td_form01">礼品名称</td>
				<td  class="td_form01">数量</td>
				
			</tr>
			<tr id="del1">
				<td class="td_form02"><select name="present">
				<option value="月饼">月饼</option>
				<option  value="红酒">红酒</option>
				<option value="水晶杯">水晶杯</option>
				
				
				</select></td>
				<td class="td_form02"><input type="text" name="number"   class="easyui-validatebox" required="true" missingMessage="大于0的整数"/></td>
				
			</tr>
		</table>
		
<br>
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<td align="center">
			<input name="1" type="button" class="buttonface"
							value=" 保存  "  onClick= "javascript:butSub(this.name); ">
						   <input name="2" type="button" class="buttonface"
							value=" 保存并提交  " onClick= "javascript:butSub(this.name); ">

						   <input  type="button" class="buttonface"
							value="  返回  " onClick=	window.close();>
					
		</td>
	</tr>
</table>
<br>
</form>
</body>
</html>