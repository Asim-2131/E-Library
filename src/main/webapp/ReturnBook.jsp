<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Issue Book</title>
	  <link rel="stylesheet" href="MainCss.css">
	  <meta charset="utf-8">
	  <meta name="viewport" content="width=device-width, initial-scale=1">
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
	  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	  <style>
	  body {
		  background-image: url('asdf.jpg');
		  background-repeat: no-repeat;
		  background-attachment: fixed; 
		  background-size: 100% 100%;
		}
	  .center {
		  margin: auto;
		  width: 50%;
		  padding-left:30px;
		  padding-right:30px;
		  padding-top:10px;
		  padding-bottom:10px;
		  background-color:#fffada;
		  border-radius:20px;
		}
	  </style>

<body  style = "padding-left:100px; padding-right:100px"></body>
<iframe src="LibrarianNavigationBar.jsp" onload="this.before((this.contentDocument.body||this.contentDocument).children[0]);this.remove()"></iframe>
<br><br><br><br><br><br>
<div class="center">
<h1>Return Book</h1>
<br>
<br>

<form action = "ReturnBookServlet" method = "POST">
		<div class = "form-group">
			<label for="fn"> ISBN </label>
			<input class="form-control"placeholder="Enter Chepter" name = 'risbn' pattern = "\d{13}" title = "It Contains 13 digits" required><br>
		</div>
		<div class = "form-group">
			<label for="fn"> Roll No </label>
			<input class="form-control"placeholder="Enter Chepter" name = 'rrollno' pattern = "^\d{2}\w{3}\d{3}$" required><br>
		</div>
		<div class="text-center">
            <button type="submit" name = 'sub' class="btn btn-primary" >Return</button>
    	</div>
</form>
</div>
</head>
</html>