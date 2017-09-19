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
<title>角色管理</title>


		<link href="/oa/css/last.css" type="text/css" rel="stylesheet" />
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

			
<script type="text/javascript" language="JavaScript1.2" src="/oa/js/stm31.js"></script>
<script language=javascript src="/oa/js/tree2.js"></script>
<script type="text/javascript">
$(document).ready(function() {

	$("input[name='chk']").click(function(){
       var p=$(this).val();
       var opt=$(this).attr('opt');
       if(opt=='1'){
           $("input[name='chk"+p+"']").attr('checked',true);
           $("input[name='chk"+p+"']").attr('ret','2');
           $(this).attr('opt','2');
       }
       else{
    	   $("input[name='chk"+p+"']").attr('checked',false);
    	   $("input[name='chk"+p+"']").attr('ret','1');
           $(this).attr('opt','1');
           }
       
		});

	$("input[name='chk9']").click(function(){
		 var ret=$(this).attr('ret');
		 if(ret=='1'){
             $("input[value='9']").attr('checked',true);
             $("input[value='9']").attr('opt','2');
             $(this).attr('ret','2');
		 }else{
			 $("input[name='9']").attr('checked',false);
			 $("input[value='9']").attr('opt','1');
	           $(this).attr('ret','1');
			 }
		});
	$("input[name='chk10']").click(function(){
		  var ret=$(this).attr('ret');
			 if(ret=='1'){
	             $("input[value='10']").attr('checked',true);
	             $("input[value='10']").attr('opt','2');
	             $(this).attr('ret','2');
			 }else{
				 $("input[name='10']").attr('checked',false);
				 $("input[value='9']").attr('opt','1');
		           $(this).attr('ret','1');
				 }
	});

	
	var modIdStr="";
	$("input[name='save']").click(function(){
		$("input[type='checkbox']").each(function(index, element) {
			if($(this).attr("checked")=='checked'){
				modIdStr+=$(this).val()+";";
			}
	    });
        var roleIdStr=$("#roleId").val();
     //   alert(modIdStr);
		$.ajax({
			type : 'POST',
			url : 'ModifyUserModServlet?modIdStr='+modIdStr+"&roleId="+roleIdStr,
			success : function() {
			alert('修改成功');
				window.location.href = "/oa/ViewRoleDetailServlet?roleId="+roleIdStr;
			},
			dataType : 'json'

		});

	});
	
});

function secBoard(n)
{
  for(i=0;i<secTable.cells.length;i++)
    secTable.cells[i].className="sec1";
  secTable.cells[n].className="sec2";
  for(i=0;i<mainTable.tBodies.length;i++)
    mainTable.tBodies[i].style.display="none";
  mainTable.tBodies[n].style.display="block";
}
</script>
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" padding="0">
<br/>
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin: 0px">
    <tr>
      <td height="25" align="center" valign="bottom" class="td06"><table width="98%" border="0" cellspacing="3" cellpadding="0">
          <tr>
            <td width="15"><img src="/oa/images/index_32.gif" width="9" height="9"/></td>
            <td valign="bottom" class="title">角色管理</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="95%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td width="90" align="center" class="td_form01">角色名称</td>
      <td class="td_form02"><input name="textfield" type="text" class="input" value="${requestScope.role.roleName }"/></td>
    </tr>
    <tr>
      <td align="center" class="td_form01">角色描述</td>
      <td class="td_form02"><textarea name="textarea" cols="100" rows="4">${requestScope.role.roleDesc}</textarea></td>
    </tr>
  </table>
  <br>
  <table width="95%"  border="0" cellspacing="2" cellpadding="0">
    <tr>
      <td class="td_title">角色权限信息</td>
    </tr>
  </table>
  <table width="95%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td width="480"><table width="480" border="0" cellpadding="0" cellspacing="0" id=secTable>
          <tr align="center">
            <td width="120" height="25" class="sec2" onClick="secBoard(0)">具备的操作权限</td>
            <td width="120" class="sec1" onClick="secBoard(1)">不具备操作权限</td>
          <%--  <td width="120" class="sec1" onClick="secBoard(2)">操作范围权限</td>
			<td width="120" class="sec1" onClick="secBoard(3)">信息项权限</td>--%>
          </tr>
      </table></td>
      <td class="sec3">&nbsp;</td>
    </tr>
  </table>
  <table border="0" cellspacing="0" cellpadding="0" width="95%" height="240" id=mainTable class="main_tab">
    <tbody style="display:block;">
      <tr>
        <td align="center" valign=top><table width="95%"  border="0" cellspacing="0" cellpadding="0">
            <tr><%--
              <td height="30" align="right" valign="bottom"><input name="Submit" type="submit" class="buttonface" value="  全选  "/>
                  <input name="Submit" type="submit" class="buttonface" value="  保存  "/>
              </td>
            --%></tr>
          </table>
            <table width="95%"  border="0" cellpadding="15" cellspacing="0" class="td_bottom">
              <tr>
                <td align="center" bgcolor="#FFFFFF">
                
                
                 <c:forEach items="${requestScope.moduleList}" var="modu" varStatus="i">
                 <c:if test="${modu.modParentId==0}" >
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="19"><img id="top_${i.index }" onClick="head('menu_${i.index}','top_${i.index }');" src="/oa/images/tree_03.gif" width="19" height="20"/></td>
                      <td width="19"><img src="/oa/images/tree_27.gif" width="19" height="20"/></td>
                      <td nowrap class="td04">${modu.modName }</td>
                    </tr>
                  </table>
                  
                    <div id="menu_${i.index }"" style="DISPLAY: none">
                    
                    <c:forEach items="${requestScope.moduleList}" var="modu2" >
                    <c:if test="${modu2.modParentId==modu.modId}">
                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"/></td>
                          <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                          <td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"/></td>
                          <td nowrap>${modu2.modName }</td>
                        </tr>
                      </table>
                      </c:if>
                        </c:forEach>
                   
                    </div>
                    </c:if>
                      </c:forEach>
                        
                        
                    
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="19"><img id="top_2" onClick="menu('menu_2','top_2');" src="/oa/images/tree_11.gif" width="19" height="20"/></td>
                        <td width="19"><img src="/oa/images/tree_27.gif" width="19" height="20"/></td>
                        <td nowrap class="td04" >  短&nbsp;消&nbsp;息&nbsp; </td>
                      </tr>
                    </table>
                    <div id="menu_2" style="DISPLAY: none">
                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"/></td>
                          <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                          <td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"/></td>
                          <td nowrap >操作短消息</td>
                        </tr>
                      </table>
                    </div>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="19"><img id="top_3" onClick="menu('menu_3','top_3');" src="/oa/images/tree_11.gif" width="19" height="20"/></td>
                         <td width="19"><img src="/oa/images/tree_27.gif" width="19" height="20"/></td>
                        <td nowrap class="td04">    我的便签</td>
                      </tr>
                    </table>
                    <div id="menu_3" style="DISPLAY: none">
                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"/></td>
                          <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                          <td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"/></td>
                          <td nowrap> 便签管理</td>
                        </tr>
                      </table>
                     
                    
                     
                    </div>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="19"><img id="top_4" onClick="menu('menu_4','top_4');" src="/oa/images/tree_11.gif" width="19" height="20"/></td>
                        <td width="19"><img src="/oa/images/tree_27.gif" width="19" height="20"/></td>
                        <td nowrap class="td04">  日程安排</td>
                      </tr>
                    </table>
                    <div id="menu_4" style="DISPLAY: none">
                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"/></td>
                          <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                          <td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"/></td>
                          <td nowrap>     日程管理</td>
                        </tr>
                      </table>
                       </div>
                       
                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="19"><img id="top_5" onClick="menu('menu_5','top_5');" src="/oa/images/tree_11.gif" width="19" height="20"/></td>
                        <td width="19"><img src="/oa/images/tree_27.gif" width="19" height="20"/></td>
                        <td nowrap class="td04"> 通&nbsp;讯&nbsp;录&nbsp;</td>
                      </tr>
                    </table>
                    <div id="menu_5" style="DISPLAY: none">
                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"/></td>
                          <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                          <td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"/></td>
                          <td nowrap> 通讯录管理</td>
                        </tr>
                      </table>
                    </div>
                     
                     
                      
                  
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="19"><img id="top_6" onClick="menu('menu_6','top_6');" src="/oa/images/tree_11.gif" width="19" height="20"/></td>
                         <td width="19"><img src="/oa/images/tree_27.gif" width="19" height="20"/></td>
                        <td nowrap class="td04">报销管理</td>
                      </tr>
                    </table>
                    <div id="menu_6" style="DISPLAY: none">
                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"/></td>
                          <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                          <td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"/></td>
                          <td nowrap>   报销申请</td>
                        </tr>
                      </table>
                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"/></td>
                          <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                          <td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"/></td>
                          <td nowrap>我的报销</td>
                        </tr>
                      </table>
                       <c:forEach items="${requestScope.moduleList}" var="disVar">
                       <c:if test="${disVar.modParentId==7}">
                       <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"/></td>
                          <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                          <td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"/></td>
                          <td nowrap>  ${disVar.modName }</td>
                        </tr>
                      </table>
 </c:if>
                      </c:forEach>
                    </div>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="19"><img id="top_7" onClick="third('menu_7','top_7');" src="/oa/images/tree_17.gif" width="19" height="20"/></td>
                        <td width="19"><img src="/oa/images/tree_27.gif" width="19" height="20"/></td>
                        <td nowrap class="td04">   出差管理</td>
                      </tr>
                    </table>
                    <div id="menu_7" style="DISPLAY: none">
                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="19">&nbsp;</td>
                          <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                          <td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"/></td>
                          <td nowrap> 我的出差</td>
                        </tr>
                      </table>
                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="19">&nbsp;</td>
                          <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                          <td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"/></td>
                          <td nowrap> 出差查询</td>
                        </tr>
                      </table>
                       <c:forEach items="${requestScope.moduleList}" var="travelVar">
                       <c:if test="${travelVar.modParentId==8}">
                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="19">&nbsp;</td>
                          <td width="19"><img src="/oa/images/tree_23.gif" width="19" height="20"/></td>
                          <td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"/></td>
                          <td nowrap> ${travelVar.modName}</td>
                        </tr>
                      </table>
                        </c:if>
                      </c:forEach>
                  </div></td>
              </tr>
          </table>
        <br/></td>
      </tr>
    </tbody>
	 <tbody style="display:none;">
      <tr>
        <td align=center valign=top><table width="95%"  border="0" cellspacing="0" cellpadding="0">
            <tr><td align="right">
                  <input name="save" type="submit" class="buttonface" value="保存  "/>
                  <input  type="hidden" id='roleId' value="${requestScope.roleId }"/>
              </td>
            </tr>
          </table>
            <table width="95%"  border="0" cellpadding="15" cellspacing="0" class="td_bottom">
              <tr>
                
            <td width="97%" align="center" valign="top" bgcolor="#FFFFFF">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="20" class="td04">分配权限</td>
                    </tr>
                </table>
                    <br/>
                    
                   
                     <c:forEach items="${requestScope.notModuleList}" var="notMod" varStatus="j">
                     <c:if test="${notMod.modParentId==0}">
                     
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                   
                        <td width="19"><img id="top_${j.index+17}" onClick="head('menu_${j.index+17}','top_${j.index+17}');" src="/oa/images/tree_03.gif" width="19" height="20"/></td>
                        <td width="19"><img src="/oa/images/tree_27.gif" width="19" height="20"/></td>
                        <td nowrap>${notMod.modName } </td>
                        <td width="20" nowrap><input type="checkbox" name="chk" value="${notMod.modId}" opt="1" />
                        </td>
                      </tr>
                    </table>
                    <div id="menu_${j.index+17}" style="DISPLAY: none">
                     <c:forEach items="${requestScope.notModuleList}" var="notMod2" >
                       <c:if test="${notMod2.modParentId==notMod.modId}">
                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"/></td>
                          <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                          <td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"/></td>
                          <td nowrap>${notMod2.modName }</td>
                          <td width="20" nowrap><input type="checkbox" name="chk${notMod.modId}"  value="${notMod2.modId}" ret="1"/>
                          </td>
                        </tr>
                      </table>
                      </c:if>
                      </c:forEach>
                    </div>
                    </c:if>
                   </c:forEach>
                    
                    <c:forEach items="${requestScope.notModuleList}" var="notMod3" varStatus="k">
                      <c:if test="${notMod3.modParentId==7}">
                       <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="19"><img id="top_${k.index+19}" onClick="bottom('menu_${k.index+19}','top_${k.index+19}');" src="/oa/images/tree_29.gif" width="19" height="20"/></td>
                        <td width="19"><img src="/oa/images/tree_27.gif" width="19" height="20"/></td>
                        <td nowrap>报销管理</td>
                        <td width="20" nowrap><input type="checkbox" name="chk" value="${notMod3.modParentId}" disabled="disabled"/></td>
                      </tr>
                    </table>
                    <div id="menu_${k.index+19}" style="DISPLAY: none">
                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                           <td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"/></td>
                          <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                          <td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"/></td>
                          <td nowrap>${ notMod3.modName}</td>
                          <td width="20" nowrap><input type="checkbox" name="chk" value="${notMod3.modId}" />
                          </td>
                        </tr>
                      </table>
                     
                     
                  </div>
                      
                      </c:if>
                    </c:forEach>
                   <c:forEach items="${requestScope.notModuleList}" var="notMod4" varStatus="k">
                      <c:if test="${notMod4.modParentId==8}">
                       <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="19"><img id="top_${k.index+21}" onClick="bottom('menu_${k.index+21}','top_${k.index+21}');" src="/oa/images/tree_29.gif" width="19" height="20"/></td>
                        <td width="19"><img src="/oa/images/tree_27.gif" width="19" height="20"/></td>
                        <td nowrap>出差管理</td>
                        <td width="20" nowrap><input type="checkbox" name="chk" value="${notMod4.modParentId}" disabled="disabled"/></td>
                      </tr>
                    </table>
                    <div id="menu_${k.index+21}" style="DISPLAY: none">
                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="19">&nbsp;</td>
                          <td width="19"><img src="/oa/images/tree_23.gif" width="19" height="20"/></td>
                          <td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"/></td>
                          <td nowrap>${ notMod4.modName}</td>
                          <td width="20" nowrap><input type="checkbox" name="chk" value="${notMod4.modId}"/>
                          </td>
                        </tr>
                      </table>
                  </div>
                      </c:if>
                    </c:forEach>
                    
                         <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="19"><img id="top_28" onClick="bottom('menu_28','top_28');" src="/oa/images/tree_29.gif" width="19" height="20"/></td>
                        <td width="19"><img src="/oa/images/tree_27.gif" width="19" height="20"/></td>
                        <td nowrap class="td04"> 通&nbsp;讯&nbsp;录&nbsp;</td>
                         <td width="20" nowrap><input type="checkbox"  disabled="disabled"/></td>
                      </tr>
                    </table>
                    <div id="menu_28" style="DISPLAY: none">
                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="19">&nbsp;</td>
                          <td width="19"><img src="/oa/images/tree_23.gif" width="19" height="20"/></td>
                          <td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"/></td>
                          <td nowrap> 通讯录管理</td>
                           <td width="20" nowrap><input type="checkbox"  disabled="disabled"/></td>
                        </tr>
                      </table>
                       <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                         
                           <td width="38">&nbsp;</td>
                            <td width="19"><img src="/oa/images/tree_23.gif" width="19" height="20"/></td>
                          <td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"/></td>
                          <td nowrap> 修改通讯录</td>
                           <td width="20" nowrap><input type="checkbox" name="chk" value="fcode04002"/></td>
                        </tr>
                      </table>
                    </div>
                    
                    
                   </td>
              </tr>
          </table>
            <br/></td>
      </tr>
    </tbody>
  </table>
  <br/>
</body>
</html>
