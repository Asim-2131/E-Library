package com.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Types;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddLibrarianServlet
 */
@WebServlet("/AddLibrarianServlet")
public class AddLibrarianServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddLibrarianServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String jdbcurl = "jdbc:mysql://localhost:3306/librarydb";
        String Username = "root";
        String driverclassname = "com.mysql.cj.jdbc.Driver";
        String sql = "";
        try {
        	
        	// Database Connection 
        	
        	Class.forName(driverclassname);
			Connection con = DriverManager.getConnection(jdbcurl,Username,"");
			
			// Make prepared Statement for insert into librarian table
			
			PreparedStatement st = con.prepareStatement("insert into librarian values(?,?,?,?)");
			
			// Take values from AddLibrarian.html page
			
        	String name = request.getParameter("nameee");
        	String email = request.getParameter("emailll");
        	String pass = request.getParameter("passss");
        	
        	// Set Values into prepared statement
        	
        	st.setNull(1, Types.NULL);
        	st.setString(2, name);
        	st.setString(3, email);
        	st.setString(4, pass);
        	
        	// Execute Query
        	
        	int i = st.executeUpdate();
        	System.out.println("Hello1");
        	PrintWriter out = response.getWriter();
        	
        	// Give Message and Redirect to adminWork.jsp page
        	
        	out.println("<script>alert('You are successfully Added librarian')</script>");
        	out.println("<script>\r\n"
        			+ "    window.location = 'adminWork.jsp'"
        			+ "</script>"); 
        	
        }catch(Exception ex) {
        	System.out.println("HELLO");
        }
	}

}
