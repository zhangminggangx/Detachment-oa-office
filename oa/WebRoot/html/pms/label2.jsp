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
<script type="text/javascript" language="JavaScript1.2" src="../../js/stm31.js"></script>
<SCRIPT language=javascript src="../../js/tree2.js">
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
<link href="../../css/style.css" rel="stylesheet" type="text/css"></link>
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<center>
  <span class="F02"></span> <br>
  <table width="95%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td align="right" class="td_page"><input name="Submit" type="button" class="buttonface" value="  保存  " >
          <input name="Submit" type="button" class="buttonface" onClick="parent.location.href='query.htm'" value=" 返回  "></input>
      </td>
    </tr>
  </table>
  </br>
  <table width="95%"  border="0" cellspacing="2" cellpadding="0">
    <tr>
      <td class="td_title">修改操作员信息</td>
    </tr>
  </table>
  <table width="95%"  border="0" align="center" cellpadding="5" cellspacing="0">
    <tr> 
      <td width="90" align="right" class="td_form01">登录名</td>
      <td class="td_form02"> 
        <input type="text" name="textfield"></input>
      </td>
    </tr>
    <tr> 
      <td align="right" class="td_form01">角色信息</td>
      <td class="td_form02">
        <textarea name="rolesName" cols="80" rows="4" readonly="readonly"></textarea>
        <input type=button name=button class="buttonface02" value="  选择  " onClick="windowOpen('rolelist2.htm','','','340','270','no','50','50')"></input>
        <input type=button name=Button class="buttonface" value="清除角色" ></input>
        <input type="hidden" name="rolesId" value=""></input>
      </td>
    </tr>
  </table>
<br />
  <table width="95%"  border="0" cellspacing="2" cellpadding="0">
      <tr>
        <td class="td_title">操作员权限信息</td>
      </tr>
  </table>
    
  <table width="95%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td width="480">
        <table width="480" border="0" cellpadding="0" cellspacing="0" id=secTable>
          <tr height="20" align="center"> 
            <td width="120" height="25" class="sec2" onClick="secBoard(0)">操作权限</td>
            <td width="120" class="sec1" onClick="secBoard(1)">查询范围权限</td>
            <td width="120" class="sec1" onClick="secBoard(2)">操作范围权限</td>
            <td width="120" class="sec1" onClick="secBoard(3)">信息项权限</td>
          </tr>
        </table>
      </td>
      <td class="sec3">&nbsp;</td>
    </tr>
  </table>
  <table border="0" cellspacing="0" cellpadding="0" width="95%" height="240" id=mainTable class="main_tab">
    <tbody style="display:block;"> 
    <tr> 
      <td align="center" valign=top>
        <table width="95%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td height="30" align="right" valign="bottom">
              <input name="Submit2" type="submit" class="buttonface02" value="  全选  "></input>
              <input name="Submit2" type="submit" class="buttonface02" value="  保存  "></input>
            </td>
          </tr>
        </table>
        <table width="95%"  border="0" cellpadding="15" cellspacing="0" class="td_bottom">
          <tr> 
            <td align="center" bgcolor="#FFFFFF">
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td width="19"><img id="top_1" onClick="head('menu_1','top_1');" src="../../images/tree_03.gif" width="19" height="20"></img></td>
                  <td width="19"><img src="../../images/tree_31.gif" width="19" height="20"></img></td>
                  <td nowrap class="td04">
                    <input type="checkbox" name="checkbox" value="checkbox"></input>
                    机构管理</td>
                </tr>
              </table>
              <div id="menu_1" style="DISPLAY: none"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="19"><img src="../../images/tree_06.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_07.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_31.gif" width="19" height="20"></img></td>
                    <td nowrap>
                      <input type="checkbox" name="checkbox" value="checkbox"></input>
                      机构维护</td>
                  </tr>
                </table>
              </div>
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td width="19"><img id="top_2" onClick="menu('menu_2','top_2');" src="../../images/tree_11.gif" width="19" height="20"></img></td>
                  <td width="19"><img src="../../images/tree_31.gif" width="19" height="20"></img></td>
                  <td nowrap class="td04">
                    <input type="checkbox" name="checkbox" value="checkbox"></input>
                    BBS </td>
                </tr>
              </table>
              <div id="menu_2" style="DISPLAY: none"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="19"><img src="../../images/tree_06.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_07.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_31.gif" width="19" height="20"></img></td>
                    <td nowrap>
                      <input type="checkbox" name="checkbox" value="checkbox"></input>
                      BBS</td>
                  </tr>
                </table>
              </div>
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td width="19"><img id="top_3" onClick="menu('menu_3','top_3');" src="../../images/tree_11.gif" width="19" height="20"></img></td>
                  <td width="19"><img src="../../images/tree_31.gif" width="19" height="20"></img></td>
                  <td nowrap class="td04">
                    <input type="checkbox" name="checkbox" value="checkbox"></input>
                    新闻申报</td>
                </tr>
              </table>
              <div id="menu_3" style="DISPLAY: none"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="19"><img src="../../images/tree_06.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_07.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_31.gif" width="19" height="20"></img></td>
                    <td nowrap>
                      <input type="checkbox" name="checkbox" value="checkbox"></input>
                      申报查看</td>
                  </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="19"><img src="../../images/tree_06.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_07.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_31.gif" width="19" height="20"></img></td>
                    <td nowrap>
                      <input type="checkbox" name="checkbox" value="checkbox"></input>
                      申报查询</td>
                  </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="19"><img src="../../images/tree_06.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_07.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_31.gif" width="19" height="20"></img></td>
                    <td nowrap>
                      <input type="checkbox" name="checkbox" value="checkbox"></input>
                      申报统计</td>
                  </tr>
                </table>
              </div>
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td width="19"><img id="top_4" onClick="menu('menu_4','top_4');" src="../../images/tree_11.gif" width="19" height="20"></img></td>
                  <td width="19"><img src="../../images/tree_31.gif" width="19" height="20"></img></td>
                  <td nowrap class="td04">
                    <input type="checkbox" name="checkbox" value="checkbox"></input>
                    工作流程</td>
                </tr>
              </table>
              <div id="menu_4" style="DISPLAY: none"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="19"><img src="../../images/tree_06.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_07.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_31.gif" width="19" height="20"></img></td>
                    <td nowrap>
                      <input type="checkbox" name="checkbox" value="checkbox"></input>
                      启动流程</td>
                  </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="19"><img src="../../images/tree_06.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_07.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_31.gif" width="19" height="20"></img></td>
                    <td nowrap>
                      <input type="checkbox" name="checkbox" value="checkbox"></input>
                      待办事宜</td>
                  </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="19"><img src="../../images/tree_06.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_07.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_30.gif" width="19" height="20"></img></td>
                    <td nowrap>
                      <input type="checkbox" name="checkbox" value="checkbox"></input>
                      手续监控</td>
                  </tr>
                </table>
              </div>
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td width="19"><img id="top_5" onClick="menu('menu_5','top_5');" src="../../images/tree_11.gif" width="19" height="20"></img></td>
                  <td width="19"><img src="../../images/tree_31.gif" width="19" height="20"></img></td>
                  <td nowrap class="td04">
                    <input type="checkbox" name="checkbox" value="checkbox"></input>
                    权限管理</td>
                </tr>
              </table>
              <div id="menu_5" style="DISPLAY: none"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="19"><img src="../../images/tree_06.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_07.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_30.gif" width="19" height="20"></img></td>
                    <td nowrap>
                      <input type="checkbox" name="checkbox" value="checkbox"></input>
                      角色管理</td>
                  </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="19"><img src="../../images/tree_06.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_07.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_30.gif" width="19" height="20"></img></td>
                    <td nowrap>
                      <input type="checkbox" name="checkbox" value="checkbox"></input>
                      用户管理</td>
                  </tr>
                </table>
              </div>
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td width="19"><img id="top_7" onClick="third('menu_7','top_7');" src="../../images/tree_17.gif" width="19" height="20"></img></td>
                  <td width="19"><img src="../../images/tree_31.gif" width="19" height="20"></img></td>
                  <td nowrap class="td04">
                    <input type="checkbox" name="checkbox" value="checkbox"></input>
                    系统管理</td>
                </tr>
              </table>
              <div id="menu_7" style="DISPLAY: none"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="19">&nbsp;</td>
                    <td width="19"><img src="../../images/tree_07.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_31.gif" width="19" height="20"></img></td>
                    <td nowrap>
                      <input type="checkbox" name="checkbox" value="checkbox"></input>
                      指标管理</td>
                  </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="19">&nbsp;</td>
                    <td width="19"><img src="../../images/tree_07.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_31.gif" width="19" height="20"></img></td>
                    <td nowrap>
                      <input type="checkbox" name="checkbox" value="checkbox"></input>
                      代码管理</td>
                  </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="19">&nbsp;</td>
                    <td width="19"><img src="../../images/tree_23.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_30.gif" width="19" height="20"></img></td>
                    <td nowrap>
                      <input type="checkbox" name="checkbox" value="checkbox"></input>
                      日志管理</td>
                  </tr>
                </table>
              </div>
            </td>
          </tr>
        </table>
        </br>
      </td>
    </tr>
    </tbody> <tbody style="display:none;"> 
    <tr> 
      <td align=center valign=top>
        <table width="95%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td height="30" align="right" valign="bottom">
              <input name="Submit2" type="submit" class="buttonface02" value="  全选  "></input>
              <input name="Submit2" type="submit" class="buttonface02" value="  保存  "></input>
            </td>
          </tr>
        </table>
        <table width="95%"  border="0" cellpadding="15" cellspacing="0" class="td_bottom">
          <tr> 
            <td width="97%" align="center" valign="top" bgcolor="#FFFFFF"> 
              <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td height="20" class="td04">　根据机构设置范围</td>
                </tr>
              </table>
              </br>
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td width="19"><img id="top_17" onClick="head('menu_17','top_17');" src="../../images/tree_03.gif" width="19" height="20"></img></td>
                  <td width="19"><img src="../../images/tree_27.gif" width="19" height="20"></img></td>
                  <td nowrap>部机关</td>
                  <td width="20" nowrap>
                    <input type="checkbox" name="checkbox" value="checkbox"></input>
                  </td>
                </tr>
              </table>
              <div id="menu_17" style="DISPLAY: none"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="19"><img src="../../images/tree_06.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_07.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_08.gif" width="19" height="20"></img></td>
                    <td nowrap>地区业务司</td>
                    <td width="20" nowrap>
                      <input type="checkbox" name="checkbox" value="checkbox"></input>
                    </td>
                  </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="19"><img src="../../images/tree_06.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_07.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_08.gif" width="19" height="20"></img></td>
                    <td nowrap>行政部门</td>
                    <td width="20" nowrap>
                      <input type="checkbox" name="checkbox" value="checkbox"></input>
                    </td>
                  </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="19"><img src="../../images/tree_06.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_07.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_08.gif" width="19" height="20"></img></td>
                    <td nowrap>党务部门</td>
                    <td width="20" nowrap>
                      <input type="checkbox" name="checkbox" value="checkbox"></input>
                    </td>
                  </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="19"><img src="../../images/tree_06.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_23.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_08.gif" width="19" height="20"></img></td>
                    <td nowrap>专业部门</td>
                    <td width="20" nowrap>
                      <input type="checkbox" name="checkbox" value="checkbox"></input>
                    </td>
                  </tr>
                </table>
              </div>
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td width="19"><img id="top_18" onClick="menu('menu_18','top_18');" src="../../images/tree_11.gif" width="19" height="20"></img></td>
                  <td width="19"><img src="../../images/tree_27.gif" width="19" height="20"></img></td>
                  <td nowrap>部属</td>
                  <td width="20" nowrap>
                    <input type="checkbox" name="checkbox" value="checkbox"></input>
                  </td>
                </tr>
              </table>
              <div id="menu_18" style="DISPLAY: none"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="19"><img src="../../images/tree_06.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_07.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_08.gif" width="19" height="20"></img></td>
                    <td nowrap>服务中心</td>
                    <td width="20" nowrap>
                      <input type="checkbox" name="checkbox" value="checkbox"></input>
                    </td>
                  </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="19"><img src="../../images/tree_06.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_07.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_08.gif" width="19" height="20"></img></td>
                    <td nowrap>档案馆</td>
                    <td width="20" nowrap>
                      <input type="checkbox" name="checkbox" value="checkbox"></input>
                    </td>
                  </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="19"><img src="../../images/tree_06.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_07.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_08.gif" width="19" height="20"></img></td>
                    <td nowrap>国际问题研究所</td>
                    <td width="20" nowrap>
                      <input type="checkbox" name="checkbox" value="checkbox">
                    </td>
                  </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="19"><img src="../../images/tree_06.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_07.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_08.gif" width="19" height="20"></img></td>
                    <td nowrap>世界知识出版社</td>
                    <td width="20" nowrap>
                      <input type="checkbox" name="checkbox" value="checkbox"></input>
                    </td>
                  </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="19"><img src="../../images/tree_06.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_07.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_08.gif" width="19" height="20"></img></td>
                    <td nowrap>外交学院</td>
                    <td width="20" nowrap>
                      <input type="checkbox" name="checkbox" value="checkbox"></input>
                    </td>
                  </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="19"><img src="../../images/tree_06.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_07.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_08.gif" width="19" height="20"></img></td>
                    <td nowrap>外交人员服务局</td>
                    <td width="20" nowrap>
                      <input type="checkbox" name="checkbox" value="checkbox"></input>
                    </td>
                  </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="19"><img src="../../images/tree_06.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_07.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_08.gif" width="19" height="20"></img></td>
                    <td nowrap>钓鱼台宾馆</td>
                    <td width="20" nowrap>
                      <input type="checkbox" name="checkbox" value="checkbox"></input>
                    </td>
                  </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="19"><img src="../../images/tree_06.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_23.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_08.gif" width="19" height="20"></img></td>
                    <td nowrap>外交学会</td>
                    <td width="20" nowrap>
                      <input type="checkbox" name="checkbox" value="checkbox"></input>
                    </td>
                  </tr>
                </table>
              </div>
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td width="19"><img id="top_19" onClick="bottom('menu_19','top_19');" src="../../images/tree_29.gif" width="19" height="20"></img></td>
                  <td width="19"><img src="../../images/tree_27.gif" width="19" height="20"></img></td>
                  <td nowrap>驻外机构</td>
                  <td width="20" nowrap>
                    <input type="checkbox" name="checkbox" value="checkbox"></input>
                  </td>
                </tr>
              </table>
              <div id="menu_19" style="DISPLAY: none"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="19">&nbsp;</td>
                    <td width="19"><img src="../../images/tree_07.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_08.gif" width="19" height="20"></img></td>
                    <td nowrap>亚洲地区</td>
                    <td width="20" nowrap>
                      <input type="checkbox" name="checkbox" value="checkbox"></input>
                    </td>
                  </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="19">&nbsp;</td>
                    <td width="19"><img src="../../images/tree_07.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_08.gif" width="19" height="20"></img></td>
                    <td nowrap>西亚北非</td>
                    <td width="20" nowrap>
                      <input type="checkbox" name="checkbox" value="checkbox"></input>
                    </td>
                  </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="19">&nbsp;</td>
                    <td width="19"><img src="../../images/tree_07.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_08.gif" width="19" height="20"></img></td>
                    <td nowrap>非洲地区</td>
                    <td width="20" nowrap>
                      <input type="checkbox" name="checkbox" value="checkbox"></input>
                    </td>
                  </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="19">&nbsp;</td>
                    <td width="19"><img src="../../images/tree_07.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_08.gif" width="19" height="20"></img></td>
                    <td nowrap>欧亚地区</td>
                    <td width="20" nowrap>
                      <input type="checkbox" name="checkbox" value="checkbox"></input>
                    </td>
                  </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="19">&nbsp;</td>
                    <td width="19"><img src="../../images/tree_07.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_08.gif" width="19" height="20"></img></td>
                    <td nowrap>西欧地区</td>
                    <td width="20" nowrap>
                      <input type="checkbox" name="checkbox" value="checkbox">
                    </td>
                  </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="19">&nbsp;</td>
                    <td width="19"><img src="../../images/tree_07.gif" width="19" height="20"></td>
                    <td width="19"><img src="../../images/tree_08.gif" width="19" height="20"></td>
                    <td nowrap>美大地区</td>
                    <td width="20" nowrap>
                      <input type="checkbox" name="checkbox" value="checkbox"></input>
                    </td>
                  </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="19">&nbsp;</td>
                    <td width="19"><img src="../../images/tree_07.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_08.gif" width="19" height="20"></img></td>
                    <td nowrap>拉美地区</td>
                    <td width="20" nowrap>
                      <input type="checkbox" name="checkbox" value="checkbox"></input>
                    </td>
                  </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="19">&nbsp;</td>
                    <td width="19"><img src="../../images/tree_23.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_08.gif" width="19" height="20"></img></td>
                    <td nowrap>国际机构</td>
                    <td width="20" nowrap>
                      <input type="checkbox" name="checkbox" value="checkbox"></input>
                    </td>
                  </tr>
                </table>
              </div>
            </td>
          </tr>
        </table>
        </br>
      </td>
    </tr>
    </tbody> <tbody style="display:none;"> 
    <tr> 
      <td align=center valign=top>
        <table width="95%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td height="30" align="right" valign="bottom">
              <input name="Submit2" type="submit" class="buttonface02" value="  全选  "></input>
              <input name="Submit2" type="submit" class="buttonface02" value="  保存  "></input>
            </td>
          </tr>
        </table>
        <table width="95%"  border="0" cellpadding="15" cellspacing="0" class="td_bottom">
          <tr> 
            <td width="94%" align="center" valign="top" bgcolor="#FFFFFF"> 
              <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td height="20" class="td04">　根据机构设置范围</td>
                </tr>
              </table>
              </br>
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td width="19"><img id="top_14" onClick="head('menu_14','top_14');" src="../../images/tree_03.gif" width="19" height="20"></img></td>
                  <td width="19"><img src="../../images/tree_27.gif" width="19" height="20"></img></td>
                  <td nowrap>部机关</td>
                  <td width="20" nowrap>
                    <input type="checkbox" name="checkbox" value="checkbox"></input>
                  </td>
                </tr>
              </table>
              <div id="menu_14" style="DISPLAY: none"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="19"><img src="../../images/tree_06.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_07.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_08.gif" width="19" height="20"></img></td>
                    <td nowrap>地区业务司</td>
                    <td width="20" nowrap>
                      <input type="checkbox" name="checkbox" value="checkbox"></input>
                    </td>
                  </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="19"><img src="../../images/tree_06.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_07.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_08.gif" width="19" height="20"></img></td>
                    <td nowrap>行政部门</td>
                    <td width="20" nowrap>
                      <input type="checkbox" name="checkbox" value="checkbox"></input>
                    </td>
                  </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                   <td width="19"><img src="../../images/tree_06.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_07.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_08.gif" width="19" height="20"></img></td>
                    <td nowrap>党务部门</td>
                    <td width="20" nowrap>
                      <input type="checkbox" name="checkbox" value="checkbox"></input>
                    </td>
                  </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="19"><img src="../../images/tree_06.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_23.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_08.gif" width="19" height="20"></img></td>
                    <td nowrap>专业部门</td>
                    <td width="20" nowrap>
                      <input type="checkbox" name="checkbox" value="checkbox"></input>
                    </td>
                  </tr>
                </table>
              </div>
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td width="19"><img id="top_15" onClick="menu('menu_15','top_15');" src="../../images/tree_11.gif" width="19" height="20"></img></td>
                  <td width="19"><img src="../../images/tree_27.gif" width="19" height="20"></img></td>
                  <td nowrap>部属</td>
                  <td width="20" nowrap>
                    <input type="checkbox" name="checkbox" value="checkbox"></input>
                  </td>
                </tr>
              </table>
              <div id="menu_15" style="DISPLAY: none"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="19"><img src="../../images/tree_06.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_07.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_08.gif" width="19" height="20"></img></td>
                    <td nowrap>服务中心</td>
                    <td width="20" nowrap>
                      <input type="checkbox" name="checkbox" value="checkbox"></input>
                    </td>
                  </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                   <td width="19"><img src="../../images/tree_06.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_07.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_08.gif" width="19" height="20"></img></td>
                    <td nowrap>档案馆</td>
                    <td width="20" nowrap>
                      <input type="checkbox" name="checkbox" value="checkbox"></input>
                    </td>
                  </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                   <td width="19"><img src="../../images/tree_06.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_07.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_08.gif" width="19" height="20"></img></td>
                    <td nowrap>国际问题研究所</td>
                    <td width="20" nowrap>
                      <input type="checkbox" name="checkbox" value="checkbox"></input>
                    </td>
                  </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                   <td width="19"><img src="../../images/tree_06.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_07.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_08.gif" width="19" height="20"></img></td>
                    <td nowrap>世界知识出版社</td>
                    <td width="20" nowrap>
                      <input type="checkbox" name="checkbox" value="checkbox"></input>
                    </td>
                  </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                   <td width="19"><img src="../../images/tree_06.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_07.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_08.gif" width="19" height="20"></img></td>
                    <td nowrap>外交学院</td>
                    <td width="20" nowrap>
                      <input type="checkbox" name="checkbox" value="checkbox"></input>
                    </td>
                  </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="19"><img src="../../images/tree_06.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_07.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_08.gif" width="19" height="20"></img></td>
                    <td nowrap>外交人员服务局</td>
                    <td width="20" nowrap>
                      <input type="checkbox" name="checkbox" value="checkbox"></input>
                    </td>
                  </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                   <td width="19"><img src="../../images/tree_06.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_07.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_08.gif" width="19" height="20"></img></td>
                    <td nowrap>钓鱼台宾馆</td>
                    <td width="20" nowrap>
                      <input type="checkbox" name="checkbox" value="checkbox"></input>
                    </td>
                  </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                 <td width="19"><img src="../../images/tree_06.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_07.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_08.gif" width="19" height="20"></img></td>
                    <td nowrap>外交学会</td>
                    <td width="20" nowrap>
                      <input type="checkbox" name="checkbox" value="checkbox"></input>
                    </td>
                  </tr>
                </table>
              </div>
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td width="19"><img id="top_16" onClick="bottom('menu_16','top_16');" src="../../images/tree_29.gif" width="19" height="20"></img></td>
                  <td width="19"><img src="../../images/tree_27.gif" width="19" height="20"></img></td>
                  <td nowrap>驻外机构</td>
                  <td width="20" nowrap>
                    <input type="checkbox" name="checkbox" value="checkbox"></input>
                  </td>
                </tr>
              </table>
              <div id="menu_16" style="DISPLAY: none"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="19">&nbsp;</td>
                    <td width="19"><img src="../../images/tree_07.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_08.gif" width="19" height="20"></img></td>
                    <td nowrap>亚洲地区</td>
                    <td width="20" nowrap>
                      <input type="checkbox" name="checkbox" value="checkbox"></input>
                    </td>
                  </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="19">&nbsp;</td>
                    <td width="19"><img src="../../images/tree_07.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_08.gif" width="19" height="20"></img></td>
                    <td nowrap>西亚北非</td>
                    <td width="20" nowrap>
                      <input type="checkbox" name="checkbox" value="checkbox"></input>
                    </td>
                  </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="19">&nbsp;</td>
                    <td width="19"><img src="../../images/tree_07.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_08.gif" width="19" height="20"></img></td>
                    <td nowrap>非洲地区</td>
                    <td width="20" nowrap>
                      <input type="checkbox" name="checkbox" value="checkbox"></input>
                    </td>
                  </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="19">&nbsp;</td>
                    <td width="19"><img src="../../images/tree_07.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_08.gif" width="19" height="20"></img></td>
                    <td nowrap>欧亚地区</td>
                    <td width="20" nowrap>
                      <input type="checkbox" name="checkbox" value="checkbox"></input>
                    </td>
                  </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="19">&nbsp;</td>
                     <td width="19"><img src="../../images/tree_07.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_08.gif" width="19" height="20"></img></td>
                    <td nowrap>西欧地区</td>
                    <td width="20" nowrap>
                      <input type="checkbox" name="checkbox" value="checkbox"></input>
                    </td>
                  </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="19">&nbsp;</td>
                     <td width="19"><img src="../../images/tree_07.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_08.gif" width="19" height="20"></img></td>
                    <td nowrap>美大地区</td>
                    <td width="20" nowrap>
                      <input type="checkbox" name="checkbox" value="checkbox"></input>
                    </td>
                  </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="19">&nbsp;</td>
                    <td width="19"><img src="../../images/tree_07.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_08.gif" width="19" height="20"></img></td>
                    <td nowrap>拉美地区</td>
                    <td width="20" nowrap>
                      <input type="checkbox" name="checkbox" value="checkbox"></input>
                    </td>
                  </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="19">&nbsp;</td>
                    <td width="19"><img src="../../images/tree_23.gif" width="19" height="20"></img></td>
                    <td width="19"><img src="../../images/tree_08.gif" width="19" height="20"></img></td>
                    <td nowrap>国际机构</td>
                    <td width="20" nowrap>
                      <input type="checkbox" name="checkbox" value="checkbox"></input>
                    </td>
                  </tr>
                </table>
              </div>
            </td>
          </tr>
        </table>
        </br>
      </td>
    </tr>
    </tbody> <tbody style="display:none;"> 
    <tr> 
      <td align=center valign=top>
        <table width="95%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td height="30" valign="bottom">全选
              <input type="radio" name="all" value=""></input>
拒绝
<input type="radio" name="all" value=""></input>
读
<input type="radio" name="all" value=""></input>
改
<input type="radio" name="all" value=""></input>
增
<input type="radio" name="all" value=""></input>
删
<input type="radio" name="all" value=""></input>
增删</td>
            <td align="right" valign="bottom"><input name="Submit22" type="submit" class="buttonface02" value="  保存  "></td>
          </tr>
        </table>
        <table width="95%"  border="0" cellpadding="15" cellspacing="0" class="td_bottom">
          <tr> 
            <td align="center" bgcolor="#FFFFFF">
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td width="19"><img id="top_8" onClick="head('menu_8','top_8');" src="../../images/tree_03.gif" width="19" height="20"></td>
                  <td width="19"><img src="../../images/tree_30.gif" width="19" height="20"></td>
                  <td width="387" nowrap class="td04">　人员基本情况子集</td>
                  <td width="263" nowrap class="td04">
                    <input type="radio" name="radio01" value=""></input>
                    拒绝 
                    <input type="radio" name="radio01" value=""></input>
                    读 
                    <input type="radio" name="radio01" value=""></input>
                    改 
                    <input type="radio" name="radio01" value=""></input>
                    增 
                    <input type="radio" name="radio01" value=""></input>
                    删 
                    <input type="radio" name="radio01" value=""></input>
                    增删</td>
                </tr>
              </table>
              <div id="menu_8" style="DISPLAY: none"> 
                <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="19" background="../../images/tree_06.gif" height="114">&nbsp;</td>
                    <td width="19" height="114">&nbsp;</td>
                    <td height="114"><br>
                      <table width="100%" border="0" align="center" cellpadding="2" cellspacing="1" class="td01">
                        <tr nowrap> 
                          <td width="65" align="center" class="td02">姓　　名</td>
                          <td bgcolor="#FFFFFF"> 
                            <input type="radio" name="radio0101" value=""></input>
                            拒绝 
                            <input type="radio" name="radio0101" value=""></input>
                            读 
                            <input type="radio" name="radio0101" value=""></input>
                            改</td>
                          <td width="65" align="center" class="td02">曾&nbsp;&nbsp;用&nbsp;&nbsp;名</td>
                          <td bgcolor="#FFFFFF"> 
                            <input type="radio" name="radio0102" value=""></input>
                            拒绝 
                            <input type="radio" name="radio0102" value=""></input>
                            读 
                            <input type="radio" name="radio0102" value=""></input>
                            改</td>
                          <td width="65" align="center" class="td02">性　　别</td>
                          <td bgcolor="#FFFFFF"> 
                            <input type="radio" name="radio0103" value=""></input>
                            拒绝 
                            <input type="radio" name="radio0103" value=""></input>
                            读 
                            <input type="radio" name="radio0103" value=""></input>
                            改</td>
                        </tr>
                        <tr nowrap> 
                          <td align="center" class="td02">民　　族</td>
                          <td bgcolor="#FFFFFF" > 
                            <input type="radio" name="radio0104" value=""></input>
                            拒绝 
                            <input type="radio" name="radio0104" value=""></input>
                            读 
                            <input type="radio" name="radio0104" value=""></input>
                            改</td>
                          <td align="center" class="td02">籍　　贯</td>
                          <td bgcolor="#FFFFFF" > 
                            <input type="radio" name="radio0105" value=""></input>
                            拒绝 
                            <input type="radio" name="radio0105" value=""></input>
                            读 
                            <input type="radio" name="radio0105" value=""></input>
                            改</td>
                          <td align="center" class="td02">血　　型</td>
                          <td bgcolor="#FFFFFF" > 
                            <input type="radio" name="radio0106" value=""></input>
                            拒绝 
                            <input type="radio" name="radio0106" value=""></input>
                            读 
                            <input type="radio" name="radio0106" value=""></input>
                            改</td>
                        </tr>
                        <tr> 
                          <td align="center" class="td02">出&nbsp;&nbsp;生&nbsp;&nbsp;地</td>
                          <td bgcolor="#FFFFFF" > 
                            <input type="radio" name="radio0107" value=""></input>
                            拒绝 
                            <input type="radio" name="radio0107" value=""></input>
                            读 
                            <input type="radio" name="radio0107" value=""></input>
                            改</td>
                          <td align="center" class="td02">单　　位</td>
                          <td bgcolor="#FFFFFF" > 
                            <input type="radio" name="radio0108" value=""></input>
                            拒绝 
                            <input type="radio" name="radio0108" value=""></input>
                            读 
                            <input type="radio" name="radio0108" value=""></input>
                            改</td>
                          <td align="center" class="td02">所在部门</td>
                          <td bgcolor="#FFFFFF" > 
                            <input type="radio" name="radio0109" value=""></input>
                            拒绝 
                            <input type="radio" name="radio0109" value=""></input>
                            读 
                            <input type="radio" name="radio0109" value=""></input>
                            改</td>
                        </tr>
                      </table>
                      </br>
                    </td>
                  </tr>
                </table>
              </div>
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td width="19"><img id="top_9" onClick="menu('menu_9','top_9');" src="../../images/tree_11.gif" width="19" height="20"></td>
                  <td width="19"><img src="../../images/tree_30.gif" width="19" height="20"></td>
                  <td width="389" nowrap class="td04">　新闻申报子集</td>
                  <td width="263" nowrap class="td04">
                    <input type="radio" name="radio01" value=""></input>
                    拒绝 
                    <input type="radio" name="radio01" value=""></input>
                    读 
                    <input type="radio" name="radio01" value=""></input>
                    改 
                    <input type="radio" name="radio01" value=""></input>
                    增 
                    <input type="radio" name="radio01" value=""></input>
                    删 
                    <input type="radio" name="radio01" value=""></input>
                    增删</td>
                </tr>
              </table>
              <div id="menu_9" style="DISPLAY: none"> 
                <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="19" background="../../images/tree_06.gif">&nbsp;</td>
                    <td width="19">&nbsp;</td>
                    <td><br>
                      <table width="100%" border="0" align="center" cellpadding="2" cellspacing="1" class="td01">
                        <tr nowrap> 
                          <td width="65" align="center" class="td02">人员编号</td>
                          <td bgcolor="#FFFFFF" >
                            <input type="radio" name="radio0201" value=""></input>
                            拒绝 
                            <input type="radio" name="radio0201" value=""></input>
                            读 
                            <input type="radio" name="radio0201" value=""></input>
                            改</td>
                          <td width="65" align="center" class="td02">题目</td>
                          <td bgcolor="#FFFFFF" >
                            <input type="radio" name="radio0202" value=""></input>
                            拒绝 
                            <input type="radio" name="radio0202" value=""></input>
                            读 
                            <input type="radio" name="radio0202" value=""></input>
                            改</td>
                          <td width="65" align="center" class="td02">媒体名称</td>
                          <td bgcolor="#FFFFFF" >
                            <input type="radio" name="radio0203" value=""></input>
                            拒绝 
                            <input type="radio" name="radio0203" value=""></input>
                            读 
                            <input type="radio" name="radio0203" value=""></input>
                            改</td>
                        </tr>
                        <tr nowrap> 
                          <td align="center" class="td02">版面</td>
                          <td bgcolor="#FFFFFF" >
                            <input type="radio" name="radio0204" value=""></input>
                            拒绝 
                            <input type="radio" name="radio0204" value=""></input>
                            读 
                            <input type="radio" name="radio0204" value=""></input>
                            改</td>
                          <td align="center" class="td02">类型</td>
                          <td bgcolor="#FFFFFF" >
                            <input type="radio" name="radio0205" value=""></input>
                            拒绝 
                            <input type="radio" name="radio0205" value=""></input>
                            读 
                            <input type="radio" name="radio0205" value=""></input>
                            改</td>
                          <td align="center" class="td02">形式</td>
                          <td bgcolor="#FFFFFF" >
                            <input type="radio" name="radio0206" value=""></input>
                            拒绝 
                            <input type="radio" name="radio0206" value=""></input>
                            读 
                            <input type="radio" name="radio0206" value=""></input>
                            改</td>
                        </tr>
                        <tr> 
                          <td align="center" class="td02">日期或刊数</td>
                          <td bgcolor="#FFFFFF" >
                            <input type="radio" name="radio0207" value=""></input>
                            拒绝 
                            <input type="radio" name="radio0207" value=""></input>
                            读 
                            <input type="radio" name="radio0207" value=""></input>
                            改</td>
                          <td align="center" class="td02">&nbsp;</td>
                          <td bgcolor="#FFFFFF" >&nbsp;</td>
                          <td align="center" class="td02">&nbsp;</td>
                          <td bgcolor="#FFFFFF" >&nbsp;</td>
                        </tr>
                      </table>
                      </br>
                    </td>
                  </tr>
                </table>
              </div>
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td width="19"><img id="top_10" onClick="menu('menu_10','top_10');" src="../../images/tree_11.gif" width="19" height="20"></td>
                  <td width="19"><img src="../../images/tree_30.gif" width="19" height="20"></td>
                  <td width="392" nowrap class="td04">　考勤管理子集</td>
                  <td width="263" nowrap class="td04">
                    <input type="radio" name="radio01" value=""></input>
                    拒绝 
                    <input type="radio" name="radio01" value=""></input>
                    读 
                    <input type="radio" name="radio01" value=""></input>
                    改 
                    <input type="radio" name="radio01" value=""></input>
                    增 
                    <input type="radio" name="radio01" value=""></input>
                    删 
                    <input type="radio" name="radio01" value=""></input>
                    增删</td>
                </tr>
              </table>
              <div id="menu_10" style="DISPLAY: none"> 
                <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="19" background="../../images/tree_06.gif">&nbsp;</td>
                    <td width="19">&nbsp;</td>
                    <td><br>
                      <table width="100%" border="0" align="center" cellpadding="2" cellspacing="1" class="td01">
                        <tr nowrap> 
                          <td width="65" align="center" class="td02">人员编号</td>
                          <td bgcolor="#FFFFFF" >
                            <input type="radio" name="radio0301" value=""></input>
                            拒绝 
                            <input type="radio" name="radio0301" value=""></input>
                            读 
                            <input type="radio" name="radio0301" value=""></input>
                            改</td>
                          <td width="65" align="center" class="td02">请假开始时间</td>
                          <td bgcolor="#FFFFFF" >
                            <input type="radio" name="radio0302" value=""></input>
                            拒绝 
                            <input type="radio" name="radio0302" value=""></input>
                            读 
                            <input type="radio" name="radio0302" value=""></input>
                            改</td>
                          <td width="65" align="center" class="td02">请假结束时间</td>
                          <td bgcolor="#FFFFFF" >
                            <input type="radio" name="radio0303" value=""></input>
                            拒绝 
                            <input type="radio" name="radio0303" value=""></input>
                            读 
                            <input type="radio" name="radio0303" value=""></input>
                            改</td>
                        </tr>
                        <tr nowrap> 
                          <td align="center" class="td02">请假类别</td>
                          <td bgcolor="#FFFFFF" >
                            <input type="radio" name="radio0304" value=""></input>
                            拒绝 
                            <input type="radio" name="radio0304" value=""></input>
                            读 
                            <input type="radio" name="radio0304" value=""></input>
                            改</td>
                          <td align="center" class="td02">请假是由</td>
                          <td bgcolor="#FFFFFF" >
                            <input type="radio" name="radio0305" value=""></input>
                            拒绝 
                            <input type="radio" name="radio0305" value=""></input>
                            读 
                            <input type="radio" name="radio0305" value=""></input>
                            改</td>
                          <td align="center" class="td02">&nbsp;</td>
                          <td bgcolor="#FFFFFF" >&nbsp;</td>
                        </tr>
                      </table>
                      </br>
                    </td>
                  </tr>
                </table>
              </div>
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td width="19"><img id="top_11" onClick="menu('menu_11','top_11');" src="../../images/tree_11.gif" width="19" height="20"></td>
                  <td width="19"><img src="../../images/tree_30.gif" width="19" height="20"></td>
                  <td width="390" nowrap class="td04">　工资信息子集</td>
                  <td width="263" nowrap class="td04">
                    <input type="radio" name="radio01" value=""></input>
                    拒绝 
                    <input type="radio" name="radio01" value=""></input>
                    读 
                    <input type="radio" name="radio01" value=""></input>
                    改 
                    <input type="radio" name="radio01" value=""></input>
                    增 
                    <input type="radio" name="radio01" value=""></input>
                    删 
                    <input type="radio" name="radio01" value=""></input>
                    增删</td>
                </tr>
              </table>
              <div id="menu_11" style="DISPLAY: none"> 
                <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="19" background="../../images/tree_06.gif">&nbsp;</td>
                    <td width="19">&nbsp;</td>
                    <td><br>
                      <table width="100%" border="0" align="center" cellpadding="2" cellspacing="1" class="td01">
                        <tr nowrap> 
                          <td width="65" align="center" class="td02">人员编号</td>
                          <td bgcolor="#FFFFFF" >
                            <input type="radio" name="radio0401" value=""></input>
                            拒绝 
                            <input type="radio" name="radio0401" value=""></input>
                            读 
                            <input type="radio" name="radio0401" value=""></input>
                            改</td>
                          <td width="65" align="center" class="td02">期号</td>
                          <td bgcolor="#FFFFFF" >
                            <input type="radio" name="radio0402" value=""></input>
                            拒绝 
                            <input type="radio" name="radio0402" value=""></input>
                            读 
                            <input type="radio" name="radio0402" value=""></input>
                            改</td>
                          <td width="65" align="center" class="td02">基本工资</td>
                          <td bgcolor="#FFFFFF" >
                            <input type="radio" name="radio0403" value=""></input>
                            拒绝 
                            <input type="radio" name="radio0403" value=""></input>
                            读 
                            <input type="radio" name="radio0403" value=""></input>
                            改</td>
                        </tr>
                        <tr nowrap> 
                          <td align="center" class="td02">岗位工资</td>
                          <td bgcolor="#FFFFFF" >
                            <input type="radio" name="radio0404" value=""></input>
                            拒绝 
                            <input type="radio" name="radio0404" value=""></input>
                            读 
                            <input type="radio" name="radio0404" value=""></input>
                            改</td>
                          <td align="center" class="td02">津贴</td>
                          <td bgcolor="#FFFFFF" >
                            <input type="radio" name="radio0405" value=""></input>
                            拒绝 
                            <input type="radio" name="radio0405" value=""></input>
                            读 
                            <input type="radio" name="radio0405" value=""></input>
                            改</td>
                          <td align="center" class="td02">养老个人缴费</td>
                          <td bgcolor="#FFFFFF" >
                            <input type="radio" name="radio0406" value=""></input>
                            拒绝 
                            <input type="radio" name="radio0406" value=""></input>
                            读 
                            <input type="radio" name="radio0406" value=""></input>
                            改</td>
                        </tr>
                        <tr> 
                          <td align="center" class="td02">养老单位缴费</td>
                          <td bgcolor="#FFFFFF" >
                            <input type="radio" name="radio0407" value=""></input>
                            拒绝 
                            <input type="radio" name="radio0407" value=""></input>
                            读 
                            <input type="radio" name="radio0407" value=""></input>
                            改</td>
                          <td align="center" class="td02">医疗个人缴费</td>
                          <td bgcolor="#FFFFFF" >
                            <input type="radio" name="radio0408" value=""></input>
                            拒绝 
                            <input type="radio" name="radio0408" value=""></input>
                            读 
                            <input type="radio" name="radio0408" value=""></input>
                            改</td>
                          <td align="center" class="td02">医疗单位缴费</td>
                          <td bgcolor="#FFFFFF" >
                            <input type="radio" name="radio0409" value=""></input>
                            拒绝 
                            <input type="radio" name="radio0409" value=""></input>
                            读 
                            <input type="radio" name="radio0409" value=""></input>
                            改</td>
                        </tr>
                        <tr> 
                          <td align="center" class="td02">所扣税款</td>
                          <td bgcolor="#FFFFFF" >
                            <input type="radio" name="radio0410" value=""></input>
                            拒绝 
                            <input type="radio" name="radio0410" value=""></input>
                            读 
                            <input type="radio" name="radio0410" value=""></input>
                            改</td>
                          <td align="center" class="td02">实发合计</td>
                          <td bgcolor="#FFFFFF" >
                            <input type="radio" name="radio0411" value=""></input>
                            拒绝 
                            <input type="radio" name="radio0411" value=""></input>
                            读 
                            <input type="radio" name="radio0411" value=""></input>
                            改</td>
                          <td align="center" class="td02">&nbsp;</td>
                          <td bgcolor="#FFFFFF" >&nbsp;</td>
                        </tr>
                      </table>
                      </br>
                    </td>
                  </tr>
                </table>
              </div>
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td width="19"><img id="top_12" onClick="menu('menu_12','top_12');" src="../../images/tree_11.gif" width="19" height="20"></td>
                  <td width="19"><img src="../../images/tree_30.gif" width="19" height="20"></td>
                  <td width="390" nowrap class="td04">　课题信息子集</td>
                  <td width="263" nowrap class="td04">
                    <input type="radio" name="radio01" value=""></input>
                    拒绝 
                    <input type="radio" name="radio01" value=""></input>
                    读 
                    <input type="radio" name="radio01" value=""></input>
                    改 
                    <input type="radio" name="radio01" value=""></input>
                    增 
                    <input type="radio" name="radio01" value=""></input>
                    删 
                    <input type="radio" name="radio01" value=""></input>
                    增删</td>
                </tr>
              </table>
              <div id="menu_12" style="DISPLAY: none"> 
                <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="19" background="../../images/tree_06.gif">&nbsp;</td>
                    <td width="19">&nbsp;</td>
                    <td><br>
                      <table width="100%" border="0" align="center" cellpadding="2" cellspacing="1" class="td01">
                        <tr nowrap> 
                          <td width="65" align="center" class="td02">课题编号</td>
                          <td bgcolor="#FFFFFF" >
                            <input type="radio" name="radio0501" value=""></input>
                            拒绝 
                            <input type="radio" name="radio0501" value=""></input>
                            读 
                            <input type="radio" name="radio0501" value=""></input>
                            改</td>
                          <td width="65" align="center" class="td02">课题名称</td>
                          <td bgcolor="#FFFFFF" >
                            <input type="radio" name="radio0502" value=""></input>
                            拒绝 
                            <input type="radio" name="radio0502" value=""></input>
                            读 
                            <input type="radio" name="radio0502" value=""></input>
                            改</td>
                          <td width="65" align="center" class="td02">课题类型</td>
                          <td bgcolor="#FFFFFF" >
                            <input type="radio" name="radio0503" value=""></input>
                            拒绝 
                            <input type="radio" name="radio0503" value=""></input>
                            读 
                            <input type="radio" name="radio0503" value=""></input>
                            改</td>
                        </tr>
                        <tr nowrap> 
                          <td align="center" class="td02">主题词</td>
                          <td bgcolor="#FFFFFF" >
                            <input type="radio" name="radio0504" value=""></input>
                            拒绝 
                            <input type="radio" name="radio0504" value=""></input>
                            读 
                            <input type="radio" name="radio0504" value=""></input>
                            改</td>
                          <td align="center" class="td02">预计课题形式</td>
                          <td bgcolor="#FFFFFF" >
                            <input type="radio" name="radio0505" value=""></input>
                            拒绝 
                            <input type="radio" name="radio0505" value=""></input>
                            读 
                            <input type="radio" name="radio0505" value=""></input>
                            改</td>
                          <td align="center" class="td02">申报时间</td>
                          <td bgcolor="#FFFFFF" >
                            <input type="radio" name="radio0506" value=""></input>
                            拒绝 
                            <input type="radio" name="radio0506" value=""></input>
                            读 
                            <input type="radio" name="radio0506" value=""></input>
                            改</td>
                        </tr>
                        <tr> 
                          <td align="center" class="td02">预计完成时间</td>
                          <td bgcolor="#FFFFFF" >
                            <input type="radio" name="radio0507" value=""></input>
                            拒绝 
                            <input type="radio" name="radio0507" value=""></input>
                            读 
                            <input type="radio" name="radio0507" value=""></input>
                            改</td>
                          <td align="center" class="td02">课题委托单位</td>
                          <td bgcolor="#FFFFFF" >
                            <input type="radio" name="radio0508" value=""></input>
                            拒绝 
                            <input type="radio" name="radio0508" value=""></input>
                            读 
                            <input type="radio" name="radio0508" value=""></input>
                            改</td>
                          <td align="center" class="td02">第一主持人姓名</td>
                          <td bgcolor="#FFFFFF" >
                            <input type="radio" name="radio0509" value=""></input>
                            拒绝 
                            <input type="radio" name="radio0509" value=""></input>
                            读 
                            <input type="radio" name="radio0509" value=""></input>
                            改</td>
                        </tr>
                        <tr> 
                          <td align="center" class="td02">课题组人数</td>
                          <td bgcolor="#FFFFFF" >
                            <input type="radio" name="radio0510" value=""></input>
                            拒绝 
                            <input type="radio" name="radio0510" value=""></input>
                            读 
                            <input type="radio" name="radio0510" value=""></input>
                            改</td>
                          <td align="center" class="td02">内容摘要</td>
                          <td bgcolor="#FFFFFF" >
                            <input type="radio" name="radio0511" value=""></input>
                            拒绝 
                            <input type="radio" name="radio0511" value=""></input>
                            读 
                            <input type="radio" name="radio0511" value=""></input>
                            改</td>
                          <td align="center" class="td02">&nbsp;</td>
                          <td bgcolor="#FFFFFF" >&nbsp;</td>
                        </tr>
                      </table>
                     </br>
                    </td>
                  </tr>
                </table>
              </div>
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td width="19"><img id="top_13" onClick="third('menu_13','top_13');" src="../../images/tree_17.gif" width="19" height="20"></img></td>
                  <td width="19"><img src="../../images/tree_30.gif" width="19" height="20"></img></td>
                  <td width="390" nowrap class="td04">　课题成员子集</td>
                  <td width="263" nowrap class="td04">
                    <input type="radio" name="radio01" value=""></input>
                    拒绝 
                    <input type="radio" name="radio01" value=""></input>
                    读 
                    <input type="radio" name="radio01" value=""></input>
                    改 
                    <input type="radio" name="radio01" value=""></input>
                    增 
                    <input type="radio" name="radio01" value=""></input>
                    删 
                    <input type="radio" name="radio01" value=""></input>
                    增删</td>
                </tr>
              </table>
              <div id="menu_13" style="DISPLAY: none"> 
                <table width="100%"  border="0" cellspacing="0" cellpadding="0" height="36">
                  <tr> 
                    <td width="19" height="56">&nbsp;</td>
                    <td width="19" height="56">&nbsp;</td>
                    <td height="56"> 
                      <table width="100%" border="0" align="center" cellpadding="2" cellspacing="1" class="td01">
                        <tr nowrap> 
                          <td width="65" align="center" class="td02">课题编号</td>
                          <td bgcolor="#FFFFFF" > 
                            <input type="radio" name="radio06" value=""></input>
                            拒绝 
                            <input type="radio" name="radio06" value=""></input>
                            读 
                            <input type="radio" name="radio06" value=""></input>
                            改</td>
                          <td width="65" align="center" class="td02">人员编号</td>
                          <td bgcolor="#FFFFFF" > 
                            <input type="radio" name="radio0601" value=""></input>
                            拒绝 
                            <input type="radio" name="radio0601" value=""></input>
                            读 
                            <input type="radio" name="radio0601" value=""></input>
                            改</td>
                          <td width="65" align="center" class="td02">&nbsp;</td>
                          <td bgcolor="#FFFFFF" >&nbsp; </td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                </table>
              </div>
            </td>
          </tr>
        </table>
        <br>
      </td>
    </tr>
    </tbody> 
  </table>
  <br>
</center>
</body>
</html>
