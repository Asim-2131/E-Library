package com.forgetpass;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class SendMail
 */
@WebServlet("/SendMail")
public class SendMail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendMail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String jdbcurl = "jdbc:mysql://localhost:3306/librarydb";
        String Username = "root";
        String driverclassname = "com.mysql.cj.jdbc.Driver";
        String sql = "";
        
        // Write To, Subject, Message into mail variables
        
        String to=request.getParameter("to");
		String subject="Forgot Password";
		String msg = "You PassWord for ELibrary Management System is : ";
        try {
        	
        	// Database connection 
        	
        	Class.forName(driverclassname);
			Connection con = DriverManager.getConnection(jdbcurl,Username,"");
			
			// Prepare Statement for check whether librarian is present in Our Database Or not
			
			PreparedStatement st = con.prepareStatement("select * from librarian where LemailId = ?");
			st.setString(1, to);
			
			// Execute Query
			
			ResultSet rs = st.executeQuery();
			if(rs.next() == false) {
				out.print("<script>alert('Wrong Email Id')</script>");
				out.println("<script>\r\n"
		    			+ "    window.location = 'ForgetPassword.html'"
		    			+ "</script>"); 
			}
			
			// Append Password to msg string
			
			msg += rs.getString("Lpassword");
			System.out.println(msg + " " + to + " "+ subject);
			
			// Call Mailer class send function to mail the forgot password
			
			Mailer.send(to, subject, msg);
			out.print("<script>alert('PassWord Sent In Your EmailId')</script>");
			out.println("<script>\r\n"
	    			+ "    window.location = 'index.jsp'"
	    			+ "</script>"); 
			out.close();
				
        }catch(Exception ex) {}
		
		
	}
}
