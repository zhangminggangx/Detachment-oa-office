
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
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<title>我已审核出差申请单详细信息</title>
		<link href="/oa/css/style.css" rel="stylesheet" type="text/css">
		
	<link rel="stylesheet" type="text/css" href="/oa/JQueryeasyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="/oa/JQueryeasyui/themes/icon.css">
	<script type="text/javascript" src="/oa/JQueryeasyui/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="/oa/JQueryeasyui/jquery.easyui.min.js"></script>


		<script type="text/javascript" src="/oa/WebRoot/js/jquery-1.4.2.js"></script>
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

	
</SCRIPT>
	</head>

	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

		<div class="main">
			<div class="global-width">

				<div class="action">
					<div class="t">
					<table  width="95%" border="0" align="center" cellpadding="0" cellspacing="0"><tr class="b">
			
			
				<td class="td_form01"><p class="sp1"><strong>我已审核出差申请单详细信息</strong></p></td>
				
			</tr></table>
					
						
					</div>
					<div class="pages">

						<!--增加报销单 区域 开始-->
						<form id="form1" name="infoForm" method="post">
						<table  width="95%" border="0" align="center" cellpadding="0" cellspacing="0"><tr class="b">
			
			
				<td class="td_form01"><p class="sp1"><strong>基本信息</strong></p></td>
				
			</tr></table>
							<table width="95%" border="0" align="center" cellpadding="0"
								cellspacing="0">
							
								<tr>
									<td class="td_form01">
										填写人：
									</td>
									<td class="td_form02">
										${requestScope.employee.empName}
									</td>
									<td class="td_form01">
										填报时间：
									</td>
									<td class="td_form02">
										09年12月 16：30
									</td>
								</tr>
								<tr>
									<td class="td_form01">
										出差事由：
									</td>
									<td class="td_form02">
										${requestScope.travelApp.travelReason}
									</td>
									<td class="td_form01">
										计划用时：
									</td>
									<td class="td_form02">
									${requestScope.travelApp.planTime}天
									</td>
								</tr>
								<tr>
									<td class="td_form01">
										出差地点：
									</td>
									<td class="td_form02">
										${requestScope.travelApp.travelPlace}
									</td>
									<td class="td_form01">
										离烟时间：
									</td>
									<td class="td_form02">
										${requestScope.travelApp.leaveTime}
									</td>
								</tr>
								<tr>
									<td colspan="2" class="td_form01">
										随带物品：
									</td>
									<td class="td_form02">
										<c:forEach items="${requestScope.goodsList}" var="l">
                    ${l.goodsName }
                    </c:forEach>
									</td>

								</tr>
							</table>
						
							<table width="95%" border="0" align="center" cellpadding="0"
								cellspacing="0">
								<tr>
									<td class="td_form01">
										赠送礼品名称
									</td>

									<td class="td_form01">
										单价
									</td>
								</tr>
								<c:forEach items="${requestScope.presentList}" var="list">
									<tr>
										<td class="td_form02">
											${list.goodsName }
										</td>

										<td class="td_form02">
											${list.price }
										</td>
									</tr>
								</c:forEach>

							</table>
										<br/>
							<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr class="b">
			
			
				<td  colspan="4"  class="td_form01"><p class="sp1"><strong>行政填写</strong></p></td>
				
			</tr>
			<tr class="b">
				<td width="90" class="td_form01">交通工具</td>
				<td colspan="3" class="td_form02">
					${requestScope.travelApp.trafficTools}
			</tr>
			<tr class="b">
				<td width="90" class="td_form01">票价</td>
				<td class="td_form02" >
			${requestScope.travelApp.trafficFee}
				</td>
				<td width="90" class="td_form01">订票时间</td>
				<td class="td_form02">
				${requestScope.travelApp.orderTime}
				</td>
			</tr>
			<tr class="b">
				<td width="90" class="td_form01">酒店名称</td>
				<td class="td_form02">
				${requestScope.travelApp.hotelName}
				</td>
				<td width="90" class="td_form01"> 房费</td>
				<td class="td_form02">
					${requestScope.travelApp.roomFee}
				</td>
			</tr>
			<tr class="b">
				<td colspan="2" width="90" class="td_form01">去成方案</td>
				<td width="90" colspan="2"  class="td_form01">返程方案</td>
			</tr>
			<tr class="b">
				<td colspan="2" class="td_form02">
				${requestScope.travelApp.leavePlan}
				</td>
				<td colspan="2" class="td_form02">
					${requestScope.travelApp.backPlan}
				</td>
			</tr>
			
		</table>
							
							<br/>
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
							
				

						</form>
						
						
					<br/>
						<!--增加报销单 区域 结束-->
					</div>
				</div>
			</div>
		</div>

		<div class="copyright">
			Copyright &nbsp; &copy; &nbsp;
		</div>

	</body>
</html>