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


<title>Welcome</title>

<script>
$(document).ready(function(){
	$('#sendButton').attr('disabled',true);
		  $('#flight_number').blur(function(){
			  $.ajax({
		  
					  type : "post",
					  url : "FlightNoChecker",
					  async: false,
					  data: {
						  Flight_number: $('#flight_number').val(),
					  },
					  success: function(msg)
					  {
						  console.log(msg)
						  
						  if(msg == '1')
							  {
							  console.log("i am enabled")
							  $('#sendButton').attr('disabled', false);
							 
							  $('#output').html("<span style='color:green;'>thank you</span>");
							  $("#flight_number").css("background-color","#ffffff");
							  
							  }
						  else {
							  $('#sendButton').attr('disabled', true);
							  $("#flight_number").css("background-color","#fff6d6");
							  $('#output').html("<span class = 'error' style='color:red'>This flight_number does not exist</span>")
						  }
						  
						  
			
		
					  }
					  
				  });
				  
  });
});

</script>

<script>
         $(document).ready(function(){
             $('ul.tabs').tabs({
                 swipeable:true,
                 responsiveThreshold:'768px'
                 
             });
             });
     </script>
     
     <script>
    $(document).ready(function(){
     $('#check1').click(function() {
    	    if (this.checked) {
    	        $('#source').prop('disabled', false); 
    	        $('#destination').prop('disabled', false);// If checked enable item       
    	    } else {
    	        $('#source').prop('disabled', true);
    	        $('#destination').prop('disabled', true); // If checked disable item                   
    	    }
    	});
    
     
    });
    $(document).ready(function(){
    	 $('#check2').click(function() {
    	 	    if (this.checked) {
    	 	        $('#arrival').prop('disabled', false); 
    	 	        $('#departure').prop('disabled', false);// If checked enable item       
    	 	    } else {
    	 	        $('#arrival').prop('disabled', true);
    	 	        $('#departure').prop('disabled', true); // If checked disable item                   
    	 	    }
    	 	});
    });
    $(document).ready(function(){
    	$('#check3').click(function() {
     	    if (this.checked) {
     	        $('#type').prop('disabled', false); 
     	             
     	    } else {
     	        $('#type').prop('disabled', true);
     	       
     	    }
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
List<DataBeanAO> abc =(ArrayList<DataBeanAO>)request.getAttribute("value"); %>

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
                                <li style="color: white;"><%=bean.getEmp_id() %></li>
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
    
	<div id="View">

  		<table border="1" class="responsive-table striped">
	       				 <tr style = "color : 'grey';font-weight:400">
			       		 	<td>FlightNo</td>
			        		<td>Source</td>
			        		<td>Destination</td>
			        		<td>Date of Arrival</td>
			        		<td>Time of Arrival</td>
			        		<td>Date of Departure</td>
			        		<td>Time of departure</td>
			        		<td>FlightType</td>
			        		<td>Status</td>
			        		<td>Update</td>
	        			</tr>
			
					    <%
					    Iterator<DataBeanAO> iterator = null;
					    iterator = abc.iterator();
					    while (iterator.hasNext()) {
					    	DataBeanAO element = iterator.next();
					    %>
					        <tr>
					            <td><%out.print(element.getFlightNo());%></td>
					            <td><%out.print(element.getSource());%></td>
					            <td><%out.print(element.getDestination());%></td>
					            <td><%out.print(element.getArrival_date());%></td>
					            <td><%out.print(element.getArrival());%></td>
					           	<td><%out.print(element.getDepartDate());%></td>
					            <td><%out.print(element.getDeparture());%></td>
					            <td><%out.print(element.getType());%></td>
					          	<td><%out.print(element.getStatus()); %></td>
					      		<td>
					      		<form action = "UpdateStatus" method = "post" >
					      		    <input type="hidden" name="flightId" value="<%=element.getId()%>">  
					      						      		
							      <p>
							      <input name='<%=element.getId()%>' type="radio" id='approve<%=element.getId()%>' value="Approved" />
							      <label for='approve<%=element.getId()%>' style="font-size:12px;">Approve</label>
							     </p>
							    <p>
							      <input name='<%=element.getId()%>' type="radio" id='reject<%=element.getId()%>' value="Rejected" />
							      <label for='reject<%=element.getId()%>' style="font-size:12px;">Reject</label>
					
							    </p>
							    <p>
							    <button  class="btn waves-effect waves-light btn-small" type="submit" name="action" >Submit
				    
				 			 </button>
							    </p>
														   
												      		
							</form>
								<p style = 'color : red'><%if(null!=request.getAttribute("msg"))
								    {
								        out.println(request.getAttribute("msg1"));
								    }%>
								</p>
							</td>
					        </tr>
					    <%} %>
			
		  </table>
		
	</div>

	

     	    
         	
      
      </div>
     </div>
         
     

</body>
</html>