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


</head>
<body>
<%@ page import = "bean.LoginBean" %>
<%@ page import = "java.util.*" %>
<%
LoginBean bean=(LoginBean)request.getAttribute("bean"); 
String emp_id = bean.getEmp_id();
%>
<%@page import = "bean.RegsiterBean" %>
<%  
@SuppressWarnings("unchecked")
List<RegsiterBean> abc =(ArrayList<RegsiterBean>)request.getAttribute("value"); %>

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
                        <p class="medium-small grey-text">Admin</p>                        
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
  				<p style = 'color : red'><%if(null!=request.getAttribute("msg1"))
								    {
								        out.println(request.getAttribute("msg1"));
								    }%>
								</p>
	       				 <tr style = "color : 'grey';font-weight:400">
	       				 	<td>Employee Id</td>
			       		 	<td>First Name</td>
							<td>Last Name</td>
			        		<td>Type</td>
			        		<td>Status</td>
			        		<td>Update</td>
			        		<td>PassWord Reseter</td>
	        			</tr>
			
					    <%
					    Iterator<RegsiterBean> iterator = null;
					    iterator = abc.iterator();
					    while (iterator.hasNext()) {
					    	RegsiterBean element = iterator.next();
					    %> 
					   
					        <tr>
					            <td><%out.print(element.getEmp_id());%></td>
					            <td><%out.print(element.getfirst_name());%></td>
					            <td><%out.print(element.getLast_name());%></td>
					            <td><%out.print(element.getUserType());%></td>
					            <td><%out.print(element.getApproval());%></td>
					           <td>
					      		<form action = "UpdateEmpstatus" method = "post" >
					      		    <input type="hidden" name="emp_id" value="<%=element.getEmp_id()%>">  
					      						      		
							      <%if(element.getApproval().equals("Activated")) 
							      
							      {
							      
							      %>
							      <p>
							      <input name='<%=element.getEmp_id()%>' type="radio" id='reject<%=element.getEmp_id()%>' value="Deactivated" />
							      <label for='reject<%=element.getEmp_id()%>' style="font-size:12px;">Reject</label>
					
							    </p> <%} %>
							      <% if(element.getApproval().equals("Deactivated"))
							      {
							      %>
							      
							      
							      <p>
							      <input name='<%=element.getEmp_id()%>' type="radio" id='approve<%=element.getEmp_id()%>' value="Activated" />
							      <label for='approve<%=element.getEmp_id()%>' style="font-size:12px;">Approve</label>
							     </p>
							     <%} %>
							    
							    <p>
							    <button  class="btn waves-effect waves-light btn-small" type="submit" name="action" >Submit
				    
				 			 </button>
							    </p>
							    <p style = 'color : red'><%if(null!=request.getAttribute("msg"))
								    {
								        out.println(request.getAttribute("msg"));
								    }%>
								</p>
														   				      		
							</form>
							
							</td>
							<td>
							<form action="PassWordReseter" method = "post">
								<input type = "hidden" name = "employee_id" value="<%=element.getEmp_id()%>">
							
								<%if(element.getApproval().equals("Activated")) {
								%> <button  class="btn waves-effect waves-light btn-small" type="submit" name="action" >Reset Pass
				 				 </button>
				 				 <%} %>
							</form>
							
							</td>
					        </tr>
					    <%} %>
			
		  </table>
		
	</div>

	

     	    
         	
      
      </div>
     </div>
         
     

</body>
</html>