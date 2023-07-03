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
	else
	{
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
			                      <th>Accept Payment</th>
			                    </tr>
			                  </thead>
			                  	                  <tbody>
		                   <%@include file="Connection.jsp"%>
		                   
		                   
		                   <%
		                   		int id=(int)session.getAttribute("admid");
		                   		int bid=getOpBoothId(id);
								ResultSet rs=null;
								try
								{
									String qry="select p_id,u_id,vh_no,vh_id,jh_id,TO_CHAR(doj,'DD/MM/YYYY'),pay,bth_id,flag from booth_payment where bth_id="+bid;
									rs=stmt.executeQuery(qry);
									
									int cnt=1;
									while(rs.next())
									{
									%>
										<tr>
					                      <td><%=cnt++ %></td>
					                      <td><%=getUserName(rs.getInt(2))%></td>
					                      <td><%=rs.getString(3)%></td>
					                      <td><%=getVhType(rs.getInt(4))%></td>
					                      <td><%=getJhType(rs.getInt(5))%></td>
					                      <td><%=rs.getString(6)%></td>
					                      <td><%=rs.getInt(7)%></td>
					                      <%if(rs.getInt(9)==0)
					                      	{
					                      %>
					                      <td><a class="btn btn-primary icon-btn" href="${pageContext.request.contextPath}/UpdateOpPayment?id=<%=rs.getInt(1)%>&flag=up"><i class="fa fa-fw fa-lg fa-check-circle"></i>Accept</a></td>
					                    	<%
					                      	}
					                    	else
					                    	{
					                    	%>
					                    	<td><button class="btn btn-default icon-btn" type="button" disabled><i class="fa fa-fw fa-lg fa-times-circle"></i>Accepted</button></td>
					                    	<%
					                    	}
					                    	%>	
					                    </tr>
									<%
									}
									con.close();
									stmt.close();
									rs.close();
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

<%}%>