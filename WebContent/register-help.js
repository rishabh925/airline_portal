$(document).ready(function(){
		$('#sendButton').attr('disabled',true);
			  $('#test').blur(function(){
				  $.ajax({
			  
						  type : "post",
						  url : "RegisterFormValidation",
						  async: false,
						  data: {
							  User_id: $('#test').val(),
						  },
						  success: function(msg)
						  {
							  console.log(msg)
							  
							  if(msg == '0')
								  {
								  $('#sendButton').attr('disabled', false);
								 
								  $('#output').html("<span style='color:green;'>thank you</span>");
								  $("#test").css("background-color","#ffffff");
								  
								  }
							  else {
								  $('#sendButton').attr('disabled', true);
								  $("#test").css("background-color","#fff6d6");
								  $('#output').html("<span class = 'error' style='color:red'>This Id already exits</span>")
							  }
							  
							  
				
			
						  }
						  
					  });
					  
	  });
  });

$(document).ready(function() {
      $('.ui.form').form({
          fields: {
            emp_id: {
              identifier  : 'emp_id',
              rules: [
                {
                  type   : 'empty',
                  prompt : 'Please enter your Employee id'
                },
              {
              	type : 'maxLength[5]',
               	prompt : 'The employee id should not have more than 5 chars'
                       
                	}
                		
                
              ]
            },
            first_name: {
              identifier  : 'first-name',
              rules: [
                {
                  type   : 'empty',
                  prompt : 'Please enter your first-name'
                }
              ]
            },
            second_name: {
                identifier  : 'last-name',
                rules: [
                  {
                    type   : 'empty',
                    prompt : 'Please enter your last-name'
                  }
                ]
              },
              contact: {
                  identifier  : 'contact',
                  rules: [
                	 { 
                		 type: 'regExp',
                	        value: '^[2-9]{1}[0-9]{9}$',
                		  
                	  },
                    {
                      type   : 'empty',
                      prompt : 'Please enter your Contact No.'
                    },
                    {
                      type   : 'length[10]',
                      prompt : 'Your Contact No must be at least 10 characters'
                    },
                    {
                        type   : 'maxLength[10]',
                        prompt : 'The contact number must have 10 characters'
                      }
                  ]
                },
                email: {
                    identifier  : 'Email',
                    rules: [
                      {
                        type   : 'empty',
                        prompt : 'Please enter your Email'
                      },
                      {
                        type   : 'email',
                        prompt : 'Please Enter a valid email'
                      }
                    ]
                  },
                  password: {
                      identifier  : 'password',
                      rules: [
                        {
                          type   : 'empty',
                          prompt : 'Please enter your password'
                        },
                        {
                          type   : 'length[6]',
                          prompt : 'Your password must be at least 6 characters'
                        }
                      ]
                    }
                  
            
          }
        });
    }

 );