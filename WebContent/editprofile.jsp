<%@page import="java.net.URLEncoder"%>
<%
response.setHeader( "Cache-Control", "no-store, no-cache, must-revalidate" );
response.addHeader( "Cache-Control", "post-check=0, pre-check=0" );
response.setHeader( "Pragma", "no-cache" );
%>
<%
	if (session.getAttribute("id")==null)
	{
		   response.sendRedirect("index.jsp?msg="+ URLEncoder.encode("Please Login First"));
	}
	else
	{
%>
<%@page import="java.sql.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="cache-control" content="no-cache">
<%@include file="header.jsp" %>
<script src="maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrapValidator.js"></script>
</head>
<script type="text/javascript">

							$(document).ready(function() {
							 
							$('#editform').bootstrapValidator({
							message: 'This value is not valid',
							fields: {
								ename: {
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
							},
							ephone: {
								message: 'The contact is not valid',
								validators: {
								notEmpty: {
								message: 'Please enter contact no.'
								},
								regexp: {
								regexp: /^[0-9\.]+$/,
								message: 'The contact can only consist of number'
								},
								stringLength: {
								min: 10,
								max: 10,
								message: 'The contact must be 10 characters long'
								}
								}
							},
							eemail: {
								validators: {
								notEmpty: {
								message: 'Please enter email'
								},
								emailAddress: {
								message: 'The input is not a valid email address'
								}
								}
							}
							}
							});
							});
						</script>

<body class="inner-page">
<%@include file="menu.jsp" %>


<!-- START #fh5co-hero -->
			<aside id="fh5co-hero" style="background-image: url(images/hero3.jpg);">
				<div class="container">
					<div class="row">
						<div class="col-md-8 col-md-offset-2">
							<div class="fh5co-hero-wrap">
								<div class="fh5co-hero-intro">
										<h2>Profile<span></span></h2>
								</div>
							</div>
						</div>
					</div>
				</div>
			</aside>

			<div id="fh5co-main"  style="margin-top: 250px !important; padding-top: 0px;">
				
				<section>
					<div class="container">
						
						<div class="row">
							
						<%@include file="connection.jsp" %>
						<%
							int id =(int)session.getAttribute("id");
							String nm="";
							long ph=0;
							String em="";
							String dt="";
							Statement stmt1=null;
							ResultSet r=null;
							try
							{
								Class.forName("oracle.jdbc.driver.OracleDriver");
								con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","tollpay_db","tollpay");
								stmt1 = con.createStatement();
								String qry="SELECT u.u_name,u.u_mobile,u.u_email,TO_CHAR(u.u_bod,'DD/MM/YYYY') FROM user_master u JOIN login l ON (u.u_email = l.l_email) WHERE l.l_id="+id;
								r=stmt1.executeQuery(qry);
								while(r.next())
								{
									nm=r.getString(1);
									ph=r.getLong(2);
									em=r.getString(3);
									dt=r.getString(4);
								}
								r.close();
								stmt1.close();
								con.close();
							}
							catch(Exception e)
							{e.printStackTrace();}
						
						%>
	
						<div class="fh5co-spacer fh5co-spacer-sm"></div>	
							<div class="col-md-12">						
								
								<form id="editform" action="${pageContext.request.contextPath}/ProfileTest" method="post">
								<div class="col-md-8 col-md-offset-2">
										<h1 class="fh5co-uppercase-heading-sm text-center">Edit Profile</h1>
									</div>
									
									<div class="col-md-8 col-md-offset-2">
										<div class="form-group">
											<div class="input-group input-group-lg">
											  <span class="input-group-addon">Name</span>
											<input placeholder="name" name="ename" VALUE="<%=nm %>" type="text" class="form-control input-lg">
											</div>
										</div>	
									</div>
									<div class="col-md-8 col-md-offset-2">
										<div class="form-group">
										<div class="input-group input-group-lg">
											  <span class="input-group-addon">Email</span>
											<input placeholder="email" name="eemail" VALUE="<%=em %>" type="text" class="form-control input-lg">
										</div>
										</div>	
									</div>
									<div class="col-md-4 col-md-offset-2">
										<div class="form-group">
											<div class="input-group input-group-lg">
											  <span class="input-group-addon">Phone</span>
											<input placeholder="mobile no." name="ephone"  VALUE="<%=ph %>" type="text" class="form-control input-lg">									
											</div>
										</div>	
									</div>
									<div class="col-md-4">
										<div class="form-group">
											<div class="input-group input-group-lg">
											  <span class="input-group-addon">Birth Date</span>
											<input type="text" placeholder="birth date" name="ebod" VALUE="<%=dt %>" id="dob" class="form-control input-lg">
										</div>
										</div>	
									</div>
									<div class="col-md-8 col-md-offset-2">
										<div class="form-group ">
											<input type="submit" class="btn btn-primary btn-lg" value="Submit">
										</div>	
									</div>
									
								</form>	
								
								
							</div>
							<div class="fh5co-spacer fh5co-spacer-md"></div>
						</div>
					</div>
				</section>

<%@include file="footer.jsp" %>
</div>
<!-- Include Date Range Picker -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>

<script>
	$(document).ready(function(){
		var date_input=$('input[name="ebod"]'); //our date input has the name "date"
		var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
		date_input.datepicker({
			format: 'dd/mm/yyyy',
			container: container,
			todayHighlight: true,
			autoclose: true,
			endDate: new Date(),
		})
	})
</script>
</body>
</html>
	<%} %>										
											