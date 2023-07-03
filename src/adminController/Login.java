package adminController;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
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
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		System.out.println("email : "+email+"passsword : "+password);
		
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		boolean flag=false;
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","tollpay_db","tollpay");
			st=con.createStatement();
			rs=st.executeQuery("select *from login");
			if(rs!=null)
			{
				while(rs.next())
				{
					if(email.equals(rs.getString(3)) && password.equals(rs.getString(4)))
					{
						if((rs.getString(2)).equalsIgnoreCase("admin"))
						{
							flag=true;
							int id=rs.getInt(1);
							System.out.println(id);
							HttpSession session=request.getSession();
							session.setAttribute("admid", id);
							session.setAttribute("type", "admin");
							out.print("<script>alert('login successfully...');</script>");
							
							response.sendRedirect("Admin/index.jsp");
						}
						if((rs.getString(2)).equalsIgnoreCase("operator"))
						{
							flag=true;
							int id=rs.getInt(1);
							System.out.println(id);
							HttpSession session=request.getSession();
							session.setAttribute("admid", id);
							session.setAttribute("type", "operator");
							out.print("<script>alert('login successfully...');</script>");
							
							response.sendRedirect("Admin/index.jsp");
						}
					}
				}
			}
			if(!flag)
			{
				out.println("<script type=\"text/javascript\">");
				out.print("alert('email and password wrong...');");
				out.println("location='Admin/login.jsp';");
				   out.println("</script>");
			}

			st.close();
			rs.close();
			con.close();	

		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
