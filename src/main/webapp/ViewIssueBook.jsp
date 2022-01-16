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
	
		.a{
		
			text-decoration:none;
			background-color:white;
		
		}
		.table td {
			text-align: center;
			font-size: 15px;
		} 
		.table th {
			text-align: center;
			font-size: 16px;
		} 
		th{
			background-color:#fffada;
		}
		   tr:nth-child(even) {
		    background-color: #fffada;
		    }
		    body {
		  background-image: url('asdf.jpg');
		  background-repeat: no-repeat;
		  background-attachment: fixed; 
		  background-size: 100% 100%;
		}
		#id1 {
		
			padding-left:150px;
			padding-right:150px;
		
		}
		</style>
		<script>
		$(document).ready(function(){
		  $("#myInput").on("keyup", function() {
		    var value = $(this).val().toLowerCase();
		    $("#myTable tr").filter(function() {
		      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
		    });
		  });
		});
		</script>
</head>
<body>
<iframe src="LibrarianNavigationBar.jsp" onload="this.before((this.contentDocument.body||this.contentDocument).children[0]);this.remove()"></iframe>
<br><br><br>
<div id = "id1">
<h1 style = "color:white">View Issued Book</h1>
<br>
<div class = "col-sm-8">
	<input class="form-control" id="myInput" type="text" placeholder="Search..">
</div>
<br>
<br>
<br>

<!--  connect database through jstl -->

<sql:setDataSource var="snapshot" driver="com.mysql.cj.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/librarydb"
     user="root"  password=""/>
<table class="table table-bordered table-striped">
	<thead>
    	<tr>
			<th>ISBN</th>
	        <th>Student Name</th>
	        <th>Student Id</th>
	        <th>Mobile No</th>
	        <th>Issue Date</th>
	    </tr>
	 </thead>
<tbody id="myTable">

<!--  Write Query for Select Issed book from its table -->

<sql:query dataSource="${snapshot}" var="result">
select * from issue_book;
</sql:query>

<c:forEach var="row" items="${result.rows}">
	<tr>
	   <td><c:out value="${row.IIsbn}"/></td>
	   <td><c:out value="${row.IStudentName}"/></td>
	   <td><c:out value="${row.IStudentId}"/></td>
	   <td><c:out value="${row.IMobileNo}"/></td>
	   <td><c:out value="${row.IDate}"/></td>
    </tr>
</c:forEach>

</tbody>
</table>
</div>
</body>
</html>