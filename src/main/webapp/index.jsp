<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>Student Login Form</title>
	<link rel="stylesheet" href="MainCss.css">
	  <meta charset="utf-8">
	  <meta name="viewport" content="width=device-width, initial-scale=1">
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"> 
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css"> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
      .error {color: #FF0000;}
      body{
    width: 100%;
      height: calc(100%);
      position: fixed;
      top:0;
      left: 0;
		  background-image: url('asdf.jpg');
		  background-repeat: no-repeat;
		  background-attachment: fixed; 
		  background-size: 100% 100%;
	
  }
  
  main#main{
    width:100%;
    height: calc(100%) !important;
    display: flex;
  }
    </style>
</head>
<body>
<%
	// If Admin Logged In then redirect index.jsp to adminWork.jsp and if librarian Logged then redirect to ViewBook.jsp

	String LoggedInAdmin = (String)session.getAttribute("LoginOfAdmin");
	String LoggedInLibrarian = (String)session.getAttribute("LoginOfLibrarian");
	System.out.println(LoggedInAdmin);
	System.out.println(LoggedInLibrarian);
	if(LoggedInAdmin != null){
		out.println("<script>\r\n"
    			+ "    window.location = 'adminWork.jsp'"
    			+ "</script>"); 
	}
	else if(LoggedInLibrarian != null){
		out.println("<script>\r\n"
    			+ "    window.location = 'ViewBook.jsp'"
    			+ "</script>"); 
	}
	

%>
	

<main id="main" > 
  <div class="container">
      <div class="col-md-8 offset-md-2 d-flex justify-content-center">
      <div id="login-center" class="row justify-content-center align-self-center w-100">
      <div class="d-flex justify-content-center align-items-center w-100">
          <span  class="m-4 p-2">
          <h1 class="text-gradient-primary text-center" style="font-size: 4rem; color: red;"><b><i class="fas fa-lock text-gradient-primary"></i></b></h1>
          <h2 class="text-gradient-primary" style="color: black;"><b style = "color:white">Login Form</b></h2>
          </span>
        </div>
        <div class="card col-sm-7">
          <div class="card-body">
          <form id="login-form" method="post" action="LoginServlet">
            <div class="form-group">
                <input type="text" class="form-control" name="email" placeholder="Enter Email Address" title = "Ex. abcd123@gmail.com" pattern = "^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$">
                
            </div>
            <div class="form-group">
                <input type="password" class="form-control" id="inputPwd4" name="password" placeholder="Password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters">
            </div> <p><a href = "ForgetPassword.html">>ForgotPassword</a>
            <center><button type="submit" class="btn btn-block btn-wave btn-primary bg-gradient-primary" name="login">Log-In</button></center>
            <hr>
            <center><a href="SignUp.html" class="btn btn-block btn-wave btn-success bg-gradient-success">Create New Account</a></center>
          </form>
          </div>
        </div>
      </div>
      </div>
  </div>
</main>


</body>
</html>
