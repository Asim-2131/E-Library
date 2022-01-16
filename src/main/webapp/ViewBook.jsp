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
		th{
			background-color:#fffada;
		}
		   tr:nth-child(even) {
		    background-color: #fffada ;
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

<!--  Include librarian navigation bar page -->

<iframe src="LibrarianNavigationBar.jsp" onload="this.before((this.contentDocument.body||this.contentDocument).children[0]);this.remove()"></iframe>


<br><br><br>
<div id = "id1">
<h1 style = "color:white">View Book</h1>
<br>
<div class = "col-sm-8">
	<input class="form-control" id="myInput" type="text" placeholder="Search..">
</div>
<br>
<br>
<br>

<!--  connect Database through JSTL -->

<sql:setDataSource var="snapshot" driver="com.mysql.cj.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/librarydb"
     user="root"  password=""/>


<table class="table table-bordered table-striped">
	<thead>
    	<tr>
			<th>ISBN</th>
	        <th>Name</th>
	        <th>Author</th>
	        <th>Publisher</th>
	        <th>Quantity</th>
	        <th>Issued</th>
	        <th>Edit</th>
	        <th>Delete</th>
	    </tr>
	 </thead>
<tbody id="myTable">

<!--  Write Query for View all the books -->

<sql:query dataSource="${snapshot}" var="result">
select * from books;
</sql:query>
<c:forEach var="row" items="${result.rows}">
<tr>
   <td><c:out value="${row.BIsbn}"/></td>
   <td><c:out value="${row.BName}"/></td>
   <td><c:out value="${row.BAuthor}"/></td>
   <td><c:out value="${row.BPublisher}"/></td>
   <td><c:out value="${row.BQuantity}"/></td>
   <td><c:out value="${row.BIssued}"/></td>
   <c:set var="id" value="${row.BookId}"/>
   <%
   		// Take value of BookId and pass it to link in edit button and in value of delete button	
   	
   		Integer myVariable = (Integer)pageContext.getAttribute("id");
   		String he = "EditBook.jsp?bid="+myVariable;
   		String hee = myVariable+"";
   		
   %>
   <td><a href = "<%=he%>"><button type = "button" class= "btn btn-info" name = "editbtn" >Edit<span class="glyphicon glyphicon-edit"></span>
	   </button></a></td>
   <td><form action = "DeleteBookServlet" method = "post"><button type = "submit" name = "pp" class= "btn btn-danger" value = "<%=hee%>" >Delete    <span class="glyphicon glyphicon-trash"></span>
   
	   </button></form></td>
 
</tr>
</c:forEach>
</tbody>
</table>
</div>
<script>bootbox.alert("This is the default alert!");</script>
</body>
</html>