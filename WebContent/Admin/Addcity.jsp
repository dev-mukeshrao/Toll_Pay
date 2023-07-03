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
			$(document).ready(function()
			{				 
					$('#cityform').bootstrapValidator({
							message: 'This value is not valid',
							fields: {
								c_name: {
								message: 'The city name is not valid',
								validators: {
								notEmpty: {
								message: 'Please enter city name'
								},
								regexp: {
								regexp: /^[a-zA-Z0-9_\.]+$/,
								message: 'The city name can only consist of alphabetical, number, dot and underscore'
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
            <h1><i class="fa fa-edit"></i> Add City</h1>
            <p></p>
          </div>
          <div>
            <ul class="breadcrumb">
              <li><i class="fa fa-home fa-lg"></i></li>
              <li>City</li>
              <li><a href="Addcity.jsp">Add City</a></li>
            </ul>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12">
            <div class="card">
              
              <div class="card-body">
                <form id="cityform" method="post" action="#">
                  <div class="form-group">
                    <label class="control-label">City Name</label>
                    <input class="form-control" type="text" name="c_name" maxlength="20" placeholder="Enter city name">
                  </div>
                  <div class="form-group">
                          <label class="control-label" for="select">state</label>
                          <div class="">
                            <select class="form-control" id="select">
                              <option>1</option>
                              <option>2</option>
                              <option>3</option>
                              <option>4</option>
                              <option>5</option>
                            </select>
						</div>	
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