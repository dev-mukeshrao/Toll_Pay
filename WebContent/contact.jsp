
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="header.jsp" %>
<script src="maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrapValidator.js"></script>
</head>
<script>
			$(document).ready(function()
			{				 
				$('#contactform').bootstrapValidator({
							message: 'This value is not valid',
							fields: {
							nm: {
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
							
							email: {
								validators: {
								notEmpty: {
								message: 'Please enter email'
								},
								emailAddress: {
								message: 'The input is not a valid email address'
								}
								}
							},
							msg:{
								validators: {
								notEmpty: {
								message: 'Plaese enter message'
								}
								}
							}
							}
							});
							});
						</script>			

<body class="inner-page">
<%@include file="menu.jsp" %>
<%=session.getAttribute("id") %>

<!-- START #fh5co-hero -->
			<aside id="fh5co-hero" style="background-image: url(images/hero3.jpg);">
				<div class="container">
					<div class="row">
						<div class="col-md-8 col-md-offset-2">
							<div class="fh5co-hero-wrap">
								<div class="fh5co-hero-intro">
										<h2>Get Started<span></span></h2>
										<h1>Contact Us Now</h1>
								</div>
							</div>
						</div>
					</div>
				</div<%
					
	%>>
			</aside>

			<div id="fh5co-main">
				<section>
					<div class="container">
						
						<div class="row">

							<div class="fh5co-spacer fh5co-spacer-sm"></div>	
							<div class=""></div>
							<div class="col-md-8">
								<div class="col-md-12"><span id="msg"></span></div>
								<form action="${pageContext.request.contextPath}/ContactTest"  method="POST" id="contactform">
									<div class="col-md-12">
										<div class="form-group">
											<label for="name" class="sr-only">Name</label>
											<input placeholder="Name" id="name" name="nm" type="text" class="form-control input-lg">
										</div>	
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<label for="email" class="sr-only">Email</label>
											<input placeholder="Email" id="email" name="email" type="text" class="form-control input-lg">
										</div>	
									</div>
									
									<div class="col-md-12">
										<div class="form-group">
											<label for="message" class="sr-only">Message</label>
											<textarea placeholder="Message" id="msg" name="msg" class="form-control input-lg" rows="3"></textarea>
										</div>	
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<input type="submit" class="btn btn-primary btn-lg " name="submit" value="Send">
											
										</div>	
									</div>
									
									<input type="hidden" value="contactFlag" name="contactFlag">
									
								</form>	
								
							</div>
							<div class="col-md-4">
								<h3>Need Help?</h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Non, harum autem quaerat vitae cupiditate, aspernatur est fugit, commodi optio itaque voluptatum! Beatae quae delectus deserunt est ab in sequi blanditiis!</p>
								<p>
									<a href="#">tollpay@info.com</a>
								</p>
							</div>

							<div class="fh5co-spacer fh5co-spacer-md"></div>	

						</div>
						
					</div>
				</section>
			
<%@include file="footer.jsp" %>
</div>
</body>
</html>