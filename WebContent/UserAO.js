 $(document).ready(function(){
	   
	 window.User_id = 1;
	   data = {}
	   var source, destination, arr_time, depart_time, arr_date, depart_date;
	   
	   $('.isko-click').click(function(){
		  ans = $(this).attr('id');
		  console.log(ans);
		  
		  if($('.'+ans +' .abhi-nahi:visible').length == 0)
			  {
			  	$('.'+ans+' .isko-hata').css('display', 'none');
			  	$('.'+ans + ' .abhi-nahi').css('display','block');
			 	 window.User_id = ans;
			 	 console.log('#submit'+User_id)
			 	 $(".isko-click").attr("disabled", true);
			 	 $("#"+ ans).prop('disabled', false);

			 	 
			 	$('#arrival'+User_id).prop('disabled',true);
	    		$('#departure'+User_id).prop('disabled', true);
	    		$('#arrivaldate'+User_id).prop('disabled', true);
	    		$('#departdate'+User_id).prop('disabled', true);
			 	$('#selectsource'+User_id).on('change', function(){
			 		source = $('#selectsource'+window.top.User_id+" option:selected").text();
			 		destination = $('#selectdest'+window.top.User_id+" option:selected").text();
			 		if(source == destination) {
			 			$('#arrival'+User_id).prop('disabled',true);
			    		$('#departure'+User_id).prop('disabled', true);
			    		$('#arrivaldate'+User_id).prop('disabled', true);
			    		$('#departdate'+User_id).prop('disabled', true);
			 			$('#output').html('Source and destination cannot be the same').css('color', 'red');
			 		}
			 		else {
			 		
			    		$('#arrivaldate'+User_id).prop('disabled', false);
			    		$('#departdate'+User_id).prop('disabled', false);
			    		$('#output').html("");
			 		}
			 		
			 	});
			 	$('#selectdest'+User_id).on('change', function(){
			 		source = $('#selectsource'+window.top.User_id+" option:selected").text();
			 		destination = $('#selectdest'+window.top.User_id+" option:selected").text();
			 		if(source == destination) {
			 			$('#arrival'+User_id).prop('disabled',true);
			    		$('#departure'+User_id).prop('disabled', true);
			    		$('#arrivaldate'+User_id).prop('disabled', true);
			    		$('#departdate'+User_id).prop('disabled', true);
			 			$('#output').html('Source and destination cannot be the same').css('color', 'red');
			 		}
			 		else {
			 			
			    		$('#arrivaldate'+User_id).prop('disabled', false);
			    		$('#departdate'+User_id).prop('disabled', false);
			    		$('#output').html("");
			 		}
			 		
			 	});
			 	 
			 	 $('#arrivaldate' + window.User_id).on('change',function(){
			 		 	
			 		     source = $('#selectsource' + User_id+ ' option:selected').val();
 		   				 destination = $('#selectdest'+ User_id+ ' option:selected').val();
 		   				 depart_date = $('#departdate'+User_id).val().split('-');
 		      			 arr_date = $("#arrivaldate" +User_id).val().split('-');
 		      			if(parseInt(arr_date[0]) >= parseInt(depart_date[0]))
 		      					 {	
 		      					$('#output').html("");
 		      					 	if(parseInt(arr_date[1]) >= parseInt(depart_date[1]))
 		      					 		{
 		      							$('#output').html("");
 		      				 				if(parseInt(arr_date[2]) >= depart_date[2])
 		  		 			 					{
				 			 						if(parseInt(arr_date[2]) == parseInt(depart_date[2]))
 		      					 			 			{
 		      					 			 				$('#output').html("");
 		      					 							$('#arrival'+User_id).prop('disabled', false);
 		      				 								$('#departure'+User_id).prop('disabled', false);
		      					 			 				depart_time = $('#departure'+User_id).val().split(":");
 		      					 			 				arr_time = $('#arrival'+User_id).val().split(":");
 		      					 			 				if(parseInt(arr_time[0]) < parseInt(depart_time[0]))
 		      					 			 					{	
 		      					 			 						$('#output').html("the chosen time is not right");
 		      					 			 											
 		      					 			 					}
 		      					 			 				else if(parseInt(arr_time[0]) == parseInt(depart_time[0]))
 		      					 			 					{
 		      					 			 						if(parseInt(arr_time[1]) <= parseInt(depart_time[1]))
 		      					 			 							{
 		      					 			 								$("#output").html("the chosen time is not right");
 		      					 										}
 		      					 			 						else{
		 		      					 			 						$('#arrival'+User_id).prop('disabled', false);
		 		 		      				 								$('#departure'+User_id).prop('disabled', false);
 		   					 			 									$("#output").html("");   					 			 											
 		   					 			 								}
 		      					 			 										
 		      					 			 					}
 		      					 			 				else{
		 		      					 			 				$('#arrival'+User_id).prop('disabled', false);
		 		      				 								$('#departure'+User_id).prop('disabled', false);
 		      					 			 						$('#output').html("");
 		      					 			 										
 		      					 			 					}
 		      					 			 			}
 		      					 			 		else {	
 		      					 			 			$('#arrival'+User_id).prop('disabled', false);
	      				 								$('#departure'+User_id).prop('disabled', false);
 		      					 			 				$("#output").html("");
 		      					 			 			}
 		      					 			 		}
 		      					 			 else{
 		      					 				$('#arrival'+User_id).prop('disabled', true);
  				 								$('#departure'+User_id).prop('disabled', true);
 		      					 			 		$('#output').html("please enter a valid date");
 		      					 			 	}
 		      					 			 			
 		      					 			}
 		      					 		else{
 		      					 				$('#arrival'+User_id).prop('disabled', true);
 		      					 				$('#departure'+User_id).prop('disabled', true);
 		      					 			 	$('#output').html("please enter a valid date");
 		      					 			 }
 		      					 			 
 		      					 	}
 		      				else{
 		      						$('#arrival'+User_id).prop('disabled', true);
					 				$('#departure'+User_id).prop('disabled', true);
 		      					  	$("#output").html("enter correct date please");
 		      					}

			    			
			    	});


			    	$('#departdate' + window.User_id).change(function(){
			    		source = $('#selectsource' + User_id+ ' option:selected').val();
		   				 destination = $('#selectdest'+ User_id+ ' option:selected').val();
		   				 depart_date = $('#departdate'+User_id).val().split('-');
		      			 arr_date = $("#arrivaldate" +User_id).val().split('-');
		      			if(parseInt(arr_date[0]) >= parseInt(depart_date[0]))
		      					 {	
		      					$('#output').html("");
		      					 	if(parseInt(arr_date[1]) >= parseInt(depart_date[1]))
		      					 		{
		      							$('#output').html("");
		      				 				if(parseInt(arr_date[2]) >= depart_date[2])
		  		 			 					{
				 			 						if(parseInt(arr_date[2]) == parseInt(depart_date[2]))
		      					 			 			{
		      					 			 				$('#output').html("");
		      					 							$('#arrival'+User_id).prop('disabled', false);
		      				 								$('#departure'+User_id).prop('disabled', false);
		      					 			 				depart_time = $('#departure'+User_id).val().split(":");
		      					 			 				arr_time = $('#arrival'+User_id).val().split(":");
		      					 			 				if(parseInt(arr_time[0]) < parseInt(depart_time[0]))
		      					 			 					{	
		      					 			 						$('#output').html("the chosen time is not right");
		      					 			 											
		      					 			 					}
		      					 			 				else if(parseInt(arr_time[0]) == parseInt(depart_time[0]))
		      					 			 					{
		      					 			 						if(parseInt(arr_time[1]) <= parseInt(depart_time[1]))
		      					 			 							{
		      					 			 								$("#output").html("the chosen time is not right");
		      					 										}
		      					 			 						else{
		 		      					 			 						$('#arrival'+User_id).prop('disabled', false);
		 		 		      				 								$('#departure'+User_id).prop('disabled', false);
		   					 			 									$("#output").html("");   					 			 											
		   					 			 								}
		      					 			 										
		      					 			 					}
		      					 			 				else{
		 		      					 			 				$('#arrival'+User_id).prop('disabled', false);
		 		      				 								$('#departure'+User_id).prop('disabled', false);
		      					 			 						$('#output').html("");
		      					 			 										
		      					 			 					}
		      					 			 			}
		      					 			 		else {	
		      					 			 			$('#arrival'+User_id).prop('disabled', false);
	      				 								$('#departure'+User_id).prop('disabled', false);
		      					 			 				$("#output").html("");
		      					 			 			}
		      					 			 		}
		      					 			 else{
			      					 				$('#arrival'+User_id).prop('disabled', true);
	 		      					 				$('#departure'+User_id).prop('disabled', true);
		      					 			 		$('#output').html("please enter a valid date");
		      					 			 	}
		      					 			 			
		      					 			}
		      					 		else{	$('#arrival'+User_id).prop('disabled', true);
	      					 					$('#departure'+User_id).prop('disabled', true);
		      					 			 	$('#output').html("please enter a valid date");
		      					 			 }
		      					 			 
		      					 	}
		      				else{
		      					$('#arrival'+User_id).prop('disabled', true);
					 				$('#departure'+User_id).prop('disabled', true);
		      					  $("#output").html("enter correct date please");
		      					}

			    			
			    	});

			   

			    	$('#departure' + window.User_id).change(function(){
			    		source = $('#selectsource' + User_id+ ' option:selected').val();
		   				 destination = $('#selectdest'+ User_id+ ' option:selected').val();
		   				 depart_date = $('#departdate'+User_id).val().split('-');
		      			 arr_date = $("#arrivaldate" +User_id).val().split('-');
		      			if(parseInt(arr_date[0]) >= parseInt(depart_date[0]))
		      					 {	
		      					$('#output').html("");
		      					 	if(parseInt(arr_date[1]) >= parseInt(depart_date[1]))
		      					 		{
		      							$('#output').html("");
		      				 				if(parseInt(arr_date[2]) >= depart_date[2])
		  		 			 					{
				 			 						if(parseInt(arr_date[2]) == parseInt(depart_date[2]))
		      					 			 			{
		      					 			 				$('#output').html("");
		      					 							$('#arrival'+User_id).prop('disabled', false);
		      				 								$('#departure'+User_id).prop('disabled', false);
		      					 			 				depart_time = $('#departure'+User_id).val().split(":");
		      					 			 				arr_time = $('#arrival'+User_id).val().split(":");
		      					 			 				if(parseInt(arr_time[0]) < parseInt(depart_time[0]))
		      					 			 					{	
		      					 			 						$('#output').html("the chosen time is not right");
		      					 			 											
		      					 			 					}
		      					 			 				else if(parseInt(arr_time[0]) == parseInt(depart_time[0]))
		      					 			 					{
		      					 			 						if(parseInt(arr_time[1]) <= parseInt(depart_time[1]))
		      					 			 							{
		      					 			 								$("#output").html("the chosen time is not right");
		      					 										}
		      					 			 						else{
		 		      					 			 						$('#arrival'+User_id).prop('disabled', false);
		 		 		      				 								$('#departure'+User_id).prop('disabled', false);
		   					 			 									$("#output").html("");   					 			 											
		   					 			 								}
		      					 			 										
		      					 			 					}
		      					 			 				else{
		 		      					 			 				$('#arrival'+User_id).prop('disabled', false);
		 		      				 								$('#departure'+User_id).prop('disabled', false);
		      					 			 						$('#output').html("");
		      					 			 										
		      					 			 					}
		      					 			 			}
		      					 			 		else {	
		      					 			 			$('#arrival'+User_id).prop('disabled', false);
	      				 								$('#departure'+User_id).prop('disabled', false);
		      					 			 				$("#output").html("");
		      					 			 			}
		      					 			 		}
		      					 			 else{
		      					 				$('#arrival'+User_id).prop('disabled', true);
 		      					 				$('#departure'+User_id).prop('disabled', true);
		      					 			 		$('#output').html("please enter a valid date");
		      					 			 	}
		      					 			 			
		      					 			}
		      					 		else{
		      					 				$('#arrival'+User_id).prop('disabled', true);
		      					 				$('#departure'+User_id).prop('disabled', true);
		      					 			 	$('#output').html("please enter a valid date");
		      					 			 }
		      					 			 
		      					 	}
		      				else{
		      						$('#arrival'+User_id).prop('disabled', true);
					 				$('#departure'+User_id).prop('disabled', true);
					 				$("#output").html("enter correct date please");
		      					}

			    			
			    	});

			   
			   

			    	$('#arrival' + window.User_id).change(function(){
			    		source = $('#selectsource' + User_id+ ' option:selected').val();
		   				 destination = $('#selectdest'+ User_id+ ' option:selected').val();
		   				 depart_date = $('#departdate'+User_id).val().split('-');
		      			 arr_date = $("#arrivaldate" +User_id).val().split('-');
		      			if(parseInt(arr_date[0]) >= parseInt(depart_date[0]))
		      					 {	
		      					$('#output').html("");
		      					 	if(parseInt(arr_date[1]) >= parseInt(depart_date[1]))
		      					 		{
		      							$('#output').html("");
		      				 				if(parseInt(arr_date[2]) >= depart_date[2])
		  		 			 					{
				 			 						if(parseInt(arr_date[2]) == parseInt(depart_date[2]))
		      					 			 			{
		      					 			 				$('#output').html("");
		      					 							$('#arrival'+User_id).prop('disabled', false);
		      				 								$('#departure'+User_id).prop('disabled', false);
		      					 			 				depart_time = $('#departure'+User_id).val().split(":");
		      					 			 				arr_time = $('#arrival'+User_id).val().split(":");
		      					 			 				if(parseInt(arr_time[0]) < parseInt(depart_time[0]))
		      					 			 					{	
		      					 			 						$('#output').html("the chosen time is not right");
		      					 			 											
		      					 			 					}
		      					 			 				else if(parseInt(arr_time[0]) == parseInt(depart_time[0]))
		      					 			 					{
		      					 			 						if(parseInt(arr_time[1]) <= parseInt(depart_time[1]))
		      					 			 							{
		      					 			 								$("#output").html("the chosen time is not right");
		      					 										}
		      					 			 						else{
		 		      					 			 						$('#arrival'+User_id).prop('disabled', false);
		 		 		      				 								$('#departure'+User_id).prop('disabled', false);
		   					 			 									$("#output").html("");   					 			 											
		   					 			 								}
		      					 			 										
		      					 			 					}
		      					 			 				else{
		 		      					 			 				$('#arrival'+User_id).prop('disabled', false);
		 		      				 								$('#departure'+User_id).prop('disabled', false);
		      					 			 						$('#output').html("");
		      					 			 										
		      					 			 					}
		      					 			 			}
		      					 			 		else {	
		      					 			 			$('#arrival'+User_id).prop('disabled', false);
	      				 								$('#departure'+User_id).prop('disabled', false);
		      					 			 				$("#output").html("");
		      					 			 			}
		      					 			 		}
		      					 			 else{
		      					 				 	$('#arrival'+User_id).prop('disabled', true);
 		      					 					$('#departure'+User_id).prop('disabled', true);
		      					 			 		$('#output').html("please enter a valid date");
		      					 			 	}
		      					 			 			
		      					 			}
		      					 		else{	$('#arrival'+User_id).prop('disabled', true);
	      					 					$('#departure'+User_id).prop('disabled', true);
		      					 			 	$('#output').html("please enter a valid date");
		      					 			 }
		      					 			 
		      					 	}
		      				else{
		      					$('#arrival'+User_id).prop('disabled', true);
					 				$('#departure'+User_id).prop('disabled', true);
		      					  $("#output").html("enter correct date please");
		      					}

			 		
			    			
			    	});

			   
			   
			   

			    	
			   
			   
			   
			   $('#submit'+window.User_id).click(function(){	
			 	   console.log(window.User_id);
			 	   $.ajax({
			 			  
			 			  type : "post",
			 			  url : "FlightUpdate",
			 			  async: true,
			 			  data: {
			 				  emp_id : $('#employee_id').val(),
			 			  	  flight_id : $('#flight_id'+window.User_id).val(),
			 				  Flight_number: $('#flight_number'+window.User_id).val(),
			 				  source : $('#selectsource'+window.User_id+" option:selected").text(),
			 				  destination:$('#selectdest'+window.User_id+" option:selected").text(),
			 				  arrival:$('#arrival'+window.top.User_id).val(),
			 				  departure:$('#departure'+window.User_id).val(),
			 				  type:$('#type'+window.User_id).val(),
			 				  status: "Pending",
			 				  
			 			  },
			 			  success: function(msg)
			 			  {
			 				  console.log("that worked");
			 				  location.reload();
			 			  }
			 			  
			 	 
			 		});
			 });

			 	   


			 	 

			  }
		  else {
			  $('.'+ans + ' .isko-hata').css('display', 'block');
			  $('.'+ans + ' .abhi-nahi').css('display', 'none');
			  $('#output').html('');
			  $(".isko-click").attr('disabled',false);
//			  for(var i = 1; i < $('#view-table tr').length; i++)
//		 		 {
//		 		 if(i != window.User_id)
//		 		 	{
//		 			 $('.' + i + ' .isko-click').prop('disabled', false);
//		 		 	}
//		 		 
//		 		 }
		  }
	   });
	  	
	    	   });
