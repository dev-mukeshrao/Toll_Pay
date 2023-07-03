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
            <h1><i class="fa fa-edit"></i>Transaction of Payment</h1>
          </div>
          <div>
            <ul class="breadcrumb">
              <li><i class="fa fa-home fa-lg"></i></li>
              <li><a href="#">Transaction</a></li>
            </ul>
          </div>
        </div>
      		
        <div class="row">
          <div class="col-md-12">
            <div class="card">
              
              <div class="card-body">
              
        			<table id="sampleTable" class="table table-striped table-bordered">
			                  <thead>
			                    <tr>
			                      <th>Sr.No</th>
			                      <th>Name</th>
			                      <th>Vehicle No.</th>
			                      <th>Vehicle Type</th>
			                      <th>Journey Type</th>
			                      <th>Date Of Journey</th>
			                      <th>Total Cost</th>
			                      <th>List of TollBooth</th>
			                    </tr>
			                  </thead>
			                  	                  <tbody>
		                   <%@include file="Connection.jsp"%>
		                   
		                   <%
								ResultSet rs=null;
								try
								{
									String qry="select t_id,u_id,vh_no,vh_id,jh_id,TO_CHAR(doj,'DD/MM/YYYY'),t_pay,bth_nm from transaction";
									rs=stmt.executeQuery(qry);
									
									int cnt=1;
									while(rs.next())
									{
									%>
										<tr>
					                      <td><%=cnt++ %></td>
					                       <%System.out.println("id : "+rs.getInt(2)); %>
					                      <td><%=getUserName(rs.getInt(2))%></td>
					                      <td><%=rs.getString(3)%></td>
					                      <td><%=getVhType(rs.getInt(4))%></td>
					                      <td><%=getJhType(rs.getInt(5))%></td>
					                      <td><%=rs.getString(6)%></td>
					                      <td><%=rs.getInt(7)%></td>
					                      <td><%=rs.getString(8)%></td>
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