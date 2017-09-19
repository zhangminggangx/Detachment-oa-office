<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="/WEB-INF/lib/pager-taglib.jar" prefix="pg"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" " http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns=" http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>无标题文档</title>
		<link href="/oa/css/style.css" rel="stylesheet" type="text/css" />
		<script language="javascript" src="/oa/js/clientSideApp.js"></script>
		<script language="JavaScript" type="text/javascript"
			src="/oa/js/win_center.js"></script>

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
		<script type="text/javascript">
	$(function() {
		$("a[name='delDoc']").click(function(e) {
			var docId = $(this).attr("id");
			var ret = window.confirm("确认要删除吗？");
			if (ret == 1) {
				$.ajax( {
					type : 'get',
					url : 'DeleteDocServlet?docId=' + docId,
					success : function(ret) {
						if (ret == 0)
							alert("删除失败");
						else {
							alert("删除成功");
							//$(delBtn).parent().parent().remove();
					window.location.href = "/oa/ViewMyDocServlet";
				}
			}
				});
			}
		});

		 var mydialog2=null;
		 
	     $("a[name='link']").click(function(){
	         var docId=$(this).prev().val();
	        if(mydialog2==null){
	         
	     	$("#dd").css("display", "block");	
	         mydialog2=$("#dd").dialog({ 
	         title: '对话框', 
	         iconCls:"icon-edit", 
	         collapsible: true, 
	         minimizable: true, 
	         maximizable: true, 
	         resizable: true, 
	         width: 350, 
	         height: 150, 
	         modal: true, 
	         href: "/oa/ViewAppendixServlet?docId="+docId, 
	         buttons: [{ 
	             text: '取消', 
	             iconCls: 'icon-ok', 
	             handler: function () { 
	         	  mydialog2.dialog('close'); 
	             } 
	         }] 
	     }); 
	        }else{
	            mydialog2.dialog({href:"/oa/ViewAppendixServlet?docId="+docId});
	     	    mydialog2.dialog('refresh');
	     	   
	            }   
	     });
	     
	});
</script>
	</head>
	<body>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="25" align="center" valign="bottom" class="td06">
					<table width="98%" border="0" cellspacing="3" cellpadding="0">
						<tr>
							<td width="15">
								<img src="/oa/images/index_32.gif" width="9" height="9" />
							</td>
							<td valign="bottom" class="title" align="left">
								文档操作
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<div width="95%" border="0" align="center" cellpadding="0"
			cellspacing="0" style="margin-top: 10px;">

			<form action="QueryDocServlet" method="post">
			  
				<table width="95%" border="0" align="center" cellpadding="0"
					cellspacing="0">
					<tr>
						<td class="td_page">
							要搜索的文档标题：
						</td>
						<td class="td_page">
							<input type="text" name="title" />
						</td>
						<td class="td_page">
							备注包含的文字：
						</td>
						<td class="td_page">
							<input type="text" name="note" />
						</td>
					</tr>
					<tr id="subtr">
						<td colspan="4" class="td_page">
							<input type="submit" value="查询" />
							<input type="reset" value="重置" />
						</td>
					</tr>
				</table>
			</form>
		</div>
		<div id="center" width="95%" border="0" align="center" cellpadding="0"
			cellspacing="0" style="margin-top: 10px;">
			 <pg:pager  maxPageItems="3" url="/oa/ViewMyDocServlet">
				<table width="95%" border="0" align="center" cellpadding="0"
					cellspacing="0" id="table1">
					<tr>
						<td class="td_top">
							文件名称
						</td>
						<td class="td_top">
							所在文件夹
						</td>
						<td class="td_top">
							备注
						</td>
						<td class="td_top">
							所有者
						</td>
						<td class="td_top">
							创建时间
						</td>
<%--						<td class="td_top" width="80px">--%>
<%--							附件--%>
<%--						</td>--%>
						<td class="td_top">
							<label >删除</label>
						</td>
					</tr>
					<%--				${not empty requestScope.documents}--%>
					<c:if test="${not empty requestScope.documents}">
					
							<c:forEach items="${requestScope.documents}" var="doc">
							   <pg:item>
								<tr>
									<td class="td07">
									<input type="hidden" value="${doc.docId}"/>
									<a name="link" href="#">${doc.title }</a>
									</td>
									<td class="td07">
										${doc.virtualPath }
									</td>
									<td class="td07">
										${doc.note }
									</td>
									<td class="td07">
										${doc.userInfo.empName}
									</td>
									<td class="td07">
										${doc.createTime }
									</td>
									<td class="td07">
										<a name="delDoc" id="${doc.docId}" href="#" style="color: green;" >删除</a>
									</td>
								</tr>
								   </pg:item>
						</c:forEach>
					</c:if>
					<tr>
		<td align="right" colspan="7">
		<pg:index>
			<pg:first><a href="${pageUrl}">第一页</a></pg:first>
			<%--pageUrl内容的构成由pager的url属性以及在其后面附加offset参数
			该参数的值是导航标签（first、last、next、prev，pages）根据当前页和maxPageItems的值计算出的偏移量
			 --%>
			<pg:prev><a href="${pageUrl}">上一页</a></pg:prev>
			<pg:pages>

			<a href="${pageUrl}">[${pageNumber }]</a>
			<%--pageNumber是pg:pages标签输出的变量，用于存放每次循环的页码号的变量，
			加上超链接表示到单击这个页码号就可以导航到指定的页面上 --%>
			</pg:pages>
			<pg:next><a href="${pageUrl}">下一页</a></pg:next>
			<pg:last><a href="${pageUrl }">最后一页</a></pg:last>
		</pg:index>
		</td>
	</tr>
				</table>
				</pg:pager>
		</div>
		<div id="dd" style="display: none">
		
		</div>
		
	</body>
</html>