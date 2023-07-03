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
 * Servlet implementation class AddBth
 */
@WebServlet("/AddBth")
public class AddBth extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddBth() {
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
		
		if(flag.equals("add"))
		{
			String bname = request.getParameter("b_username");
			
			CallableStatement cs=null;
			try
			{
				
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","tollpay_db","tollpay");
				
				System.out.println("confi over");
				
				cs=con.prepareCall("{call bth_mstr_proc_add(?)}");
				
				cs.setString(1, bname);
				
				cs.execute();
				
				System.out.println(bname);
				response.setContentType("text/javascript");
				PrintWriter out=response.getWriter();
				out.print("<script>alert('Booth Add successfully...');</script>");
				response.sendRedirect("Admin/Addbooth.jsp");

				cs.close();
				con.close();	
						
			}
			catch (Exception e2) 
			{
				System.out.println(e2);
			}
		}
		if(flag.equals("del"))
		{
			int id = Integer.parseInt(request.getParameter("id"));
			String nm=request.getParameter("b_u_name");
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","tollpay_db","tollpay");
				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery("delete from booth_master where bth_id="+id);
				
				System.out.println("delete: "+id);
				response.setContentType("text/html");
				PrintWriter out=response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.print("alert('Booth Del successfully...');");
				out.println("location='Admin/Addbooth.jsp';");
			    out.println("</script>");
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
		
		if(flag.equals("up"))
		{
			int id = Integer.parseInt(request.getParameter("id"));
			String nm=request.getParameter("b_username");
			try
		
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","tollpay_db","tollpay");
				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery("update booth_master set BTH_NAME='"+nm+"' where BTH_ID="+id);
		
				response.setContentType("text/html");
				PrintWriter out=response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.print("alert('boothname update successfully...');");
				out.println("location='Admin/Addbooth.jsp';");
			    out.println("</script>");
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
		doGet(request, response);
		
	}

}
