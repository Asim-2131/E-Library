package com.addviewbook;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Types;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EditBookServlet
 */
@WebServlet("/AddBookServlet")
public class AddBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddBookServlet() {
        super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String jdbcurl = "jdbc:mysql://localhost:3306/librarydb";
        String Username = "root";
        String driverclassname = "com.mysql.cj.jdbc.Driver";
        String sql = "";
        try {
        	
        	// Connection Of Database
        	
        	Class.forName(driverclassname);
			Connection con = DriverManager.getConnection(jdbcurl,Username,"");
			
			// Making Prepared Statement for checking book is present of not
			
			PreparedStatement st1 = con.prepareStatement("select * from books where Bisbn = ?");
			
			// Making Prepared Statement for insert book if it is not present
			
			PreparedStatement st = con.prepareStatement("insert into books values(?,?,?,?,?,?,?)");
			
			// Take All the values from form of AddBook.jsp
			
			String isbn = request.getParameter("bisbn");
        	String name = request.getParameter("bname");
        	String author = request.getParameter("bauthor");
        	String publisher = request.getParameter("bpublish");
        	String quantity = request.getParameter("bquant");
        	
        	// Set value in Query 1
        	
        	st1.setString(1, isbn);
        	PrintWriter out = response.getWriter();
        	
        	// Execute First Query
        	
        	ResultSet ress = st1.executeQuery();
        	if(ress.next() == false) { // check that book is not present
        		
        		// Set Values in Query 2
        		
	        	st.setNull(1, Types.NULL);
	        	st.setString(2, isbn);
	        	st.setString(3, name);
	        	st.setString(4, author);
	        	st.setString(5, publisher);
	        	st.setString(6, quantity);
	        	st.setString(7, "0");
	        	
	        	// Execute Second Query
	        	
	        	int i = st.executeUpdate();
	        	System.out.println("Hello1");
	        	
	        	// Message and redirect to ViewBook.jsp page
	        	
	        	out.println("<script>alert('You are successfully updated record')</script>");
	        	out.println("<script>\r\n"
	        			+ "    window.location = 'ViewBook.jsp'"
	        			+ "</script>"); 
        	}
        	else {
        		out.println("<script>alert('Book Already Exist Please Enter Again')</script>");
        		out.println("<script>\r\n"
	        			+ "    window.location = 'AddBook.html'"
	        			+ "</script>"); 
        	}
        	
        }catch(Exception ex) {
        	System.out.println("HELLO");
        }
	}

}
