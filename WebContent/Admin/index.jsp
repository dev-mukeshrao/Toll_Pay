<%
response.setHeader( "Cache-Control", "no-store, no-cache, must-revalidate" );
response.addHeader( "Cache-Control", "post-check=0, pre-check=0" );
response.setHeader( "Pragma", "no-cache" );
%>
<%
	if (session.getAttribute("admid")==null)
	{
		out.println("<script type=\"text/javascript\">");
		  out.println("alert('Please Login first');");
		out.println("location='login.jsp';");
		   out.println("</script>");
	}
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- CSS-->
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <title>Toll Pay</title>
<script type="text/javascript" src="js/bootbox.min.js"></script>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries-->
    <!--if lt IE 9
    script(src='https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js')
    script(src='https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js')
    -->
    
      	<%@include file="Header.jsp" %>
  </head>
  <body class="sidebar-mini fixed">
    <div class="wrapper">
      <!-- Navbar-->
      <div class="content-wrapper">
      	
      	
      	<%!
      	public int getTotalUser()
   		{
			int cnt = 0;	   		
	   		Connection con = null;
			Statement stmt1=null;
	   		ResultSet r=null;
   	   		try
			{
   	   			Class.forName("oracle.jdbc.driver.OracleDriver");
				con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","tollpay_db","tollpay");
				stmt1 = con.createStatement();
				String qry="select count(*) from user_master";
				r=stmt1.executeQuery(qry);
				r.next();
				cnt=r.getInt(1);
				con.close();
				stmt1.close();
				r.close();
			}
  	   		catch(Exception e)
  	   		{e.printStackTrace();}
  	   		
  	   		return cnt;
  		}
      	%>
      	
      	<%!
      	public int getTotalOp()
   		{
			int cnt = 0;	   		
	   		Connection con = null;
			Statement stmt1=null;
	   		ResultSet r=null;
   	   		try
			{
   	   			Class.forName("oracle.jdbc.driver.OracleDriver");
				con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","tollpay_db","tollpay");
				stmt1 = con.createStatement();
				String qry="select count(*) from booth_operator";
				r=stmt1.executeQuery(qry);
				r.next();
				cnt=r.getInt(1);
				con.close();
				stmt1.close();
				r.close();
			}
  	   		catch(Exception e)
  	   		{e.printStackTrace();}
  	   		
  	   		return cnt;
  		}
      	%>
      	
      	<%!
      	public int getTotalComm()
   		{
			int cnt = 0;	   		
	   		Connection con = null;
			Statement stmt1=null;
	   		ResultSet r=null;
   	   		try
			{
   	   			Class.forName("oracle.jdbc.driver.OracleDriver");
				con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","tollpay_db","tollpay");
				stmt1 = con.createStatement();
				String qry="select count(*) from contact_master";
				r=stmt1.executeQuery(qry);
				r.next();
				cnt=r.getInt(1);
				con.close();
				stmt1.close();
				r.close();
			}
  	   		catch(Exception e)
  	   		{e.printStackTrace();}
  	   		
  	   		return cnt;
  		}
      	%>
      	
      	<%!
      	public int getTotalTransaction()
   		{
			int cnt = 0;	   		
	   		Connection con = null;
			Statement stmt1=null;
	   		ResultSet r=null;
   	   		try
			{
   	   			Class.forName("oracle.jdbc.driver.OracleDriver");
				con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","tollpay_db","tollpay");
				stmt1 = con.createStatement();
				String qry="select count(*) from transaction";
				r=stmt1.executeQuery(qry);
				r.next();
				cnt=r.getInt(1);
				con.close();
				stmt1.close();
				r.close();
			}
  	   		catch(Exception e)
  	   		{e.printStackTrace();}
  	   		
  	   		return cnt;
  		}
      	%>
      	
        <div class="page-title">
          <div>
            <h1><i class="fa fa-dashboard"></i> Dashboard</h1>
            <p>welcome admin</p>
          </div>
          <div>
            <ul class="breadcrumb">
              <li><i class="fa fa-home fa-lg"></i></li>
              <li><a href="#">Dashboard</a></li>
            </ul>
          </div>
        </div>
        <div class="row">
          <div class="col-md-6">
            <div class="widget-small primary"><i class="icon fa fa-users fa-3x"></i>
              <div class="info">
                <h4>Users</h4>
                <p> <b><%=getTotalUser() %></b></p>
              </div>
            </div>
            <div class="widget-small info"><i class="icon fa fa-users fa-3x"></i>
              <div class="info">
                <h4>Operators</h4>
                <p> <b><%=getTotalOp() %></b></p>
              </div>
            </div>
            <div class="widget-small danger"><i class="icon fa fa-comments-o fa-3x"></i>
              <div class="info">
                <h4>Comments</h4>
                <p> <b><%=getTotalComm() %></b></p>
              </div>
            </div>
            <div class="widget-small warning coloured-icon"><i class="icon fa fa-files-o fa-3x"></i>
              <div class="info">
                <h4>Transactions</h4>
                <p> <b><%=getTotalTransaction() %></b></p>
              </div>
            </div>
          </div>
          <div class="col-md-6">
            <div class="card">
              <h3 class="card-title">Getting Started</h3>
              <p style="font-size: 16px;">The TollPay is Website which provides functionalities to the user for paying the Toll Tax Online within there  Source-to-Destination.
				<br>To save the time at toll booths and having cash free operation.</p>
              <p class="mt-40 mb-20"><a class="btn btn-info icon-btn mr-10" href="../index.jsp" target="_blank"><i class="fa fa-github"></i>Visit Website</a></p>
            </div>
          </div>
         
        </div>
        
      </div>
    </div>
    <!-- Javascripts-->
    <script src="js/jquery-2.1.4.min.js"></script>
    <script src="js/essential-plugins.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/plugins/pace.min.js"></script>
    <script src="js/main.js"></script>
    <script type="text/javascript" src="js/plugins/chart.js"></script>
   
  </body>
</html>