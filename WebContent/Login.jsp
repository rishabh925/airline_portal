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
<script src = "https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.3.1/components/modal.min.js"></script>

<script type="text/javascript" src = "https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.3.1/components/modal.js"></script>
<script src= "https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.3.1/components/transition.min.js"></script>
<script src= "https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.3.1/components/dimmer.min.js"></script>

<script>
$(document).ready(function(){
	$('#sendButton').attr('disabled',true);
		  $('#test').blur(function(){
			  $.ajax({
		  
					  type : "post",
					  url : "LoginFormValidation",
					  async: false,
					  data: {
						  User_id: $('#test').val(),
					  },
					  success: function(msg)
					  {
						  console.log(msg)
						  
						  if(msg == '1')
							  {
							  console.log("i am enabled")
							  $('#sendButton').attr('disabled', false);
							 
							  $('#output').html("<span style='color:green;'>thank you</span>");
							  $("#test").css("background-color","#ffffff");
							  
							  }
						  else {
							  $('#sendButton').attr('disabled', true);
							  $("#test").css("background-color","#fff6d6");
							  $('#output').html("<span class = 'error' style='color:red'>This Id does not exist</span>")
						  }
						  
						  
			
		
					  }
					  
				  });
				  
  });
});

</script>
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
  <script src = "login-help.js"> </script>

<title>Login</title>
</head>
<body>
<% if(null != request.getSession().getAttribute("username"))
	{
	response.sendRedirect("WEB-INF/User.jsp");
	}

	%>
<div class="ui middle aligned center aligned grid">
  <div class="column">
    <h2 class="ui teal image header">
      <img src="asset/image_aai.jpg" class="image">
      <div class="content">
        Log-in to your account
      </div>
    </h2>
    <form action = "ControllerServlet" method ="post" class="ui large form">
      <div class="ui stacked segment">
        <div class="field">
          <div class="ui left icon input">
            <i class="user icon"></i>
            <input type="text" name="emp_id" id ="test" placeholder="Employee ID">
            
          </div>
          <div id = "output"></div>
        </div>
        <div class="field">
          <div class="ui left icon input">
            <i class="lock icon"></i>
            <input type="password" name="password" placeholder="Password">
          </div>
        </div>
        <button class="ui fluid large teal button"  type = "submit" id = "sendButton">
        <div >Login</div></button>
        
      </div>

      <div class="ui error">
      <% 
    if(null!=request.getAttribute("msg"))
    {
        out.println(request.getAttribute("msg"));
    }
%>
</div>
      

    </form>

    <div class="ui message">
      New to us? <a href="index.jsp">Sign Up</a>
    </div>
    
    <button class="ui button green create_btn" type="button" id="test5">Forgot Password</button>
	  <div class="ui modal mini test5">
  		<i class="close icon"></i>
  		<div class="header"><div class="ui middle aligned center aligned grid">Contact the Admin</div></div>
    	<div class = Content><div class = "ui middle aligned center aligned grid"> Contact Details -> Risgulati @gmail.com</div>
    	</div>	
 	</div>
 	 

    </div>
  </div>

<script>

$(document).ready(function(){
		$("#test5").click(function(){
			$(".test5.mini.modal").modal('show');
		});
		$(".test5").modal({
			closable: true
		});
	});

</script>


</body>
</html>