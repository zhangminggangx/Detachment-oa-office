<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
<title>操作员管理</title>
<script type="text/javascript" language="JavaScript1.2" src="/oa/js/stm31.js"></script>
<script language=javascript src="/oa/js/tree2.js"></script>
<script language="javascript">
function windowOpen(theURL,winName,features,width,hight,scrollbars,top,left) 
{
  var parameter="top="+top+",left="+left+",width="+width+",height="+hight;
  if(scrollbars=="no")
 {parameter+=",scrollbars=no";}
  else
 {parameter+=",scrollbars=yes";}
  window.open(theURL,winName,parameter);
}

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
<link href="/oa/css/style.css" rel="stylesheet" type="text/css"/>
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<center>
<br/>
<table width="95%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td align="right" class="td_page"><input name="Submit" type="button" class="buttonface02" onClick="parent.location.href='query.htm'" value="  返回  "/></td>
    </tr>
  </table>
  <br/>
  <table width="95%"  border="0" cellspacing="2" cellpadding="0">
      <tr>
        <td class="td_title">操作员权限信息</td>
      </tr>
  </table>
    <table width="95%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="480"><table width="480" border="0" cellpadding="0" cellspacing="0" id=secTable>
      <tr height="20" align="center">
        <td width="120" height="25" class="sec2" onClick="secBoard(0)">操作权限</td>
        <td width="120" class="sec1" onClick="secBoard(1)">信息项权限</td>
        <td width="120" class="sec1" onClick="secBoard(2)">查询范围权限</td>
        <td width="120" class="sec1" onClick="secBoard(3)">操作范围权限</td>
      </tr>
    </table></td>
    <td class="sec3">&nbsp;</td>
  </tr>
</table>
<table border="0" cellspacing="0" cellpadding="0" width="95%" height="240" id=mainTable class="main_tab">
  <tbody style="display:block;">
    <tr>
      <td align="center" valign=top><table width="95%"  border="0" cellspacing="0" cellpadding="0">
        
      </table>
        <table width="95%"  border="0" cellpadding="15" cellspacing="1" class="td_bottom">
          <tr>
            <td align="center" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="19"><img id="top_1" onClick="head('menu_1','top_1');" src="/oa/images/tree_03.gif" width="19" height="20"/></td>
                <td width="19"><img src="/oa/images/tree_31.gif" width="19" height="20"/></td>
                <td nowrap class="td04"><input type="checkbox" name="checkbox" value="checkbox"/>
      机构管理</td>
              </tr>
            </table>
              <div id="menu_1" style="DISPLAY: none">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_31.gif" width="19" height="20"/></td>
                    <td nowrap><input type="checkbox" name="checkbox" value="checkbox"/>
        机构维护</td>
                  </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_30.gif" width="19" height="20"/></td>
                    <td nowrap><input type="checkbox" name="checkbox" value="checkbox"/>
        机构图</td>
                  </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_31.gif" width="19" height="20"/></td>
                    <td nowrap><input type="checkbox" name="checkbox" value="checkbox"/>
        机构编制</td>
                  </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_23.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_31.gif" width="19" height="20"/></td>
                    <td nowrap><input type="checkbox" name="checkbox" value="checkbox"/>
        机构历史</td>
                  </tr>
                </table>
              </div>
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="19"><img id="top_2" onClick="menu('menu_2','top_2');" src="/oa/images/tree_11.gif" width="19" height="20"/></td>
                  <td width="19"><img src="/oa/images/tree_31.gif" width="19" height="20"/></td>
                  <td nowrap class="td04"><input type="checkbox" name="checkbox" value="checkbox"/>
      人员管理</td>
                </tr>
              </table>
              <div id="menu_2" style="DISPLAY: none">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_31.gif" width="19" height="20"/></td>
                    <td nowrap><input type="checkbox" name="checkbox" value="checkbox"/>
        信息维护</td>
                  </tr>
                </table>
                
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_31.gif" width="19" height="20"/></td>
                    <td nowrap><input type="checkbox" name="checkbox" value="checkbox"/>
        批量处理</td>
                  </tr>
                </table>
                
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_30.gif" width="19" height="20"/></td>
                    <td nowrap><input type="checkbox" name="checkbox" value="checkbox"/>
        统计分析</td>
                  </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_30.gif" width="19" height="20"/></td>
                    <td nowrap><input type="checkbox" name="checkbox" value="checkbox"/>
        信息报表</td>
                  </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_23.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_30.gif" width="19" height="20"/></td>
                    <td nowrap><input type="checkbox" name="checkbox" value="checkbox"/>
        提醒设置</td>
                  </tr>
                </table>
              </div>
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="19"><img id="top_3" onClick="menu('menu_3','top_3');" src="/oa/images/tree_11.gif" width="19" height="20"/></td>
                  <td width="19"><img src="/oa/images/tree_31.gif" width="19" height="20"/></td>
                  <td nowrap class="td04"><input type="checkbox" name="checkbox" value="checkbox"/>
      档案管理</td>
                </tr>
              </table>
              <div id="menu_3" style="DISPLAY: none">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_31.gif" width="19" height="20"/></td>
                    <td nowrap><input type="checkbox" name="checkbox" value="checkbox"/>
        转入转出</td>
                  </tr>
                </table>
                
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_31.gif" width="19" height="20"/></td>
                    <td nowrap><input type="checkbox" name="checkbox" value="checkbox"/>
        借阅归还</td>
                  </tr>
                </table>
               
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_31.gif" width="19" height="20"/></td>
                    <td nowrap><input type="checkbox" name="checkbox" value="checkbox"/>
        日常打印</td>
                  </tr>
                </table>
                
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_31.gif" width="19" height="20"/></td>
                    <td nowrap><input type="checkbox" name="checkbox" value="checkbox"/>
        统计盘库</td>
                  </tr>
                </table>
                
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_30.gif" width="19" height="20"/></td>
                    <td nowrap><input type="checkbox" name="checkbox" value="checkbox"/>
        制作花名册</td>
                  </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_23.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_31.gif" width="19" height="20"/></td>
                    <td nowrap><input type="checkbox" name="checkbox" value="checkbox"/>
        副本管理</td>
                  </tr>
                </table>   
              </div>
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="19"><img id="top_4" onClick="menu('menu_4','top_4');" src="/oa/images/tree_11.gif" width="19" height="20"/></td>
                  <td width="19"><img src="/oa/images/tree_31.gif" width="19" height="20"/></td>
                  <td nowrap class="td04"><input type="checkbox" name="checkbox" value="checkbox"/>
      手续办理</td>
                </tr>
              </table>
              <div id="menu_4" style="DISPLAY: none">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_31.gif" width="19" height="20"/></td>
                    <td nowrap><input type="checkbox" name="checkbox" value="checkbox"/>
        信息维护</td>
                  </tr>
                </table>
                
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_31.gif" width="19" height="20"/></td>
                    <td nowrap><input type="checkbox" name="checkbox" value="checkbox"/>
        新建手续</td>
                  </tr>
                </table>
                
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_30.gif" width="19" height="20"/></td>
                    <td nowrap><input type="checkbox" name="checkbox" value="checkbox"/>
        待办手续</td>
                  </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_23.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_30.gif" width="19" height="20"/></td>
                    <td nowrap><input type="checkbox" name="checkbox" value="checkbox"/>
        手续历史</td>
                  </tr>
                </table>
              </div>
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="19"><img id="top_5" onClick="menu('menu_5','top_5');" src="/oa/images/tree_11.gif" width="19" height="20"/></td>
                  <td width="19"><img src="/oa/images/tree_31.gif" width="19" height="20"/></td>
                  <td nowrap class="td04"><input type="checkbox" name="checkbox" value="checkbox"/>
      领导查询</td>
                </tr>
              </table>
              <div id="menu_5" style="DISPLAY: none">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_30.gif" width="19" height="20"/></td>
                    <td nowrap><input type="checkbox" name="checkbox" value="checkbox"/>
        机构信息</td>
                  </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_30.gif" width="19" height="20"/></td>
                    <td nowrap><input type="checkbox" name="checkbox" value="checkbox"/>
        人员信息</td>
                  </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_30.gif" width="19" height="20"/></td>
                    <td nowrap><input type="checkbox" name="checkbox" value="checkbox"/>
        统计分析</td>
                  </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_23.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_30.gif" width="19" height="20"/></td>
                    <td nowrap><input type="checkbox" name="checkbox" value="checkbox"/>
        报表信息</td>
                  </tr>
                </table>
              </div>
              
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="19"><img id="top_7" onClick="third('menu_7','top_7');" src="/oa/images/tree_17.gif" width="19" height="20"/></td>
                  <td width="19"><img src="/oa/images/tree_31.gif" width="19" height="20"/></td>
                  <td nowrap class="td04"><input type="checkbox" name="checkbox" value="checkbox"/>
      系统管理</td>
                </tr>
              </table>
              <div id="menu_7" style="DISPLAY: none">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="19">&nbsp;</td>
                    <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_31.gif" width="19" height="20"/></td>
                    <td nowrap><input type="checkbox" name="checkbox" value="checkbox"/>
        指标管理</td>
                  </tr>
                </table>
                
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="19">&nbsp;</td>
                    <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_31.gif" width="19" height="20"/></td>
                    <td nowrap><input type="checkbox" name="checkbox" value="checkbox"/>
        代码管理</td>
                  </tr>
                </table>
                
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="19">&nbsp;</td>
                    <td width="19"><img src="/oa/images/tree_23.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_30.gif" width="19" height="20"/></td>
                    <td nowrap><input type="checkbox" name="checkbox" value="checkbox"/>
        日志管理</td>
                  </tr>
                </table>
              </div></td>
          </tr>
        </table>
                <br/></td>
    </tr>
  </tbody>
  <tbody style="display:none;">
    <tr>
      <td align=center valign=top><table width="95%"  border="0" cellspacing="0" cellpadding="0">
        
      </table>
        <table width="95%"  border="0" cellpadding="15" cellspacing="1" class="td_bottom">
          <tr>
            <td align="center" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="19"><img id="top_8" onClick="head('menu_8','top_8');" src="/oa/images/tree_03.gif" width="19" height="20"/></td>
                <td width="19"><img src="/oa/images/tree_30.gif" width="19" height="20"/></td>
                <td width="387" nowrap class="td04">　人员基本情况子集</td>
                <td width="263" nowrap class="td04">
                    <input type="radio" name="radio01" value=""/>
                    拒绝
                    <input type="radio" name="radio01" value=""/>
                    读
                    <input type="radio" name="radio01" value=""/>
改
<input type="radio" name="radio01" value=""/>
增
<input type="radio" name="radio01" value=""/>
删
<input type="radio" name="radio01" value=""/>
增删</td>
                </tr>
            </table>
              <div id="menu_8" style="DISPLAY: none">
              <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="19" background="/oa/images/tree_06.gif">&nbsp;</td>
                  <td width="19">&nbsp;</td>
                  <td><br/>
                    <table width="100%" border="0" align="center" cellpadding="2" cellspacing="1" class="td01">
                    <tr nowrap>
                      <td width="65" align="center" class="td02">姓　　名</td>
                      <td bgcolor="#FFFFFF">
                    <input type="radio" name="radio0101" value=""/>拒绝
                    <input type="radio" name="radio0101" value=""/>读
                    <input type="radio" name="radio0101" value=""/>改</td>
                      <td width="65" align="center" class="td02">曾&nbsp;&nbsp;用&nbsp;&nbsp;名</td>
                      <td bgcolor="#FFFFFF">
                    <input type="radio" name="radio0102" value=""/>拒绝
                    <input type="radio" name="radio0102" value=""/>读
                    <input type="radio" name="radio0102" value=""/>改</td>
                      <td width="65" align="center" class="td02">性　　别</td>
                      <td bgcolor="#FFFFFF">
                    <input type="radio" name="radio0103" value=""/>拒绝
                    <input type="radio" name="radio0103" value=""/>读
                    <input type="radio" name="radio0103" value=""/>改</td>
                    </tr>
                    <tr nowrap>
                      <td align="center" class="td02">民　　族</td>
                      <td bgcolor="#FFFFFF" >
                    <input type="radio" name="radio0104" value=""/>拒绝
                    <input type="radio" name="radio0104" value=""/>读
                    <input type="radio" name="radio0104" value=""/>改</td>
                      <td align="center" class="td02">籍　　贯</td>
                      <td bgcolor="#FFFFFF" >
                    <input type="radio" name="radio0105" value=""/>拒绝
                    <input type="radio" name="radio0105" value=""/>读
                    <input type="radio" name="radio0105" value=""/>改</td>
                      <td align="center" class="td02">血　　型</td>
                      <td bgcolor="#FFFFFF" >
                    <input type="radio" name="radio0106" value=""/>拒绝
                    <input type="radio" name="radio0106" value=""/>读
                    <input type="radio" name="radio0106" value=""/>改</td>
                    </tr>
                    <tr>
                      <td align="center" class="td02">出&nbsp;&nbsp;生&nbsp;&nbsp;地</td>
                      <td bgcolor="#FFFFFF" >
                    <input type="radio" name="radio0107" value=""/>拒绝
                    <input type="radio" name="radio0107" value=""/>读
                    <input type="radio" name="radio0107" value=""/>改</td>
                      <td align="center" class="td02">单　　位</td>
                      <td bgcolor="#FFFFFF" >
                    <input type="radio" name="radio0108" value=""/>拒绝
                    <input type="radio" name="radio0108" value=""/>读
                    <input type="radio" name="radio0108" value=""/>改</td>
                      <td align="center" class="td02">所在部门</td>
                      <td bgcolor="#FFFFFF" >
                    <input type="radio" name="radio0109" value=""/>拒绝
                    <input type="radio" name="radio0109" value=""/>读
                    <input type="radio" name="radio0109" value=""/>改</td>
                    </tr>
                    <tr>
                      <td align="center" class="td02">主要语种</td>
                      <td bgcolor="#FFFFFF" >
                    <input type="radio" name="radio0110" value=""/>拒绝
                    <input type="radio" name="radio0110" value=""/>读
                    <input type="radio" name="radio0110" value=""/>改</td>
                      <td align="center" class="td02">健康状况</td>
                      <td bgcolor="#FFFFFF" >
                    <input type="radio" name="radio0111" value=""/>拒绝
                    <input type="radio" name="radio0111" value=""/>读
                    <input type="radio" name="radio0111" value=""/>改</td>
                      <td align="center" class="td02">学　　历</td>
                      <td bgcolor="#FFFFFF" >
                    <input type="radio" name="radio0112" value=""/>拒绝
                    <input type="radio" name="radio0112" value=""/>读
                    <input type="radio" name="radio0112" value=""/>改</td>
                    </tr>
                  </table>
                    <br/></td>
                </tr>
              </table>
              </div>
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="19"><img id="top_9" onClick="menu('menu_9','top_9');" src="/oa/images/tree_11.gif" width="19" height="20"/></td>
                  <td width="19"><img src="/oa/images/tree_30.gif" width="19" height="20"/></td>
                  <td width="389" nowrap class="td04">　学历学位子集</td>
                  <td width="263" nowrap class="td04">
                    <input type="radio" name="radio01" value=""/>
                    拒绝
                    <input type="radio" name="radio01" value=""/>
                    读
                    <input type="radio" name="radio01" value=""/>
改
<input type="radio" name="radio01" value=""/>
增
<input type="radio" name="radio01" value=""/>
删
<input type="radio" name="radio01" value=""/>
增删</td>
                </tr>
              </table>
              <div id="menu_9" style="DISPLAY: none">
                <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="19" background="/oa/images/tree_06.gif">&nbsp;</td>
                    <td width="19">&nbsp;</td>
                    <td><br/>
                        <table width="100%" border="0" align="center" cellpadding="2" cellspacing="1" class="td01">
                          <tr nowrap>
                            <td width="65" align="center" class="td02">人员编号</td>
                            <td bgcolor="#FFFFFF" >
                    <input type="radio" name="radio0201" value=""/>拒绝
                    <input type="radio" name="radio0201" value=""/>读
                    <input type="radio" name="radio0201" value=""/>改</td>
                            <td width="65" align="center" class="td02">毕业时间</td>
                            <td bgcolor="#FFFFFF" >
                    <input type="radio" name="radio0202" value=""/>拒绝
                    <input type="radio" name="radio0202" value=""/>读
                    <input type="radio" name="radio0202" value=""/>改</td>
                            <td width="65" align="center" class="td02">学　　位</td>
                            <td bgcolor="#FFFFFF" >
                    <input type="radio" name="radio0203" value=""/>拒绝
                    <input type="radio" name="radio0203" value=""/>读
                    <input type="radio" name="radio0203" value=""/>改</td>
                          </tr>
                          <tr nowrap>
                            <td align="center" class="td02">毕业学校</td>
                            <td bgcolor="#FFFFFF" >
                    <input type="radio" name="radio0204" value=""/>拒绝
                    <input type="radio" name="radio0204" value=""/>读
                    <input type="radio" name="radio0204" value=""/>改</td>
                            <td align="center" class="td02">所学专业</td>
                            <td bgcolor="#FFFFFF" >
                    <input type="radio" name="radio0205" value=""/>/拒绝
                    <input type="radio" name="radio0205" value=""/>读
                    <input type="radio" name="radio0205" value=""/>改</td>
                            <td align="center" class="td02">学　　历</td>
                            <td bgcolor="#FFFFFF" >
                    <input type="radio" name="radio0206" value=""/>拒绝
                    <input type="radio" name="radio0206" value=""/>读
                    <input type="radio" name="radio0206" value=""/>改</td>
                          </tr>
                          <tr>
                            <td align="center" class="td02">入学时间</td>
                            <td bgcolor="#FFFFFF" >
                    <input type="radio" name="radio0207" value=""/>拒绝
                    <input type="radio" name="radio0207" value=""/>读
                    <input type="radio" name="radio0207" value=""/>改</td>
                            <td align="center" class="td02">&nbsp;</td>
                            <td bgcolor="#FFFFFF" >&nbsp;</td>
                            <td align="center" class="td02">&nbsp;</td>
                            <td bgcolor="#FFFFFF" >&nbsp;</td>
                          </tr>
                        </table>
                        <br/></td>
                  </tr>
                </table>
                </div>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="19"><img id="top_10" onClick="menu('menu_10','top_10');" src="/oa/images/tree_11.gif" width="19" height="20"/></td>
                  <td width="19"><img src="/oa/images/tree_30.gif" width="19" height="20"/></td>
                  <td width="392" nowrap class="td04">　教育培训子集</td>
                  <td width="263" nowrap class="td04">
                    <input type="radio" name="radio01" value=""/>
                    拒绝
                    <input type="radio" name="radio01" value=""/>
                    读
                    <input type="radio" name="radio01" value=""/>
改
<input type="radio" name="radio01" value=""/>
增
<input type="radio" name="radio01" value=""/>
删
<input type="radio" name="radio01" value=""/>
增删</td>
                </tr>
              </table>
              <div id="menu_10" style="DISPLAY: none">
                <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="19" background="/oa/images/tree_06.gif">&nbsp;</td>
                    <td width="19">&nbsp;</td>
                    <td><br/>
                        <table width="100%" border="0" align="center" cellpadding="2" cellspacing="1" class="td01">
                          <tr nowrap>
                            <td width="65" align="center" class="td02">人员编号</td>
                            <td bgcolor="#FFFFFF" >
                    <input type="radio" name="radio0301" value=""/>拒绝
                    <input type="radio" name="radio0301" value=""/>读
                    <input type="radio" name="radio0301" value=""/>改</td>
                            <td width="65" align="center" class="td02">开始时间</td>
                            <td bgcolor="#FFFFFF" >
                    <input type="radio" name="radio0302" value=""/>拒绝
                    <input type="radio" name="radio0302" value=""/>读
                    <input type="radio" name="radio0302" value=""/>改</td>
                            <td width="65" align="center" class="td02">结束时间</td>
                            <td bgcolor="#FFFFFF" >
                    <input type="radio" name="radio0303" value=""/>拒绝
                    <input type="radio" name="radio0303" value=""/>读
                    <input type="radio" name="radio0303" value=""/>改</td>
                          </tr>
                          <tr nowrap>
                            <td align="center" class="td02">承担部门</td>
                            <td bgcolor="#FFFFFF" >
                    <input type="radio" name="radio0304" value=""/>拒绝
                    <input type="radio" name="radio0304" value=""/>读
                    <input type="radio" name="radio0304" value=""/>/改</td>
                            <td align="center" class="td02">备　　注</td>
                            <td bgcolor="#FFFFFF" >
                    <input type="radio" name="radio0305" value=""/>拒绝
                    <input type="radio" name="radio0305" value=""/>读
                    <input type="radio" name="radio0305" value=""/>改</td>
                            <td align="center" class="td02">&nbsp;</td>
                            <td bgcolor="#FFFFFF" >&nbsp;</td>
                          </tr>
                        </table>
                        <br/></td>
                  </tr>
                </table>
                </div>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="19"><img id="top_11" onClick="menu('menu_11','top_11');" src="/oa/images/tree_11.gif" width="19" height="20"/></td>
                  <td width="19"><img src="/oa/images/tree_30.gif" width="19" height="20"/></td>
                  <td width="390" nowrap class="td04">　婚史及配偶子集</td>
                  <td width="263" nowrap class="td04">
                    <input type="radio" name="radio01" value=""/>
                    拒绝
                    <input type="radio" name="radio01" value=""/>
                    读
                    <input type="radio" name="radio01" value=""/>
改
<input type="radio" name="radio01" value=""/>
增
<input type="radio" name="radio01" value=""/>
删
<input type="radio" name="radio01" value=""/>
增删</td>
                  </tr>
              </table>
              <div id="menu_11" style="DISPLAY: none">
                <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="19" background="/oa/images/tree_06.gif">&nbsp;</td>
                    <td width="19">&nbsp;</td>
                    <td><br/>
                        <table width="100%" border="0" align="center" cellpadding="2" cellspacing="1" class="td01">
                          <tr nowrap>
                            <td width="65" align="center" class="td02">人员编号</td>
                            <td bgcolor="#FFFFFF" >
                    <input type="radio" name="radio0401" value=""/>拒绝
                    <input type="radio" name="radio0401" value=""/>读
                    <input type="radio" name="radio0401" value=""/>改</td>
                            <td width="65" align="center" class="td02">配偶编号</td>
                            <td bgcolor="#FFFFFF" >
                    <input type="radio" name="radio0402" value=""/>拒绝
                    <input type="radio" name="radio0402" value=""/>读
                    <input type="radio" name="radio0402" value=""/>改</td>
                            <td width="65" align="center" class="td02">配偶姓名</td>
                            <td bgcolor="#FFFFFF" >
                    <input type="radio" name="radio0403" value=""/>拒绝
                    <input type="radio" name="radio0403" value=""/>读
                    <input type="radio" name="radio0403" value=""/>改</td>
                          </tr>
                          <tr nowrap>
                            <td align="center" class="td02">照　　片</td>
                            <td bgcolor="#FFFFFF" >
                    <input type="radio" name="radio0404" value=""/>拒绝
                    <input type="radio" name="radio0404" value=""/>读
                    <input type="radio" name="radio0404" value=""/>改</td>
                            <td align="center" class="td02">出生日期</td>
                            <td bgcolor="#FFFFFF" >
                    <input type="radio" name="radio0405" value=""/>拒绝
                    <input type="radio" name="radio0405" value=""/>读
                    <input type="radio" name="radio0405" value=""/>改</td>
                            <td align="center" class="td02">性　　别</td>
                            <td bgcolor="#FFFFFF" >
                    <input type="radio" name="radio0406" value=""/>拒绝
                    <input type="radio" name="radio0406" value=""/>读
                    <input type="radio" name="radio0406" value=""/>改</td>
                          </tr>
                          <tr>
                            <td align="center" class="td02">籍　　贯</td>
                            <td bgcolor="#FFFFFF" >
                    <input type="radio" name="radio0407" value=""/>拒绝
                    <input type="radio" name="radio0407" value=""/>读
                    <input type="radio" name="radio0407" value=""/>改</td>
                            <td align="center" class="td02">民　　族</td>
                            <td bgcolor="#FFFFFF" >
                    <input type="radio" name="radio0408" value=""/>拒绝
                    <input type="radio" name="radio0408" value=""/>读
                    <input type="radio" name="radio0408" value=""/>改</td>
                            <td align="center" class="td02">政治面貌</td>
                            <td bgcolor="#FFFFFF" >
                    <input type="radio" name="radio0409" value=""/>拒绝
                    <input type="radio" name="radio0409" value=""/>读
                    <input type="radio" name="radio0409" value=""/>改</td>
                          </tr>
                          <tr>
                            <td align="center" class="td02">结婚证号</td>
                            <td bgcolor="#FFFFFF" >
                    <input type="radio" name="radio0410" value=""/>拒绝
                    <input type="radio" name="radio0410" value=""/>读
                    <input type="radio" name="radio0410" value=""/>改</td>
                            <td align="center" class="td02">结婚状态</td>
                            <td bgcolor="#FFFFFF" >
                    <input type="radio" name="radio0411" value=""/>拒绝
                    <input type="radio" name="radio0411" value=""/>读
                    <input type="radio" name="radio0411" value=""/>改</td>
                            <td align="center" class="td02">&nbsp;</td>
                            <td bgcolor="#FFFFFF" >&nbsp;</td>
                          </tr>
                        </table>
                        <br/></td>
                  </tr>
                </table>
                </div>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="19"><img id="top_12" onClick="menu('menu_12','top_12');" src="/oa/images/tree_11.gif" width="19" height="20"/></td>
                  <td width="19"><img src="/oa/images/tree_30.gif" width="19" height="20"/></td>
                  <td width="390" nowrap class="td04">　家庭成员子集</td>
                  <td width="263" nowrap class="td04">
                    <input type="radio" name="radio01" value=""/>
                    拒绝
                    <input type="radio" name="radio01" value=""/>
                    读
                    <input type="radio" name="radio01" value=""/>
改
<input type="radio" name="radio01" value=""/>
增
<input type="radio" name="radio01" value=""/>
删
<input type="radio" name="radio01" value=""/>
增删</td>
                  </tr>
              </table>
              <div id="menu_12" style="DISPLAY: none">
                <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="19" background="/oa/images/tree_06.gif">&nbsp;</td>
                    <td width="19">&nbsp;</td>
                    <td><br/>
                        <table width="100%" border="0" align="center" cellpadding="2" cellspacing="1" class="td01">
                          <tr nowrap>
                            <td width="65" align="center" class="td02">人员编号</td>
                            <td bgcolor="#FFFFFF" >
                    <input type="radio" name="radio0501" value=""/>拒绝
                    <input type="radio" name="radio0501" value=""/>读
                    <input type="radio" name="radio0501" value=""/>改</td>
                            <td width="65" align="center" class="td02">成员编号</td>
                            <td bgcolor="#FFFFFF" >
                    <input type="radio" name="radio0502" value=""/>拒绝
                    <input type="radio" name="radio0502" value=""/>读
                    <input type="radio" name="radio0502" value=""/>改</td>
                            <td width="65" align="center" class="td02">照　　片</td>
                            <td bgcolor="#FFFFFF" >
                    <input type="radio" name="radio0503" value=""/>拒绝
                    <input type="radio" name="radio0503" value=""/>读
                    <input type="radio" name="radio0503" value=""/>改</td>
                          </tr>
                          <tr nowrap>
                            <td align="center" class="td02">成员姓名</td>
                            <td bgcolor="#FFFFFF" >
                    <input type="radio" name="radio0504" value=""/>拒绝
                    <input type="radio" name="radio0504" value=""/>读
                    <input type="radio" name="radio0504" value=""/>改</td>
                            <td align="center" class="td02">与本人关系</td>
                            <td bgcolor="#FFFFFF" >
                    <input type="radio" name="radio0505" value=""/>拒绝
                    <input type="radio" name="radio0505" value=""/>读
                    <input type="radio" name="radio0505" value=""/>改</td>
                            <td align="center" class="td02">政治面貌</td>
                            <td bgcolor="#FFFFFF" >
                    <input type="radio" name="radio0506" value=""/>拒绝
                    <input type="radio" name="radio0506" value=""/>读
                    <input type="radio" name="radio0506" value=""/>改</td>
                          </tr>
                          <tr>
                            <td align="center" class="td02">出生日期</td>
                            <td bgcolor="#FFFFFF" >
                    <input type="radio" name="radio0507" value=""/>拒绝
                    <input type="radio" name="radio0507" value=""/>读
                    <input type="radio" name="radio0507" value=""/>改</td>
                            <td align="center" class="td02">单位职务</td>
                            <td bgcolor="#FFFFFF" >
                    <input type="radio" name="radio0508" value=""/>拒绝
                    <input type="radio" name="radio0508" value=""/>读
                    <input type="radio" name="radio0508" value=""/>改</td>
                            <td align="center" class="td02">籍　　贯</td>
                            <td bgcolor="#FFFFFF" >
                    <input type="radio" name="radio0509" value=""/>拒绝
                    <input type="radio" name="radio0509" value=""/>读
                    <input type="radio" name="radio0509" value=""/>改</td>
                          </tr>
                          <tr>
                            <td align="center" class="td02">出&nbsp;&nbsp;生&nbsp;&nbsp;地</td>
                            <td bgcolor="#FFFFFF" >
                    <input type="radio" name="radio0510" value=""/>拒绝
                    <input type="radio" name="radio0510" value=""/>读
                    <input type="radio" name="radio0510" value=""/>改</td>
                            <td align="center" class="td02">生存状况</td>
                            <td bgcolor="#FFFFFF" >
                    <input type="radio" name="radio0511" value=""/>拒绝
                    <input type="radio" name="radio0511" value=""/>读
                    <input type="radio" name="radio0511" value=""/>改</td>
                            <td align="center" class="td02">&nbsp;</td>
                            <td bgcolor="#FFFFFF" >&nbsp;</td>
                          </tr>
                        </table>
                        <br/></td>
                  </tr>
                </table>
                </div>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="19"><img id="top_13" onClick="third('menu_13','top_13');" src="/oa/images/tree_17.gif" width="19" height="20"/></td>
                  <td width="19"><img src="/oa/images/tree_30.gif" width="19" height="20"/></td>
                  <td width="390" nowrap class="td04">　机构基本信息子集</td>
                  <td width="263" nowrap class="td04">
                    <input type="radio" name="radio01" value=""/>
                    拒绝
                    <input type="radio" name="radio01" value=""/>
                    读
                    <input type="radio" name="radio01" value=""/>
改
<input type="radio" name="radio01" value=""/>
增
<input type="radio" name="radio01" value=""/>
删
<input type="radio" name="radio01" value=""/>
增删</td>
                  </tr>
              </table>
              <div id="menu_13" style="DISPLAY: none">
                <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="19">&nbsp;</td>
                    <td width="19">&nbsp;</td>
                    <td><br/>
                        <table width="100%" border="0" align="center" cellpadding="2" cellspacing="1" class="td01">
                          <tr nowrap>
                            <td width="65" align="center" class="td02">单位性质</td>
                            <td bgcolor="#FFFFFF" >
                    <input type="radio" name="radio06" value=""/>拒绝
                    <input type="radio" name="radio06" value=""/>读
                    <input type="radio" name="radio06" value=""/>改</td>
                            <td width="65" align="center" class="td02">机构名称</td>
                            <td bgcolor="#FFFFFF" >
                    <input type="radio" name="radio0601" value=""/>拒绝
                    <input type="radio" name="radio0601" value=""/>读
                    <input type="radio" name="radio0601" value=""/>改</td>
                            <td width="65" align="center" class="td02">机构简称</td>
                            <td bgcolor="#FFFFFF" >
                    <input type="radio" name="radio0602" value=""/>拒绝
                    <input type="radio" name="radio0602" value=""/>读
                    <input type="radio" name="radio0602" value=""/>改</td>
                          </tr>
                          <tr nowrap>
                            <td align="center" class="td02">上级机构</td>
                            <td bgcolor="#FFFFFF" >
                    <input type="radio" name="radio0603" value=""/>拒绝
                    <input type="radio" name="radio0603" value=""/>读
                    <input type="radio" name="radio0603" value=""/>改</td>
                            <td align="center" class="td02">机构类别</td>
                            <td bgcolor="#FFFFFF" >
                    <input type="radio" name="radio0604" value=""/>拒绝
                    <input type="radio" name="radio0604" value=""/>读
                    <input type="radio" name="radio0604" value=""/>改</td>
                            <td align="center" class="td02">编制总数</td>
                            <td bgcolor="#FFFFFF" >
                    <input type="radio" name="radio0605" value=""/>拒绝
                    <input type="radio" name="radio0605" value=""/>读
                    <input type="radio" name="radio0605" value=""/>改</td>
                          </tr>
                          <tr>
                            <td align="center" class="td02">领导职数</td>
                            <td bgcolor="#FFFFFF" >
                    <input type="radio" name="radio0606" value=""/>拒绝
                    <input type="radio" name="radio0606" value=""/>读
                    <input type="radio" name="radio0606" value=""/>改</td>
                            <td align="center" class="td02">实有人数</td>
                            <td bgcolor="#FFFFFF" >
                    <input type="radio" name="radio0607" value=""/>拒绝
                    <input type="radio" name="radio0607" value=""/>读
                    <input type="radio" name="radio0607" value=""/>改</td>
                            <td align="center" class="td02">超编人数</td>
                            <td bgcolor="#FFFFFF" >
                    <input type="radio" name="radio0608" value=""/>拒绝
                    <input type="radio" name="radio0608" value=""/>读
                    <input type="radio" name="radio0608" value=""/>改</td>
                          </tr>
                          <tr>
                            <td align="center" class="td02">缺编人数</td>
                            <td bgcolor="#FFFFFF" >
                    <input type="radio" name="radio0609" value=""/>拒绝
                    <input type="radio" name="radio0609" value=""/>读
                    <input type="radio" name="radio0609" value=""/>改</td>
                            <td align="center" class="td02">机构级别</td>
                            <td bgcolor="#FFFFFF" >
                    <input type="radio" name="radio0610" value=""/>拒绝
                    <input type="radio" name="radio0610" value=""/>读
                    <input type="radio" name="radio0610" value=""/>改</td>
                            <td align="center" class="td02">隶属关系</td>
                            <td bgcolor="#FFFFFF" >
                    <input type="radio" name="radio0611" value=""/>拒绝
                    <input type="radio" name="radio0611" value=""/>读
                    <input type="radio" name="radio0611" value=""/>改</td>
                          </tr>
                        </table>
                        <br/></td>
                  </tr>
                </table></div></td>
          </tr>
        </table>
        <br/></td>
    </tr>
  </tbody>
  <tbody style="display:none;">
    <tr>
      <td align=center valign=top><table width="95%"  border="0" cellspacing="0" cellpadding="0">
       
      </table>
        <table width="95%"  border="0" cellpadding="15" cellspacing="1" class="td_bottom">
          <tr>
            <td width="50%" align="center" valign="top" bgcolor="#FFFFFF"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="20" class="td04">　根据机构设置范围</td>
              </tr>
            </table>
              <br/>
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="19"><img id="top_14" onClick="head('menu_14','top_14');" src="/oa/images/tree_03.gif" width="19" height="20"/></td>
                <td width="19"><img src="/oa/images/tree_27.gif" width="19" height="20"/></td>
                <td nowrap>部机关</td>
                <td width="20" nowrap>
                  <input type="checkbox" name="checkbox" value="checkbox"/>
                </td>
              </tr>
            </table>
              <div id="menu_14" style="DISPLAY: none">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"/></td>
                    <td nowrap>地区业务司</td>
                <td width="20" nowrap>
                  <input type="checkbox" name="checkbox" value="checkbox"/>
                </td>
                  </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"/></td>
                    <td nowrap>行政部门</td>
                <td width="20" nowrap>
                  <input type="checkbox" name="checkbox" value="checkbox"/>/
                </td>
                  </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"/></td>
                    <td nowrap>党务部门</td>
                <td width="20" nowrap>
                  <input type="checkbox" name="checkbox" value="checkbox"/>
                </td>
                  </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_23.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"/></td>
                    <td nowrap>专业部门</td>
                <td width="20" nowrap>
                  <input type="checkbox" name="checkbox" value="checkbox"/>
                </td>
                  </tr>
                </table>
              </div>
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="19"><img id="top_15" onClick="menu('menu_15','top_15');" src="/oa/images/tree_11.gif" width="19" height="20"/></td>
                  <td width="19"><img src="/oa/images/tree_27.gif" width="19" height="20"/></td>
                  <td nowrap>部属</td>
                  <td width="20" nowrap><input type="checkbox" name="checkbox" value="checkbox"/></td>
                </tr>
              </table>
              <div id="menu_15" style="DISPLAY: none">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"/></td>
                    <td nowrap>服务中心</td>
                <td width="20" nowrap>
                  <input type="checkbox" name="checkbox" value="checkbox"/>
                </td>
                  </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"/></td>
                    <td nowrap>档案馆</td>
                <td width="20" nowrap>
                  <input type="checkbox" name="checkbox" value="checkbox"/>
                </td>
                  </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"/></td>
                    <td nowrap>国际问题研究所</td>
                <td width="20" nowrap>
                  <input type="checkbox" name="checkbox" value="checkbox"/>
                </td>
                  </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"/></td>
                    <td nowrap>世界知识出版社</td>
                <td width="20" nowrap>
                  <input type="checkbox" name="checkbox" value="checkbox"/>
                </td>
                  </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"/></td>
                    <td nowrap>外交学院</td>
                <td width="20" nowrap>
                  <input type="checkbox" name="checkbox" value="checkbox"/>
                </td>
                  </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"/></td>
                    <td nowrap>外交人员服务局</td>
                <td width="20" nowrap>
                  <input type="checkbox" name="checkbox" value="checkbox"/>
                </td>
                  </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"/></td>
                    <td nowrap>钓鱼台宾馆</td>
                <td width="20" nowrap>
                  <input type="checkbox" name="checkbox" value="checkbox"/>
                </td>
                  </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_23.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"/></td>
                    <td nowrap>外交学会</td>
                <td width="20" nowrap>
                  <input type="checkbox" name="checkbox" value="checkbox"/>
                </td>
                  </tr>
                </table>
              </div>
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="19"><img id="top_16" onClick="bottom('menu_16','top_16');" src="/oa/images/tree_29.gif" width="19" height="20"/></td>
                  <td width="19"><img src="/oa/images/tree_27.gif" width="19" height="20"/></td>
                  <td nowrap>驻外机构</td>
                  <td width="20" nowrap><input type="checkbox" name="checkbox" value="checkbox"/></td>
                </tr>
              </table>
              <div id="menu_16" style="DISPLAY: none">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="19">&nbsp;</td>
                    <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"/></td>
                    <td nowrap>亚洲地区</td>
                <td width="20" nowrap>
                  <input type="checkbox" name="checkbox" value="checkbox"/>
                </td>
                  </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="19">&nbsp;</td>
                    <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"/></td>
                    <td nowrap>西亚北非</td>
                <td width="20" nowrap>
                  <input type="checkbox" name="checkbox" value="checkbox"/>
                </td>
                  </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="19">&nbsp;</td>
                    <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"/></td>
                    <td nowrap>非洲地区</td>
                <td width="20" nowrap>
                  <input type="checkbox" name="checkbox" value="checkbox"/>
                </td>
                  </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="19">&nbsp;</td>
                    <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"/></td>
                    <td nowrap>欧亚地区</td>
                <td width="20" nowrap>
                  <input type="checkbox" name="checkbox" value="checkbox"/>
                </td>
                  </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="19">&nbsp;</td>
                    <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"/></td>
                    <td nowrap>西欧地区</td>
                <td width="20" nowrap>
                  <input type="checkbox" name="checkbox" value="checkbox"/>
                </td>
                  </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="19">&nbsp;</td>
                    <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"/></td>
                    <td nowrap>美大地区</td>
                <td width="20" nowrap>
                  <input type="checkbox" name="checkbox" value="checkbox"/>
                </td>
                  </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="19">&nbsp;</td>
                    <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"/></td>
                    <td nowrap>拉美地区</td>
                <td width="20" nowrap>
                  <input type="checkbox" name="checkbox" value="checkbox"/>
                </td>
                  </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="19">&nbsp;</td>
                    <td width="19"><img src="/oa/images/tree_23.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"/></td>
                    <td nowrap>国际机构</td>
                <td width="20" nowrap>
                  <input type="checkbox" name="checkbox" value="checkbox"/>
                </td>
                  </tr>
                </table>
              </div></td>
            <td align="center" valign="top" bgcolor="#FFFFFF"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="20" class="td04">　根据岗位设置范围</td>
              </tr>
            </table>
              <table width="100%"  border="0" cellspacing="12" cellpadding="0">
                <tr>
                  <td><input type="checkbox"/>
      部长<br/>
      <input type="checkbox"/>
      副部长<br/>
      <input type="checkbox"/>
      网络系统分析师<br/>
      <input type="checkbox"/>
     网络系统工程师<br/>
      <input type="checkbox"/>
      网络系统主管<br/>
      <input type="checkbox"/>
     处长<br/>
      <input type="checkbox"/>
      副处长<br/>
     </td>
                </tr>
              </table>
             
              </td>
          </tr>
        </table>
        <br/></td>
    </tr>
  </tbody>
  <tbody style="display:none;">
    <tr>
      <td align=center valign=top><table width="95%"  border="0" cellspacing="0" cellpadding="0">
        
      </table>
        <table width="95%"  border="0" cellpadding="15" cellspacing="1" class="td_bottom">
          <tr>
            <td width="50%" align="center" valign="top" bgcolor="#FFFFFF"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td height="20" class="td04">　根据机构设置范围</td>
                </tr>
              </table>
                <br/>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="19"><img id="top_17" onClick="head('menu_17','top_17');" src="/oa/images/tree_03.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_27.gif" width="19" height="20"/></td>
                    <td nowrap>部机关</td>
                    <td width="20" nowrap><input type="checkbox" name="checkbox" value="checkbox"/>
                    </td>
                  </tr>
                </table>
                <div id="menu_17" style="DISPLAY: none">
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"/></td>
                      <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                      <td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"/></td>
                      <td nowrap>地区业务司</td>
                      <td width="20" nowrap><input type="checkbox" name="checkbox" value="checkbox"/>
                      </td>
                    </tr>
                  </table>
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"/></td>
                      <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                      <td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"/></td>
                      <td nowrap>行政部门</td>
                      <td width="20" nowrap><input type="checkbox" name="checkbox" value="checkbox"/>
                      </td>
                    </tr>
                  </table>
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"/></td>
                      <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                      <td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"/></td>
                      <td nowrap>党务部门</td>
                      <td width="20" nowrap><input type="checkbox" name="checkbox" value="checkbox"/>
                      </td>
                    </tr>
                  </table>
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"/></td>
                      <td width="19"><img src="/oa/images/tree_23.gif" width="19" height="20"/></td>
                      <td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"/></td>
                      <td nowrap>专业部门</td>
                      <td width="20" nowrap><input type="checkbox" name="checkbox" value="checkbox"/>
                      </td>
                    </tr>
                  </table>
                </div>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="19"><img id="top_18" onClick="menu('menu_18','top_18');" src="/oa/images/tree_11.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_27.gif" width="19" height="20"/></td>
                    <td nowrap>部属</td>
                    <td width="20" nowrap><input type="checkbox" name="checkbox" value="checkbox"/></td>
                  </tr>
                </table>
                <div id="menu_18" style="DISPLAY: none">
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"/></td>
                      <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                      <td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"/></td>
                      <td nowrap>服务中心</td>
                      <td width="20" nowrap><input type="checkbox" name="checkbox" value="checkbox"/>
                      </td>
                    </tr>
                  </table>
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"/></td>
                      <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                      <td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"/></td>
                      <td nowrap>档案馆</td>
                      <td width="20" nowrap><input type="checkbox" name="checkbox" value="checkbox"/>
                      </td>
                    </tr>
                  </table>
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"/></td>
                      <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                      <td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"/></td>
                      <td nowrap>国际问题研究所</td>
                      <td width="20" nowrap><input type="checkbox" name="checkbox" value="checkbox"/>
                      </td>
                    </tr>
                  </table>
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"/></td>
                      <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                      <td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"/></td>
                      <td nowrap>世界知识出版社</td>
                      <td width="20" nowrap><input type="checkbox" name="checkbox" value="checkbox"/>
                      </td>
                    </tr>
                  </table>
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"/></td>
                      <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                      <td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"/></td>
                      <td nowrap>外交学院</td>
                      <td width="20" nowrap><input type="checkbox" name="checkbox" value="checkbox"/>
                      </td>
                    </tr>
                  </table>
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"/></td>
                      <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                      <td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"/></td>
                      <td nowrap>外交人员服务局</td>
                      <td width="20" nowrap><input type="checkbox" name="checkbox" value="checkbox"/>
                      </td>
                    </tr>
                  </table>
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"/></td>
                      <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                      <td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"/></td>
                      <td nowrap>钓鱼台宾馆</td>
                      <td width="20" nowrap><input type="checkbox" name="checkbox" value="checkbox"/>
                      </td>
                    </tr>
                  </table>
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"/></td>
                      <td width="19"><img src="/oa/images/tree_23.gif" width="19" height="20"/></td>
                      <td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"/></td>
                      <td nowrap>外交学会</td>
                      <td width="20" nowrap><input type="checkbox" name="checkbox" value="checkbox"/>
                      </td>
                    </tr>
                  </table>
                </div>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="19"><img id="top_19" onClick="bottom('menu_19','top_19');" src="/oa/images/tree_29.gif" width="19" height="20"/></td>
                    <td width="19"><img src="/oa/images/tree_27.gif" width="19" height="20"/></td>
                    <td nowrap>驻外机构</td>
                    <td width="20" nowrap><input type="checkbox" name="checkbox" value="checkbox"/></td>
                  </tr>
                </table>
                <div id="menu_19" style="DISPLAY: none">
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="19">&nbsp;</td>
                      <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                      <td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"/></td>
                      <td nowrap>亚洲地区</td>
                      <td width="20" nowrap><input type="checkbox" name="checkbox" value="checkbox"/>
                      </td>
                    </tr>
                  </table>
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="19">&nbsp;</td>
                      <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                      <td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"/></td>
                      <td nowrap>西亚北非</td>
                      <td width="20" nowrap><input type="checkbox" name="checkbox" value="checkbox"/>
                      </td>
                    </tr>
                  </table>
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="19">&nbsp;</td>
                      <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                      <td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"/></td>
                      <td nowrap>非洲地区</td>
                      <td width="20" nowrap><input type="checkbox" name="checkbox" value="checkbox"/>
                      </td>
                    </tr>
                  </table>
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="19">&nbsp;</td>
                      <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                      <td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"/></td>
                      <td nowrap>欧亚地区</td>
                      <td width="20" nowrap><input type="checkbox" name="checkbox" value="checkbox"/>
                      </td>
                    </tr>
                  </table>
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="19">&nbsp;</td>
                      <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                      <td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"/></td>
                      <td nowrap>西欧地区</td>
                      <td width="20" nowrap><input type="checkbox" name="checkbox" value="checkbox"/>
                      </td>
                    </tr>
                  </table>
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="19">&nbsp;</td>
                      <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                      <td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"/></td>
                      <td nowrap>美大地区</td>
                      <td width="20" nowrap><input type="checkbox" name="checkbox" value="checkbox"/>
                      </td>
                    </tr>
                  </table>
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="19">&nbsp;</td>
                      <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                      <td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"/></td>
                      <td nowrap>拉美地区</td>
                      <td width="20" nowrap><input type="checkbox" name="checkbox" value="checkbox"/>
                      </td>
                    </tr>
                  </table>
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="19">&nbsp;</td>
                      <td width="19"><img src="/oa/images/tree_23.gif" width="19" height="20"/></td>
                      <td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"/></td>
                      <td nowrap>国际机构</td>
                      <td width="20" nowrap><input type="checkbox" name="checkbox" value="checkbox"/>
                      </td>
                    </tr>
                  </table>
              </div></td>
            <td align="center" valign="top" bgcolor="#FFFFFF"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td height="20" class="td04">　根据岗位设置范围</td>
                </tr>
              </table>
                <table width="100%"  border="0" cellspacing="12" cellpadding="0">
                  <tr>
                    <td><input type="checkbox"/>
      部长<br/>
      <input type="checkbox"/>
      副部长<br/>
      <input type="checkbox"/>
      网络系统分析师<br/>
      <input type="checkbox"/>
     网络系统工程师<br/>
      <input type="checkbox"/>
      网络系统主管<br/>
      <input type="checkbox"/>
     处长<br/>
      <input type="checkbox"/>
      副处长<br/>
     </td>
                  </tr>
                </table>
               
              </td>
          </tr>
        </table>
        <br/></td>
    </tr>
  </tbody>
</table>
<br/>
</center>
</body>
</html>
