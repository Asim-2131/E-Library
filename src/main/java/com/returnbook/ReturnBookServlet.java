package com.returnbook;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ReturnBookServlet
 */
@WebServlet("/ReturnBookServlet")
public class ReturnBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReturnBookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String jdbcurl = "jdbc:mysql://localhost:3306/librarydb";
        String Username = "root";
        String driverclassname = "com.mysql.cj.jdbc.Driver";
        try {
        	
        	// Database Connection
        	
        	Class.forName(driverclassname);
			Connection con = DriverManager.getConnection(jdbcurl,Username,"");
			
			// Create simple Statement
			
			Statement st = con.createStatement();
			
			// Take value from ReturnBook.jsp page
			
			String isbn = request.getParameter("risbn");
        	String rollno = request.getParameter("rrollno");
        	
        	// Write Query for delete from issue_book
        	
        	String sql = "delete from issue_book where IStudentId = '"+rollno+"' AND IIsbn = '"+isbn+"'";
        	
        	// Make prepared statement for select issued_book field from books
        	
        	PreparedStatement st1 = con.prepareStatement("select * from books where Bisbn = ?");
        	st1.setString(1, isbn);
        	ResultSet rss = st1.executeQuery();
        	PrintWriter out = response.getWriter();
        	if(rss.next() != false) {
        		
        		// if it is exists then take value of BIssued and decrement by 1 and add update book table accordingly
        		
        		int val = Integer.parseInt(rss.getString("BIssued")) -1;
        		
        		st1 = con.prepareStatement("update books set BIssued = ? where Bisbn = ?");
        		st1.setString(1,val+"");
        		st1.setString(2,isbn);
        		int i = st1.executeUpdate();
        		System.out.println(val);
        		st.executeUpdate(sql);
	        	
        		// Pring Message and redirect to librarian main page
        		
	        	out.println("<script>alert('You are successfully returnd book')</script>");
	        	out.println("<script>\r\n"
	        			+ "    window.location = 'ViewIssueBook.jsp'"
	        			+ "</script>"); 
	        }
        	else {
	        	out.println("<script>alert('Book Not Exists Please Check Agains')</script>");
	        	out.println("<script>\r\n"
	        			+ "    window.location = 'ReturnBook.jsp'"
	        			+ "</script>"); 
        	}
        }catch(Exception ex) {}
		
	}

}
