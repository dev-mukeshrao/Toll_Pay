package demo;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ContactTest
 */
@WebServlet("/ContactTest")
public class ContactTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContactTest() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		 
		
		String name=request.getParameter("nm");
		String eml=request.getParameter("email");
		String msg=request.getParameter("msg");
		
	
		CallableStatement cs=null;
		try
		{
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","tollpay_db","tollpay");
			
			System.out.println("NM :"+name+"em : "+eml+"m : "+msg);
			
			cs=con.prepareCall("{call contact_proc_add(?,?,?)}");
			
			cs.setString(1, name);
			cs.setString(2, eml);
			cs.setString(3, msg);
			cs.execute();
			
			System.out.println(name+" "+eml+""+msg);
			out.println("<script type=\"text/javascript\">");
			out.print("alert('contact insert successfully...');");
			out.println("location='index.jsp';");
		    out.println("</script>");
			
			cs.close();
			con.close();	
					
		}
		catch (Exception e2) 
		{
			System.out.println(e2);
		}
	}
}


