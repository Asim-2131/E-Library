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
<title>Insert title here</title>
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
</head>
<body>
<iframe src="LibrarianNavigationBar.jsp" onload="this.before((this.contentDocument.body||this.contentDocument).children[0]);this.remove()"></iframe>
<sql:setDataSource var="snapshot" driver="com.mysql.cj.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/librarydb"
     user="root"  password=""/>
<%


	// Get Value from address Bar which is passed by ViewBook page and set into session
	String val = request.getParameter("bid");
	session.setAttribute("EditBookIdNo",val);

%>

<!-- Write Query for Select Books Where Book Id = val and write it into form -->

<sql:query dataSource="${snapshot}" var="result">
select * from books where BookId = <%=val%>;
</sql:query>
<br><br><br>
<div class = "center">
<h1>Edit Book</h1>
<br>
<c:forEach var="row" items="${result.rows}">

	<form action = "EditBookServlet" method = "post">
	
		<div class = "form-group">
			<label for="fn"> ISBN </label>
			<input class="form-control"placeholder="Enter Chepter" name = 'bisbn' value = <c:out value="${row.BIsbn}"/> pattern = "\d{13}" title = "It Contains 13 digits" required><br>
		</div>
		<div class = "form-group">
			<label for="fn"> Name </label>
			<input class="form-control"placeholder="Enter Chepter" name = 'bname' value = <c:out value="${row.BName}"/> required><br>
		</div>
		<div class = "form-group">
			<label for="fn"> Author </label>
			<input class="form-control"placeholder="Enter Chepter" name = 'bauthor' value = <c:out value="${row.BAuthor}"/> required><br>
		</div>
		<div class = "form-group">
			<label for="fn"> Publisher </label>
			<input class="form-control"placeholder="Enter Chepter" name = 'bpublish' value = <c:out value="${row.BPublisher}"/> required><br>
		</div>
		<div class = "form-group">
			<label for="fn"> Quantity </label>
			<input class="form-control"placeholder="Enter Chepter" name = 'bquant' value = <c:out value="${row.BQuantity}"/> required><br>
		</div>
		<div class="text-center">
            <button type="submit" name = 'sub' class="btn btn-primary" >EditData</button>
    	</div>
	
	</form>

</c:forEach>
</div>
</body>
</html>