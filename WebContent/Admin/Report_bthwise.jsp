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
            <h1><i class="fa fa-edit"></i>Booth Wise report</h1>
          </div>
          <div>
            <ul class="breadcrumb">
              <li><i class="fa fa-home fa-lg"></i></li>
              <li>Report</li>
              <li><a href="Report_bthwise.jsp">Booth Wise report</a></li>
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
         
              
                <form action="Report_bthwise.jsp" id="login2" method="POST">
                  <div class="form-group">
                    <label class="control-label">Select Booth Name</label>
					<%@include file="Connection.jsp"%>
		                   
		                    <select class="form-control" id="boothName" name="boothName">
			                    <optgroup label="Select Cities">
			                   <%
									ResultSet rs=null;
									try
									{
										String qry="select * from booth_master";
										rs=stmt.executeQuery(qry);
										
										int cnt=1;
										while(rs.next())
										{
											//System.out.println("id : "+rs.getInt(1)+"name : "+rs.getString(2));
										%>
						                      <option value="<%=rs.getInt(1) %>" ><%=rs.getString(2)%></option>
										<%
										}
										rs.close();
									}
									catch(Exception e)
									{System.out.print(e);}
								%>
								</optgroup>
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
  	if((request.getParameter("boothName"))!=null)
  	{
  %>
        <div class="row">
          <div class="col-md-12">
          <div class="bs-component">
         	 <div class="panel panel-primary">
            	<div class="panel-heading">
              		<h3 class="panel-title">Booth wise report of <%=getBoothName(Integer.parseInt(request.getParameter("boothName")))%> plaza</h3>
            	</div>
            	
            	<div class="panel-body">
            	
		            <div class="card">
		              <div class="card-body">
		              <div class="table-responsive">
		                <table id="sampleTable" class="table table-striped table-bordered">
			                  <thead>
			                    <tr>
			                      <th>Sr.No</th>
			                      <th>BoothName</th>
			                      <th>Name</th>
			                      <th>Vehicle No.</th>
			                      <th>Vehicle Type</th>
			                      <th>Journey Type</th>
			                      <th>Date Of Journey</th>
			                      <th>Total Cost</th>
			                    </tr>
			                  </thead>
			                  <tbody>
		                   <%
		                   		
		                   		int bid=Integer.parseInt((request.getParameter("boothName")));
								rs=null;
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
					                      <td><%=getBoothName(Integer.parseInt(request.getParameter("boothName"))) %></td>
					                      <td><%=getUserName(rs.getInt(2))%></td>
					                      <td><%=rs.getString(3)%></td>
					                      <td><%=getVhType(rs.getInt(4))%></td>
					                      <td><%=getJhType(rs.getInt(5))%></td>
					                      <td><%=rs.getString(6)%></td>
					                      <td><%=rs.getInt(7)%></td>
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