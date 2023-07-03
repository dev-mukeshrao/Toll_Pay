package demo;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
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

import org.hibernate.classic.Session;

/**
 * Servlet implementation class Payment
 */
@WebServlet("/Payment")
public class Payment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Payment() {
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
		HttpSession s=request.getSession();
		int uid=(int) s.getAttribute("id");
		
		String vhno = request.getParameter("vhno");
		int vhid = Integer.parseInt(request.getParameter("vhid"));
		int jh_id = Integer.parseInt(request.getParameter("jhid"));;
		String doj = request.getParameter("doj");
		String ntoll=request.getParameter("ntoll");
		double pay= Double.parseDouble(request.getParameter("pay"));
		String dtime=request.getParameter("dtime");
		String start=request.getParameter("start");
		String end=request.getParameter("end");
		
		System.out.print("in paymeny.java uid : "+uid+"vh no: "+vhno+"vhid : "+vhid+"jh_id: "+jh_id+"doj: "+doj+"rate : "+pay+"ntol : "+ntoll+"dtime : "+dtime+"start : "+start+"end : "+end); 
		
		CallableStatement cs=null;
		try
		{
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","tollpay_db","tollpay");
			
			// insert into transaction table for single entry of whole payment
			cs=con.prepareCall("{call transaction_proc_add(?,?,?,?,?,?,?,?,?,?)}");
			cs.setInt(1, uid);
			cs.setString(2, vhno);
			cs.setInt(3, vhid);
			cs.setInt(4, jh_id);
			cs.setString(5,doj);
			cs.setDouble(6, pay);
			cs.setString(7, ntoll);
			cs.setString(8, start);
			cs.setString(9, end);
			cs.setString(10, dtime);
			cs.execute();
			
			System.out.println("transaction completed");
			
			int tranid=0;
			Statement st = con.createStatement();
			st.executeQuery("SELECT seq_transaction.CURRVAL FROM dual");
			ResultSet r = st.getResultSet();
			while(r.next())
			{
				tranid=r.getInt(1);
			}
			System.out.println("trans id : "+tranid);
			// insert into booth_payment table for individual payment entry of booth
			String[] bth=ntoll.split(",");
			
			String jtype = getJourneyType(jh_id);
			
			for(int i=0; i<bth.length; i++ )
			{
				System.out.println("bth : "+i+" nm : "+bth[i]);
				 //p_id,u_id,vh_no,vh_id,jh_id,doj,pay,bth_id,flag
				int bid = getBoothId(bth[i]);
				int rate = getRate(bid, vhid, jtype);
				
				System.out.println("entry : "+i+" bid : "+bid+" vhid : "+vhid+" jtyp : "+jtype+" rate : "+rate);
				
				cs=null;
				cs=con.prepareCall("{call bth_pay_proc_add(?,?,?,?,?,?,?,?)}");
				cs.setInt(1, uid);
				cs.setInt(2, tranid);
				cs.setString(3, vhno);
				cs.setInt(4, vhid);
				cs.setInt(5, jh_id);
				cs.setString(6,doj);
				cs.setInt(7, rate);
				cs.setInt(8, bid);
				
				cs.execute();
				
				System.out.println("div pay suc");
			}
			response.sendRedirect("transaction.jsp");

			cs.close();
			con.close();	
					
		}
		catch (Exception e2) 
		{
			System.out.println(e2);
		}
		
		
	}
	
	public int getBoothId(String nm)
	{
 		int bthid=0;
 		
 		Connection con = null;
		Statement stmt1=null;
 		ResultSet r=null;
 		try
		{
   			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","tollpay_db","tollpay");
			stmt1 = con.createStatement();
			String qry="select bth_id from booth_master where bth_name = '"+nm+"'";//.toLowerCase()+"'";
			r=stmt1.executeQuery(qry);
			while(r.next())
			{
				bthid=r.getInt("bth_id");
			}
			System.out.println(bthid);
			con.close();
			stmt1.close();
			r.close();
		}
  		catch(Exception e)
  		{e.printStackTrace();}
  		
  		return bthid;
	}
	
	public String getJourneyType(int jid)
	{
		String jtype="";
		Connection con = null;
		Statement stmt1=null;
 		ResultSet r=null;
 		try
		{
   			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","tollpay_db","tollpay");
			stmt1 = con.createStatement();
			String qry="select jh_type from journey_master where jh_id = '"+jid+"'";//.toLowerCase()+"'";
			r=stmt1.executeQuery(qry);
			while(r.next())
			{
				jtype=r.getString("jh_type");
			}
			System.out.println(jtype);
			con.close();
			stmt1.close();
			r.close();
		}
  		catch(Exception e)
  		{e.printStackTrace();}
  	
		return jtype;
	}
	
	public int getRate(int bid,int vid,String jtype)
	{
			int rate=0;
			Connection con = null;
			Statement stmt1=null;
	 		ResultSet r=null;
	 		try
			{
	   			Class.forName("oracle.jdbc.driver.OracleDriver");
				con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","tollpay_db","tollpay");
				stmt1 = con.createStatement();
				String qry="select * from rate where bth_id="+bid+"and vh_id="+vid;
				r=stmt1.executeQuery(qry);
				while(r.next())
				{
					if(jtype.equalsIgnoreCase("single trip"))
					{
						rate=r.getInt(4);
					}
					if(jtype.equalsIgnoreCase("return trip"))
					{
						rate=r.getInt(5);
					}
				}
				con.close();
				stmt1.close();
				r.close();
			}
	  		catch(Exception e)
	  		{e.printStackTrace();}
	  		
			return rate;
	}

}
