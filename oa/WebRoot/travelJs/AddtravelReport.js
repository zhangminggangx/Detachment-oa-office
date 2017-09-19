$(function() {
	
	      /*  $("#del").click(function(){
						alert("!!!");
			                $(this).parent().parent().parent().children("input:last-child").remove();
			        });*/
	       
	
	
			$("#txtDate").datebox({
						required : "true"

					});
			$("#addCustomsBut").click(function() {

						$("#customsInfo").clone(true)
								.insertAfter("#customsInfo");
					});
          
		
			
		});
