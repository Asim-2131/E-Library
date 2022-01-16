package com.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DeleteLibrarianServlet
 */
@WebServlet("/DeleteLibrarianServlet")
public class DeleteLibrarianServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteLibrarianServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String jdbcurl = "jdbc:mysql://localhost:3306/librarydb";
        String Username = "root";
        String driverclassname = "com.mysql.cj.jdbc.Driver";
        try {
        	
        	// Database Connection
        	
        	Class.forName(driverclassname);
			Connection con = DriverManager.getConnection(jdbcurl,Username,"");
			Statement st = con.createStatement();
			
			// Take value of Librarian Id from session
			
        	/*HttpSession sc = request.getSession();
        	String bookId = (String) sc.getAttribute("LibIdForEditAndDelete");*/
			String bookId = (String) request.getParameter("pp");
        	
        	// Create Query for delete librarian with librarian Id
        	
        	String sql = "delete from librarian where LibId = "+bookId;
        	System.out.println(bookId);
        	
        	st.executeUpdate(sql);
        	PrintWriter out = response.getWriter();
        	
        	// Pring Message and redirect to adminWork.jsp page
        	
        	out.println("<script>alert('You are successfully Deleted record')</script>");
        	out.println("<script>\r\n"
        			+ "    window.location = 'adminWork.jsp'"
        			+ "</script>"); 
        	
        }catch(Exception ex) {}
	}

}
