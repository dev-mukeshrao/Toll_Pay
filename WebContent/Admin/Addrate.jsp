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
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- CSS-->
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <title>TollPay</title>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries-->
    <!--if lt IE 9
    script(src='https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js')
    script(src='https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js')
    -->
    
    <script src="ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
	<script src="../js/bootstrapValidator.js"></script>
		
  </head>
  <script>
 		 $(document).ready(function() {
		 
		$('#rate').bootstrapValidator({
		message: 'This value is not valid',
		fields: {
		s_rate: {
			message: 'The rate is not valid',
			validators: {
			notEmpty: {
			message: 'Please enter rate'
			},
			regexp: {
			regexp: /^[0-9\.]+$/,
			message: 'The rate can only consist of number'
			},
			stringLength: {
			min: 2,
			max: 3,
			message: 'The rate must be 2 to 3 characters long'
			}
			}
		},
		r_rate: {
			message: 'The rate is not valid',
			validators: {
			notEmpty: {
			message: 'Please enter rate'
			},
			regexp: {
			regexp: /^[0-9\.]+$/,
			message: 'The rate can only consist of number'
			},
			stringLength: {
			min: 2,
			max: 3,
			message: 'The rate must be 2 to 3 characters long'
			}
			}
		}
		
		}
		});
		});
  </script>
  
  <body class="sidebar-mini fixed">
    <div class="wrapper">
      <!-- Navbar-->
      
 		<%@include file="Header.jsp" %>

      <div class="content-wrapper">
        <div class="page-title">
          <div>
            <h1><i class="fa fa-edit"></i> Add Rate</h1>
            <p>Rate according the vehicle type & its journey type</p>
          </div>
          <div>
            <ul class="breadcrumb">
              <li><i class="fa fa-home fa-lg"></i></li>
              <li>Rate</li>
              <li><a href="Addrate.jsp">Add Rate</a></li>
            </ul>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12">
            <div class="card">
              
              <div class="card-body">
                <form  action="${pageContext.request.contextPath}/Addrateofveh" id="rate" method="post">
					<div class="form-group">
                          <label class="control-label" for="select">Booth Name</label>
                          <div class="">
                           
                            <%@include file="Connection.jsp"%>
		                   
		                    <select class="form-control" id="boothName" name="boothName">
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
							</select>
						</div>	
					</div>
					<div class="form-group">
                          <label class="control-label" for="select">Vehicle Type</label>
                          <div class="">
                            
		                    <select class="form-control" id="vehType" name="vehType">
			                   <%
									ResultSet rs1=null;
									try
									{
										String qry="select * from vehicle_master";
										rs1=stmt.executeQuery(qry);
										
										int cnt=1;
										while(rs1.next())
										{
											//System.out.println("id : "+rs1.getInt(1)+"name : "+rs1.getString(2));
										%>
						                      <option value="<%=rs1.getInt(1) %>" ><%=rs1.getString(2)%></option>
										<%
										}
										rs.close();
										stmt.close();
										con.close();
									}
									catch(Exception e)
									{System.out.print(e);}
								%>
							</select>
						</div>	
					</div>
					<div class="form-group">
						<label class="control-label">Single Rate</label>
						<input class="form-control" type="text" name="s_rate" maxlength="3" placeholder="single journey rate">
					</div>
					<div class="form-group">
						<label class="control-label">Return Rate</label>
						<input class="form-control" type="text" name="r_rate" maxlength="3" placeholder="return journey rate">
					</div>
                  
              		<div class="card-footer">
                		<button class="btn btn-primary icon-btn" type="submit"><i class="fa fa-fw fa-lg fa-check-circle"></i>Save</button>&nbsp;&nbsp;&nbsp;<a class="btn btn-default icon-btn" href="#"><i class="fa fa-fw fa-lg fa-times-circle"></i>Clear</a>
              		</div>    
                  
                </form>
              </div>
              
            </div>
          </div>
          <div class="clearix"></div>
          
        </div>
      </div>
    </div>
    <!-- Javascripts
    <script src="js/jquery-2.1.4.min.js"></script>-->
    <script src="js/essential-plugins.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/plugins/pace.min.js"></script>
    <script src="js/main.js"></script>
  </body>
</html>