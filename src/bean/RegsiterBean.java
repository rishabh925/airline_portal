package bean;

public class RegsiterBean {
	

		private String  emp_id, first_name , last_name, email, password, User_type, contact, approval;  

		  
		public String getEmp_id () {  
		    return emp_id;  
		}  
		public void setEmp_id(String emp_id) {  
		    this.emp_id = emp_id;  
		}
		  
		public void setfirst_name(String first_name) {  
		    this.first_name= first_name;  
		}  
		public String getfirst_name() {  
		    return first_name;  
		}  
		  
		public void setLast_name(String last_name) {  
		    this.last_name = last_name;  
		}  
		public String getLast_name() {  
		    return last_name ;  
		}  
		  
		   
		public String getPass() {  
		    return password;  
		}  
		  
		public void setPass(String password) {  
		    this.password = password;  
		}  
		
		
		public String getEmail()
		{
			return email;
		}
		public void setEmail(String email)
		{
			this.email = email;
		}
		 
	    public String getContact()
		{
			return contact;
		}
		public void setContact(String contact)
		{
			this.contact = contact;
		}
		public String getUserType() {
			return User_type;
		}
		public void setUserType(String User_type)
		{
			this.User_type = User_type;
		}
		public void setApproval(String approval)
		{
			this.approval = approval;
		}
		public String getApproval()
		{
			return approval;
		}


}
