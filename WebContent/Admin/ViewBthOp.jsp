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
            <h1><i class="fa fa-edit"></i> View Booth Operator</h1>
          </div>
          <div>
            <ul class="breadcrumb">
              <li><i class="fa fa-home fa-lg"></i></li>
              <li>Booth Operator</li>
              <li><a href="ViewBthOp.jsp"> View Booth Operator</a></li>
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
		                      <th>Operator Name</th>
		                      <th>Mobile</th>
		                      <th>Email</th>
		                      <th>Gender</th>
		                      <th>Address</th>
		                      <th>Birth Date</th>
		                      <th>Booth Name</th>
		                      <th><i class="fa fa-trash"></i>&nbsp;DELETE</th>
		                    </tr>
		                  </thead>
		                  <tbody>
		                   <%@include file="Connection.jsp"%>
		                  	                   
		                   <%
								ResultSet rs=null;
								try
								{
									String qry="select bo_id,bo_name,bo_mobile,bo_email,bo_gender,bo_address,TO_CHAR(bo_bod,'DD/MM/YYYY'),bth_id from booth_operator";
									rs=stmt.executeQuery(qry);
									
									int cnt=1;
									while(rs.next())
									{
										//System.out.println("id : "+rs.getInt(1)+"name : "+rs.getString(2));
									%>
										<tr>
					                      <td><%=cnt++ %></td>
					                      <td><%=rs.getString(2) %></td>
					                      <td><%=rs.getLong(3) %></td>
					                      <td><%=rs.getString(4) %></td>
					                      <td><%=rs.getString(5) %></td>
					                      <td><%=rs.getString(6) %></td>
					                      <td><%=rs.getString(7) %></td>
					                      <td><%=getBoothName(rs.getInt(8)) %></td>
					                      <td align="center"><a class="btn btn-warning" href="${pageContext.request.contextPath}/DelBthOp?id=<%=rs.getInt(1)%>&flag=del"><i class="fa fa-trash"></i>Delete</a></td>
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