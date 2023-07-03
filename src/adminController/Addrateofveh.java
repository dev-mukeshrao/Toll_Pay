package adminController;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Addrateofveh
 */
@WebServlet("/Addrateofveh")
public class Addrateofveh extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Addrateofveh() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String flag=request.getParameter("flag");
		int id = Integer.parseInt(request.getParameter("id"));
		
		if(flag.equals("del"))
		{
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","tollpay_db","tollpay");
				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery("delete from rate where rt_id="+id);
				
				System.out.println("delete: "+id);
				response.setContentType("text/javascript");
				PrintWriter out=response.getWriter();
				out.print("<script>alert('Rate Del successfully...');</script>");
				response.sendRedirect("Admin/ViewRate.jsp");
			}
			catch (ClassNotFoundException e)
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
			catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	//	doGet(request, response);
		int bhtid = Integer.parseInt(request.getParameter("boothName"));
		int vtype = Integer.parseInt(request.getParameter("vehType"));
		int srt = Integer.parseInt(request.getParameter("s_rate"));
		int rrt = Integer.parseInt(request.getParameter("r_rate"));
		
		System.out.println("booth : "+bhtid+"Vtype : "+vtype+"single rate : "+srt+"Return rate : "+rrt);
		
		CallableStatement cs=null;
		try
		{
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","tollpay_db","tollpay");
			
		System.out.println("confi over");
			
			cs=con.prepareCall("{call rate_proc_add(?,?,?,?)}");
			
			cs.setInt(1,bhtid);
			cs.setInt(2, vtype);
			cs.setInt(3, srt);
			cs.setInt(4, rrt);
			
			cs.execute();
			System.out.println("Rate add successfully");
			response.setContentType("text/javascript");
			PrintWriter out=response.getWriter();
			out.print("<script>alert('Rate Add successfully...');</script>");
			response.sendRedirect("Admin/ViewRate.jsp");

			cs.close();
			con.close();	
					
		}
		catch (Exception e2) 
		{
			System.out.println(e2);
		}
	}

}
