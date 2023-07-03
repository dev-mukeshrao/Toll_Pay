package demo;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SignTest
 */
@WebServlet("/SignTest")
public class SignTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignTest() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
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
		String dt=request.getParameter("dob");
		Long ph=Long.parseLong(request.getParameter("con"));
		String eml=request.getParameter("eml");
		String ceml=request.getParameter("ceml");
		String pass=request.getParameter("pass");
		String cpass=request.getParameter("cpass");
		
		CallableStatement cs=null;
		CallableStatement cs1=null;
		Statement st=null;
		boolean b=false;
		try
		{
			System.out.println(name+" "+dt+" "+ph+""+eml);
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","tollpay_db","tollpay");
			
			/*SimpleDateFormat fdt= new SimpleDateFormat("DD/MM/YYYY");
			Date ud = fdt.parse(dt);
			java.sql.Date sqldt=new java.sql.Date(ud);
			*/
			
			st=con.createStatement();
			ResultSet rs=st.executeQuery("select *from user_master");
			if(rs!=null)
			{
				while(rs.next())
				{
					if(eml.equals(rs.getString(4)))
					{	
						b=true;
						System.out.print("this email is exist");
					}
				}
			}
			if(b)
			{
				out.println("<script type=\"text/javascript\">");
				out.print("alert('This email is exist...');");
				out.println("location='index.jsp';");
				out.println("</script>");
			}
			if(!b)
			{
				cs1=con.prepareCall("{call login_proc_add(?, ?, ?)}");
				cs1.setString(1, "user");
				cs1.setString(2,eml);
				cs1.setString(3, pass);
				cs1.execute();
			
				cs=con.prepareCall("{call user_proc_add(?, ?, ?, ?)}");
				cs.setString(1, name);
				cs.setLong(2, ph);
				cs.setString(3, eml);
				cs.setString(4, dt);
				cs.execute();
			
			
			//System.out.println(name+" "+dt+" "+ph+""+eml);
			
				out.println("<script type=\"text/javascript\">");
				out.print("alert('Registration successfully...');");
				out.println("location='index.jsp';");
			    out.println("</script>");

	
				cs.close();
				cs1.close();

				con.close();	
			}	
		}
		catch (Exception e2) 
		{
			System.out.println(e2);
		}
	}
}
