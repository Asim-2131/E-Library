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
<body >

<!-- Add AdminNavigationBar.jsp -->

<iframe src="AdminNavigationBar.jsp" onload="this.before((this.contentDocument.body||this.contentDocument).children[0]);this.remove()"></iframe>
<div id = "id1">
<br><br><br>
<h1 style = "color:white;">Librarian</h1>
<br>

<!--  Make Search Bar for Table  -->

<div class = "col-sm-8">
	<input class="form-control" id="myInput" type="text" placeholder="Search..">
</div>
<br>
<br>
<br>

<!-- Use Jstl to connect to Database -->

<sql:setDataSource var="snapshot" driver="com.mysql.cj.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/librarydb"
     user="root"  password=""/>


<table class="table table-bordered table-striped">
	<thead>
    	<tr>
			<th>Email</th>
	        <th>Name</th>
	        <th>Password</th>
	        <th>Edit</th>
	        <th>Delete</th>
	    </tr>
	 </thead>
<tbody id="myTable">

<!-- Write Query for Select Librarians -->

<sql:query dataSource="${snapshot}" var="result">
select * from Librarian;
</sql:query>

<!-- Iterate over all the librarian and put it into table -->

<c:forEach var="row" items="${result.rows}">
<tr>
   <td><c:out value="${row.LemailId}"/></td>
   <td><c:out value="${row.Lname}"/></td>
   <td><c:out value="${row.Lpassword}"/></td>
   <c:set var="id" value="${row.LibId}"/>
   <%
   
   		/*Integer myVariable = (Integer)pageContext.getAttribute("id");
   		session.setAttribute("LibIdForEditAndDelete",myVariable+"");*/
   		
   		
   		Integer myVariable = (Integer)pageContext.getAttribute("id");
   		String he = "EditLibrarian.jsp?Lid="+myVariable;
   		String hee = myVariable+"";
   		
   %>
   
   <!-- pass myVariable in href of Edit Button -->
   
   <td><a href = "<%=he%>"><button type = "button" class= "btn btn-info" name = "editbtn" >Edit<span class="glyphicon glyphicon-edit"></span>
	   </button></a></td>
	   
   <!-- pass myVariable in value of delete Button -->
  	
  	<td><form action = "DeleteLibrarianServlet" method = "get"><button type = "submit" class= "btn btn-danger" name = "pp" value = "<%=hee%>">Delete    <span class="glyphicon glyphicon-trash"></span>
	   </button></form></td>
 
</tr>
</c:forEach>
</tbody>
</table>
</div>
</body>
</html>