<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" " http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<base href="<%=basePath%>" />

		<title>My JSP 'schedule.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache"></meta>
		<meta http-equiv="cache-control" content="no-cache"></meta>
		<meta http-equiv="expires" content="0"></meta>
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"></meta>
		<meta http-equiv="description" content="This is my page"></meta>
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
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


		<link href="/oa/html/schedule/lib/themes/icon.css" type="text/css"
			rel="stylesheet" />
		<link href="/oa/html/schedule/lib/themes/default/easyui.css"
			type="text/css" rel="stylesheet" />
		<script src="/oa/html/schedule/lib/jquery-1.7.1.min.js"></script>
		<script src="/oa/html/schedule/lib/jquery.easyui.min.js"></script>
		<script src="/oa/html/schedule/lib/jquery-ui-1.8.17.custom.min.js"></script>
		<script src="/oa/html/schedule/lib/fullcalendar/fullcalendar.min.js"></script>
		<link rel='stylesheet' type='text/css'
			href='/oa/html/schedule/lib/fullcalendar/fullcalendar.css' />
		<%--
			
			<script  src="/oa/html/schedule/schedule.js"></script>
		--%>
		<style type="text/css">
#cal {
	background-color: #e6f2fb;
}
</style>
		<script type="text/javascript">
	$(function() {
		$.messager.defaults = {
			ok : "确定",
			cancel : "取消"
		};
		//日程组件 
		$("#cal")
				.fullCalendar(
						{
							height : 450,
							editable : true,
							draggable : true,
							selectable : true,
							buttonText : {
								today : "今天"
							},
							monthNames : [ "一月", "二月", "三月", "四月", "五月", "六月",
									"七月", "八月", "九月", "十月", "十一月", "十二月" ],
							dayNames : [ "周日", "周一", "周二", "周三", "周四", "周五",
									"周六" ],
							dayNamesShort : [ "周日", "周一", "周二", "周三", "周四",
									"周五", "周六" ],
							today : [ "今天" ],

							buttonText : {
								today : '今天',
								month : '月',
								week : '周',
								day : '日',
								prev : '上一月',
								next : '下一月'
							},
							events : '/oa/ViewScheduleServlet',

							//选择事件
							select : function(start, end, allDay) {

								var startTime = start.toString();
								var startmonth = new Date(startTime).getMonth() + 1;
								var startday = new Date(startTime).getDate();
								//  var MyStartDate = new Date(startTime).getFullYear()+ "-" + (new Date(startTime).getMonth() + 1) + "-"+ new Date(startTime).getDate();

								if (startmonth < 10) {
									startmonth = "0" + startmonth;
								}
								if (startday < 10) {
									startday = "0" + startday;
								}

								var MyStartDate = new Date(startTime)
										.getFullYear()
										+ "-" + startmonth + "-" + startday;
								var MyStartTime = new Date(startTime)
										.getHours()
										+ ":"
										+ new Date(startTime).getMinutes();
								var startTime = MyStartDate + " " + MyStartTime;

								var endTime = end.toString();

								var endmonth = new Date(endTime).getMonth() + 1;
								var endday = new Date(endTime).getDate();

								if (endmonth < 10) {
									endmonth = "0" + endmonth;
								}
								if (endday < 10) {
									endday = "0" + endday;
								}
								var MyEndDate = new Date(endTime).getFullYear()
										+ "-" + endmonth + "-" + endday;
								var MyEndTime = new Date(endTime).getHours()
										+ ":" + new Date(endTime).getMinutes();

								var endTime = MyEndDate + " " + MyEndTime;

								/* 	if ($.messager.confirm("操作提示","增加新日程?")) {
										addFrom.startTime.value = MyStartDate;
										addFrom.endTime.value = MyEndDate;
										//  window.location = "getTime.jsp?Start="+ startTime + "&End=" +endTime;
										//   window.open("getTime.jsp?Start="+ startTime + "&End=" +endTime,"添加日程","height=500,width=600");
										//    addfun(MyStartDate,MyEndDate);
										addfun();

									}
								 */

								$.messager
										.alert(
												"操作提示",
												"增加新日程?",
												"info",
												function() {
													addFrom.startTime.value = MyStartDate;
													addFrom.endTime.value = MyEndDate;
													addfun();
												});

							},//选择事件  

							// 事件点击函数 
							eventClick : function(event) {
								var startTime = event.start.toString();
								var startmonth = new Date(startTime).getMonth() + 1;
								var startday = new Date(startTime).getDate();
								if (startmonth < 10) {
									startmonth = "0" + startmonth;
								}
								if (startday < 10) {
									startday = "0" + startday;
								}
								var MyStartDate = new Date(startTime)
										.getFullYear()
										+ "-" + startmonth + "-" + startday;
								var endTime = event.end.toString();

								var endmonth = new Date(endTime).getMonth() + 1;
								var endday = new Date(endTime).getDate();

								if (endmonth < 10) {
									endmonth = "0" + endmonth;
								}
								if (endday < 10) {
									endday = "0" + endday;
								}
								var MyEndDate = new Date(endTime).getFullYear()
										+ "-" + endmonth + "-" + endday;

								addFrom.startTime.value = MyStartDate;
								addFrom.endTime.value = MyEndDate;
								addFrom.title.value = event.title;
								addFrom.place.value = event.place;
								addFrom.content.value = event.contents;
								addFrom.scdId.value = event.scdId;
								//   window.open(event.url);
								updatefun(event);
							}

						}); //日程组件 
	})

	//--------------修改查看日程
	function updatefun(event) {
		$("#addEvent").css("display", "block");
		$("#addEvent")
				.dialog(
						{
							title : "查看/修改 /删除日程",
							width : 400,
							heigh : 600,
							collapsible : true,
							resizable : true,
							 draggable:true,
							buttons : [
									{
										text : '修改',
										iconCls : 'icon-ok',
										handler : function() {
											var scdId = $("input[name='scdId']")
													.val();
											var startTime = $(
													"input[name='startTime']")
													.val();
											var endTime = $(
													"input[name='endTime']")
													.val();
											var title = $("input[name='title']")
													.val();
											var place = $("input[name='place']")
													.val();
											var content = $(
													"textarea[name='content']")
													.val();
											var data = {
												'scdId' : scdId,
												'startTime' : startTime,
												'endTime' : endTime,
												'title' : title,
												'place' : place,
												'content' : content
											};
											$
													.ajax( {
														type : 'POST',
														url : '/oa/UpdateScheduleServlet',
														data : data,
														success : function() {
															window.location.href = "/oa/html/schedule/schedule.jsp";
														},
														dataType : 'json'

													});
											alert('保存成功');
											$('#addEvent').dialog('close');
										}
									},
									{
										text : '删除',
										iconCls : 'icon-cancel',
										handler : function() {
										var scdId = $("input[name='scdId']").val();
								
							          	var data = {
									    'scdId' : scdId
								};
										$.ajax( {
									type : 'POST',
									url : '/oa/DeleteScheduleServlet',
									data : data,
									success : function() {
										 window.location.href = "/oa/html/schedule/schedule.jsp";
									},
									dataType : 'json'

								});
	
								alert('删除成功');
								$('#addEvent').dialog('close');
										}
									}, {
										text : '返回',
										iconCls : 'icon-back',
										handler : function() {
											$('#addEvent').dialog('close');
										}
									} ]
						});
	}
	//--------------修改查看日程

	// 添加日程
	//	function addfun(startTime,endTime){
	function addfun() {

		$("#addEvent").css("display", "block");
		$("input[name='title']").val("");
		 $("input[name='place']").val("");
		 $("textarea[name='content']").val("");
		$("#addEvent")
				.dialog(
						{
							title : "新建日程",
							width : 400,
							heigh : 600,
							collapsible : true,
							resizable : true,
							 draggable:true,
							buttons : [
									{
										text : '保存',
										iconCls : 'icon-ok',
										handler : function() {
											var startTime = $(
													"input[name='startTime']")
													.val();
											var endTime = $(
													"input[name='endTime']")
													.val();
											var title = $("input[name='title']")
													.val();
											var place = $("input[name='place']")
													.val();
											var content = $(
													"textarea[name='content']")
													.val();
											var data = {
												'startTime' : startTime,
												'endTime' : endTime,
												'title' : title,
												'place' : place,
												'content' : content
											};
											$
													.ajax( {
														type : 'POST',
														url : '/oa/AddScheduleServlet',
														data : data,
														success : function() {
															// window.location.href="/oa/ViewScheduleServlet"; 
															window.location.href = "/oa/html/schedule/schedule.jsp";
															//  window.location.reload();
														},
														dataType : 'json'

													});
											alert('保存成功');
											$('#addEvent').dialog('close');
										}
									}, {
										text : '返回',
										iconCls : 'icon-cancel',
										handler : function() {
											$('#addEvent').dialog('close');
										}
									} ]
						});
	}// 添加日程
</script>

	</head>

	<body>
		<div id="cal"></div>

		<div id="addEvent" icon="icon-save" style="display: none">
			<div style="float: left">
				<form method="post" name="addFrom">
					<table id="lst">
						<tr>
							<td>
								开始时间：
							</td>
							<td>
								<input type="text" name="startTime" />
								<input type="hidden" name="scdId" />
							</td>
						</tr>
						<tr>
							<td>
								结束时间：
							</td>
							<td>
								<input type="text" name="endTime" />
							</td>
						</tr>
						<tr>
							<td>
								主题
							</td>
							<td>
								<input type="text" name="title" />
							</td>
						</tr>
						<tr>
							<td>
								日程地点
							</td>
							<td>
								<input type="text" name="place" />
							</td>
						</tr>
						<tr>
							<td>
								日程内容
							</td>
							<td>
							   <textarea rows="5" cols="30" name="content"></textarea>
								<%--<input type="text" name="content" />
							--%></td>
						</tr>
					</table>
				</form>
			</div>


		</div>
	</body>
</html>
