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
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<form name="form1" method="post" action="">
  <table width="90%" border="0" align="center" cellpadding="2" cellspacing="1" bordercolorlight="black" bordercolordark="white">
    <tr>
      <td bgcolor="#FFFFFF">
	  <input type="checkbox" name="checkbox" value="checkbox"/>机构管理
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  <input name="Submit" type="submit" class="buttonface02" value="  全选  "/>
	  <input name="Submit" type="submit" class="buttonface02" value="  保存  "/>
	  <br/>
	  &nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="checkbox" value="checkbox"/>机构维护
	  <br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  <input type="checkbox" name="checkbox" value="checkbox"/>新建
	  <input type="checkbox" name="checkbox" value="checkbox"/>修改
	  <input type="checkbox" name="checkbox" value="checkbox"/>删除
	  <br/>&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="checkbox" value="checkbox"/>机构图
	  <br/>&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="checkbox" value="checkbox"/>机构编制
	  <br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  <input type="checkbox" name="checkbox" value="checkbox"/>固定统计
	  <input type="checkbox" name="checkbox" value="checkbox"/>日常统计
	  <br/>&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="checkbox" value="checkbox"/>机构历史
	  <br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  <input type="checkbox" name="checkbox" value="checkbox"/>删除历史
	  <br/><input type="checkbox" name="checkbox" value="checkbox"/>人员管理
	  <br/>&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="checkbox" value="checkbox"/>信息维护
	  <br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  <input type="checkbox" name="checkbox" value="checkbox"/>增加
	  <input type="checkbox" name="checkbox" value="checkbox"/>修改
	  <input type="checkbox" name="checkbox" value="checkbox"/>删除
	  <br/>&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="checkbox" value="checkbox"/>批量处理
	  <br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  <input type="checkbox" name="checkbox" value="checkbox"/>增加
	  <input type="checkbox" name="checkbox" value="checkbox"/>修改
	  <input type="checkbox" name="checkbox" value="checkbox"/>删除
	  <br/>&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="checkbox" value="checkbox"/>统计分析
	  <br/>&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="checkbox" value="checkbox"/>信息报表
	  <br/>&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="checkbox" value="checkbox"/>提醒设置
	  <br/><input type="checkbox" name="checkbox" value="checkbox"/>档案管理
	  <br/>&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="checkbox" value="checkbox"/>转入转出
	  <br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  <input type="checkbox" name="checkbox" value="checkbox"/>信息维护
	  <input type="checkbox" name="checkbox" value="checkbox"/>转入
	  <input type="checkbox" name="checkbox" value="checkbox"/>转出
	  <br/>&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="checkbox" value="checkbox"/>借阅归还
	  <br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  <input type="checkbox" name="checkbox" value="checkbox"/>借阅申请
	  <input type="checkbox" name="checkbox" value="checkbox"/>档案借阅
	  <input type="checkbox" name="checkbox" value="checkbox"/>档案归还
	  <br/>&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="checkbox" value="checkbox"/>日常打印
	  <br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  <input type="checkbox" name="checkbox" value="checkbox"/>查询打印
	  <input type="checkbox" name="checkbox" value="checkbox"/>变更打印
	  <br/>&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="checkbox" value="checkbox"/>统计盘库
	  <br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  <input type="checkbox" name="checkbox" value="checkbox"/>档案柜管理
	  <input type="checkbox" name="checkbox" value="checkbox"/>档案盘库
	  <input type="checkbox" name="checkbox" value="checkbox"/>查询统计
	  <br/>&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="checkbox" value="checkbox"/>制作花名册
	  <br/>&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="checkbox" value="checkbox"/>副本管理
	  <br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  <input type="checkbox" name="checkbox" value="checkbox"/>副本录入
	  <input type="checkbox" name="checkbox" value="checkbox"/>副本修改
	  <input type="checkbox" name="checkbox" value="checkbox"/>副本删除
	  <br/><input type="checkbox" name="checkbox" value="checkbox"/>手续办理
	  <br/>&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="checkbox" value="checkbox"/>信息维护
	  <br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  <input type="checkbox" name="checkbox" value="checkbox"/>路线维护
	  <input type="checkbox" name="checkbox" value="checkbox"/>使馆维护
	  <input type="checkbox" name="checkbox" value="checkbox"/>工资对照表维护
	  <br/>&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="checkbox" value="checkbox"/>新建手续
	  <br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  <input type="checkbox" name="checkbox" value="checkbox"/>借阅申请
	  <input type="checkbox" name="checkbox" value="checkbox"/>档案借阅
	  <input type="checkbox" name="checkbox" value="checkbox"/>档案归还
	  <br/>&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="checkbox" value="checkbox"/>待办手续
	  <br/>&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="checkbox" value="checkbox"/>手续历史
	  <br/><input type="checkbox" name="checkbox" value="checkbox"/>领导查询
	  <br/>&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="checkbox" value="checkbox"/>机构信息
	  <br/>&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="checkbox" value="checkbox"/>人员信息
	  <br/>&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="checkbox" value="checkbox"/>统计分析
	  <br/>&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="checkbox" value="checkbox"/>报表信息
	  <br/><input type="checkbox" name="checkbox" value="checkbox"/>权限管理
	  <br/>&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="checkbox" value="checkbox"/>角色管理
	  <br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  <input type="checkbox" name="checkbox" value="checkbox"/>增加
	  <input type="checkbox" name="checkbox" value="checkbox"/>修改
	  <input type="checkbox" name="checkbox" value="checkbox"/>删除
	  <br/>&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="checkbox" value="checkbox"/>操作员管理
	  <br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  <input type="checkbox" name="checkbox" value="checkbox"/>修改
	  <input type="checkbox" name="checkbox" value="checkbox"/>分配角色
	  <br/><input type="checkbox" name="checkbox" value="checkbox"/>系统管理
	  <br/>&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="checkbox" value="checkbox"/>指标管理
	  <br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  <input type="checkbox" name="checkbox" value="checkbox"/>增加
	  <input type="checkbox" name="checkbox" value="checkbox"/>修改
	  <input type="checkbox" name="checkbox" value="checkbox"/>删除
	  <input type="checkbox" name="checkbox" value="checkbox"/>启/禁用
	  <br/>&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="checkbox" value="checkbox"/>代码管理
	  <br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  <input type="checkbox" name="checkbox" value="checkbox"/>增加
	  <input type="checkbox" name="checkbox" value="checkbox"/>修改
	  <input type="checkbox" name="checkbox" value="checkbox"/>删除
	  <br/>&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="checkbox" value="checkbox"/>
	  日志管理
	  </td>
    </tr>
  </table>
</form>
</body>
</html>
