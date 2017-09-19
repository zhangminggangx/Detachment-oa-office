<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="/WEB-INF/lib/pager-taglib.jar" prefix="pg"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>短消息</title>
		
		
		
		<link href="/oa/css/last.css" type="text/css" rel="stylesheet" />
		<link href="/oa/css/style.css" rel="stylesheet" type="text/css"/>
		<link type="text/css" rel="stylesheet"
			href="/oa/JQueryeasyui/themes/default/easyui.css"/>
		<link type="text/css" rel="stylesheet"
			href="/oa/JQueryeasyui/themes/icon.css"/>
		<script type="text/javascript"
			src="/oa/JQueryeasyui/jquery-1.4.4.min.js"></script>
		<script type="text/javascript"
			src="/oa/JQueryeasyui/jquery.easyui.min.js"></script>
		<script type="text/javascript"
			src="/oa/JQueryeasyui/locale/easyui-lang-zh_CN.js"></script>


<script type="text/javascript" src="/oa/ueditor/editor_config.js"></script>
<script type="text/javascript" src="/oa/ueditor/editor_all.js"></script>
<link rel="stylesheet" href="/oa/ueditor/themes/default/ueditor.css"/>


		<script type="text/javascript">
		function aaa(ele){
			 var reu= $("input[name='receiveEmail']").val()+ele.innerHTML+";";
			  $("input[name='receiveEmail']").val(reu);
		}

          $(function(){
              
        	  var editor_a = new baidu.editor.ui.Editor({autoClearinitialContent:true});
   	        //渲染编辑器
   	            editor_a.render('myEditor');
        		
	           $("#findBut").click(function(){
                   
	              var findTiao=  $("input[name='searchEamil']").val();
	              var data = {
	                	'likeStr' : findTiao	
						};
				
	              $.ajax( {
						type : 'POST',
						url : '/oa/FindUserEmailServlet',
						data :data,
						success : function(eve) {
	            	            $.each(eve,function(index,ele){
		            	           
							       //   var row="<li><a href='#' onclick='aaa();'>"+ele+"</a></li>";
							        
							        $("#addUl").append("<li><a href='#' onclick='aaa(this);'>"+ele+"</a></li>");
							     });
          	             
                              
                              //  $("#addUl").append("<li>"+$(this)+"</li>");
								
						},
						dataType : 'json'

					});
		         });
		         
		         
})

          

		
</script>



		<style type="text/css">
		
		 #myEditor{

            width: 550px;

            height: 480px;

        }
		
#writeDiv {
	text-align: center;
	width: 900px;
}

form {
	width: 700px;
}

#subBut {
	padding-left: 0px;
}

.inp {
	width: 93%;
}

#writeLeft,#writeRight {

	float: left;
}
#writeLeft{width:625px;}
#writeRight{width:90px; margin: 0px;padding: 0px;height: 608px}
.searchTable {
margin:0px;padding:0px;
	border: 2px;
	border: solid;
	border: #e0ecff;
}

.searchTable ul {

	height: 447px;
}
#addUl{
list-style: none;
text-align: left;
}
#addUl li{padding:0px;text-align: left;}
</style>


	</head>

	<body>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="25" align="center" valign="bottom" class="td06">
					<table width="98%" border="0" cellspacing="3" cellpadding="0">
						<tr>
							<td width="15">
								<img src="/oa/images/index_32.gif" width="9" height="9"></img>
							</td>
							<td valign="bottom" class="title" align="left">
								短消息
								<input type="hidden" value="${requestScope.tabName}"
									name="tabName" />
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<br />

		<div id="tt" class="easyui-tabs">

			<div title="收件箱">

				<iframe src="/oa/ViewReceivedMessageServlet" width="100%"
					height="500px" frameborder="0"></iframe>
			</div>
			<div title="发件箱">
				<iframe src="/oa/ViewsenddMessageServlet" width="100%"
					height="500px" frameborder="0"></iframe>

			</div>

			<div title="写消息" id="writeDiv">
				<div id="writeLeft">
					<form action="/oa/AddMessageServlet" method="post" style="width: 625px">
						<table class="table01">
							<tr>
								<td class="td_top">
									<input type="submit" value="发送" class="buttonface" id="subBut" />
								</td>
								<td class="td_top"></td>
							</tr>
							<tr>
								<td class="td07">
									标题：
								</td>
								<td class="td2">
									<input type="text" class="inp" size="10" name="title" />
								</td>
							</tr>
							<tr>
								<td class="td07">
									收信人：
								</td>
								<td class="td2">
									<input type="text" class="inp" name="receiveEmail" />
								</td>
							</tr>
							<tr>
								<td class="td07">
									内容：
								</td>
								<td class="td2">
									<textarea  name="contents" id="myEditor">
									</textarea>
								</td>
							</tr>
							<tr> 
                          <td nowrap width="100%" class="td_top" colspan="2"></td>
                     </tr>
						</table>
						
					</form>
				</div>
				<script type="text/javascript">
			
                                     </script>
				<div id="writeRight">
					<table class="searchTable">
						<tr id="searchTr">
							<td class="td_top">
							</td>
						</tr>
						<tr>
							<td>
								<input type="text" name="searchEamil" />
								<input type="button" value="搜索"  id="findBut" onclick="findReceiver();" />
							</td>
						</tr>
						<tr>
							<td>
								<ul id="addUl">
									<li></li>
								</ul>
							</td>
						</tr>
                      <tr> 
                          <td nowrap width="95%" class="td_top"></td>
                     </tr>

					</table>
				</div>
			</div>
		</div>

	</body>
</html>


