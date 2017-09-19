<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="f" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>出差申请明细</title>
<link href="/oa/css/style.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="/oa/js/jquery-1.4.2.js"></script>
<script type="text/javascript" src="/oa/travelJs/travelapp.js"></script>
<link rel="stylesheet" type="text/css" href="/oa/JQueryeasyui/themes/default/easyui.css"/>
<link rel="stylesheet" type="text/css" href="/oa/JQueryeasyui/themes/icon.css"/>
<script type="text/javascript" src="/oa/JQueryeasyui/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="/oa/JQueryeasyui/jquery.easyui.min.js"></script>
 


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


function ckplanTime() {
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
	}
	
	function ckform() {
		if (ckplanTime() && ckleaveTime()) {
			return ckplanTime() && ckleaveTime();
		} else {
			alert("注意必填项");
			return ckplanTime() && ckleaveTime();
	}
	}
	function butSub(state)
	{
		if(ckform()){
		infoForm.action='/oa/UpdateTravelAppServlet?state='+state+'&&appId='+${requestScope.travelApp.appId};
		infoForm.submit();
	    }
	    else{
               alert("注意必填项 ");
		    }
	}

</script>
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

<div class="main"><div class="global-width">
	
	
    <div class="action">
    	<div class="t">
    	
    	
    	</div>
   		<div class="pages">
   		<br />
   		<form  name="infoForm" method="post" >
   		<table  width="95%" border="0" align="center" cellpadding="0" cellspacing="0"><tr class="b">
			
			
				<td class="td_form01"><p class="sp1"><strong>出差申请明细</strong></p></td>
				
			</tr></table>
			<br/>
        	<!--增加报销单 区域 开始-->
        	<c:if test="${(2==requestScope.travelApp.state)||(4==requestScope.travelApp.state)}">
        	<table  width="95%" border="0" align="center" cellpadding="0" cellspacing="0"><tr class="b">
			
			
				<td class="td_form01"><p class="sp1"><strong>基本信息</strong></p></td>
				
			</tr></table>
                <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
                 
                  <tr>
                    <td  class="td_form01">填写人：</td><td class="td_form02">${sessionScope.userInfo.empName}</td>
                    <td   class="td_form01">填报时间：</td><td class="td_form02">09年12月 16：30</td>
                  </tr>
                  <tr>
                    <td  class="td_form01"> 出差事由：</td><td class="td_form02">${requestScope.travelApp.travelReason}</td>
                    <td  class="td_form01">状态：</td><td class="td_form02">
                    <c:if test="${requestScope.travelApp.state==1}">草稿</c:if>
                    <c:if test="${requestScope.travelApp.state==2}">待审核</c:if>
                    <c:if test="${requestScope.travelApp.state==3}">打回</c:if>
                    <c:if test="${requestScope.travelApp.state==4}">审核完毕</c:if>
                  </td>
                  </tr>
				   <tr>
                    <td  class="td_form01">出差地点：</td><td class="td_form02">${requestScope.travelApp.travelPlace}</td>
                    <td  class="td_form01">离烟时间：</td><td class="td_form02">${requestScope.travelApp.leaveTime}</td>
                  </tr>
				     <tr>
                    <td colspan="2"  class="td_form01">随带物品：</td><td class="td_form02"><c:forEach 
                    items="${requestScope.goodslist}" var="l">
                    ${l.goodsName }
                    </c:forEach></td>
                
                  </tr>
                </table>
          <br/>
                <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td  class="td_form01">赠送礼品名称</td>
                    <td  class="td_form01">数量</td>
                    <td  class="td_form01">单价</td>
                  </tr>
                 <%-- --%>  <c:forEach items="${requestScope.prelist}"var="list">
                  <tr>
                    <td class="td_form02">${list.goodsName }</td>
                    <td class="td_form02">${list.store }</td>
                    <td class="td_form02">${list.price }</td>
                  </tr>
                  </c:forEach>
                   
                </table><br/><table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
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
                </table>
               <br/>   </c:if>
                
                <c:if test="${(1==requestScope.travelApp.state)||(3==requestScope.travelApp.state)}">
                <table align="center" width="95%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td width="182" height="24" class="td_form01">出差人</td>
		<td nowrap class=td_form02>${sessionScope.userInfo.empName}</td>
		<td width="182" class="td_form01">部门</td>
		<td nowrap class=td_form02>${sessionScope.userInfo.deptName}</td>
	</tr>
	<tr>
		<td height="24" class="td_form01">出差目的</td>
		<td nowrap class=td_form02><input type="text"name="travelReason" value="${requestScope.travelApp.travelReason}"/></td>
		<td class="td_form01">出差地点</td>
		<td nowrap class=td_form02><input type="text" name="travelPlace"value="${requestScope.travelApp.travelPlace}"/></td>
	</tr>
	<tr >
	<td height="24" class="td_form01">计划用时(天)</td>
	<td nowrap class="td_form02">
		<input type="text" name="planTime"class="easyui-validatebox" required="true"
			missingMessage="必填" value="${requestScope.travelApp.planTime}"
		 />
	</td>
	<td height="24" class="td_form01">离烟时间</td>
	<td nowrap class=td_form02>
		<input type="text" name="leaveTime" id="lt"class="easyui-validatebox" required="true"
			missingMessage="必填" value="${requestScope.travelApp.leaveTime}"
		/>
	</td>
</tr>
</table>
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
<tr>
                    <td colspan = "3"class="td_form01"><strong>您申请的物品</strong></td>
                   
                   
                  </tr>
                
             
                  <tr>
                  
                    <td colspan="2"  class="td_form01">随带物品：</td><td class="td_form02">
                     <c:forEach items="${requestScope.goodslist}" var="list"> 
                   <input type="checkbox" name="Name" value="${list.goodsName }" checked="checked"/>${list.goodsName }
                   <input type="hidden" name="goodsName" value="${list.goodsName }"/>
                    </c:forEach>
                    <c:forEach items="${requestScope.inventories2}" var="l"> 
                   <input type="checkbox" name="Name" value="${l.goodsName }" />${l.goodsName }
                   <input type="hidden" name="goodsName" value="${l.goodsName }"/>
                    </c:forEach>
              
                    </td>
              
                  </tr>
                   
                </table>
                <br/>
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">

                                    <tr><td colspan = "2"class="td_form01"> <strong>您已申请的礼品</strong></td></tr>
                  <tr>
                    <td  class="td_form01">赠送礼品名称</td>
                    
                    <td  class="td_form01">单价</td>
                 
                    
                  </tr>
                  <input type="hidden" name="oldlength" value="${f:length(requestScope.prelist)}"/>
<%--                  <lable>${f:length(requestScope.prelist)}</lable>--%>
                  <c:forEach items="${requestScope.prelist}"var="list">
                  <tr>
                    <td class="td_form02" align="center">${list.goodsName }</td>
                    
                    <td class="td_form02" align="center">${list.price }
                    <input type="hidden" name="oldn" value="${list.goodsName }"/></td>
                  </tr></c:forEach>
                 
                  

</table>
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">


			<tr class="b">
				<td width="90" class="td_form01">
					<input type="button" value="增加" id="add"/>
					<input type="button" value="删除" id="del"/>
				</td>
				<td colspan="6" class="td_form01"><strong >请填写您想再次申请的礼品申请礼品（礼品申请数量不可大于库存量）</strong></td>
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
				<td class="td_form02"><input type="text" name="number" value="1"/></td>
				
			</tr>
			
		</table>
		
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
               </c:if>
            <!--增加报销单 区域 结束-->
        </div>
    </div>
</div></div>

<div class="copyright">Copyright  &nbsp;   &copy;  &nbsp; </div>

</body>
</html>
