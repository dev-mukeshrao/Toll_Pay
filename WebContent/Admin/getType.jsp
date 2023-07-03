
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
						con.close();
						stmt1.close();
						r.close();
					//	System.out.println(bthid);
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
				con.close();
				stmt1.close();
				r.close();
			//	System.out.println(bthid);
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
			con.close();
			stmt1.close();
			r.close();
		}
		catch(Exception e)
		{e.printStackTrace();}
		System.out.println("in nm : "+name);
		return name;
}
%>


<%!
public String getBoothUserName(int id)
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
			String qry="SELECT bo.bo_name FROM booth_operator bo JOIN login l ON (bo.bo_email = l.l_email) WHERE l.l_id="+id;
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
   	public String getBoothName(int id)
  	{
   		String bthnm="";
   		
   		Connection con = null;
		Statement stmt1=null;
   		ResultSet r=null;
   		try
		{
        	Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","tollpay_db","tollpay");
			stmt1 = con.createStatement();
			String qry="select bth_name from booth_master where bth_id = "+id;
			r=stmt1.executeQuery(qry);
			while(r.next())
			{
				bthnm=r.getString("bth_name");
			}
			con.close();
			stmt1.close();
			r.close();
//	System.out.println(bthnm);
		}
   		catch(Exception e)
   		{e.printStackTrace();}
 	   		
  		return bthnm;
}
%>            

<%!
 		public int getOpBoothId(int id)
 		{
 			int bid=0;
 			Connection con = null;
			Statement stmt1=null;
			ResultSet r=null;
	 		try
			{	
				Class.forName("oracle.jdbc.driver.OracleDriver");
				con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","tollpay_db","tollpay");
				stmt1 = con.createStatement();
				String qry="SELECT bo.bth_id FROM booth_operator bo JOIN login l ON (bo.bo_email = l.l_email) WHERE l.l_id="+id;
				r=stmt1.executeQuery(qry);
				while(r.next())
				{
					bid=r.getInt(1);
				}
				con.close();
				stmt1.close();
				r.close();
			//	System.out.println(bthid);
			}
			catch(Exception e)
			{e.printStackTrace();}
	 		return bid;
			}
 %>