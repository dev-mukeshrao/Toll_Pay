<%@page import="java.sql.*"%>
<%!
               	public String getVhType(int id)
           		{
        	   		String type="";
        	   		
        	   		Connection con = null;
        			Statement stmt1=null;
        	   		ResultSet r=null;
           	   		try
					{
           	   			Class.forName("oracle.jdbc.driver.OracleDriver");
						con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","tollpay_db","tollpay");
						stmt1 = con.createStatement();
						String qry="select vh_type from vehicle_master where vh_id = '"+id+"'";//.toLowerCase()+"'";
						r=stmt1.executeQuery(qry);
						while(r.next())
						{
							type=r.getString(1);
						}
					//	System.out.println(bthid);
					r.close();
					stmt1.close();
					con.close();
					}
          	   		catch(Exception e)
          	   		{e.printStackTrace();}
          	   		
          	   		return type;
          		}
%>

<%!
	public String getJhType(int id)
		{
			String type="";
			
			Connection con = null;
			Statement stmt1=null;
			ResultSet r=null;
	  		try
			{
	  			Class.forName("oracle.jdbc.driver.OracleDriver");
				con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","tollpay_db","tollpay");
				stmt1 = con.createStatement();
				String qry="select jh_type from journey_master where jh_id = '"+id+"'";//.toLowerCase()+"'";
				r=stmt1.executeQuery(qry);
				while(r.next())
				{
					type=r.getString(1);
				}
			//	System.out.println(bthid);
				r.close();
				stmt1.close();
				con.close();
			}
	 		catch(Exception e)
	 		{e.printStackTrace();}
	 		
	 		return type;
		}
%>

<%!
public String getUserName(int id)
{
	System.out.println("in id : "+id);
	String name="";
		
		Connection con = null;
		Statement stmt1=null;
		ResultSet r=null;
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","tollpay_db","tollpay");
			stmt1 = con.createStatement();
			String qry="SELECT u.u_name FROM user_master u JOIN login l ON (u.u_email = l.l_email) WHERE l.l_id="+id;
			r=stmt1.executeQuery(qry);
			while(r.next())
			{
				name=r.getString(1);
			}
			r.close();
			stmt1.close();
			con.close();
		}
		catch(Exception e)
		{e.printStackTrace();}
		System.out.println("in nm : "+name);	
		return name;
}
%>


<%!
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
			r.close();
			stmt1.close();
			con.close();
		}
  		catch(Exception e)
  		{e.printStackTrace();}
  		
  		return bthid;
	}
%>

<%!
public int getRate(int bid,int vid,int jid)
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
				if((getJhType(jid)).equals("single trip"))
				{
					rate=r.getInt(4);
				}
				if((getJhType(jid)).equals("return trip"))
				{
					rate=r.getInt(5);
				}
			}
			r.close();
			stmt1.close();
			con.close();
		}
  		catch(Exception e)
  		{e.printStackTrace();}
  		
		return rate;
}
%>  
								   
								   	
