<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://jsptags.com/tags/navigation/pager"  prefix="pg"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" " http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns=" http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>个人通讯录</title>
		<link href="/oa/css/style.css" rel="stylesheet" type="text/css" />
		<link type="text/css" rel="stylesheet"
			href="/oa/JQueryeasyui/themes/default/easyui.css" />
		<link type="text/css" rel="stylesheet"
			href="/oa/JQueryeasyui/themes/icon.css" />
		<script type="text/javascript"
			src="/oa/JQueryeasyui/jquery-1.8.0.min.js"></script>
		<script type="text/javascript"
			src="/oa/JQueryeasyui/jquery.easyui.min.js"></script>
		<script type="text/javascript"
			src="/oa/JQueryeasyui/locale/easyui-lang-zh_CN.js"></script>
		<script language=JavaScript type=text/JavaScript>
		$(function() {



			$("#allForm input[name=submitAll]").click(function(){
				$("#allForm").attr("action","/oa/SearchSinCommServlet");
			});
			
			$("#allForm input[name=submitSelect]").click(function(){
				$("#allForm").attr("action","/oa/SearchSinCommByServlet");
				
				
			});
			

			
			$(".del").click(function(e) {
				var ret=window.confirm("确认要删除吗？");
				var commId = $(this).attr("name");
				if(ret==1){
					window.location.href="/oa/RemoveSinComm?commId="+commId; 
				}
			});


			
			
		
		});
</script>


  </head>
  
  <body>
   
			<form action="" id="allForm" method="post">				
					<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
						<tr>
							<td class="td_page">
								类型：
							<select name="typeName">

								<c:if test="${not empty requestScope.typeList}">
									<c:forEach items="${ requestScope.typeList}" var="type">
										<c:if test="${type.tname!='公司内部'}">
											<option value="${type.tid}">
												${type.tname}
											</option>
										</c:if>
									</c:forEach>
								</c:if>
							</select>
							<input name="submitSelect" type="submit" class="buttonface" value="查询  " />
								<input name="submitAll" type="submit" class="buttonface" value="查询个人全部通讯录" />
							</td>
						</tr>
					</table>
					</form>
					<div style="height: 400px;" id="page">
					
					<pg:pager maxPageItems="10" url="/oa/SearchSinCommServlet" >
					<%--
      pager 两个常用属性maxPageItems：显示最多的纪录数/页 ，实现一页中出现item元素的数量控制
      url:分页的链接地址（表示当你单击分页导航所转向的页面）
    --%><table width="95%" border="0" align="center" cellpadding="0"
					cellspacing="0" class="table01">
					
					<tr>
						
						<td class="td_top">
							姓名
						</td>
						<td class="td_top">
							联系电话
						</td>
						<td class="td_top">
							Email
						</td>
						<td class="td_top">
							部门
						</td>
						<td class="td_top">
							职位
						</td>
						<td class="td_top">
							类型
						</td>
						<td class="td_top">
							删除
						</td>
					</tr>
					<c:if test="${not empty requestScope.sinList}">
					<c:forEach items="${requestScope.sinList}" var="sinComm">
					<pg:item>
							<tr>
								
								<td class="td07">
									${sinComm.comm.empName }
								</td>
								<td class="td07">
									${sinComm.comm.empMobile }
								</td>
								<td class="td07">
									${sinComm.comm.email }
								</td>
								<td class="td07">
									${sinComm.comm.department }
								</td>
								<td class="td07">
									${sinComm.comm.position }
								</td>
								<td class="td07">
									${sinComm.commTypes.tname }
								</td>
								<td class="td07">
									<a href="#" name="${sinComm.comm.commId}" class="del">删除</a>
								</td>
							</tr>
							</pg:item>
							</c:forEach>
						</c:if>
						<tr>
							<td align="right" colspan="7">
								<pg:index>
									<pg:first>
										<a href="${pageUrl}">第一页</a>
									</pg:first>
									<%--pageUrl内容的构成由pager的url属性以及在其后面附加offset参数
			该参数的值是导航标签（first、last、next、prev，pages）根据当前页和maxPageItems的值计算出的偏移量
			 --%>
									<pg:prev>
										<a href="${pageUrl}">上一页</a>
									</pg:prev>
									<pg:pages>

										<a href="${pageUrl}">[${pageNumber }]</a>
										<%--pageNumber是pg:pages标签输出的变量，用于存放每次循环的页码号的变量，
			加上超链接表示到单击这个页码号就可以导航到指定的页面上 --%>
									</pg:pages>
									<pg:next>
										<a href="${pageUrl}">下一页</a>
									</pg:next>
									<pg:last>
										<a href="${pageUrl }">最后一页</a>
									</pg:last>
								</pg:index>
							</td>
						</tr>
					</table>
				</pg:pager>
				</div>
  </body>
</html>
