<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Book</title>
	  <link rel="stylesheet" href="MainCss.css">
	  <meta charset="utf-8">
	  <meta name="viewport" content="width=device-width, initial-scale=1">
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
	  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<style>
	
		.a{
		
			text-decoration:none;
			background-color:white;
		
		}
		.table td {
			text-align: center;
		} 
		.table th {
			text-align: center;
		}
		.navbar-nav li a:hover, .navbar-nav li.active a{
	  		color: #192bc2 !important;
    		background-color: #fff !important;
	  	}
	
	</style>
</head>
<body style = "padding-left:100px; padding-right:100px">
<%

	// Take Name of Admin from LoginOfAdmin from loginservlet

	String ClearValue = (String)session.getAttribute("LoginOfAdmin");

%>
<div class="navbar navbar-default navbar-fixed-top" id="shadowing">
	  <div class="container">
	    <div class="navbar-header">
	      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>                        
	      </button>
	      <a class="navbar-brand" href="adminWork.jsp"><img src = "logo.png" height="30px" width="120px"></a>
	    </div>
	    <div class="collapse navbar-collapse" id="myNavbar">
	      <ul class="nav navbar-nav navbar-right">
	        <li><a href="adminWork.jsp">VIEW LIBRARIAN</a></li>
	        <li><a href="AddLibrarian.html">ADD LIBRARIAN</a></li>
	        <li><a href="#"><span class="glyphicon glyphicon-user"></span><%=ClearValue%></a></li>
      		<li><a href="SignOut.jsp"><span class="glyphicon glyphicon-log-in"></span>&nbsp&nbspLogout</a></li>
	      </ul>
	    </div>
	  </div>
	</div>

<br><br><br>

</body>
</html>