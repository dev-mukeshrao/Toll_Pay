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
          <div class="col-md-3">
            <div class="card p-0">
              <ul class="nav nav-tabs nav-stacked user-tabs">
               <li class="active"><a href="#user-settings" data-toggle="tab">Change Email</a></li>
                <li><a href="#user-timeline" data-toggle="tab">Change Password</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md-9">
            <div class="tab-content">
              <div class="tab-pane fade" id="user-timeline">
                <div class="timeline">
                 <div class="card user-settings">
                  <h4 class="line-head">Change Password</h4>
                 	<form method="get" action="${pageContext.request.contextPath}/AdminSetting">
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
              </div>
              <div class="tab-pane active" id="user-settings">
                <div class="card user-settings">
                  <h4 class="line-head">Change Email</h4>
                  <form method="get" action="${pageContext.request.contextPath}/AdminSetting">
                    <div class="row mb-20">
                      <div class="col-md-8">
                        <label>Old Email</label>
                        <input class="form-control" name="email" type="oldemail">
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-8 mb-20">
                        <label>Password</label>
                        <input class="form-control" type="password" name="oldpass">
                      </div>
                    <div class="col-md-8 mb-20">
                        <label>New Email</label>
                        <input class="form-control" type="email" name="newem">
                      </div>
                      <div class="col-md-8 mb-20">
                        <label>Confirm Email</label>
                        <input class="form-control" type="email" name="confem">
                      </div>
                     <div class="clearfix"></div>
                      
                    </div>
                    <div class="row mb-10">
                      <div class="col-md-12">
                        <button class="btn btn-primary" name="submit" value="chngem" type="submit"><i class="fa fa-fw fa-lg fa-check-circle"></i>Save Setting</button>
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