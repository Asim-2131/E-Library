<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%

	// remove Both admin login and librarian login value from session and redirect to index.jsp page

	session.removeAttribute("LoginOfAdmin");
	session.removeAttribute("LoginOfLibrarian");
	out.println("<script>\r\n"
			+ "    window.location = 'index.jsp'"
			+ "</script>"); 

%>
</body>
</html>