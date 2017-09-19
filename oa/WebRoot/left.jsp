<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>Untitled Document</title>
<link href="/oa/css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" type="text/javascript" src="/oa/js/tree.js"></script>
</head>

<body>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center" valign="top" class="td03"><br>
      <table width="90%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="25" class="F01"><p><img src="/oa/images/index_35.gif" width="12" height="16" align="absmiddle"><strong>淡定OA办公</strong></p>
          </td>
        </tr>
        <tr>
          <td height="2" background="/oa/images/index_39.gif"><img src="/oa/images/spacer.gif" width="1" height="1"></td>
        </tr>
      </table>
        <table width="90%" border="0" cellpadding="0" cellspacing="0" class="td01">
          <tr>
            <td width="12">&nbsp;</td>
            <td width="628"><p><img src="/oa/images/spacer.gif" width="1" height="1"><img src="/oa/images/index_35.gif" width="12" height="16" align="absmiddle"><strong>快速通道</strong></p>
			
          <tr>
            <td background="/oa/images/index_41.gif">&nbsp;</td>
            <td>
              
            	
            	
            	<table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td>
                	               
                	
                   <!--代码开始menu 列表-->			
				  
				
                     
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="19"><img id="top_3" onClick="menu('menu_3','top_3');" src="/oa/images/tree_11.gif" width="19" height="20"></td>
                          <td width="19"><img src="/oa/images/tree_27.gif" width="19" height="20"></td>
                          <td nowrap>出差管理</td>
                        </tr>
                      </table>
					  	  <div id="menu_3" style="DISPLAY: none">
					  <table width="100%" border="0" cellspacing="0" cellpadding="0">
						  <tr>
							<td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"></td>
							<td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"></td>
							<td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"></td>
							<td nowrap><a href="/oa/html/worktime/createleavelist1.jsp" target="mainFrame" class="a03">我要出差</a></td>
						  </tr>
						</table>
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
						  <tr>
							<td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"></td>
							<td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"></td>
							<td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"></td>
							<td nowrap><a href="/oa/html/worktime/leavelist_32.jsp" target="mainFrame" class="a03">出差查询</a></td>
						  </tr>
						</table>
						<c:forEach items="${sessionScope.moduleAcls}" var="ma">
						<c:if test="${ma.module.modId==16}">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
						  <tr>
							<td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"></td>
							<td width="19"><img src="/oa/images/tree_23.gif" width="19" height="20"></td>
							<td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"></td>
							<td nowrap><a href="/oa/html/worktime/leavelist_31.jsp" target="mainFrame" class="a03">我的审核</a></td>
						  </tr>
						</table>
						</c:if>
						</c:forEach>
						</div>
						
                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="19"><img id="top_2" onClick="menu('menu_2','top_2');" src="/oa/images/tree_11.gif" width="19" height="20"></td>
                          <td width="19"><img src="/oa/images/tree_27.gif" width="19" height="20"></td>
                          <td nowrap>我的文档</td>
                        </tr>
                      </table>
					  <div id="menu_2" style="DISPLAY: none">
					  <table width="100%" border="0" cellspacing="0" cellpadding="0">
						  <tr>
							<td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"></td>
							<td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"></td>
							<td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"></td>
							<td nowrap><a href="/oa/html/media/applicationlist_1.jsp" target="mainFrame" class="a03">新建文档</a></td>
						  </tr>
						</table>
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
						  <tr>
							<td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"></td>
							<td width="19"><img src="/oa/images/tree_23.gif" width="19" height="20"></td>
							<td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"></td>
							<td nowrap><a href="/oa/ViewMyDocServlet" target="mainFrame" class="a03">查看文档</a></td>
						  </tr>
						</table>
					  </div>
					  
					    
					
					
					
					
					
					
					
					
					
					
					 	  <c:forEach items="${sessionScope.moduleAcls}" var="ma">
                       	<c:if test="${ma.module.modId==9}">
				   <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="19"><img id="top_4" onClick="menu('menu_4','top_4');" src="/oa/images/tree_11.gif" width="19" height="20"></td>
                          <td width="19"><img src="/oa/images/tree_27.gif" width="19" height="20"></td>
                          <td nowrap>人事管理</td>
                        </tr>
                      </table>
					  <div id="menu_4" style="DISPLAY: none">
					  <table width="100%" border="0" cellspacing="0" cellpadding="0">
						  <tr>
							<td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"></td>
							<td width="19"><img src="/oa/images/tree_23.gif" width="19" height="20"></td>
							<td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"></td>
							<td nowrap><a  href="/oa/ViewEmployeeListServlet?fcode=917002" target="mainFrame" class="a03">人事管理操作</a></td>
						  </tr>
						</table>
						
						</div>
						</c:if>
				 </c:forEach>
                     
					
                     
                     <table width="100%" border="0" cellspacing="0" cellpadding="0">
                       <tr>
                         <td width="19"><img id="top_9" onClick="menu('menu_9','top_9');" src="/oa/images/tree_11.gif" width="19" height="20"></td>
                         <td width="19"><img src="/oa/images/tree_27.gif" width="19" height="20"></td>
                         <td nowrap>报销管理</td>
                       </tr>
                     </table>
                     <div id="menu_9" style="DISPLAY: none">
                     <table width="100%" border="0" cellspacing="0" cellpadding="0">
                         <tr>
                           <td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"></td>
                           <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"></td>
                           <td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"></td>
                           <td nowrap><a  href="/oa/html/dispatch/baoxiao/disList2.jsp" target="mainFrame" class="a03">报销申请</a></td>
                         </tr>
                       </table>
                       <table width="100%" border="0" cellspacing="0" cellpadding="0">
                         <tr>
                           <td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"></td>
                           <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"></td>
                           <td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"></td>
                           <td nowrap><a href="/oa/SerachDisServlet?pageNo=1" target="mainFrame" class="a03">我的报销查询</a></td>
                         </tr>
                         </table>
                         <c:forEach items="${sessionScope.moduleAcls}" var="ma">
                       	<c:if test="${ma.module.modId==13}">
                       	<table width="100%" border="0" cellspacing="0" cellpadding="0">
						  <tr>
							<td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"></td>
							<td width="19"><img src="/oa/images/tree_23.gif" width="19" height="20"></td>
							<td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"></td>
							<td nowrap><a href="/oa/html/dispatch/baoxiao/disList.jsp" target="mainFrame" class="a03">我的审核</a></td>
						  </tr>
						</table>
						</c:if>
						</c:forEach>
                </div>
				
				
				
                   
                  <c:forEach items="${sessionScope.moduleAcls}" var="ma">
                       	<c:if test="${ma.module.modId==10}">
                     <table width="100%" border="0" cellspacing="0" cellpadding="0">
                       <tr>
                         <td width="19"><img id="top_12" onClick="menu('menu_12','top_12');" src="/oa/images/tree_11.gif" width="19" height="20"></td>
                         <td width="19"><img src="/oa/images/tree_27.gif" width="19" height="20"></td>
                         <td nowrap>权限管理</td>
                       </tr>
                     </table>
                     <div id="menu_12" style="DISPLAY: none">
                       <table width="100%" border="0" cellspacing="0" cellpadding="0">
                         <tr>
                          <td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"></td>
                           <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"></td>
                           <td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"></td>
                           <td nowrap><a href="/oa/ViewRolesServlet?fcode=1018001" target="mainFrame" class="a03">角色管理</a></td>
                         </tr>
                       </table>
                       <table width="100%" border="0" cellspacing="0" cellpadding="0">
                         <tr>
                         <td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"></td>
                           <td width="19"><img src="/oa/images/tree_23.gif" width="19" height="20"></td>
                           <td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"></td>
                           <td nowrap><a href="/oa/ViewUsersServlet?fcode=1019001" target="mainFrame" class="a03">用户管理</a></td>
                         </tr>
                       </table>
                </div>
                </c:if>
                </c:forEach>
                
                
                
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="19"><img id="top_16" onClick="bottom('menu_16','top_16');" src="/oa/images/tree_29.gif" width="19" height="20"></td>
                          <td width="19"><img src="/oa/images/tree_27.gif" width="19" height="20"></td>
                          <td nowrap>我的桌面</td>
                        </tr>
                      </table>
					  <div id="menu_16" style="DISPLAY: none">
					  <table width="100%" border="0" cellspacing="0" cellpadding="0">
						  <tr>
							<td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"></td>
							<td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"></td>
							<td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"></td>
							<td nowrap><a href="/oa/html/schedule/schedule.jsp" target="mainFrame" class="a03">日程安排</a></td>
						  </tr>
						</table>
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
						  <tr>
							<td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"></td>
							<td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"></td>
							<td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"></td>
							<td nowrap><a href="/oa/ViewMyMemoServlet" target="mainFrame" class="a03">我的便签</a></td>
						  </tr>
						</table>
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
						  <tr>
							<td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"></td>
							<td width="19"><img src="/oa/images/tree_23.gif" width="19" height="20"></td>
							<td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"></td>
							<td nowrap><a href="/oa/html/tongxunlu/tongxunlu.jsp"" target="mainFrame" class="a03">个人通讯录</a></td>
						  </tr>
						</table>
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
						  <tr>
							<td width="19"><img src="/oa/images/tree_23.gif" width="19" height="20"></td>
							<td width="19"><img src="/oa/images/tree_30.gif" width="19" height="20"></td>
							<td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"></td>
							<td nowrap><a href="/oa/ViewShortMessageServlet" target="mainFrame" class="a03">短消息</a></td>
						  </tr>
						</table>
					  </div>
                 
                
                
                
                
                
                    
                     </td>
              </tr>
            </table></td>
           
          </tr>
        
      </table>
        <br>
    </td>
  </tr>
</table>
</body>
</html>

