<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		<title>出差报告详细信息</title>
		<link href="/oa/css/style.css" rel="stylesheet" type="text/css"/>

		<link rel="stylesheet" type="text/css"
			href="/oa/JQueryeasyui/themes/default/easyui.css"/>
		<link rel="stylesheet" type="text/css" href="/oa/JQueryeasyui/themes/icon.css"/>
		<script type="text/javascript"
			src="/oa/JQueryeasyui/jquery-1.4.4.min.js"></script>
		<script type="text/javascript"
			src="/oa/JQueryeasyui/jquery.easyui.min.js"></script>


		<script type="text/javascript" src="/oa/js/jquery-1.4.2.js"></script>
		<script language="javascript" src="/oa/js/clientSideApp.js"></script>

		<script  type="text/javaScript">
function windowOpen(theURL,winName,features,width,hight,scrollbars,top,left) 
{
  var parameter="top="+top+",left="+left+",width="+width+",height="+hight;
  if(scrollbars=="no")
 {parameter+=",scrollbars=no";}
  else
 {parameter+=",scrollbars=yes";}
  window.open(theURL,winName,parameter);
}

function ckRealTime() {
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
}
function ckform() {

		return ckRealTime() && ckTrafficFee() && ckDisMoney();
	
}

function butSub(state)
{
	if(ckform()){
	infoForm.action='/oa/UpdateReportServlet?state='+state;
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
							<td width="15">
								<img src="/oa/images/index_32.gif" width="9" height="9">
							</td>
							<td valign="bottom" class="title">
								出差报告详细信息
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<br>

		<c:if
			test="${(2==requestScope.travelReport.state)||(4==requestScope.travelReport.state)}">
			<table width="95%" border="0" align="center" cellpadding="0"
				cellspacing="0">
				<tr>
					<td  height="24" class="td_form01">
						出差人
					</td>
					<td class="td_form02">
						${sessionScope.userInfo.empName }
					</td>
				</tr>
				<tr>
					<td height="24" class="td_form01">
						部门
					</td>
					<td class="td_form02">
						${sessionScope.userInfo.deptName}
					</td>
				</tr>
				<tr>
					<td height="24" class="td_form01">
						实际用时
					</td>
					<td class="td_form02">
						${requestScope.travelReport.realTime}
					</td>
				</tr>
				<%--	
   <tr>
     <td height="24" class="td_form01">返烟时间</td>
     <td class="td_form02">${requestScope.travelReport.realTime}</td>
   </tr>	
   --%>
				<tr>
					<td height="24" class="td_form01">
						交通工具
					</td>
					<td class="td_form02">
						${requestScope.travelReport.trafficTools}
					</td>
				</tr>
				<tr>
					<td height="24" class="td_form01">
						交通费
					</td>
					<td class="td_form02">
						${requestScope.travelReport.trafficFee}
					</td>
				</tr>
				<tr>
					<td height="24" class="td_form01">
						行政经办人
					</td>
					<td class="td_form02">
						行政部
					</td>
				</tr>
				<tr>
					<td height="24" class="td_form01">
						需要报销的差旅费
					</td>
					<td class="td_form02">
						${requestScope.travelReport.disMoney}
					</td>
				</tr>
				<%--	
   <tr>
     <td height="24" class="td_form01">实报差旅费</td>
     <td class="td_form02">1000</td>
   </tr>	
   --%>
				<tr>
					<td height="24" class="td_form01">
						关联的出差申请单
					</td>
					<td class="td_form02">
						${requestScope.travelApp.formNo}
					</td>
				</tr>
				<tr>
					<td height="24" class="td_form01">
						随带物品
					</td>
					<td class="td_form02">
						<c:forEach items="${requestScope.goodsList}" var="goods">
         ${goods.goodsName}
         </c:forEach>
					</td>
				</tr>
				<tr>
					<td height="24" class="td_form01">
						受赠礼品
					</td>
					<td class="td_form02">
						${requestScope.received.recName }
					</td>
				</tr>

			</table>
			<table align="center" width="95%" border="0" cellspacing="0"
				cellpadding="0">
				<tr class="td_form01">
					<td colspan="4" class="td_form01">
						<strong>见到客户信息</strong>
					</td>
				</tr>
				<tr class="b">
					<td class="td_form02" colspan="4">
						${requestScope.travelReport.customs}
					</td>
				</tr>

			</table>
			<table align="center" width="95%" border="0" cellspacing="0"
				cellpadding="0">
				<tr class="td_form01">
					<td rowspan="6" class="td_form01" width="30%">
						出差总结
					</td>
					<td class="td_form02">
						${requestScope.travelReport.summery}
					</td>
				</tr>

			</table>

			<table width=95% border=0 align=center cellpadding=0 cellspacing=0>
					<tr align="left" nowrap>
						<tr>
							<td width="90" height="24" class="td_form01">
								审批人
							</td>
							<td width="180" class="td_form01">
								意见
							</td>
							<td class="td_form01">
								情况
							</td>
							<td class="td_form01">
								时间
							</td>

						</tr>
						<c:forEach items="${requestScope.approvedResults}" var="ar">
							<tr>
								<td width="90" height="24" class="td_form02">
									${ar.employee.empName }
								</td>
								<td width="180" class="td_form02">
									${ar.approveReason }
								</td>
								<td class="td_form02">
									${ar.result.resName }
								</td>
								<td class="td_form02">
									${ar.approveTime }
								</td>

							</tr>

						</c:forEach>
				</table>
			<p>
				&nbsp;
			</p>
			
		</c:if>






		<%--下为新创建和打回，上为其他状态--%>




		<c:if
			test="${(1==requestScope.travelReport.state)||(3==requestScope.travelReport.state)}">
			<form method="post" name="infoForm" onsubmit="return ckform();">

				<br>
				<table align="center" width="95%" border="0" cellspacing="0"
					cellpadding="0">
					<tr>
						<td width="90" height="24" class="td_form01">
							姓名
							<input type="text" style="display: none" name="reportFormNo"
								value="${requestScope.travelReport.formNo}"/>
							<input type="text" style="display: none" name="reportId"
								value="${requestScope.travelReport.reportId}"/>
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
							<input type="text" name="realTime"
								value="${requestScope.travelReport.realTime}"
								class="easyui-validatebox" required="true" missingMessage="必填" />
						</td>
						<%--
					<td class="td_form01">
						返烟时间
					</td>
					<td nowrap class="td_form02" id="backTime">
						<input type="text" id="txtDate" />
					</td>
				--%>
					</tr>
					<tr>
						<td height="24" class="td_form01">
							行政经办人
						</td>
						<td nowrap class="td_form02">
							行政部经理
						</td>
						<td class="td_form01">
							需要报销的差旅费
						</td>
						<td nowrap class="td_form02">
							<input type="text" name="disMoney"
								value="${requestScope.travelReport.disMoney}"
								class="easyui-validatebox" required="true" missingMessage="必填" />
						</td>
					</tr>
					<tr>
						<td height="24" class="td_form01">
							交通工具
						</td>
						<td nowrap class="td_form02">
							<input type="text" name="trafficTools"
								value="${requestScope.travelReport.trafficTools}" />
						</td>
						<td class="td_form01">
							关联的出差申请单
						</td>
						<%--<td nowrap class=td_form02><input type="text" name="appId"/></td>
	--%>
						<td nowrap class=td_form02>
							<select name="appFormNo" id="select" class="input_01">
								<c:forEach items="${requestScope.appList}" var="app">
									<option value="${app.formNo}">
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
							<input type="text" name="hotelName"
								value="${requestScope.travelReport.hotelName}" />
						</td>
						<td class="td_form01">
							交通费
						</td>
						<td nowrap class=td_form02>
							<input type="text" name="trafficFee"
								value="${requestScope.travelReport.trafficFee}"
								class="easyui-validatebox" required="true" missingMessage="必填" />
						</td>

					</tr>

					<tr class="b">
						<td rowspan="2" class="td_form01">
							随带物品
						</td>
						<td colspan="3">
							<c:forEach items="${requestScope.goodsList}" var="goods">

								<input type="checkbox" name="goods" checked="checked" value="${goods.goodsName}" />
							  ${goods.goodsName}
                            </c:forEach>

							<%--<input type="checkbox" name="goods" value="优盘" />
							优盘
							<input type="checkbox" name="goods" value="无线网卡" />
							无线网卡
							<input type="checkbox" name="goods" value="笔记本电脑" />
							笔记本电脑
							<input type="checkbox" name="goods" value="录音笔 " />
							录音笔
						--%>
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
						<td class="td_form01">
							数量
						</td>

					</tr>
					<tr id="del1">
						<td class="td_form02">
							<input type="text" name="receivedName"
								value="${requestScope.received.recName }" />
						</td>
						<td class="td_form02">
							<input type="text" name="receivedCount"
								value="${requestScope.received.reccount}" />
						</td>

					</tr>
				</table>


				<table align="center" width="95%" border="0" cellspacing="0"
					cellpadding="0">
					<tr class="td_form01">
						<td class="td_form01">
							<strong>见到客户的哪些人</strong>
						</td>
					</tr>
					<tr class="b">
						<td class="td_form01">
							<input type="text" name="custom"
								value="${requestScope.travelReport.customs}" />
						</td>
					</tr>
				</table>
				<table align="center" width="95%" border="0" cellspacing="0"
					cellpadding="0">
					<tr class="td_form01">
						<td rowspan="6" class="td_form01">
							出差总结
						</td>
						<td rowspan="6" class="td_form01">
							<textarea rows="6" cols="45" name="summery">
					   ${requestScope.travelReport.summery}
					   </textarea>
							<br />
						</td>

					</tr>

				</table>
				<br>
				<table width="95%" border="0" align="center" cellpadding="0"
					cellspacing="0">
					<tr>
						<td align="center" id="butTd">
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
		</c:if>
	</body>
</html>
