<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>出差报告添加</title>

		<link href="/oa/css/style.css" rel="stylesheet" type="text/css">

		<link rel="stylesheet" type="text/css"
			href="/oa/JQueryeasyui/themes/default/easyui.css">
		<link rel="stylesheet" type="text/css"
			href="/oa/JQueryeasyui/themes/icon.css">
		<script type="text/javascript"
			src="/oa/JQueryeasyui/jquery-1.4.4.min.js"></script>
		<script type="text/javascript"
			src="/oa/JQueryeasyui/jquery.easyui.min.js"></script>
        <script type="text/javascript" src="/oa/JQueryeasyui/locale/easyui-lang-zh_CN.js"></script>

		<script type="text/javascript" src="/oa/WebRoot/js/jquery-1.4.2.js"></script>
		<script language="javascript" src="/oa/js/clientSideApp.js"></script>
		<script type="text/javascript" src="/oa/travelJs/AddtravelReport.js"></script>

		<SCRIPT language=JavaScript type=text/JavaScript>

	
		
	function windowOpen(theURL, winName, features, width, hight, scrollbars,
			top, left) {
		var parameter = "top=" + top + ",left=" + left + ",width=" + width
				+ ",height=" + hight;
		if (scrollbars == "no") {
			parameter += ",scrollbars=no";
		} else {
			parameter += ",scrollbars=yes";
		}
		window.open(theURL, winName, parameter);
	}
	/* function ckRealTime() {
		var realTime = $("input[name='realTime']").val();
		if (realTime.length < 1 || realTime == null) {
			return false;
		} else {
			return true;
		}
	}
	function ckDisMoney() {
		var disMoney = $("input[name='disMoney']").val();
		if (disMoney.length < 1 || disMoney == null) {
			return false;
		} else {
			return true;
		}
	}
	function ckTrafficFee() {
		var trafficFee = $("input[name='trafficFee']").val();
		if (trafficFee.length < 1) {
			return false;
		} else {
			return true;
		}
	}*/
	function ckRecCount() {
		var receivedCount = $("input[name='receivedCount']").val();
		
		//alert(receivedCount);
		var reg=/^[0-9]+$/;
		 if((!reg.test(receivedCount))&&(receivedCount!="")){
			 $("input[name='receivedCount']").css({"border-color": "red" }); 
			return false;
			} else {
				 $("input[name='receivedCount']").css({"border-color": "#fff" }); 
			return true;
		}
	}
 function ckReceive(){
	 var receivedCount = $("input[name='receivedCount']").val();
	 var receivedName = $("input[name='receivedName']").val();
	 if((receivedCount!="")&&(receivedName=="")){ $("input[name='receivedName']").css({"border-color": "red" }); $("input[name='receivedCount']").css({"border-color": "#fff" });return false; }
	 else if((receivedCount=="")&&(receivedName!="")){$("input[name='receivedCount']").css({"border-color": "red" }); $("input[name='receivedName']").css({"border-color": "#fff" });return false;}
	 else{
		 $("input[name='receivedCount']").css({"border-color": "#fff" }); $("input[name='receivedName']").css({"border-color": "#fff" });return true;
		 }
	 }
	
	
	
	function ckform() {
		return ckRecCount()&&ckReceive();
	
}
	function butSub(state)
	{
		// alert($("form[name='infoForm']").form('validate'));
		
		if((ckform()&&$("form[name='infoForm']").form('validate'))){
		infoForm.action='/oa/TravelReportServlet?state='+state;
		infoForm.submit();
	    }
	    else{
               //alert("注意所填项类型   ");
		    }
	}
	
	$(function(){
		 $("#delCustomsBut").click(function(){
	                $(this).parent().parent().parent().children("tr:last-child").remove();
	        });
       $("#select").change(function(){
             var appformNo=$(this).val();
            
             var data = {
	                	'appformNo' : appformNo	
						};
				// alert(data.appformNo);
             $.ajax( {
					type : 'POST',
					url : '/oa/GetReportAppGoodsServlet',
					data :data,
					success : function(eve) {
                     	 $("#goodAddD").empty();
         	            $.each(eve,function(index,ele){
	            	           
         	            	  //  $("#goodAddD").children().html("");
         	            	  
						        $("#goodAddD").append("<input type='checkBox' checked='checked' value='"+ele.goodsName+"'>"+ele.goodsName+"</input>");
						     });
					},
					dataType : 'json'

				});
           })
		})

</SCRIPT>
	</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

		<form method="post" name="infoForm" onsubmit="return ckform();">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="25" align="center" valign="bottom" class="td06">
						<table width="98%" border="0" cellspacing="3" cellpadding="0">
							<tr>
								<td width="15">
									<img src="/oa/images/index_32.gif" width="9" height="9">
								</td>
								<td valign="bottom" class="title">
									出差报告
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<br>
			<table align="center" width="95%" border="0" cellspacing="0"
				cellpadding="0">
				<tr>
					<td width="90" height="24" class="td_form01">
						姓名
					</td>
					<td nowrap class=td_form02>
						${sessionScope.userInfo.empName }
					</td>
					<td width="90" class="td_form01">
						部门
					</td>
					<td nowrap class=td_form02>
						${sessionScope.userInfo.deptName}
					</td>
				</tr>
				<tr>
					<td height="24" class="td_form01">
						实际用时
					</td>
					<td nowrap class="td_form02">
						<input type="text" name="realTime" class="easyui-validatebox"
							required="true" missingMessage="必填" />(天)
					</td>
					<td class="td_form01">
						返烟时间
					</td>
					<td nowrap class="td_form02" id="backTime">
						<input type="text" id="txtDate" />
					</td>
				</tr>
				<tr>
					<td height="24" class="td_form01">
						行政经办人
					</td>
					<td nowrap class="td_form02">
						王五
					</td>
					<td class="td_form01">
						需要报销的差旅费
					</td>
					<td nowrap class="td_form02">
						<input type="text" name="disMoney" class="easyui-validatebox"
							required="true" missingMessage="必填" />
					</td>
				</tr>
				<tr>
					<td height="24" class="td_form01">
						交通工具
					</td>
					<td nowrap class="td_form02">
						<input type="text" name="trafficTools" />
					</td>
					<td class="td_form01">
						关联的出差申请单
					</td>
					<%--<td nowrap class=td_form02><input type="text" name="appId"/></td>
	--%>
					<td nowrap class=td_form02>
						<input type="hidden" value="${requestScope.appList}"
							name="appListHidden">
						<select name="appFormNo" id="select" class="input_01" >
							<option value="">
								---选择关联的出差申请单---
							</option>
							<c:forEach items="${requestScope.appList}" var="app">
								<option value="${app.formNo}" >
									${app.formNo }
								</option>

							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td height="24" class="td_form01">
						酒店名称
					</td>
					<td nowrap class=td_form02>
						<input type="text" name="hotelName" />
					</td>
					<td class="td_form01">
						交通费
					</td>
					<td nowrap class=td_form02>
						<input type="text" name="trafficFee" class="easyui-validatebox"
							required="true" missingMessage="必填" />
					</td>

				</tr>

				<tr class="b">
					<td rowspan="2" class="td_form01">
						随带物品
					</td>
					<td colspan="3" id="goodAddD">


					</td>
				</tr>



			</table>

			<table width="95%" border="0" align="center" cellpadding="0"
				cellspacing="0">
				<tr class="b">
					<td colspan="2" class="td_form01">
						<strong>回赠礼品</strong>
					</td>
				</tr>
				<tr>
					<td class="td_form01">
						礼品名称
					</td>
					<td class="td_form01"  >
						数量
					</td>

				</tr>
				<tr id="del1">
					<td class="td_form02">
						<input type="text" name="receivedName" />
					</td>
					<td class="td_form02">
						<input type="text" name="receivedCount" class="easyui-validatebox" valueField="number"  invalidMessage='数值'/>
					</td>

				</tr>
			</table>


			<table align="center" width="95%" border="0" cellspacing="0"
				cellpadding="0">
				<tr  class="b">
					
					<td class="td_form01" colspan="2">
						<input type="button" value="增加" id="addCustomsBut" class="buttonface"/>
						<input type="button" value="删除" id="delCustomsBut" class="buttonface"/>
						
						 <strong>见到客户的哪些人</strong>
					</td>
				</tr>
				<tr class="b">
					<td class="td_form01">
						客户姓名
					</td>
					<td class="td_form01">
						客户职位
					</td>

				</tr>
				<tr class="b" id="customsInfo">
					<td class="td_form02">
						<input type="text" name="custom" />
					</td>
					<td class="td_form02" colspan="2">
						<input type="text" name="custom" />
					</td>


				</tr>
			</table>
			<table align="center" width="95%" border="0" cellspacing="0"
				cellpadding="0">
				<tr class="td_form01">
					<td rowspan="7" class="td_form01">
						出差总结
					</td>
					<td>
						是否当场确定意向
					</td>
					<td class="td_form02" rowspan="7"><%--
						<input type="text" name="summery" />
						--%><textarea rows="10" cols="100" name="summery"></textarea>
					</td>
				</tr>
				
				<tr class="td_form01">
				
					<td>
						洽谈的主要事项
					</td>

					
				</tr>
				<tr class="td_form01">
				
					<td>
						后期还是否需要继续跟踪
					</td>
	
					
				</tr>
				<tr class="td_form01">
					
					<td>
						你预计此项目的签署时间
					</td>

					
				</tr>
				<tr class="td_form01">
				
					<td>
						通过此次拜访您的收获和感受
					</td>
	
					
				</tr>
				<tr class="td_form01">
				
					<td>
						给其他同事的建议
					</td>

					
				</tr>
			</table>
			<br>
			<table width="95%" border="0" align="center" cellpadding="0"
				cellspacing="0">
				<tr>
					<td align="center" id="butTd">
						<%--<input name="1" type="button" class="buttonface"
							value=" 保存  "  onClick= "infoForm.action='/oa/TravelReportServlet?state=1';infoForm.submit(); ">
							--%>

						<%--<input name="2" type="button" class="buttonface"
							value=" 保存并提交  " onClick= "infoForm.action='/oa/TravelReportServlet?state=2';infoForm.submit(); ">
							
						   --%>
						<input name="1" type="button" class="buttonface" value=" 保存  "
							onClick="javascript:butSub(this.name); ">
						<input name="2" type="button" class="buttonface" value=" 保存并提交  "
							onClick="javascript:butSub(this.name); ">

						<input type="button" class="buttonface" value="  返回  "
							onClick=window.close();>
					</td>
				</tr>
			</table>
			<br>
		</form>
	</body>
</html>