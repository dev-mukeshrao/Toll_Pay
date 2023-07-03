package demo;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ProfileTest
 */
@WebServlet("/ProfileTest")
public class ProfileTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfileTest() {
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
	@SuppressWarnings({ "resource", "null" })
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		String eml1="";
		
		HttpSession s=request.getSession(false);
		int d1=(int)s.getAttribute("id");
		
		String n=request.getParameter("ename");
		String e1=request.getParameter("eemail");
		Long p=Long.parseLong(request.getParameter("ephone"));
		String b=request.getParameter("ebod");

		Statement st=null;
		boolean b1=false;
		ResultSet rs=null;
		ResultSet rs1=null;

		try
		{		
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","tollpay_db","tollpay");
			st=con.createStatement();
			rs=st.executeQuery("select *from login");
			if(rs!=null)
			{
				while(rs.next())
				{
					if(d1==Integer.parseInt(rs.getString(1)))
					{
						b1=true;
						eml1=rs.getString(3);
					}
				}
			}
			if(b1)
			{
				rs1=st.executeQuery("select *from user_master");
				if(rs1!=null)
				{
					while(rs1.next())
					{
						if(eml1.equals(rs1.getString(4)))
						{
							System.out.print(n+" "+p+" "+e1+" "+b);
							rs1=st.executeQuery("update login set L_EMAIL='"+e1+"' where L_EMAIL='"+eml1+"' ");
							rs1=st.executeQuery("update user_master set U_NAME='"+n+"', U_MOBILE="+p+", U_EMAIL='"+e1+"', U_BOD=to_date('"+b+"','DD/MM/YYYY') where U_EMAIL='"+eml1+"' ");
							out.println("<script type=\"text/javascript\">");
							out.print("alert('profile update successfully...');");
							out.println("location='profile.jsp';");
						    out.println("</script>");
							
						}
					}
					response.sendRedirect("editprofile.jsp");
				}	
			}
		}					
		catch(Exception e)
		{
			System.out.print(e);
		}
	}
}
