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
<script language="javascript">
var personflag = true;
var educationflag = true;
var trainflag = true;
var marryflag = true;
var familyflag = true;
var orgflag = true;
function viewperson(imgid,viewid)
{
	if(personflag)
	{
		imgid.src="../../images/tree_2_29.gif";
		viewid.style.display = "inline";
		personflag = false;
	}else
	{
		imgid.src="../../images/tree_29.gif";
		viewid.style.display = "none";
		personflag = true;
	}
}
function vieweducation(imgid,viewid)
{
	if(educationflag)
	{
		imgid.src="../../images/tree_2_29.gif";
		viewid.style.display = "inline";
		educationflag = false;
	}else
	{
		imgid.src="../../images/tree_29.gif";
		viewid.style.display = "none";
		educationflag = true;
	}
}
function viewtrain(imgid,viewid)
{
	if(trainflag)
	{
		imgid.src="../../images/tree_2_29.gif";
		viewid.style.display = "inline";
		trainflag = false;
	}else
	{
		imgid.src="../../images/tree_29.gif";
		viewid.style.display = "none";
		trainflag = true;
	}
}
function viewmarry(imgid,viewid)
{
	if(marryflag)
	{
		imgid.src="../../images/tree_2_29.gif";
		viewid.style.display = "inline";
		marryflag = false;
	}else
	{
		imgid.src="../../images/tree_29.gif";
		viewid.style.display = "none";
		marryflag = true;
	}
}
function viewfamily(imgid,viewid)
{
	if(familyflag)
	{
		imgid.src="../../images/tree_2_29.gif";
		viewid.style.display = "inline";
		familyflag = false;
	}else
	{
		imgid.src="../../images/tree_29.gif";
		viewid.style.display = "none";
		familyflag = true;
	}
}
function vieworg(imgid,viewid)
{
	if(orgflag)
	{
		imgid.src="../../images/tree_2_29.gif";
		viewid.style.display = "inline";
		orgflag = false;
	}else
	{
		imgid.src="../../images/tree_29.gif";
		viewid.style.display = "none";
		orgflag = true;
	}
}
</script>
<link href="/oa/css/style.css" rel="stylesheet" type="text/css"/>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<form name="form1" method="post" action="">
  <table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td>
	  <table width="700" border="0" align="center">
    <tr >
      <td colspan="6"  >
	  <img src="/oa/images/tree_29.gif" width="19" height="20" align="absmiddle"  id="personimg" onClick="viewperson(personimg,person)"/>人员基本情况子集
	    <input name="radiobutton1" type="radio" value="radiobutton"/>
	    拒绝
	    <input name="radiobutton1" type="radio" value="radiobutton"/> 
	    读
	    <input name="radiobutton1" type="radio" value="radiobutton"/>
	    改	
		</td>
      <td align="right"  ><input name="Submit" type="submit" class="buttonface" value="  全选  "/>
        <input name="Submit" type="submit" class="buttonface" value="  保存  "/></td>
    </tr>
	<tr><td>
	<div id="person" style="display:none ">
	<table align="center" border="0" width="700">
    <tr nowrap>
      <td width="10" >&nbsp;</td>
      <td width="65" >姓名</td>
      <td width="145" >
	  <input name="radiobutton11" type="radio" value="radiobutton"/>拒绝
	  <input name="radiobutton11" type="radio" value="radiobutton"/>读
	  <input name="radiobutton11" type="radio" value="radiobutton"/>改
	  </td>
      <td width="65" >曾用名</td>
      <td width="145" >
	  <input name="radiobutton12" type="radio" value="radiobutton"/>拒绝
	  <input name="radiobutton12" type="radio" value="radiobutton"/>读
	  <input name="radiobutton12" type="radio" value="radiobutton"/>改
      </td>
      <td width="65" >性别</td>
      <td width="145" >
	  <input name="radiobutton13" type="radio" value="radiobutton"/>拒绝
	  <input name="radiobutton13" type="radio" value="radiobutton"/>读
	  <input name="radiobutton13" type="radio" value="radiobutton"/>改
	  </td>
    </tr>
    <tr nowrap>
      <td >&nbsp;</td>
      <td >民族</td>
      <td >
	  <input name="radiobutton14" type="radio" value="radiobutton"/>拒绝
	  <input name="radiobutton14" type="radio" value="radiobutton"/>读
	 <input name="radiobutton14" type="radio" value="radiobutton"/>改
	  </td>
      <td >籍贯</td>
      <td >
	  <input name="radiobutton15" type="radio" value="radiobutton"/>拒绝
	  <input name="radiobutton15" type="radio" value="radiobutton"/>读
	  <input name="radiobutton15" type="radio" value="radiobutton"/>改
	  </td>
      <td >血型</td>
      <td >
	  <input name="radiobutton16" type="radio" value="radiobutton"/>拒绝
	  <input name="radiobutton16" type="radio" value="radiobutton"/>读
	  <input name="radiobutton16" type="radio" value="radiobutton"/>改
	  </td>
    </tr>
	<tr>
      <td >&nbsp;</td>
      <td >出生地</td>
      <td >
	  <input name="radiobutton17" type="radio" value="radiobutton"/>拒绝
	  <input name="radiobutton17" type="radio" value="radiobutton"/>读
	  <input name="radiobutton17" type="radio" value="radiobutton"/>改
	  </td>
      <td >单位</td>
      <td >
	  <input name="radiobutton18" type="radio" value="radiobutton"/>拒绝
	  <input name="radiobutton18" type="radio" value="radiobutton"/>读
	  <input name="radiobutton18" type="radio" value="radiobutton"/>改
	  </td>
      <td >所在部门</td>
      <td >
	  <input name="radiobutton19" type="radio" value="radiobutton"/>拒绝
	  <input name="radiobutton19" type="radio" value="radiobutton"/>读
	  <input name="radiobutton19" type="radio" value="radiobutton"/>改
	  </td>
    </tr>
	<tr>
      <td >&nbsp;</td>
      <td >主要语种</td>
      <td >
	  <input name="radiobutton111" type="radio" value="radiobutton"/>拒绝
	  <input name="radiobutton111" type="radio" value="radiobutton"/>读
	  <input name="radiobutton111" type="radio" value="radiobutton"/>改
	  </td>
      <td >健康状况</td>
      <td >
	  <input name="radiobutton112" type="radio" value="radiobutton"/>拒绝
	  <input name="radiobutton112" type="radio" value="radiobutton"/>读
	  <input name="radiobutton112" type="radio" value="radiobutton"/>改
	  </td>
      <td >学历</td>
      <td >
	  <input name="radiobutton113" type="radio" value="radiobutton"/>拒绝
	  <input name="radiobutton113" type="radio" value="radiobutton"/>读
	  <input name="radiobutton113" type="radio" value="radiobutton"/>改
	  </td>
    </tr>
	</table>
	</div>
	</td></tr>
	<tr  nowrap>
      <td colspan="7"  >
	  <img src="/oa/images/tree_29.gif" width="19" height="20" align="absmiddle"  id="educationimg" onClick="vieweducation(educationimg,education)"/>学历学位子集
	    <input name="radiobutton2" type="radio" value="radiobutton"/>
	    拒绝
	    <input name="radiobutton2" type="radio" value="radiobutton"/> 
	    读
	    <input name="radiobutton2" type="radio" value="radiobutton"/>
	    改	
		</td>
    </tr>
	<tr><td>
	<div id="education" style="display:none ">
	<table align="center" border="0" width="700">
    <tr nowrap>
      <td width="10" >&nbsp;</td>
      <td width="65" >人员编号</td>
      <td width="145" >
	  <input name="radiobutton21" type="radio" value="radiobutton"/>拒绝
	  <input name="radiobutton21" type="radio" value="radiobutton"/>读
	  <input name="radiobutton21" type="radio" value="radiobutton"/>改
	  </td>
      <td width="65" >毕业时间</td>
      <td width="145" >
	  <input name="radiobutton22" type="radio" value="radiobutton"/>拒绝
	  <input name="radiobutton22" type="radio" value="radiobutton"/>读
	  <input name="radiobutton22" type="radio" value="radiobutton"/>改
      </td>
      <td width="65" >学位</td>
      <td width="145" >
	  <input name="radiobutton23" type="radio" value="radiobutton"/>拒绝
	  <input name="radiobutton23" type="radio" value="radiobutton"/>读
	  <input name="radiobutton23" type="radio" value="radiobutton"/>改
	  </td>
    </tr>
    <tr nowrap>
      <td >&nbsp;</td>
      <td >毕业学校</td>
      <td >
	  <input name="radiobutton24" type="radio" value="radiobutton"/>拒绝
	  <input name="radiobutton24" type="radio" value="radiobutton"/>读
	  <input name="radiobutton24" type="radio" value="radiobutton"/>改
	  </td>
      <td >所学专业</td>
      <td >
	  <input name="radiobutton25" type="radio" value="radiobutton"/>拒绝
	  <input name="radiobutton25" type="radio" value="radiobutton"/>读
	  <input name="radiobutton25" type="radio" value="radiobutton"/>改
	  </td>
      <td >学历</td>
      <td >
	  <input name="radiobutton26" type="radio" value="radiobutton"/>拒绝
	  <input name="radiobutton26" type="radio" value="radiobutton"/>读
	  <input name="radiobutton26" type="radio" value="radiobutton"/>改
	  </td>
    </tr>
	<tr>
      <td >&nbsp;</td>
      <td >入学时间</td>
      <td >
	  <input name="radiobutton27" type="radio" value="radiobutton"/>拒绝
	  <input name="radiobutton27" type="radio" value="radiobutton"/>读
	  <input name="radiobutton27" type="radio" value="radiobutton"/>改
	  </td>
      <td >&nbsp;</td>
      <td >&nbsp;</td>
      <td >&nbsp;</td>
      <td >&nbsp;</td>
    </tr>
	</table>
	</div>
	</td></tr>
    <tr  nowrap>
      <td colspan="7"  >
	  <img src="/oa/images/tree_29.gif" width="19" height="20" align="absmiddle"  id="trainimg" onClick="viewtrain(trainimg,train)"/>教育培训子集
	    
	    <input name="radiobutton3" type="radio" value="radiobutton"/>
	    拒绝
	    <input name="radiobutton3" type="radio" value="radiobutton"/> 
	    读
	    <input name="radiobutton3" type="radio" value="radiobutton"/>
	    改	
		</td>
    </tr>
	<tr><td>
	<div id="train" style="display:none ">
	<table align="center" border="0" width="700">
    <tr nowrap>
      <td width="10" >&nbsp;</td>
      <td width="65" >人员编号</td>
      <td width="145" >
	  <input name="radiobutton31" type="radio" value="radiobutton"/>拒绝
	  <input name="radiobutton31" type="radio" value="radiobutton"/>读
	  <input name="radiobutton31" type="radio" value="radiobutton"/>改
	  </td>
      <td width="65" >开始时间</td>
      <td width="145" >
	  <input name="radiobutton32" type="radio" value="radiobutton"/>拒绝
	  <input name="radiobutton32" type="radio" value="radiobutton"/>读
	  <input name="radiobutton32" type="radio" value="radiobutton"/>改
      </td>
      <td width="65" >结束时间</td>
      <td width="145" >
	  <input name="radiobutton33" type="radio" value="radiobutton"/>拒绝
	  <input name="radiobutton33" type="radio" value="radiobutton"/>读
	  <input name="radiobutton33" type="radio" value="radiobutton"/>改
	  </td>
    </tr>
    <tr nowrap>
      <td >&nbsp;</td>
      <td >承担部门</td>
      <td >
	  <input name="radiobutton34" type="radio" value="radiobutton"/>拒绝
	  <input name="radiobutton34" type="radio" value="radiobutton"/>读
	  <input name="radiobutton34" type="radio" value="radiobutton"/>改
	  </td>
      <td >备注</td>
      <td >
	  <input name="radiobutton35" type="radio" value="radiobutton"/>拒绝
	  <input name="radiobutton35" type="radio" value="radiobutton"/>读
	  <input name="radiobutton35" type="radio" value="radiobutton"/>改
	  </td>
      <td >&nbsp;</td>
      <td >&nbsp;</td>
    </tr>
	</table>
	</div>
	</td></tr>
	<tr  nowrap>
      <td colspan="7"  >
	  <img src="/oa/images/tree_29.gif" width="19" height="20" align="absmiddle"  id="marryimg" onClick="viewmarry(marryimg,marry)"/>婚史及配偶子集
	    <input name="radiobutton4" type="radio" value="radiobutton"/>
	    拒绝
	    <input name="radiobutton4" type="radio" value="radiobutton"/> 
	    读
	    <input name="radiobutton4" type="radio" value="radiobutton"/>
	    改	
		</td>
    </tr>
	<tr><td>
	<div id="marry" style="display:none ">
	<table align="center" border="0" width="700">
    <tr nowrap>
      <td width="10" >&nbsp;</td>
      <td width="65" >人员编号</td>
      <td width="145" >
	  <input name="radiobutton41" type="radio" value="radiobutton"/>拒绝
	  <input name="radiobutton41" type="radio" value="radiobutton"/>读
	  <input name="radiobutton41" type="radio" value="radiobutton"/>改
	  </td>
      <td width="65" >配偶编号</td>
      <td width="145" >
	  <input name="radiobutton42" type="radio" value="radiobutton"/>拒绝
	  <input name="radiobutton42" type="radio" value="radiobutton"/>读
	  <input name="radiobutton42" type="radio" value="radiobutton"/>改
      </td>
      <td width="65" >配偶姓名</td>
      <td width="145" >
	  <input name="radiobutton43" type="radio" value="radiobutton"/>拒绝
	  <input name="radiobutton43" type="radio" value="radiobutton"/>读
	  <input name="radiobutton43" type="radio" value="radiobutton"/>改
	  </td>
    </tr>
    <tr nowrap>
      <td >&nbsp;</td>
      <td >照片</td>
      <td >
	  <input name="radiobutton44" type="radio" value="radiobutton"/>拒绝
	  <input name="radiobutton44" type="radio" value="radiobutton"/>读
	  <input name="radiobutton44" type="radio" value="radiobutton"'/>改
	  </td>
      <td >出生日期</td>
      <td >
	  <input name="radiobutton45" type="radio" value="radiobutton"/>拒绝
	  <input name="radiobutton45" type="radio" value="radiobutton"/>读
	  <input name="radiobutton45" type="radio" value="radiobutton"/>改
	  </td>
      <td >性别</td>
      <td >
	  <input name="radiobutton46" type="radio" value="radiobutton"/>拒绝
	  <input name="radiobutton46" type="radio" value="radiobutton"/>读
	  <input name="radiobutton46" type="radio" value="radiobutton"/>改
	  </td>
    </tr>
	<tr nowrap>
      <td >&nbsp;</td>
      <td >籍贯</td>
      <td >
	  <input name="radiobutton47" type="radio" value="radiobutton"/>拒绝
	  <input name="radiobutton47" type="radio" value="radiobutton"/>读
	  <input name="radiobutton47" type="radio" value="radiobutton"/>改
	  </td>
      <td >民族</td>
      <td >
	  <input name="radiobutton48" type="radio" value="radiobutton"/>拒绝
	  <input name="radiobutton48" type="radio" value="radiobutton"/>读
	  <input name="radiobutton48" type="radio" value="radiobutton"/>改
	  </td>
      <td >政治面貌</td>
      <td >
	  <input name="radiobutton49" type="radio" value="radiobutton"/>拒绝
	  <input name="radiobutton49" type="radio" value="radiobutton"/>读
	  <input name="radiobutton49" type="radio" value="radiobutton"/>改
	  </td>
    </tr>
	<tr nowrap>
      <td >&nbsp;</td>
      <td >结婚证号</td>
      <td >
	  <input name="radiobutton50" type="radio" value="radiobutton"/>拒绝
	  <input name="radiobutton50" type="radio" value="radiobutton"/>读
	  <input name="radiobutton50" type="radio" value="radiobutton"/>改
	  </td>
      <td >结婚状态</td>
      <td >
	  <input name="radiobutton511" type="radio" value="radiobutton"/>拒绝
	  <input name="radiobutton511" type="radio" value="radiobutton"/>读
	  <input name="radiobutton511" type="radio" value="radiobutton"/>改
	  </td>
      <td >&nbsp;</td>
      <td >&nbsp;
	  </td>
    </tr>
	</table>
	</div>
	</td></tr>
	<tr  nowrap>
      <td colspan="7"  >
	  <img src="/oa/images/tree_29.gif" width="19" height="20" align="absmiddle"  id="familyimg" onClick="viewfamily(familyimg,family)"/>家庭成员子集
	    <input name="radiobutton6" type="radio" value="radiobutton"/>
	    拒绝
	    <input name="radiobutton6" type="radio" value="radiobutton"/> 
	    读
	    <input name="radiobutton6" type="radio" value="radiobutton"/>
	    改	
		</td>
    </tr>
	<tr><td>
	<div id="family" style="display:none ">
	<table align="center" border="0" width="700">
    <tr nowrap>
      <td width="10" >&nbsp;</td>
      <td width="65" >人员编号</td>
      <td width="145" >
	  <input name="radiobutton61" type="radio" value="radiobutton"/>拒绝
	  <input name="radiobutton61" type="radio" value="radiobutton"/>读
	  <input name="radiobutton61" type="radio" value="radiobutton"/>改
	  </td>
      <td width="65" >成员编号</td>
      <td width="145" >
	  <input name="radiobutton62" type="radio" value="radiobutton"/>拒绝
	  <input name="radiobutton62" type="radio" value="radiobutton"/>读
	  <input name="radiobutton62" type="radio" value="radiobutton"/>改
      </td>
      <td width="65" >照片</td>
      <td width="145" >
	  <input name="radiobutton63" type="radio" value="radiobutton"/>拒绝
	  <input name="radiobutton63" type="radio" value="radiobutton"/>读
	  <input name="radiobutton63" type="radio" value="radiobutton"/>改
	  </td>
    </tr>
    <tr nowrap>
      <td >&nbsp;</td>
      <td >成员姓名</td>
      <td >
	  <input name="radiobutton64" type="radio" value="radiobutton"/>拒绝
	  <input name="radiobutton64" type="radio" value="radiobutton"/>读
	  <input name="radiobutton64" type="radio" value="radiobutton"/>改
	  </td>
      <td >与本人关系</td>
      <td >
	  <input name="radiobutton65" type="radio" value="radiobutton"/>拒绝
	  <input name="radiobutton65" type="radio" value="radiobutton"/>读
	  <input name="radiobutton65" type="radio" value="radiobutton"/>改
	  </td>
      <td >政治面貌</td>
      <td >
	  <input name="radiobutton66" type="radio" value="radiobutton"/>拒绝
	  <input name="radiobutton66" type="radio" value="radiobutton"/>读
	  <input name="radiobutton66" type="radio" value="radiobutton"/>改
	  </td>
    </tr>
	<tr nowrap>
      <td >&nbsp;</td>
      <td >出生日期</td>
      <td >
	  <input name="radiobutton67" type="radio" value="radiobutton"/>拒绝
	  <input name="radiobutton67" type="radio" value="radiobutton"/>读
	  <input name="radiobutton67" type="radio" value="radiobutton"/>改
	  </td>
      <td >单位职务</td>
      <td >
	  <input name="radiobutton68" type="radio" value="radiobutton"/>拒绝
	  <input name="radiobutton68" type="radio" value="radiobutton"/>读
	  <input name="radiobutton68" type="radio" value="radiobutton"/>改
	  </td>
      <td >籍贯</td>
      <td >
	  <input name="radiobutton69" type="radio" value="radiobutton"/>拒绝
	  <input name="radiobutton69" type="radio" value="radiobutton"/>读
	  <input name="radiobutton69" type="radio" value="radiobutton"/>改
	  </td>
    </tr>
	<tr nowrap>
      <td >&nbsp;</td>
      <td >出生地</td>
      <td >
	  <input name="radiobutton70" type="radio" value="radiobutton"/>拒绝
	  <input name="radiobutton70" type="radio" value="radiobutton"/>读
	  <input name="radiobutton70" type="radio" value="radiobutton"/>改
	  </td>
      <td >生存状况</td>
      <td >
	  <input name="radiobutton611" type="radio" value="radiobutton"/>拒绝
	  <input name="radiobutton611" type="radio" value="radiobutton"/>读
	  <input name="radiobutton611" type="radio" value="radiobutton"/>改
	  </td>
      <td >&nbsp;</td>
      <td >&nbsp;
	  </td>
    </tr>
	</table>
	</div>
	</td></tr>
	<tr  nowrap>
      <td colspan="7"  >
	  <img src="/oa/images/tree_29.gif" width="19" height="20" align="absmiddle"  id="orgimg" onClick="vieworg(orgimg,org)"/>机构基本信息子集
	    <input name="radiobutton7" type="radio" value="radiobutton"/>
	    拒绝
	    <input name="radiobutton7" type="radio" value="radiobutton"/> 
	    读
	    <input name="radiobutton7" type="radio" value="radiobutton"/>
	    改	
		</td>
    </tr>
	<tr><td>
	<div id="org" style="display:none ">
	<table align="center" border="0" width="700">
    <tr nowrap>
      <td width="10" >&nbsp;</td>
      <td width="65" >单位性质</td>
      <td width="145" >
	  <input name="radiobutton71" type="radio" value="radiobutton"/>拒绝
	  <input name="radiobutton71" type="radio" value="radiobutton"/>读
	  <input name="radiobutton71" type="radio" value="radiobutton"/>改
	  </td>
      <td width="65" >机构名称</td>
      <td width="145" >
	  <input name="radiobutton72" type="radio" value="radiobutton"/>拒绝
	  <input name="radiobutton72" type="radio" value="radiobutton"/>读
	  <input name="radiobutton72" type="radio" value="radiobutton"/>改
      </td>
      <td width="65" >机构简称</td>
      <td width="145" >
	  <input name="radiobutton73" type="radio" value="radiobutton"/>拒绝
	  <input name="radiobutton73" type="radio" value="radiobutton"/>读
	  <input name="radiobutton73" type="radio" value="radiobutton"/>改
	  </td>
    </tr>
    <tr nowrap>
      <td >&nbsp;</td>
      <td >上级机构</td>
      <td >
	  <input name="radiobutton74" type="radio" value="radiobutton"/>拒绝
	  <input name="radiobutton74" type="radio" value="radiobutton"/>读
	  <input name="radiobutton74" type="radio" value="radiobutton"/>改
	  </td>
      <td >机构类别</td>
      <td >
	  <input name="radiobutton75" type="radio" value="radiobutton"/>拒绝
	  <input name="radiobutton75" type="radio" value="radiobutton"/>读
	  <input name="radiobutton75" type="radio" value="radiobutton"/>改
	  </td>
      <td >编制总数</td>
      <td >
	  <input name="radiobutton76" type="radio" value="radiobutton"/>拒绝
	  <input name="radiobutton76" type="radio" value="radiobutton"/>读
	  <input name="radiobutton76" type="radio" value="radiobutton"/>改
	  </td>
    </tr>
	<tr nowrap>
      <td >&nbsp;</td>
      <td >领导职数</td>
      <td >
	  <input name="radiobutton77" type="radio" value="radiobutton"/>拒绝
	  <input name="radiobutton77" type="radio" value="radiobutton"/>读
	  <input name="radiobutton77" type="radio" value="radiobutton"/>改
	  </td>
      <td >实有人数</td>
      <td >
	  <input name="radiobutton78" type="radio" value="radiobutton"/>拒绝
	  <input name="radiobutton78" type="radio" value="radiobutton"/>读
	  <input name="radiobutton78" type="radio" value="radiobutton"/>改
	  </td>
      <td >超编人数</td>
      <td >
	  <input name="radiobutton79" type="radio" value="radiobutton"/>拒绝
	  <input name="radiobutton79" type="radio" value="radiobutton"/>读
	  <input name="radiobutton79" type="radio" value="radiobutton"/>改
	  </td>
    </tr>
	<tr nowrap>
      <td >&nbsp;</td>
      <td >缺编人数</td>
      <td >
	  <input name="radiobutton80" type="radio" value="radiobutton"/>拒绝
	  <input name="radiobutton80" type="radio" value="radiobutton"/>读
	  <input name="radiobutton80" type="radio" value="radiobutton"/>改
	  </td>
      <td >机构级别</td>
      <td >
	  <input name="radiobutton711" type="radio" value="radiobutton"/>拒绝
	  <input name="radiobutton711" type="radio" value="radiobutton"/>读
	  <input name="radiobutton711" type="radio" value="radiobutton"/>改
	  </td>
      <td >隶属关系</td>
      <td >
	  <input name="radiobutton712" type="radio" value="radiobutton"/>拒绝
	  <input name="radiobutton712" type="radio" value="radiobutton"/>读
	  <input name="radiobutton712" type="radio" value="radiobutton"/>改
	  </td>
    </tr>
	</table>
	</div>
	</td></tr>
  </table>
	  </td>
    </tr>
  </table>
</form>
</body>
</html>

