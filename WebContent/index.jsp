<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.3.1/dist/semantic.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.3.1/components/form.js"></script>
<script type="text/javascript" src = "https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.3.1/components/form.min.js"></script>
<title>Login Page</title>
<style type="text/css">
    body {
      background-color: #DADADA;
    }
    body > .grid {
      height: 100%;
    }
    .image {
      margin-top: -100px;
      width : 5 em;
    }
    .column {
      max-width: 450px;
    }
  </style>
  <script type="text/javascript" src = "register-help.js"></script>
  <script type = "text/javascript">
  
  </script>
</head>
<body>
			
		
		<div class="ui middle aligned center aligned grid">
  			<div class="column">
   				 <h2 class="ui teal image header">
      				<img src="asset/image_aai.jpg" class="image">
      				<div class="content">
        			Please Register </div>
    			 </h2>
    			<form action = "RegisterController" method ="post" class="ui large form">
      				<div class="ui stacked segment">
      					<div class="field">
    						<label>Employee Id</label>
    						<input id ="test"  name="emp_id" placeholder="Employee ID" type="text">
  			  				
  						<div class="field">
  			  				<label>First Name</label>
  			  				<input name="first-name" placeholder="First Name" type="text">
  			  				
  						</div>
  						<div class="field">
    						<label>Last Name</label>
    						<input name="last-name" placeholder="Last Name" type="text">
  						</div>
  						<div class="field">
    						<label>Contact No.</label>
    						<input name="contact" placeholder="Contact No." type="tel" maxlength="10">
  						</div>
  						<div class="field">
    						<label>Email-id</label>
    						<input name="Email" placeholder="Email Id" type="email">
  						</div>
  						<div class="field">
    						<label>Password</label>
    						<input name="password" placeholder="Password" type="password">
  						</div>
  						<div class="field">
    						<select name="select_user" class="ui fluid dropdown">
        						<option>UserType</option> 
    							<option>AO</option>
    							<option>SO</option>
   						    </select>
  						</div>
  						<button class="ui button" id = "sendButton" type="submit">Submit</button>
  						<div><a href = "Login.jsp"> Already a User?</a></div>
  						<div class="error" id = "output"></div>
  						</div>
						<div class="ui error message">
  						</div>
						</div>
						
      				</div>
      			</form>
        	</div>
		</div>

</body>
</html>