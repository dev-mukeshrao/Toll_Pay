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
 * Servlet implementation class AddJourney
 */
@WebServlet("/AddJourney")
public class AddJourney extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddJourney() {
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
				ResultSet rs = stmt.executeQuery("delete from journey_master where jh_id="+id);
				
				System.out.println("delete: "+id);
				response.setContentType("text/javascript");
				PrintWriter out=response.getWriter();
				out.print("<script>alert('Journey type Del successfully...');</script>");
				response.sendRedirect("Admin/Journey.jsp");
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
		//doGet(request, response);
		String jtype = request.getParameter("b_username");
		
		CallableStatement cs=null;
		try
		{
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","tollpay_db","tollpay");
			
			System.out.println("confi over");
			
			cs=con.prepareCall("{call jrny_proc_add(?)}");
			
			cs.setString(1, jtype);
			
			cs.execute();
			
			System.out.println(jtype);
			response.setContentType("text/javascript");
			PrintWriter out=response.getWriter();
			out.print("<script>alert('jtype Add successfully...');</script>");
			response.sendRedirect("Admin/Journey.jsp");

			cs.close();
			con.close();	
					
		}
		catch (Exception e2) 
		{
			System.out.println(e2);
		}
		
	}

}
