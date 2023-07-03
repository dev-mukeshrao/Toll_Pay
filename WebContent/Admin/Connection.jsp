<%@page import="java.sql.*"%>
<% 	
			Connection con = null;
			Statement stmt=null;
			try
			{
					Class.forName("oracle.jdbc.driver.OracleDriver");
					con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","tollpay_db","tollpay");
					stmt = con.createStatement();
			}
			catch(ClassNotFoundException e)
			{
				System.out.print("class was not found");
			}
			catch(SQLException e)
			{
				System.out.print("error in query");
			}
			catch(Exception e)
			{
				System.out.println("Any other error");
			}
%>