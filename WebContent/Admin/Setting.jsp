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
        <div class="row user">
          <div class="col-md-12">
            <div class="profile">
              <div class="info"><img class="user-img" src="https://s3.amazonaws.com/uifaces/faces/twitter/jsa/128.jpg">
                <h4><%=getBoothUserName((int)session.getAttribute("admid")) %></h4>
                 <p>Booth Operator</p>
             	 <p>(<%=getBoothName(getOpBoothId((int)session.getAttribute("admid"))) %> Plaza)</p>
            
              </div>
              <div class="cover-image"></div>
            </div>
          </div>
			<%@include file="Connection.jsp" %>
          <%
          String nm="",em="",dob="",add="",gen="";
          long ph = 0;
          int id=(int)session.getAttribute("admid");
          ResultSet rs=null;
          try
			{		
				Class.forName("oracle.jdbc.driver.OracleDriver");
				con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","tollpay_db","tollpay");
				stmt = con.createStatement();
				String qry="SELECT bo.bo_name,bo.bo_mobile,bo.bo_email,bo.bo_gender,bo.bo_address,TO_CHAR(bo.bo_bod,'DD/MM/YYYY') FROM booth_operator bo JOIN login l ON (bo.bo_email = l.l_email) WHERE l.l_id="+id;
				rs=stmt.executeQuery(qry);
				while(rs.next())
				{
					nm=rs.getString(1);
					ph=rs.getLong(2);
					em=rs.getString(3);
					gen=rs.getString(4);
					add=rs.getString(5);
					dob=rs.getString(6);
				}
				rs.close();
				stmt.close();
				con.close();

			}					
			catch(Exception e)
			{
				out.println(e);
			}
          %>
          <div class="col-md-3">
            <div class="card p-0">
              <ul class="nav nav-tabs nav-stacked user-tabs">
               <li class="active"><a href="#user-settings" data-toggle="tab">Settings</a></li>
                <li><a href="#user-timeline" data-toggle="tab">Change Password</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md-9">
            <div class="tab-content">
              <div class="tab-pane fade" id="user-timeline">
                <div class="timeline">
                 	<form method="get" action="${pageContext.request.contextPath}/ChangeProfile">
                    <div class="row mb-20">
                      <div class="col-md-8">
                        <label>Email</label>
                        <input class="form-control" name="email" type="email">
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-8 mb-20">
                        <label>Old Password</label>
                        <input class="form-control" type="password" name="oldpass">
                      </div>
                    <div class="col-md-8 mb-20">
                        <label>New Password</label>
                        <input class="form-control" type="password" name="newpass">
                      </div>
                      <div class="col-md-8 mb-20">
                        <label>Confirm Password</label>
                        <input class="form-control" type="password" name="confpass">
                      </div>
                     <div class="clearfix"></div>
                     
                    </div>
                    <div class="row mb-10">
                      <div class="col-md-12">
                        <button class="btn btn-primary" name="submit" value="changPass" type="submit"><i class="fa fa-fw fa-lg fa-check-circle"></i>Save Setting</button>
                      </div>
                    </div>
                  </form>
                 	
                </div>
              </div>
              <div class="tab-pane active" id="user-settings">
                <div class="card user-settings">
                  <h4 class="line-head">Settings</h4>
                  <form method="get" action="${pageContext.request.contextPath}/ChangeProfile">
                    <div class="row mb-20">
                      <div class="col-md-8">
                        <label>Name</label>
                        <input class="form-control" name="name" type="text" value="<%=nm%>">
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-8 mb-20">
                        <label>Email</label>
                        <input class="form-control" type="email" name="email" value="<%=em%>">
                      </div>
                      <div class="clearfix"></div>
                      <div class="col-md-8 mb-20">
                        <label>Mobile No</label>
                        <input class="form-control" type="text" name="mobile" value="<%=ph%>">
                      </div>
                      <div class="clearfix"></div>
                      <div class="col-md-8 mb-20">
                        <label>Gender</label><br>
                        <%
                        	if(gen.endsWith("M"))
                        	{
                        	%>
	 						<input type="radio" name="gender" class="" id="gender" value="M" checked><span class="label-text">Male</span>
	                        <input type="radio" name="gender" class="" id="gender" value="F"><span class="label-text">Female</span>
                        	<% 
                        	}
                        	else
                        	{
                        	%>
                        	 <input type="radio" name="gender" class="" id="gender" value="M"><span class="label-text">Male</span>
		                      <input type="radio" name="gender" checked class="" id="gender" value="F"><span class="label-text">Female</span>
                        	<%	
                        	}
                        %>
                        </div>
                      <div class="clearfix"></div>
                      <div class="col-md-8 mb-20">
                        <label>Address</label>
                     <textarea class="form-control" rows="5" cols="3" name="add" placeholder="Enter your address"><%=add %></textarea>
                      </div>
                      <div class="clearfix"></div>
                      <div class="col-md-8 mb-20">
                        <label>Birth Date</label><br>
                        <input type="text" name="bod" id="bod" class="form-control" value="<%=dob%>"  value="M">
                      </div>
                    </div>
                    <div class="row mb-10">
                      <div class="col-md-12">
                        <button class="btn btn-primary" name="submit" value="update" type="submit"><i class="fa fa-fw fa-lg fa-check-circle"></i>Save Setting</button>
                      </div>
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
        <div class="clearix"></div>
          
        </div>
        
       
    </div>
    <!-- Javascripts -->
    <script src="js/jquery-2.1.4.min.js"></script>
    <script src="js/essential-plugins.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/plugins/pace.min.js"></script>
    <script src="js/main.js"></script>
   
      <script type="text/javascript" src="js/plugins/bootstrap-datepicker.min.js"></script>
    <script type="text/javascript" src="js/plugins/bootstrap-datepicker.min.js"></script>
    
    <script type="text/javascript">
   	 $('#bod').datepicker({
      	format: "dd/mm/yyyy",
      	autoclose: true,
      	todayHighlight: true
      });
   
    </script>
   
  </body>
</html>

<%}%>