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
<title>角色管理</title>
<link href="/oa/css/style.css" rel="stylesheet" type="text/css"/>
<script language=javascript src="/oa/js/tree.js"></script>
<script language=javascript>
<!--
function ss(){
	window.open('blank');
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.0
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && document.getElementById) x=document.getElementById(n); return x;
}

function MM_nbGroup(event, grpName) { //v3.0
  var i,img,nbArr,args=MM_nbGroup.arguments;
  if (event == "init" && args.length > 2) {
    if ((img = MM_findObj(args[2])) != null && !img.MM_init) {
      img.MM_init = true; img.MM_up = args[3]; img.MM_dn = img.src;
      if ((nbArr = document[grpName]) == null) nbArr = document[grpName] = new Array();
      nbArr[nbArr.length] = img;
      for (i=4; i < args.length-1; i+=2) if ((img = MM_findObj(args[i])) != null) {
        if (!img.MM_up) img.MM_up = img.src;
        img.src = img.MM_dn = args[i+1];
        nbArr[nbArr.length] = img;
    } }
  } else if (event == "over") {
    document.MM_nbOver = nbArr = new Array();
    for (i=1; i < args.length-1; i+=3) if ((img = MM_findObj(args[i])) != null) {
      if (!img.MM_up) img.MM_up = img.src;
      img.src = (img.MM_dn && args[i+2]) ? args[i+2] : args[i+1];
      nbArr[nbArr.length] = img;
    }
  } else if (event == "out" ) {
    for (i=0; i < document.MM_nbOver.length; i++) {
      img = document.MM_nbOver[i]; img.src = (img.MM_dn) ? img.MM_dn : img.MM_up; }
  } else if (event == "down") {
    if ((nbArr = document[grpName]) != null)
      for (i=0; i < nbArr.length; i++) { img=nbArr[i]; img.src = img.MM_up; img.MM_dn = 0; }
    document[grpName] = nbArr = new Array();
    for (i=2; i < args.length-1; i+=2) if ((img = MM_findObj(args[i])) != null) {
      if (!img.MM_up) img.MM_up = img.src;
      img.src = img.MM_dn = args[i+1];
      nbArr[nbArr.length] = img;
  } }
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//-->
</script>
<link href="/oa/css/style.css" rel="stylesheet" type="text/css"/>
</head>

<body  leftmargin="10" topmargin="10" marginwidth="0" marginheight="0">
<table width="700"  border="0" align="center" cellpadding="10" cellspacing="1">
  <tr>
    <td bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
		    <tr>
			  <td class="td_page">根据机构设置范围</td>
			  <td align="right" class="td_page"><input name="Submit" type="submit" class="buttonface02" value="  全选  "/>
			    <input name="Submit" type="submit" class="buttonface02" value="  保存  "/></td>
		    </tr> 
            <tr>
              <td colspan="2"><br/>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="19"><img id="top_1" onClick="head('menu_1','top_1');" src="/oa/images/tree_2_03.gif" width="19" height="20"/></td>
                      <td width="19"><img src="/oa/images/tree_27.gif" width="19" height="20"/></td>
                      <td nowrap><a href="tree_01.html" target="tree" class="a02">部机关</a>
                        <input type="checkbox" name="checkbox" value="checkbox"/>                      </td>
                    </tr>
                  </table>
                    <div id="menu_1">
                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"/></td>
                          <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                          <td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"/></td>
                          <td nowrap><a href="tree_05.html" target="tree" class="a02">地区业务司</a>
                            <input type="checkbox" name="checkbox" value="checkbox"/></td>
                        </tr>
                      </table>
                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"/></td>
                          <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                          <td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"/></td>
                          <td nowrap><a href="tree_06.html" target="tree" class="a02">行政部门</a>
                            <input type="checkbox" name="checkbox" value="checkbox"/></td>
                        </tr>
                      </table>
                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"/></td>
                          <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                          <td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"/></td>
                          <td nowrap><a href="#" class="a02">党务部门</a>
                            <input type="checkbox" name="checkbox" value="checkbox"/></td>
                        </tr>
                      </table>
                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"/></td>
                          <td width="19"><img src="/oa/images/tree_23.gif" width="19" height="20"/></td>
                          <td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"/></td>
                          <td nowrap><a href="#" class="a02">专业部门</a>
                            <input type="checkbox" name="checkbox" value="checkbox"/></td>
                        </tr>
                      </table>
                    </div>
                      <table width="100%" border="0" cellspacing="0" cellpadding="0"/>
                        <tr>
                          <td width="19"><img src="/oa/images/tree_26.gif" width="19" height="20"/></td>
                          <td width="19"><img src="/oa/images/tree_27.gif" width="19" height="20"/></td>
                          <td nowrap><a href="tree_02.html" target="tree" class="a02">部属</a>
                            <input type="checkbox" name="checkbox" value="checkbox"/></td>
                        </tr>
                      </table>
                    <div id="menu_2" style="DISPLAY: none">
                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"/></td>
                          <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                          <td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"/></td>
                          <td nowrap><a href="#" class="a02">服务中心</a></td>
                        </tr>
                      </table>
                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"/></td>
                          <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                          <td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"/></td>
                          <td nowrap><a href="#" class="a02">档案馆</a></td>
                        </tr>
                      </table>
                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"/></td>
                          <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                          <td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"/></td>
                          <td nowrap><a href="#" class="a02">国际问题研究所</a></td>
                        </tr>
                      </table>
                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"/></td>
                          <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                          <td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"/></td>
                          <td nowrap>世界知识出版社</td>
                        </tr>
                      </table>
                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"/></td>
                          <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                          <td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"/></td>
                          <td nowrap><a href="#" class="a02">外交学院</a></td>
                        </tr>
                      </table>
                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"/></td>
                          <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                          <td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"/></td>
                          <td nowrap><a href="#" class="a02">外交人员服务局</a></td>
                        </tr>
                      </table>
                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"/></td>
                          <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                          <td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"/></td>
                          <td nowrap>钓鱼台宾馆</td>
                        </tr>
                      </table>
                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="19"><img src="/oa/images/tree_06.gif" width="19" height="20"/></td>
                          <td width="19"><img src="/oa/images/tree_23.gif" width="19" height="20"/></td>
                          <td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"/></td>
                          <td nowrap><a href="#" class="a02">外交学会</a></td>
                        </tr>
                      </table>
                    </div>
                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="19"><img id="top_3" onClick="bottom('menu_3','top_3');" src="/oa/images/tree_2_29.gif" width="19" height="20"/></td>
                          <td width="19"><img src="/oa/images/tree_27.gif" width="19" height="20"/></td>
                          <td nowrap><a href="tree_03.html" target="tree" class="a02">驻外机构</a>
                            <input type="checkbox" name="checkbox" value="checkbox"/></td>
                        </tr>
                      </table>
                      <div id="menu_3">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="19">&nbsp;</td>
                            <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                            <td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"/></td>
                            <td nowrap><a href="#" class="a02">亚洲地区</a>
                              <input type="checkbox" name="checkbox" value="checkbox"/></td>
                          </tr>
                        </table>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="19">&nbsp;</td>
                            <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                            <td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"/></td>
                            <td nowrap><a href="#" class="a02">西亚北非</a>
                              <input type="checkbox" name="checkbox" value="checkbox"/></td>
                          </tr>
                        </table>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="19">&nbsp;</td>
                            <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                            <td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"/></td>
                            <td nowrap><a href="#" class="a02">非洲地区</a>
                              <input type="checkbox" name="checkbox" value="checkbox"/></td>
                          </tr>
                        </table>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="19">&nbsp;</td>
                            <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                            <td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"></td>
                            <td nowrap><a href="#" class="a02">欧亚地区</a>
                              <input type="checkbox" name="checkbox" value="checkbox"/></td>
                          </tr>
                        </table>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="19">&nbsp;</td>
                            <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                            <td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"/></td>
                            <td nowrap><a href="#" class="a02">西欧地区</a>
                              <input type="checkbox" name="checkbox" value="checkbox"/></td>
                          </tr>
                        </table>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="19">&nbsp;</td>
                            <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                            <td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"/></td>
                            <td nowrap><a href="tree_04.html" target="tree" class="a02">美大地区</a>
                              <input type="checkbox" name="checkbox" value="checkbox"/></td>
                          </tr>
                        </table>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="19">&nbsp;</td>
                            <td width="19"><img src="/oa/images/tree_07.gif" width="19" height="20"/></td>
                            <td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"/></td>
                            <td nowrap><a href="#" class="a02">拉美地区</a>
                              <input type="checkbox" name="checkbox" value="checkbox"/></td>
                          </tr>
                        </table>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="19">&nbsp;</td>
                            <td width="19"><img src="/oa/images/tree_23.gif" width="19" height="20"/></td>
                            <td width="19"><img src="/oa/images/tree_08.gif" width="19" height="20"/></td>
                            <td nowrap><a href="#" class="a02">国际机构</a>
                              <input type="checkbox" name="checkbox" value="checkbox"/></td>
                          </tr>
                        </table>
                      </div>
                </td></tr>
          </table>
          <br/></td>
        </tr>
		<tr>
		<td class="td_page">根据职务设置范围</td>
		</tr>
		<tr>
		<td height="40">条件：职务级别
		  <select name="select">
		    <option selected>--请选择--</option>
		    <option>等于</option>
		    <option>大于</option>
		    <option>下于</option>
		    <option>大于等于</option>
		    <option>小于等于</option>
	      </select>
		  <select name="select">
		    <option selected>--请选择--</option>
		    <option>部级</option>
		    <option>副部级</option>
		    <option>司、局级</option>
		    <option>副司、副局级</option>
		    <option>县、处级</option>
		    <option>副县、副处级</option>
		    <option>正科级</option>
		    <option>副科级</option>
		    <option>科员级</option>
		    <option>办事员级</option>
	      </select></td>
		</tr>
		<tr>
		<td class="td_page">根据外交职衔设置范围</td>
		</tr>
		<tr>
		<td height="40">条件：外交职衔
		  <select name="select">
            <option selected>--请选择--</option>
            <option>等于</option>
            <option>大于</option>
            <option>下于</option>
            <option>大于等于</option>
            <option>小于等于</option>
          </select>
		  <select name="select">
            <option selected>--请选择--</option>
            <option>大使</option>
            <option>代表</option>
            <option>主任</option>
            <option>总领事</option>
            <option>公使</option>
            <option>参赞</option>
            <option>一秘</option>
            <option>二秘</option>
            <option>三秘</option>
            <option>随员</option>
          </select></td>
		</tr>
    </table></td>
  </tr>
</table>
</body>
</html>
