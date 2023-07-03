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
		 
		$('#operator').bootstrapValidator({
		message: 'This value is not valid',
		fields: {
		o_name: {
			message: 'The username is not valid',
			validators: {
			notEmpty: {
			message: 'Please enter username'
			},
			regexp: {
			regexp: /^[a-zA-Z ]+$/,
			message: 'The username can only consist of alphabetical, number, dot and underscore'
			}
			}
		},
		mob: {
			message: 'The contact is not valid',
			validators: {
			notEmpty: {
			message: 'Please enter contact no.'
			},
			regexp: {
			regexp: /^[789]\d{9}$/,
			message: 'The contact can only consist of number'
			},
			stringLength: {
			min: 10,
			max: 10,
			message: 'The contact must be 10 characters long'
			}
			}
		},
		gender: {
			message: 'is not valid',
			validators: {
			notEmpty: {
			message: 'Please select gender ..!'
			}
			}
		},
		eml: {
			validators: {
			notEmpty: {
			message: 'Please enter email'
			},
			emailAddress: {
			message: 'The input is not a valid email address'
			}
			}
		},
		add: {
			validators: {
			notEmpty: {
			message: 'Please enter address'
			},
			stringLength: {
			min: 10,
			max: 255,
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
            <h1><i class="fa fa-edit"></i> Add Booth Operator</h1>
            <p>new employee who assigned as booth operation work</p>
          </div>
          <div>
            <ul class="breadcrumb">
              <li><i class="fa fa-home fa-lg"></i></li>
              <li>Booth Operator</li>
              <li><a href="Addboothop.jsp">Add Booth Operator</a></li>
            </ul>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12">
            <div class="card">
              
              <div class="card-body">
                <form id="operator" method="POST" action="${pageContext.request.contextPath}/AddBthOp">
                  <div class="form-group">
                    <label class="control-label">Name</label>
                    <input class="form-control" type="text" name="o_name" maxlength="30" placeholder="Enter full name">
                  </div>
                  <div class="form-group">
                    <label class="control-label">Email</label>
                    <input class="form-control" type="email" name="eml" maxlength="30" placeholder="Enter email address">
                  </div>
                  <div class="form-group">
                    <label class="control-label">Address</label>
                    <textarea class="form-control" rows="5" name="add" placeholder="Enter your address"></textarea>
                  </div>
				  <div class="form-group">
                    <label class="control-label">Mobile</label>
                    <input class="form-control" type="number" name="mob" maxlength="10" placeholder="Mobile no...">
                  </div>
                  <div class="form-group">
                    <label class="control-label">Gender</label>
                    <div class="radio">
                      <label>
                        <input type="radio" name="gender" value="M">Male
                      </label>
                    &nbsp;&nbsp;
                      <label>
                        <input type="radio" name="gender" value="F">Female
                      </label>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="control-label">Birth Date</label>
                    <input class="form-control" type="text" name="bod" id="bod" placeholder="Select Birth of date">
                  </div>
				  <div class="form-group">
                          <label class="control-label" for="select">Booth Name</label>
                          <div class="">
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
										stmt.close();
										con.close();
									}
									catch(Exception e)
									{System.out.print(e);}
								%>
								</optgroup>
							</select>
									
						</div>	
					</div>
                 	<div class="card-footer">
						<button class="btn btn-primary icon-btn" type="submit"><i class="fa fa-fw fa-lg fa-check-circle"></i>Register</button>&nbsp;&nbsp;&nbsp;<a class="btn btn-default icon-btn" href="#"><i class="fa fa-fw fa-lg fa-times-circle"></i>Clear</a>
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
    <script type="text/javascript" src="js/plugins/bootstrap-datepicker.min.js"></script>
    <script type="text/javascript" src="js/plugins/select2.min.js"></script>
    <script type="text/javascript" src="js/plugins/bootstrap-datepicker.min.js"></script>
    
     <script type="text/javascript">
   	 
	    var dt = new Date();
	    dt.setFullYear(new Date().getFullYear()-18);
	    
	    $('#bod').datepicker({
	      	format: "dd/mm/yyyy",
	      	autoclose: true,
	      	todayHighlight: true,
	      	viewMode: "years",
	        endDate : dt
	      });
	   	 
	      $('#boothName').select2();
    </script>
  </body>
</html>