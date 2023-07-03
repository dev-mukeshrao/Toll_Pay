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
<!DOCTYPE html>

<html>
  <head>
    <!-- CSS-->
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <title>TollPay</title>
    
  	 <script src="ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
		<script src="../js/bootstrapValidator.js"></script>
		
  </head>
  
  <body class="sidebar-mini fixed">
  
    <div class="wrapper">
      <!-- Navbar-->
      
       	<%@include file="Header.jsp" %>
       	
      <div class="content-wrapper">
        <div class="page-title">
          <div>
            <h1><i class="fa fa-edit"></i> View Rate</h1>
            <p>View rate of vehicle on base of plaza/booth</p>
          </div>
          <div>
            <ul class="breadcrumb">
              <li><i class="fa fa-home fa-lg"></i></li>
              <li>Rate</li>
              <li><a href="ViewRate.jsp">View Rate</a></li>
            </ul>
          </div>
        </div>
      		
        <div class="row">
          <div class="col-md-12">
            <div class="card">
              
              <div class="card-body">
              
        		
		                <table class="table table-hover table-bordered" id="sampleTable">
		                  <thead>
		                    <tr>
		                      <th>Sr.No</th>
		                      <th>Booth Name</th>
		                      <th>Vehicle Type</th>
		                      <th>Single Journey Rate</th>
		                      <th>Return Journey Rate</th>
		                      <th><i class="fa fa-edit"></i>&nbsp;EDIT</th>
		                      <th><i class="fa fa-trash"></i>&nbsp;DELETE</th>
		                    </tr>
		                  </thead>
		                  <tbody>
		                   <%@include file="Connection.jsp"%>
		                   <%!
		                   public String getVehicleType(int id)
	                   		{
	                	   		String vtype="";
	                	   		
	                	   		Connection con = null;
	                			Statement stmt1=null;
	                	   		ResultSet r=null;
	                	   		try
								{
	                	   			Class.forName("oracle.jdbc.driver.OracleDriver");
									con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","tollpay_db","tollpay");
									stmt1 = con.createStatement();
									String qry="select vh_type from vehicle_master where vh_id = "+id;
									r=stmt1.executeQuery(qry);
									while(r.next())
									{
										vtype=r.getString("vh_type");
									}
									System.out.println(vtype);
									r.close();
									stmt1.close();
									con.close();
								}
	                	   		catch(Exception e)
	                	   		{e.printStackTrace();}
	                	   		
	                	   		return vtype;
	                   		}
		                   %>
		                   		                   
		                   <%
								ResultSet rs=null;
								try
								{
									String qry="select * from rate";
									rs=stmt.executeQuery(qry);
									
									int cnt=1;
									while(rs.next())
									{
										//System.out.println("id : "+rs.getInt(1)+"name : "+rs.getString(2));
									%>
										<tr>
					                      <td><%=cnt++ %></td>
					                      <td><%=getBoothName(rs.getInt(2)) %></td>
					                      <td><%=getVehicleType(rs.getInt(3)) %></td>
					                      <td><%=rs.getInt(4) %></td>
					                      <td><%=rs.getInt(5) %></td>
					                      <td align="center"><a class="btn btn-info" href="#"><i class="fa fa-edit"></i>Edit</a></td>
					                      <td align="center"><a class="btn btn-warning" href="${pageContext.request.contextPath}/Addrateofveh?id=<%=rs.getInt(1)%>&flag=del"><i class="fa fa-trash"></i>Delete</a></td>
					                    </tr>
									<%
									}
									rs.close();
									stmt.close();
									con.close();
								}
								catch(Exception e)
								{System.out.print(e);}
							%>
		                  </tbody>
		                </table>
		              </div>
		            </div>
		       
              
                
              </div>
              
            </div>
          </div>
          <div class="clearix"></div>
          
        </div>
        
       
    </div>
    <!-- Javascripts 
    <script src="js/jquery-2.1.4.min.js"></script>-->
    <script src="js/essential-plugins.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/plugins/pace.min.js"></script>
    <script src="js/main.js"></script>
    
    <script type="text/javascript" src="js/plugins/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="js/plugins/dataTables.bootstrap.min.js"></script>
    <script type="text/javascript">$('#sampleTable').DataTable();</script>
   
   
  </body>
</html>