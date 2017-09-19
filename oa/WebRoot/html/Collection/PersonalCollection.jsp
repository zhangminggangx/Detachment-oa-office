<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" " http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns=" http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>我的便签</title>
<link href="/oa/css/style.css" rel="stylesheet" type="text/css"/>
<link type="text/css" rel="stylesheet" href="/oa/JQueryeasyui/themes/default/easyui.css"/>
<link type="text/css" rel="stylesheet" href="/oa/JQueryeasyui/themes/icon.css"/>
<script type="text/javascript" src="/oa/JQueryeasyui/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="/oa/JQueryeasyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/oa/JQueryeasyui/locale/easyui-lang-zh_CN.js"></script>
  <style type="text/css">
        #main div
        {
           // position: absolute;
            width: 220px;
            height: 266px;
           
         
        }
        #main{
     
    //  border:solid 1px #ff0000;
        }
        .notedDiv{
        position: relative;
      	 	float:left;
       	background-repeat: no-repeat;
      
   
       
        }
        .space{
        clear: both;}
        #main div table tr td{ font-size: 12px;}
        
    </style>
<script type="text/javaScript">


$(function(){
           $("img[name='delMemo']").click(function(e) {
        	 var memoId = $(this).attr("id");
        	 var delBtn="#"+memoId;
			var ret=window.confirm("确认要删除吗？");
			
			if(ret==1){
				  $.ajax({
	                  type:'get',
			           url:'DeleteMemoServlet?memoId='+memoId,
			           success:function(ret){
	               	      if(ret==0)
		               	      alert("删除失败");
	               	      else{
		               	      alert("删除成功");
		               	   window.location.href="/oa/ViewMyMemoServlet";
	               	      }
				           }
				    });
			}
			
			
		});
		   	$("#add").bind("click",function(){
		   		$("#dd").css("display","block");
				$("#dd").dialog({
					title:"新建标签",
					width : 300,
					heigh : 500,
					collapsible:true,
					resizable:true,
					 draggable:true,
					buttons:[{
						text:'保存',
						iconCls:'icon-ok',
						handler:function(){
						    $.ajax({
                                   type:'get',
						           url:'AddMemoServlet?title='+encodeURI(encodeURI($("#title1").val()))+"&contents="+encodeURI(encodeURI($("#contents1").val())),
                                   dataType:'json',
						           success:function(ele){
                                 	  window.location.href="/oa/ViewMyMemoServlet";
     						           }
							    });
							//alert('保存成功');
						$('#dd').dialog('close');
						}
					},{
						text:'删除',
						iconCls:'icon-cancel',
						handler:function(){
						$('#dd').dialog('删除成功');
					}
				}]
				});
			});



			//详情且修改开始
			 var mydialog=null;
				$("a[name='link']").bind("click",function(){
					var memoId=$(this).prev().val();
					var contents=$(this).prev().prev().val();
					var owner=$(this).parent().prev().prev().html();
					var title=$(this).parent().prev().prev().prev().html();
					//alert(contents);
					$("#owner").val(owner);
					$("#title").val(title);
					$("#contents").val(contents);
		   		    $("#tt").css("display","block");

		   		 if(mydialog==null){
				$("#tt").dialog({
					title:"修改便签",
					collapsible:true,
					resizable:true,
					 draggable:true,
					buttons:[{
						text:'保存',
						iconCls:'icon-ok',
						handler:function(){
						  var inputTitle=$("#title").val();
				   		    var inputContents=$("#contents").val();
						    $.ajax({
                                   type:'get',
                                   url:'ModifyMemoServlet?memoId='+memoId+"&title="+encodeURI(encodeURI(inputTitle))+"&contents="+encodeURI(encodeURI(inputContents)),
						           success:function(ele){
						             alert('修改成功');
						             window.location.href("/oa/ViewMyMemoServlet");
     						           },
     						        dataType:'json'
							    });
						$('#tt').dialog('close');
						}
					},{
						text:'取消',
						iconCls:'icon-cancel',
						handler:function(){
						$('#tt').dialog('close');
					}
				}]
				});
		   		 }
		   		else{
		            mydialog.dialog({href:"/oa/ViewMyMemoServlet"});
		     	    mydialog.dialog('refresh');
		     	   
		            }   
			});
				
		//mouseOver
		var  imgb;
				$("#main").children().hover(function(){
					imgb=$(this).css("backgroundImage");
					
                          $(this).css("backgroundImage","url('/oa/images/b1.gif')");
					},function(){ 
					   $(this).css("backgroundImage",imgb);
					}
					);

				
			
});

function  check(){
	var checkEle=document.getElementsByName("product");
	var allEle=document.getElementById("all");
	for(var i=0;i<checkEle.length;i++){
		checkEle[i].checked=allEle.checked;
	}
}




</script>


</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
  
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="25" align="center" valign="bottom" class="td06"><table width="98%" border="0" cellspacing="3" cellpadding="0">
      <tr>
        <td width="15"><img src="/oa/images/index_32.gif" width="9" height="9"/></td>
        <td valign="bottom" class="title"align="left">我的便签</td>
         <td height="30">
                     <input  name="addMemo" type="button" class="buttonface" value="添加  " id="add"/>
                </td>
      </tr>
    </table></td>
  </tr>
</table>
<br/>
 <div id="main" >
 
  <c:if test="${not empty requestScope.memos}">
  <c:forEach items="${requestScope.memos}" var="m" varStatus="i"  >
   <div class="notedDiv"  style="background-image: url('/oa/images/b${i.index+5}.gif');" onmousedown="move(this,event)">
 
  <table width="95%"  align="center" cellpadding="0" cellspacing="0"  id="form1" style="padding-top: 20px; padding-left: 20px; margin-top: 20px; line-height: 30px;">
 
    <tr > <td  >标题:${m.title }</td></tr>
    <tr > <td >时间:${m.createTime }</td></tr>
   <tr><td>便签内容:</td></tr>
   <tr><td>&nbsp;&nbsp;${m.contents}</td></tr>
    <tr>     <td> 
    <%--<input name="delMemo" type="button"  style="width: 40px"  value=" 删除  " id="${m.memoId }"/>
       --%>
       <img src="/oa/images/x1.gif" alt="xx"  name="delMemo"  id="${m.memoId }" style="margin-top: 10px;margin-left: 120px;" />
    </td></tr>
</table>
</div>

  </c:forEach>
  </c:if>

</div>

		<div id="dd" icon="icon-save" style="display: none">
			<p>
				标题
				<input type="text" id="title1" />
			</p>
			<p>
				内容
				<textarea id="contents1" cols="30"  rows="10"></textarea>
			</p>
		</div>

		<div id="tt" icon="icon-save" style="display: none">
			<table border=0 align=center cellpadding=0 cellspacing=0>
				<tr align="left" nowrap>
					<td width="80" height="24" align="center" class=td_form01>
						便签主人
					</td>
					<td class="td_form02">
						<input id="owner" type="text"/>
					</td>
				</tr>
				<tr>
					<td width="80" height="24" align="center" class=td_form01>
						便签主题
					</td>
					<td class="td_form02">
						<input type="text" id="title" />
					</td>
				</tr>
				<tr>
					<td width="80" height="24" align="center" class=td_form01>
						便签内容
					</td>
					<td class="td_form02">
					<textarea id="contents" cols="26" rows="8"></textarea>
						

					</td>
				</tr>
			</table>
		</div>
		
		
		<script type="text/javaScript">

var a;
document.onmouseup = function() {
    if (!a) return;
    document.all ? a.releaseCapture() : window.captureEvents(Event.MOUSEMOVE | Event.MOUSEUP);
    a = "";
};
document.onmousemove = function(d) {
    if (!a) return;
    if (!d) d = event;
    a.style.left = (d.clientX - b) + "px"; a.style.top = (d.clientY - c) + "px";
};
function move(o, e) {
    a = o;
    document.all ? a.setCapture() : window.captureEvents(Event.MOUSEMOVE);
    b = e.clientX - parseInt(a.style.left);
    c = e.clientY - parseInt(a.style.top);
    o.style.zIndex = getMaxIndex() + 1;
};
// function $(id) { return document.getElementById(id); }
function getMaxIndex() {
    var index = 0;
    var ds = document.getElementById('main').getElementsByTagName('div');
    var l = document.getElementById('main').getElementsByTagName('div').length;
    for (i = 0; i < l; i++) {
        if (ds[i].style.zIndex > index) index = ds[i].style.zIndex;
    }
    return index;
}
</script>
	</body>
</html>
