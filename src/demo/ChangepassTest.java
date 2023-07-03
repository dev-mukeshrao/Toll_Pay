package demo;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ChangepassTest
 */
@WebServlet("/ChangepassTest")
public class ChangepassTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangepassTest() {
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
	@SuppressWarnings("resource")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		
		String e=request.getParameter("neml");
		String p=request.getParameter("opwd");
		String np=request.getParameter("npwd");
		
		Statement st=null;
		boolean flag=false;
		try
		{
			System.out.println(e+" "+p);
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","tollpay_db","tollpay");
			st=con.createStatement();
			ResultSet rs=st.executeQuery("select *from login");
			if(rs!=null)
			{
				while(rs.next())
				{
					if(e.equals(rs.getString(3)) && p.equals(rs.getString(4)))
					{
						flag=true;
						int id=rs.getInt(1);
						System.out.println(id);
						
						HttpSession session=request.getSession();
						session.setAttribute("id", id);
						
						rs=st.executeQuery("update login set PASSWORD='"+np+"' where L_ID="+id+" ");
						out.println("<script type=\"text/javascript\">");
						out.print("alert('password change successfully...');");
						out.println("location='index.jsp';");
						out.println("</script>");
				}
				}
			}
			if(!flag)
			{
				out.println("<script type=\"text/javascript\">");
				out.print("alert('password not change...');");
				out.println("location='index.jsp';");
				out.println("</script>");
		
			}

			st.close();
			rs.close();
			con.close();	
		}
		catch (Exception e2) 
		{
			System.out.println(e2);
		}
	}
}
