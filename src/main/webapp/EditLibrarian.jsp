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
<iframe src="AdminNavigationBar.jsp" onload="this.before((this.contentDocument.body||this.contentDocument).children[0]);this.remove()"></iframe>
<sql:setDataSource var="snapshot" driver="com.mysql.cj.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/librarydb"
     user="root"  password=""/>
<%

	//String val = (String)session.getAttribute("LibIdForEditAndDelete");

	// Take value of Lid from adminWork.jsp and put it into LibIdForEditAndDelete key of session
	
	
	String val = (String)request.getParameter("Lid");
	session.setAttribute("LibIdForEditAndDelete",val);

%>

<!--  Write Query for select Librarian information and put it into form -->

<sql:query dataSource="${snapshot}" var="result">
select * from librarian where LibId = <%=val%>;
</sql:query>
<br><br><br><br><br>

<br>
<c:forEach var="row" items="${result.rows}">
	<div class = "center">
	<h1>Edit Librarian</h1>
	<form action = "EditLibrarianServlet" method = "post">
	
		<div class = "form-group">
			<label for="fn"> Name </label>
			<input class="form-control"placeholder="Enter Name" name = 'namee' value = <c:out value="${row.Lname}"/> required><br>
		</div>
		<div class = "form-group">
			<label for="fn"> EmailAddress </label>
			<input class="form-control"placeholder="Enter Email Address" name = 'emaill' title = "Ex. abcd123@gmail.com" value = <c:out value="${row.LemailId}"/> pattern = "^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$" required><br>
		</div>
		<div class = "form-group">
			<label for="fn"> Password </label>
			<input class="form-control" type = "password" placeholder="Enter Chepter" name = 'passs' value = <c:out value="${row.Lpassword}"/> required><br>
		</div>
		<div class="text-center">
            <button type="submit" name = 'sub' class="btn btn-primary" >EditData</button>
    	</div>
	
	</form>
	</div>

</c:forEach>
</body>
</html>