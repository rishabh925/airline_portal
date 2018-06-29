<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
      <link href="https://fonts.googleapis.com/css?family=Cinzel+Decorative:900" rel="stylesheet">
      <link href="https://fonts.googleapis.com/css?family=Capriola" rel="stylesheet">
      <link href="https://fonts.googleapis.com/css?family=Ewert" rel="stylesheet">
      <link type="text/css" rel="stylesheet" href="materialize.min.css"  media="screen,projection"/>
       <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
       <script type="text/javascript" src="materialize.min.js"></script>
        <link rel="stylesheet" type="text/css" href="style.css">
      <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
      	<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
      	<script src="paging.js"></script> 
<title>Welcome</title>



     <style type="text/css">
     .tab {
    overflow: hidden;
    border: 1px solid #ccc;
    background-color: #f1f1f1;
}

/* Style the buttons that are used to open the tab content */
.tab button {
    background-color: inherit;
    float: left;
    border: none;
    outline: none;
    cursor: pointer;
    padding: 14px 16px;
    transition: 0.3s;
}

/* Change background color of buttons on hover */
.tab button:hover {
    background-color: #ddd;
}

/* Create an active/current tablink class */
.tab button.active {
    background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
    display: none;
    overflow : scroll;
    padding: 6px 12px;
    border: 1px solid #ccc;
    border-top: none;
    
}
.input-field label {
  pointer-events: auto;
}
.abhi-nahi {
display : none;
}

.paging-nav a {

    margin: auto 1px;
    text-decoration: none;
    display: inline-block;
    padding: 1px 7px;
    background: #91b9e6;
    color: white;
    border-radius: 3px;

}
     </style>
     <script>$(document).ready(function() {
    	    $('select').material_select();
     });</script>
     <script type="text/javascript">
     function openCity(evt, cityName) {
    	    // Declare all variables
    	    var i, tabcontent, tablinks;

    	    // Get all elements with class="tabcontent" and hide them
    	    tabcontent = document.getElementsByClassName("tabcontent");
    	    for (i = 0; i < tabcontent.length; i++) {
    	        tabcontent[i].style.display = "none";
    	    }

    	    // Get all elements with class="tablinks" and remove the class "active"
    	    tablinks = document.getElementsByClassName("tablinks");
    	    for (i = 0; i < tablinks.length; i++) {
    	        tablinks[i].className = tablinks[i].className.replace(" active", "");
    	        
    	    }

    	    // Show the current tab, and add an "active" class to the button that opened the tab
    	    document.getElementById(cityName).style.display = "block";
    	    evt.currentTarget.className += " active";
    	  
    	} 
     </script>
     
     <script>
    	var source, destination, arr_time, depart_time, arr_date, depart_date;
    	
	
     $(document).ready(function(){
    	 	$('#arrivaltime').prop('disabled',true);
    		$('#departuretime').prop('disabled', true);
    		$('#arrivaldate').prop('disabled', true);
    		$('#departuredate').prop('disabled', true);
    		source = $('#sourceinput option:selected').text();
    		destination = $('#destinationinput option:selected').text();
    		console.log(source);
    		console.log(destination);
    		 
    	 	$('#sourceinput').on('change',function(){
        		 source = $('#sourceinput option:selected').text();
   				 destination = $('#destinationinput option:selected').text();
   				 if((source.toLowerCase() == destination.toLowerCase()) && source != "" && destination != ""){
   					$('#arrivaltime').prop('disabled',true);
   		    		$('#departuretime').prop('disabled', true);
   		    		$('#arrivaldate').prop('disabled', true);
   		    		$('#departuredate').prop('disabled', true);
   					 $('#msg1').html("The source and destination cannot be the same").css('color', 'red');
   				 }
   				 else if(source == "" || destination == ""){
   					$('#arrivaltime').prop('disabled',true);
   		    		$('#departuretime').prop('disabled', true);
   		    		$('#arrivaldate').prop('disabled', true);
   		    		$('#departuredate').prop('disabled', true);
   					$('#msg1').html("please enter a value").css('color', 'red');
   					 
   				 }
   				 else if(source.toLowerCase() != destination.toLowerCase())
   					 {
   					 	$("#msg1").html("");
   					 	$("#arrivaldate").prop('disabled', false);
   					 	$("#departuredate").prop('disabled', false);
			 		 
   					 }
    	 	});
   					 	 
   		$('#destinationinput').on('change',function(){
   		        		 source = $('#sourceinput option:selected').val();
   		   				 destination = $('#destinationinput option:selected').val();
   		   				 if((source.toLowerCase() == destination.toLowerCase()) && source != "" && destination != ""){
			   		   			$('#arrivaltime').prop('disabled',true);
			   		     		$('#departuretime').prop('disabled', true);
			   		     		$('#arrivaldate').prop('disabled', true);
			   		     		$('#departuredate').prop('disabled', true);
   		   					 $('#msg1').html("The source and destination cannot be the same").css('color', 'red');
   		   				 }
   		   				 else if(source == "" || destination == ""){
		   		   			$('#arrivaltime').prop('disabled',true);
		   		     		$('#departuretime').prop('disabled', true);
		   		     		$('#arrivaldate').prop('disabled', true);
		   		     		$('#departuredate').prop('disabled', true);
   		   					$('#msg1').html("please enter a value").css('color', 'red');
   		   					 
   		   				 }
   		   				 else if(source.toLowerCase() != destination.toLowerCase())
   		   					 {
   		   					 	$("#msg1").html("");
   		   					 	$("#arrivaldate").prop('disabled', false);
   		   					 	$("#departuredate").prop('disabled', false);   		   					 		 
   		   					 }
   		    	 	});

   		  $('#departuredate').on('change focusout',function(){
   			source = $('#sourceinput option:selected').val();
				 destination = $('#destinationinput option:selected').val();
				 depart_date = $('#departuredate').val().split('-');
  			 arr_date = $("#arrivaldate").val().split('-');
  			if(parseInt(arr_date[0]) >= parseInt(depart_date[0]))
  					 {	
  					$('#msg3').html("");
  					 	if(parseInt(arr_date[1]) >= parseInt(depart_date[1]))
  					 		{
  							$('#msg3').html("");
  				 				if(parseInt(arr_date[2]) >= depart_date[2])
		 			 					{
	 			 						if(parseInt(arr_date[2]) == parseInt(depart_date[2]))
  					 			 			{
  					 			 				$('#msg2').html("");
  					 							$('#arrivaltime').prop('disabled', false);
  				 								$('#departuretime').prop('disabled', false);
 					 			 				depart_time = $('#departuretime').val().split(":");
  					 			 				arr_time = $('#arrivaltime').val().split(":");
  					 			 				if(parseInt(arr_time[0]) < parseInt(depart_time[0]))
  					 			 					{	
  					 			 						$('#msg3').html("the chosen time is not right");
  					 			 											
  					 			 					}
  					 			 				else if(parseInt(arr_time[0]) == parseInt(depart_time[0]))
  					 			 					{
  					 			 						if(parseInt(arr_time[1]) <= parseInt(depart_time[1]))
  					 			 							{
  					 			 								$("#msg3").html("the chosen time is not right");
  					 										}
  					 			 						else{
	      					 			 						$('#arrivaltime').prop('disabled', false);
	 		      				 								$('#departuretime').prop('disabled', false);
					 			 									$("#msg3").html("");   					 			 											
					 			 								}
  					 			 										
  					 			 					}
  					 			 				else{
	      					 			 				$('#arrivaltime').prop('disabled', false);
	      				 								$('#departuretime').prop('disabled', false);
  					 			 						$('#msg3').html("");
  					 			 										
  					 			 					}
  					 			 			}
  					 			 		else {	
  					 			 			$('#arrivaltime').prop('disabled', false);
				 								$('#departuretime').prop('disabled', false);
  					 			 				$("#msg2").html("");
  					 			 			}
  					 			 		}
  					 			 else{
  					 				$('#arrivaltime').prop('disabled', true);
		 								$('#departuretime').prop('disabled', true);
  					 			 		$('#msg2').html("please enter a valid date");
  					 			 	}
  					 			 			
  					 			}
  					 		else{
  					 				$('#arrivaltime').prop('disabled', true);
  					 				$('#departuretime').prop('disabled', true);
  					 			 	$('#msg2').html("please enter a valid date");
  					 			 }
  					 			 
  					 	}
  				else{
  						$('#arrivaltime').prop('disabled', true);
		 				$('#departuretime').prop('disabled', true);
  					  	$("#msg2").html("enter correct date please");
  					}
 		      					 		 
   		   					});
   		  
   		$('#arrivaldate').on('change focusout',function(){
   			source = $('#sourceinput option:selected').val();
			 destination = $('#destinationinput option:selected').val();
			 depart_date = $('#departuredate').val().split('-');
			 arr_date = $("#arrivaldate").val().split('-');
			if(parseInt(arr_date[0]) >= parseInt(depart_date[0]))
					 {	
					$('#msg3').html("");
					 	if(parseInt(arr_date[1]) >= parseInt(depart_date[1]))
					 		{
							$('#msg3').html("");
				 				if(parseInt(arr_date[2]) >= depart_date[2])
	 			 					{
			 						if(parseInt(arr_date[2]) == parseInt(depart_date[2]))
					 			 			{
					 			 				$('#msg2').html("");
					 							$('#arrivaltime').prop('disabled', false);
				 								$('#departuretime').prop('disabled', false);
				 			 				depart_time = $('#departuretime').val().split(":");
					 			 				arr_time = $('#arrivaltime').val().split(":");
					 			 				if(parseInt(arr_time[0]) < parseInt(depart_time[0]))
					 			 					{	
					 			 						$('#msg3').html("the chosen time is not right");
					 			 											
					 			 					}
					 			 				else if(parseInt(arr_time[0]) == parseInt(depart_time[0]))
					 			 					{
					 			 						if(parseInt(arr_time[1]) <= parseInt(depart_time[1]))
					 			 							{
					 			 								$("#msg3").html("the chosen time is not right");
					 										}
					 			 						else{
     					 			 						$('#arrivaltime').prop('disabled', false);
		      				 								$('#departuretime').prop('disabled', false);
				 			 									$("#msg3").html("");   					 			 											
				 			 								}
					 			 										
					 			 					}
					 			 				else{
     					 			 				$('#arrivaltime').prop('disabled', false);
     				 								$('#departuretime').prop('disabled', false);
					 			 						$('#msg3').html("");
					 			 										
					 			 					}
					 			 			}
					 			 		else {	
					 			 			$('#arrivaltime').prop('disabled', false);
			 								$('#departuretime').prop('disabled', false);
					 			 				$("#msg2").html("");
					 			 			}
					 			 		}
					 			 else{
					 				$('#arrivaltime').prop('disabled', true);
	 								$('#departuretime').prop('disabled', true);
					 			 		$('#msg2').html("please enter a valid date");
					 			 	}
					 			 			
					 			}
					 		else{
					 				$('#arrivaltime').prop('disabled', true);
					 				$('#departuretime').prop('disabled', true);
					 			 	$('#msg2').html("please enter a valid date");
					 			 }
					 			 
					 	}
				else{
						$('#arrivaltime').prop('disabled', true);
	 				$('#departuretime').prop('disabled', true);
					  	$("#msg2").html("enter correct date please");
					}
	      					 		 
	      					 		 
				});


   		   		   							 	 	
   		   		    					 	 	
   		   		    					 	 	
   		$('#arrivaltime').on('change focusout',function(){
   			source = $('#sourceinput option:selected').val();
			 destination = $('#destinationinput option:selected').val();
			 depart_date = $('#departuredate').val().split('-');
			 arr_date = $("#arrivaldate").val().split('-');
			if(parseInt(arr_date[0]) >= parseInt(depart_date[0]))
					 {	
					$('#msg3').html("");
					 	if(parseInt(arr_date[1]) >= parseInt(depart_date[1]))
					 		{
							$('#msg3').html("");
				 				if(parseInt(arr_date[2]) >= depart_date[2])
	 			 					{
			 						if(parseInt(arr_date[2]) == parseInt(depart_date[2]))
					 			 			{
					 			 				$('#msg2').html("");
					 							$('#arrivaltime').prop('disabled', false);
				 								$('#departuretime').prop('disabled', false);
				 			 				depart_time = $('#departuretime').val().split(":");
					 			 				arr_time = $('#arrivaltime').val().split(":");
					 			 				if(parseInt(arr_time[0]) < parseInt(depart_time[0]))
					 			 					{	
					 			 						$('#msg3').html("the chosen time is not right");
					 			 											
					 			 					}
					 			 				else if(parseInt(arr_time[0]) == parseInt(depart_time[0]))
					 			 					{
					 			 						if(parseInt(arr_time[1]) <= parseInt(depart_time[1]))
					 			 							{
					 			 								$("#msg3").html("the chosen time is not right");
					 										}
					 			 						else{
     					 			 						$('#arrivaltime').prop('disabled', false);
		      				 								$('#departuretime').prop('disabled', false);
				 			 									$("#msg3").html("");   					 			 											
				 			 								}
					 			 										
					 			 					}
					 			 				else{
     					 			 				$('#arrivaltime').prop('disabled', false);
     				 								$('#departuretime').prop('disabled', false);
					 			 						$('#msg3').html("");
					 			 										
					 			 					}
					 			 			}
					 			 		else {	
					 			 			$('#arrivaltime').prop('disabled', false);
			 								$('#departuretime').prop('disabled', false);
					 			 				$("#msg2").html("");
					 			 			}
					 			 		}
					 			 else{
					 				$('#arrivaltime').prop('disabled', true);
	 								$('#departuretime').prop('disabled', true);
					 			 		$('#msg2').html("please enter a valid date");
					 			 	}
					 			 			
					 			}
					 		else{
					 				$('#arrivaltime').prop('disabled', true);
					 				$('#departuretime').prop('disabled', true);
					 			 	$('#msg2').html("please enter a valid date");
					 			 }
					 			 
					 	}
				else{
						$('#arrivaltime').prop('disabled', true);
	 				$('#departuretime').prop('disabled', true);
					  	$("#msg2").html("enter correct date please");
					}
	      					 		 
 					 		 
		});
   		$('#departuretime').on('change focusout',function(){
   			source = $('#sourceinput option:selected').val();
			 destination = $('#destinationinput option:selected').val();
			 depart_date = $('#departuredate').val().split('-');
			 arr_date = $("#arrivaldate").val().split('-');
			if(parseInt(arr_date[0]) >= parseInt(depart_date[0]))
					 {	
					$('#msg3').html("");
					 	if(parseInt(arr_date[1]) >= parseInt(depart_date[1]))
					 		{
							$('#msg3').html("");
				 				if(parseInt(arr_date[2]) >= depart_date[2])
	 			 					{
			 						if(parseInt(arr_date[2]) == parseInt(depart_date[2]))
					 			 			{
					 			 				$('#msg2').html("");
					 							$('#arrivaltime').prop('disabled', false);
				 								$('#departuretime').prop('disabled', false);
				 			 				depart_time = $('#departuretime').val().split(":");
					 			 				arr_time = $('#arrivaltime').val().split(":");
					 			 				if(parseInt(arr_time[0]) < parseInt(depart_time[0]))
					 			 					{	
					 			 						$('#msg3').html("the chosen time is not right");
					 			 											
					 			 					}
					 			 				else if(parseInt(arr_time[0]) == parseInt(depart_time[0]))
					 			 					{
					 			 						if(parseInt(arr_time[1]) <= parseInt(depart_time[1]))
					 			 							{
					 			 								$("#msg3").html("the chosen time is not right");
					 										}
					 			 						else{
     					 			 						$('#arrivaltime').prop('disabled', false);
		      				 								$('#departuretime').prop('disabled', false);
				 			 									$("#msg3").html("");   					 			 											
				 			 								}
					 			 										
					 			 					}
					 			 				else{
     					 			 				$('#arrivaltime').prop('disabled', false);
     				 								$('#departuretime').prop('disabled', false);
					 			 						$('#msg3').html("");
					 			 										
					 			 					}
					 			 			}
					 			 		else {	
					 			 			$('#arrivaltime').prop('disabled', false);
			 								$('#departuretime').prop('disabled', false);
					 			 				$("#msg2").html("");
					 			 			}
					 			 		}
					 			 else{
					 				$('#arrivaltime').prop('disabled', true);
	 								$('#departuretime').prop('disabled', true);
					 			 		$('#msg2').html("please enter a valid date");
					 			 	}
					 			 			
					 			}
					 		else{
					 				$('#arrivaltime').prop('disabled', true);
					 				$('#departuretime').prop('disabled', true);
					 			 	$('#msg2').html("please enter a valid date");
					 			 }
					 			 
					 	}
				else{
						$('#arrivaltime').prop('disabled', true);
	 				$('#departuretime').prop('disabled', true);
					  	$("#msg2").html("enter correct date please");
					}
	      					 		  					 		 
		});



    		 
  });

    	    </script>
    	  
   <script src = "UserAO.js"></script>
        <script>
         	
    	    $(document).ready( function () {
    	    	
    	    	$('#view-table').paging({
    	    		limit: 5,
    	    		rowDisplayStyle: 'block',
    	    		activePage: 0,
    	    		rows: []
    	    	  });
    	    });
    	    </script>

</head>
<body>
<%@ page import = "bean.LoginBean" %>
<%@ page import = "java.util.*" %>
<%
LoginBean bean=(LoginBean)request.getAttribute("bean"); 
String emp_id = bean.getEmp_id();



%>
<%@page import = "bean.DataBeanAO" %>
<%  
@SuppressWarnings("unchecked")
List<DataBeanAO> abc =(ArrayList<DataBeanAO>)request.getAttribute("value"); 
@SuppressWarnings("unchecked")
List<DataBeanAO> place =(ArrayList<DataBeanAO>)request.getAttribute("List");%>

<nav class="nav-extended grey darken-4">
            <div class="container">
                    <div class="nav-wrapper">
                        <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
                        <ul id="nav-mobile" class="right hide-on-med-and-down">
                          <li><a class="active" href="index.html">Home</a></li>
                          <li><a href="gallery.html">Gallery</a></li>
                        </ul>
                    </div>
            </div>
     </nav>
     <div class="row">
         <div class="col s4 l4">
              <ul class="side-nav fixed back_full" id="mobile-demo">
                           <div class="profile-head">
                              <ul>
                                <li ><img class="demo-avtar" src="asset/user.jpg"></li>
                                <li style="color: white;" id ="employee_id"><%=bean.getEmp_id() %></li>
                              </ul>
                           </div>
                           <div class="down-left" style = "min-height:450px;">
                             <ul>
                                <li><a href="#"><i class="small material-icons">apps</i>Gallery</a></li>
                                <li><a href="#"><i class="small material-icons">chat_bubble</i>Chat</a></li>
                               <li><form method="get" action="Logout" style ="padding-left : 40px">
		                           
                                <a href= 'Logout' class="waves-effect waves-light btn">Logout</a>
                               
    						
							
								
								</form></li>
                               
                                
                            </ul>
                           </div>
                        </ul>
         </div>
         <div class="col s12 l8 offset-l3">
             <div id="profile-page-header" class="card">
                <div class="card-image waves-effect waves-block waves-light">
                    <img class="activator" src="asset/Purple%20Bliss.jpg" alt="user background">                    
                </div>
                <figure class="card-profile-image">
                    <img src="asset/user.jpg" alt="profile image" class="circle z-depth-2 halfway-fab responsive-img activator">
                </figure>
                <div class="card-content">
                  <div class="row">                    
                    <div class="col s2 ">                        
                        <h4 class="card-title grey-text text-darken-4"><%= bean.getEmp_id()%></h4>
                        <p class="medium-small grey-text">Project Manager</p>                        
                    </div>
                    <div class="col s2 center-align offset-s1">
                        <h4 class="card-title grey-text text-darken-4">10+</h4>
                        <p class="medium-small grey-text">Work Experience</p>                        
                    </div>
                    <div class="col s2 center-align offset-s1">
                        <h4 class="card-title grey-text text-darken-4">6</h4>
                        <p class="medium-small grey-text">Completed Projects</p>                        
                    </div>                                        
                    
                  </div>
                </div>
            </div>
         </div>
     </div>
     <div class="row" style="margin-top:50px">
     <div class="col s12 l8 offset-l3">
     <div class="tab">
  		<button class="tablinks" onclick="openCity(event, 'View')" id="defaultOpen">View Flights</button>

 	    <button class="tablinks" onclick="openCity(event, 'Add')">AddFlights</button>
	</div>
	<div id="View" class="tabcontent active">
	<div id = "output" style = "padding-left: 60%; color:red"></div>
  		<table border="1" class="responsive-table striped" id ='view-table'>
	       				 <tr style = "color : 'grey';font-weight:400">
	       				 	<td>Index</td>
			       		 	<td>FlightNo</td>
			        		<td>Source</td>
			        		<td>Destination</td>
			        		<td>Arrival Date</td>
			        		<td>Time of Arrival</td>
			        		<td> Departure Date</td>
			        		<td>Time of departure</td>
			        		<td>FlightType</td>
			        		<td>Status</td>
			        		<td>Updater</td>
			        		<td>Submit</td>
			        	
	        			</tr>
			
					    <%
					    Iterator<DataBeanAO> iterator = null;
					   
					    iterator = abc.iterator();
					    while (iterator.hasNext()) {
					    	DataBeanAO element = iterator.next();
					    
					    %> 

					        <tr class = "<%=element.getId()%>">
				        		<td><%out.print(element.getId());%>
				        		<div class = "input-field "><input type = "hidden" id = "flight_id<%=element.getId() %>" value=<%=element.getId() %>></div></td>
				        		
					            <td><%out.print(element.getFlightNo());%>
					            <div class = "input-field "><input type = "hidden" id = "flight_number<%=element.getId() %>" value=<%=element.getFlightNo() %>></div>
					            </td>
					            
					            
					            <td><div class = "isko-hata"><%out.print(element.getSource());%></div>
					             <div class = "input-field abhi-nahi" >
        							<select class = "input-field " id = "selectsource<%=element.getId()%>">
        							<%
        							Iterator<DataBeanAO> it1 = null;
        							it1 = place.iterator();
        							while(it1.hasNext())
        							{
        								DataBeanAO el = it1.next();
        							
        								
        								%>
        							<option value = "<%=el.getCode()%>"><%out.print(el.getPlace());%></option>
        							<% }%>
        						
        							</select>
								</div></td>
								
								
					            <td><div class = "isko-hata"><%out.print(element.getDestination());%></div>
					            <div class = "input-field abhi-nahi" >
        							<select class = "input-field " id = "selectdest<%=element.getId()%>">
        							<%
        							Iterator<DataBeanAO> it = null;
        							it = place.iterator();
        							while(it.hasNext())
        							{
        								DataBeanAO el = it.next();
        							
        								
        								%>
        							<option value = "<%=el.getCode()%>"><%out.print(el.getPlace());%></option>
        							<% }%>
        						
        							</select>
								</div></td>
								
								 <td><div  class = 'isko-hata'><%out.print(element.getArrival_date());%>
								</div>
								<div class = "input-field abhi-nahi">
									<input type = "date" id = "arrivaldate<%=element.getId()%>" value=<%=element.getArrival_date()%> required>
								</div>
								</td>
								
					            <td><div class = "isko-hata"><%out.print(element.getArrival());%></div>
					            <div class = "input-field abhi-nahi">
        							<input type="time" id = "arrival<%=element.getId() %>" value=<%=element.getArrival()%> required></div>
					            </td>
					            
					            <td ><div class = 'isko-hata'><%out.print(element.getDepartDate());%>
								</div>
								<div class = "input-field abhi-nahi">
									<input type = "date" id = "departdate<%=element.getId()%>" value=<%=element.getDepartDate()%> required>
								</div>
								</td>
					            <td ><div class = "isko-hata"><%out.print(element.getDeparture());%></div>
					            <div class = "input-field abhi-nahi">
        							<input type="time" id = "departure<%=element.getId()%>" value = <%=element.getDeparture()%> required>
        						</div>
        						</td>
					           
					           <td><div class = "isko-hata"><%out.print(element.getType());%></div>
					            <div class = "input-field abhi-nahi">
        							<input type="text" id = "type<%=element.getId()%>" value = <%=element.getType()%> required pattern="(?:Domestic|International)">
        						</div>
        						</td>
					           
					            <td><div><%out.print(element.getStatus());%></div>
					            <div class = "input-field">
					            	<input type = "hidden" id= "status<%=element.getId()%>" value = <%=element.getStatus()%> >
					            </div>
					            </td>
					          
					          	
					          <%if(element.getStatus().equals("Pending")){ %>
					      		<td>
					      		<button class="btn isko-click waves-effect waves-light" id="<%=element.getId()%>"  name="action">ClickMe
							    <i class="material-icons right">send</i>
							  </button> 
							  </td>
							 <td> <button class = 'btn waves-effect waves-effect waves-light abhi-nahi' id='submit<%=element.getId()%>'>
							 Submit </button></td>
							  
							  
							 
					
							   <%} %>
					        </tr>

					  							
					    <%}%>
					    
					    
					
					  
			
		  </table>
		  <div class = "pagin-nav"></div>
		
	</div>

	
	<div id="Add" class="tabcontent">
		
 		 <div class="row">
    		<form class="col s12" method = "post" action = "FlightAdder">
    	
		        <div class="input-field">
		          <input id="emp_i" type="hidden" placeholder="Employee_id" name = "emp" value =<%= bean.getEmp_id()%> >
		        </div>
		        
			
    		<div class="row">
		        <div class="input-field col s12">
		        <label for="flightnumber">Flight Number</label>
		          <input id="flightnumber" type="text" placeholder="Flight Number" name = "flight_num" required maxlength="7" title="the length of the string must be less than 7 chars">
		          <div id = "msg5"></div>
		        </div>
		        
			 </div>
     			 <div class="row">
        			<div class="input-field col s6">
          			  <label for="sourceinput">Source</label>
          			  <select class = "input-field " id = "sourceinput" name ="source" required>
        							<%
        							Iterator<DataBeanAO> it1 = null;
        							it1 = place.iterator();
        							while(it1.hasNext())
        							{
        								DataBeanAO el = it1.next();
        							
        								
        								%>
        							<option value = "<%=el.getCode()%>"><%out.print(el.getPlace());%></option>
        							<% }%>
        						
        			</select>
        			</div>
        			<div class="input-field col s6">
          				<label for="destinationinput">Destination</label>
          				 <select class = "input-field " id = "destinationinput" required name ="destination">
        							<%
        							Iterator<DataBeanAO> it2 = null;
        							it2 = place.iterator();
        							while(it2.hasNext())
        							{
        								DataBeanAO el = it2.next();
        							
        								
        								%>
        							<option value = "<%=el.getCode()%>"><%out.print(el.getPlace());%></option>
        							<% }%>
        						
        			</select>
        			</div>
        			<div id = "msg1"></div>
        			
      			</div>
      			 <div class="row">
				      	
				      	<div class="input-field col s6">
			          	Departure Date<input  id="departuredate" type="date" name = "departure_date" required>
			          	</div>
			          	
				        <div class="input-field col s6">
				         Arrival Date<input type="date"  id ="arrivaldate" name = "arrival_date" required>
				        </div>
				        
			          	<div id = "msg2" style ="color:red"></div>
			      </div>
			     
			      <div class="row" id = "time">
				      	
				      	<div class="input-field col s6">
			          	Departure Time<input  id="departuretime" type="time" name = "departure_time" required>
			          	</div>
			          	
				        <div class="input-field col s6">
				         Arrival Time<input type="time"  id ="arrivaltime" name = "arrival_time" required>
				        </div>
				        
			          	<div id = "msg3" style ="color:red"></div>
			      </div>
			     
		      
		      <div class="row">
		        <div class="input-field col s12">
		          <input id="typeinput" type="text" placeholder="Flight Type" name = "type" required pattern="(?:Domestic|International)" title="It can either be Domestic or International">
		          <label for="typeinput">Flight Type</label>
		        </div>
		        
		      </div>
		      <div class = "row">
		      	<div class = "input-field col s3 offset-s4 " >
				  <button  class="btn waves-effect waves-light" type="submit" name="action" id = "sendButton1">Submit
				    <i class="material-icons right">send</i>
				  </button>
		      	</div>
		      
		      </div>
   		 </form>
  		</div>
 	

	</div>
     	    
         	
      
      </div>
     </div>
         
     

</body>
</html>