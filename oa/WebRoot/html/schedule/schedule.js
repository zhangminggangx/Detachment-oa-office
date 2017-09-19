$(function() {

		//�ճ���� 
		$("#cal").fullCalendar(
				{
					height : 500,
					editable : true,
					draggable : true,
					selectable : true,
					buttonText : {
						today : "����"
					},
					monthNames : [ "һ��", "����", "����", "����", "����", "����", "����",
							"����", "����", "ʮ��", "ʮһ��", "ʮ����" ],
					events : '/oa/ViewScheduleServlet',
					//ѡ���¼�
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

					var MyStartDate = new Date(startTime).getFullYear() + "-"
							+ startmonth + "-" + startday;
					var MyStartTime = new Date(startTime).getHours() + ":"
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
					var MyEndDate = new Date(endTime).getFullYear() + "-"
							+ endmonth + "-" + endday;
					var MyEndTime = new Date(endTime).getHours() + ":"
							+ new Date(endTime).getMinutes();

					var endTime = MyEndDate + " " + MyEndTime;

					if (confirm("�������ճ�?")) {
						addFrom.startTime.value = MyStartDate;
						addFrom.endTime.value = MyEndDate;
						//  window.location = "getTime.jsp?Start="+ startTime + "&End=" +endTime;
						//   window.open("getTime.jsp?Start="+ startTime + "&End=" +endTime,"����ճ�","height=500,width=600");
						//    addfun(MyStartDate,MyEndDate);
						addfun();

					}

				},//ѡ���¼�  
				
				
					// �¼�������� 
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
						var MyStartDate = new Date(startTime).getFullYear()
								+ "-" + startmonth + "-" + startday;
						var endTime =event.start.toString();

						var endmonth = new Date(endTime).getMonth() + 1;
						var endday = new Date(endTime).getDate();

						if (endmonth < 10) {
							endmonth = "0" + endmonth;
						}
						if (endday < 10) {
							endday = "0" + endday;
						}
						var MyEndDate = new Date(endTime).getFullYear() + "-"
								+ endmonth + "-" + endday;
						
						addFrom.startTime.value = MyStartDate;
						addFrom.endTime.value = MyEndDate;
						addFrom.title.value = event.title;
						addFrom.place.value = event.place;
						addFrom.content.value = event.contents;
						addFrom.scdId.value = event.scdId;
						alert(addFrom.startTime.value);
						//   window.open(event.url);
						updatefun(event);
					}

				}); //�ճ���� 
	})
	
	//--------------�޸Ĳ鿴�ճ�
	function updatefun(event) {
		$("#addEvent").css("display", "block");
		$("#addEvent")
				.dialog(
						{
							title : "�鿴/�޸� �ճ�",
							width : 400,
							heigh : 600,
							collapsible : true,
							resizable : true,
							buttons : [
									{
										text : '����',
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
													"input[name='content']")
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
											alert('����ɹ�');
											$('#addEvent').dialog('close');
										}
									}, {
										text : 'ɾ��',
										iconCls : 'icon-cancel',
										handler : function() {
											$('#addEvent').dialog('ɾ���ɹ�');
										}
									} ]
						});
	}
	//--------------�޸Ĳ鿴�ճ�

	// ����ճ�
	//	function addfun(startTime,endTime){
	function addfun() {
		//	alert(startTime+"   "+endTime);

		$("#addEvent").css("display", "block");
		$("#addEvent")
				.dialog(
						{
							title : "�½��ճ�",
							width : 400,
							heigh : 600,
							collapsible : true,
							resizable : true,
							buttons : [
									{
										text : '����',
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
													"input[name='content']")
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
											alert('����ɹ�');
											$('#addEvent').dialog('close');
										}
									}, {
										text : 'ɾ��',
										iconCls : 'icon-cancel',
										handler : function() {
											$('#addEvent').dialog('ɾ���ɹ�');
										}
									} ]
						});
	}// ����ճ�