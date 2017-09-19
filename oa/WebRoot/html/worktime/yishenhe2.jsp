<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>出差报告详细信息</title>
<link href="/oa/css/style.css" rel="stylesheet" type="text/css">
<SCRIPT language=JavaScript type=text/JavaScript>
function windowOpen(theURL,winName,features,width,hight,scrollbars,top,left) 
{
  var parameter="top="+top+",left="+left+",width="+width+",height="+hight;
  if(scrollbars=="no")
 {parameter+=",scrollbars=no";}
  else
 {parameter+=",scrollbars=yes";}
  window.open(theURL,winName,parameter);
}
</SCRIPT>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="25" align="center" valign="bottom" class="td06"><table width="98%" border="0" cellspacing="3" cellpadding="0">
      <tr>
        <td width="15"><img src="/oa/images/index_32.gif" width="9" height="9"></td>
        <td valign="bottom" class="title">出差报告详细信息</td>
      </tr>
    </table></td>
  </tr>
</table>
<br>


<table width="95%" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<tr>
				<td width="90" height="24" class="td_form01">
					出差人
				</td>
				<td class="td_form02">
					${requestScope.employee.empName }
					<input type="hidden" name="reportFormNo" value="${requestScope.travelReport.formNo}">
					<input type="hidden" name="wsId" value="${requestScope.wsId}">
				</td>
			</tr>
			<tr>
				<td height="24" class="td_form01">
					部门
				</td>
				<td class="td_form02">
						${requestScope.employee.deptName}
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
                 ${goods.goodsName }
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

	
			<%--<table width="95%" border="0" align="center" cellpadding="0"
				cellspacing="0">

				<tr>
					<td>
						  <input name="2" type="button" class="buttonface"
							value=" 通过  "  onClick= "javascript:butSub(this.name); ">
						   <input name="3" type="button" class="buttonface"
							value=" 打回  " onClick= "javascript:butSub(this.name); ">
							 <input  type="button" class="buttonface"
							value="  返回  " onClick=	window.close();>
					</td>
				</tr>
			</table>
--%></body>
</html>
