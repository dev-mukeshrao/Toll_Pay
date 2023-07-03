<%@page import="java.net.URLEncoder"%>
<%
response.setHeader( "Cache-Control", "no-store, no-cache, must-revalidate" );
response.addHeader( "Cache-Control", "post-check=0, pre-check=0" );
response.setHeader( "Pragma", "no-cache" );
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="header.jsp" %>
</head>
<body class="inner-page" >
<%
	if (session.getAttribute("id")==null)
	{
		/*out.println("<script type=\"text/javascript\">");
		  out.println("setTimeout('', 1000000);bootbox.alert('Please Login first');");
		out.println("location='index.jsp';");
		   out.println("</script>");*/	

		   response.sendRedirect("index.jsp?msg="+ URLEncoder.encode("Please Login First"));
			
	}
	
%>
<%@include file="menu.jsp" %>

<!-- START #fh5co-hero -->
			<aside id="fh5co-hero" style="background-image: url(images/hero3.jpg);">
				<div class="container">
					<div class="row">
						<div class="col-md-8 col-md-offset-2">
							<div class="fh5co-hero-wrap">
								<div class="fh5co-hero-intro">
										<h2>Go Digital,Cash less<span></span></h2>
										<h1>Pay your trip toll tax online with us..</h1>
								</div>
							</div>
						</div>
					</div>
				</div>
			</aside>

			<div id="fh5co-main">
				


				
				<section>
					<div class="container">
						
						<div class="row">

							<div class="fh5co-spacer fh5co-spacer-sm"></div>	
							<div class="col-md-12 well">
								<form action="#" method="post">
								<div class="col-md-8 col-md-offset-2">
										<h1 class="fh5co-uppercase-heading-sm text-center">Payment</h1>
									</div>
									<div class="col-md-8 col-md-offset-2">
										<div class="form-group">
											<label for="vh_no" class="sr-only">Vehicle No.</label>
											<input placeholder="Vehicle number.. ex gj27bc2768" id="vh_no" type="text" class="form-control input-lg">
										</div>	
									</div>
									<div class="col-md-4 col-md-offset-2">
										<div class="form-group">
											<label for="vh_type" class="sr-only">Vehicle type</label>
											<select class="form-control input-lg" id="vh_type">
												<option>Car/Jeep</option>
												<option>Bus</option>
												<option>Truck</option>
											</select>
										</div>	
									</div>
									<div class="col-md-4">
										<div class="form-group">
											<label for="Journey" class="sr-only">Journey Type</label>
											<select class="form-control input-lg" id="jo_type">
												<option>Single</option>
												<option>Return</option>
											</select>
										</div>	
									</div>
									<div class="col-md-8 col-md-offset-2">
										<div class="form-group">
											<label for="Rate" class="sr-only">Rate</label>
											<input type="text" readonly placeholder="Rate" id="rate" name="rate" class="form-control input-lg">
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
</body>
</html>