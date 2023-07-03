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
            <h1><i class="fa fa-edit"></i> Add Booth</h1>
            <p>Add the booth which are newly established</p>
          </div>
          <div>
            <ul class="breadcrumb">
              <li><i class="fa fa-home fa-lg"></i></li>
              <li>Booth</li>
              <li><a href="Addbooth.jsp">Add Booth</a></li>
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
         
              
                <form action="${pageContext.request.contextPath}/AddBth" id="login2" method="POST">
                  <div class="form-group">
                    <label class="control-label">Booth Name</label>
                    <input class="form-control" type="text" name="b_username" maxlength="30" value="<%=getBoothName(Integer.parseInt(request.getParameter("id"))) %>"  placeholder="Enter booth name">
                  </div>
                  <div class="card-footer">
                  <input type="hidden" name="id" value="<%=request.getParameter("id")%>">
                  <input type="hidden" name="flag" value="up"> 
                  <button class="btn btn-primary icon-btn" type="submit" ><i class="fa fa-fw fa-lg fa-check-circle"></i>Update</button>&nbsp;&nbsp;&nbsp;
                  <button class="btn btn-default icon-btn" type="reset"><i class="fa fa-fw fa-lg fa-times-circle"></i>Clear</button>
              </div>                
                </form>
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