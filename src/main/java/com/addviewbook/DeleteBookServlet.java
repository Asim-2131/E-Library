package com.addviewbook;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class DeleteBookServlet
 */
@WebServlet("/DeleteBookServlet")
public class DeleteBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteBookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String jdbcurl = "jdbc:mysql://localhost:3306/librarydb";
        String Username = "root";
        String driverclassname = "com.mysql.cj.jdbc.Driver";
        try {
        	
        	// Connect Database
        	
        	Class.forName(driverclassname);
			Connection con = DriverManager.getConnection(jdbcurl,Username,"");
			Statement st = con.createStatement();
			
			// Take value of BookId from session
			
        	String bookId = request.getParameter("pp");        	
        	// Write SQL for delete book
        	
        	String sql = "delete from books where BookId = "+bookId;
        	
        	// Execute Query
        	
        	st.executeUpdate(sql);
        	PrintWriter out = response.getWriter();
        	
        	// Redirect to ViewBook.jsp page
        	
        	out.println("<script>alert('You are successfully Deleted record')</script>");
        	out.println("<script>\r\n"
        			+ "    window.location = 'ViewBook.jsp'"
        			+ "</script>"); 
        	
        }catch(Exception ex) {}
	}

}
