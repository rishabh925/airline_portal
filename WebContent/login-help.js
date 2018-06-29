




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
        })
      ;
    }

 );