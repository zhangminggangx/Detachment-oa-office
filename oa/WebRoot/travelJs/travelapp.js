$(document).ready(function() {
								   
		 $("#add").click(function()
	   {
									 
             ($("#del1").clone(true).insertAfter("#del1"));
	  
       });
		 $("#del").click(function()
					{
			               $(this).parent().parent().next().next().remove();
			        });
		 $("#lt").datebox({
				required : "true"

			});
		 $("#dt").datebox({
				required : "true"

			});

		
	});