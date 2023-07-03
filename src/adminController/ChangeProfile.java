package adminController;

import java.io.IOException;
import java.io.PrintWriter;
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
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ChangeProfile
 */
@WebServlet("/ChangeProfile")
public class ChangeProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeProfile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String submit=request.getParameter("submit");
		
		if(submit.equalsIgnoreCase("update"))
		{
			String nm=request.getParameter("name");
			long mb=Long.parseLong(request.getParameter("mobile"));
			String em=request.getParameter("email");
			String gen =request.getParameter("gender");
			String addr=request.getParameter("add");
			String dt=request.getParameter("bod");
			
			HttpSession s = request.getSession();
			int id=(int)s.getAttribute("admid");
			
			System.out.println("name : "+nm+"mb : "+mb+"em : "+em+"gen : "+gen+"addre : "+addr+"dt : "+dt);
			
			int boid=getBthOpId(id);
			System.out.println("boid: "+boid);
			
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","tollpay_db","tollpay");
				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery("update login set l_email='"+em+"' where l_id="+id);
				System.out.println("login update");
				ResultSet rs1=stmt.executeQuery("update booth_operator set bo_name='"+nm+"',bo_mobile="+mb+",bo_email='"+em+"',bo_gender='"+gen+"',bo_address='"+addr+"',bo_bod=to_date('"+dt+"','DD/MM/YYYY') where bo_id ="+boid);
				System.out.println("booth operator update");
				response.setContentType("text/javascript");
				PrintWriter out=response.getWriter();
				out.print("<script>alert('Setting successfully save');</script>");
				response.sendRedirect("Admin/Setting.jsp");
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
		
		if(submit.equalsIgnoreCase("changPass"))
		{
			String em=request.getParameter("email");
			String oldpass=request.getParameter("oldpass");
			String newpass=request.getParameter("newpass");
			String confpass=request.getParameter("confpass");
			
			HttpSession s = request.getSession();
			int id=(int)s.getAttribute("admid");
			
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","tollpay_db","tollpay");
				Statement stmt = con.createStatement();
				ResultSet r = stmt.executeQuery("select * from login where l_id = "+id);
				
				while(r.next())
				{
					if(em.equals(r.getString("l_email")) && oldpass.equals(r.getString("password")))
					{
						ResultSet rs = stmt.executeQuery("update login set password='"+newpass+"' where l_id="+id);
						rs.close();
						response.setContentType("text/javascript");
						PrintWriter out=response.getWriter();
						out.print("<script>alert('Setting successfully save');</script>");
						response.sendRedirect("Admin/Setting.jsp");
					}
					else
					{
						PrintWriter out=response.getWriter();
						out.println("<script type=\"text/javascript\">");
						out.print("alert('email or password are Worng');");
						out.println("location='Admin/Setting.jsp';");
					    out.println("</script>");
					}
				}
				r.close();
				stmt.close();
				con.close();
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

	public int getBthOpId(int id)
	{
			int boid=0;
		
			Connection con = null;
			Statement stmt1=null;
			ResultSet r=null;
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","tollpay_db","tollpay");
				stmt1 = con.createStatement();
				String qry="SELECT bo.bo_id FROM booth_operator bo JOIN login l ON (bo.bo_email = l.l_email) WHERE l.l_id="+id;
				r=stmt1.executeQuery(qry);
				while(r.next())
				{
					boid=r.getInt(1);
				}
				r.close();
				stmt1.close();
				con.close();
			}
			catch(Exception e)
			{e.printStackTrace();}
			return boid;
	}
	
}
