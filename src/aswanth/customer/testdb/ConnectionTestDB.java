package aswanth.customer.testdb;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;

/**
 * Servlet implementation class ConnectionTestDB
 */
@WebServlet("/ConnectionTestDB")
public class ConnectionTestDB extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public ConnectionTestDB() {
       
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String user = "springstudent";
		String pass = "springstudent";
		
		String jdbcURl = "jdbc:mysql://localhost:3306/web_customer_tracker?useSSL=false";
		
		String driver = "com.mysql.jdbc.Driver";
		
		try{
			PrintWriter out = response.getWriter();
			
			out.println("connecting to database " + jdbcURl);
			
			Class.forName(driver);
			
			java.sql.Connection myConn = DriverManager.getConnection(jdbcURl,user,pass);
			
			out.print("connection successful");
			
			myConn.close();
		}
		catch(Exception ex){
			ex.printStackTrace();
			throw new ServletException(ex);
		}
	}

}
