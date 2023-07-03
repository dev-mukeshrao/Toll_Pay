package adminController;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddBthOp
 */
@WebServlet("/AddBthOp")
public class AddBthOp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddBthOp() {
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
		String name = request.getParameter("o_name");
		String em = request.getParameter("eml");
		String address = request.getParameter("add");
		long mob = Long.parseLong(request.getParameter("mob"));
		String gen= request.getParameter("gender");
		String bod = request.getParameter("bod");
		int bthid = Integer.parseInt(request.getParameter("boothName"));
		
		System.out.println("name : "+name+"email : "+em+"address : "+address+"mob : "+mob+"gen : "+gen+"bod : "+bod+"bth id : "+bthid);
		
		CallableStatement cs=null;
		CallableStatement cs1=null;
		try
		{
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","tollpay_db","tollpay");
			
			System.out.println("confi over");
			
			cs=con.prepareCall("{call bth_op_proc_add(?,?,?,?,?,?,?)}");
			
			cs.setString(1,name);
			cs.setLong(2,mob);
			cs.setString(3, em);
			cs.setString(4, gen);
			cs.setString(5, address);
			cs.setString(6, bod);
			cs.setInt(7, bthid);
			
			cs.execute();
			System.out.println("INSERT INTO BOOTH_OPERATOR");
			
			cs1=con.prepareCall("{call login_proc_add(?, ?, ?)}");
			cs1.setString(1, "operator");
			cs1.setString(2,em);
			cs1.setString(3, "operator");
			cs1.execute();
			System.out.println("INSERT INTO login BOOTH_OPERATOR");
			
			response.setContentType("text/javascript");
			PrintWriter out=response.getWriter();
			out.print("<script>alert('Booth Operator Add successfully...');</script>");
			response.sendRedirect("Admin/ViewBthOp.jsp");

			cs.close();
			cs1.close();
			con.close();	
					
		}
		catch (Exception e2) 
		{
			System.out.println(e2);
		}
	
	}

}
