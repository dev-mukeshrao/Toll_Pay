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
    <link rel="stylesheet" type="text/css" href="css/myCss.css">
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
            <h1><i class="fa fa-edit"></i>Vehicle Wise report</h1>
          </div>
          <div>
            <ul class="breadcrumb">
              <li><i class="fa fa-home fa-lg"></i></li>
              <li>Report</li>
              <li><a href="Report_VhWise.jsp">Vehicle Wise report</a></li>
            </ul>
          </div>
        </div>
      		
        <div class="row">
          <div class="col-md-12">
            <div class="card">
              
              <div class="card-body">
              
         <script>
 		 $(document).ready(function() {	 
			$('#login2').bootstrapValidator({
				message: 'This value is not valid',
				fields: {
					b_username: {
					message: 'The username is not valid',
					validators: {
					notEmpty: {
					message: 'Please enter username'
					},
					regexp: {
					regexp: /^[a-zA-Z0-9_\.]+$/,
					message: 'The username can only consist of alphabetical, number, dot and underscore'
					}
					}
				}
				}
				});
				});
  
		</script>     
         
              
                <form action="Report_VhWise.jsp" id="login2" method="POST">
                  <div class="form-group">
                    <label class="control-label">Select Vehicle Type</label>
					<%@include file="Connection.jsp"%>
		                   
		                    <select id = "vhType" name="vhType"  class="form-control" required>
			                   <%
									ResultSet rs1=null;
									try
									{
										String qry="select * from vehicle_master";
										rs1=stmt.executeQuery(qry);
										
										int cnt=1;
										while(rs1.next())
										{
											System.out.println("id : "+rs1.getInt(1)+"name : "+rs1.getString(2));
										%>
						                      <option value="<%=rs1.getInt(1) %>" ><%=rs1.getString(2)%></option>
										<%
										}
										rs1.close();
									}
									catch(Exception e)
									{System.out.print(e);}
								%>
							</select>
                  </div>
                  <div class="card-footer">
                  <button class="btn btn-primary icon-btn" type="submit" ><i class="fa fa-fw fa-lg fa-check-circle"></i>Generate</button>&nbsp;&nbsp;&nbsp;
              </div>                
                </form>
              </div>
              
            </div>
          </div>
          <div class="clearix"></div>
          
        </div>
        
  <%
  	if((request.getParameter("vhType"))!=null)
  	{
  %>
        <div class="row">
          <div class="col-md-12">
          <div class="bs-component">
         	 <div class="panel panel-primary">
            	<div class="panel-heading">
              		<h3 class="panel-title">Vehicle wise report of <%=getVhType(Integer.parseInt(request.getParameter("vhType")))%> type</h3>
            	</div>
            	
            	<div class="panel-body">
            	
		            <div class="card">
		              <div class="card-body">
		              <div class="table-responsive">
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
			                       <th>BoothName</th>
			                    </tr>
			                  </thead>
			                  <tbody>
		                   <%
		                   		
		                   		int id=Integer.parseInt((request.getParameter("vhType")));
								ResultSet rs=null;
								try
								{
									String qry="select t_id,u_id,vh_no,vh_id,jh_id,TO_CHAR(doj,'DD/MM/YYYY'),t_pay,bth_nm from transaction where vh_id="+id;
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
					                      <td><%=rs.getString(8)%></td>
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
          </div>
          </div>
        
      </div>
      
      <%} %>
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