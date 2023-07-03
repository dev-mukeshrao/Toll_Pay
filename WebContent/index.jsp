<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="header.jsp" %>
</head>
<body class="inner-page">
<% 
	if(request.getParameter("msg")!=null)
	{
		out.println("<script type=\"text/javascript\">");
		  out.println("bootbox.alert('"+request.getParameter("msg")+"');");
		  out.println("</script>");
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
										<h2>Go Safe,Go Green<span></span></h2>
										<h1>With Online TollPay</h1>
								</div>
							</div>
						</div>
					</div>
				</div>
			</aside>

			<div id="fh5co-main">

				<div class="container">
					<div class="row">
						<div class="col-md-8 col-md-offset-2 text-center fh5co-lead-wrap">
							<h2 class="fh5co-serif fh5co-lead">The <a href="#">TollPay</a>
								will allow user to pay the toll tax online and one can do the whole payment at once .
							</h2>
							<div class="fh5co-spacer fh5co-spacer-sm"></div>
							<p><a href="#" class="btn btn-outline btn-lg">Read More</a></p>
						</div>
					</div>
				</div>

				
					
				<section id="fh5co-feature">
					<div class="container">
						<!-- FEATURE -->
						<div class="row fh5co-feature-2">
							
							<h2 class="fh5co-uppercase-heading-sm text-center">Theme Features</h2>
							<div class="fh5co-spacer fh5co-spacer-md"></div>
							

							<div class="col-md-3 col-sm-6 fh5co-feature-item">
								<span class="fh5co-feature-icon fh5co-circle"><i class="ti-gift"></i></span>
								<h3 class="text-center fh5co-feature-title h4 text-uppercase">Free HTML5 Template</h3>
								<p class="text-center fh5co-feature-description">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fugiat aliquid placeat nobis veritatis neque earum possimus tempora sunt. </p>
								<p class="text-center"><a href="#" class="btn btn-primary btn-sm">Read more</a></p>
							</div>
							<div class="col-md-3 col-sm-6 fh5co-feature-item">
								<span class="fh5co-feature-icon fh5co-circle"><i class="ti-mobile"></i></span>
								<h3 class="text-center fh5co-feature-title h4 text-uppercase">Mobile First</h3>
								<p class="text-center fh5co-feature-description">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fugiat aliquid placeat nobis veritatis neque earum possimus tempora sunt.</p>
								<p class="text-center"><a href="#" class="btn btn-primary btn-sm">Read more</a></p>
							</div>
							
							<div class="clearfix visible-sm-block"></div>

							<div class="col-md-3 col-sm-6 fh5co-feature-item">
								<span class="fh5co-feature-icon fh5co-circle"><i class="ti-pie-chart"></i></span>
								<h3 class="text-center fh5co-feature-title h4 text-uppercase">Analytics</h3>
								<p class="text-center fh5co-feature-description">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fugiat aliquid placeat nobis veritatis neque earum possimus tempora sunt.</p>
								<p class="text-center"><a href="#" class="btn btn-primary btn-sm">Read more</a></p>
							</div>
							<div class="col-md-3 col-sm-6 fh5co-feature-item">
								<span class="fh5co-feature-icon fh5co-circle"><i class="ti-wallet"></i></span>
								<h3 class="text-center fh5co-feature-title h4 text-uppercase">Increase Income</h3>
								<p class="text-center fh5co-feature-description">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fugiat aliquid placeat nobis veritatis neque earum possimus tempora sunt.</p>
								<p class="text-center"><a href="#" class="btn btn-primary btn-sm">Read more</a></p>
							</div>
							
							<!-- <div class="fh5co-spacer fh5co-spacer-md"></div> -->

						</div>
					</div>
				</section>
				
				<div class="fh5co-spacer fh5co-spacer-lg"></div>


				<section id="fh5co-feature-slider">
					<div class="container">
						<div class="row">
							

							<div class="col-md-12">
								

								<div class="owl-carousel-fullwidth owl-carousel-2">
									<div class="item">
										<!-- <div class="container"> -->
											<div class="row">
												<div class="col-md-9 col-md-offset-1 col-sm-9 col-sm-offset-1">
													<div class="row">
														<div class="col-md-6 col-sm-6 col-xs-6 col-xxs-12 fh5co-item-slide-img"> 
															<img src="images/macbook_1.png" alt="Images" class="img-responsive">
														</div>
														<div class="col-md-6 col-sm-6 col-xs-6 col-xxs-12 fh5co-item-slide-text">
															<h2>Saepe dolore natus corrupti <span class="fh5co-border"></span></h2>
															<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Saepe dolore natus, corrupti. Error nulla, quia nemo porro hic explicabo aliquid labore cumque in, nesciunt alias suscipit accusamus laborum ad tempora tempore</p>
														</div>
													</div>
												</div>
											</div>
										<!-- </div> -->
									</div>
									<!-- END .item -->

									<div class="item">
										<div class="row">
											<div class="col-md-9 col-md-offset-1 col-sm-9 col-sm-offset-1">
												<div class="row">
													<div class="col-md-6 col-sm-6 col-xs-6 col-xxs-12 fh5co-item-slide-img"> 
														<img src="images/macbook_1.png" alt="Images" class="img-responsive">
													</div>
													<div class="col-md-6 col-sm-6 col-xs-6 col-xxs-12 fh5co-item-slide-text">
														<h2>Saepe dolore natus corrupti<span class="fh5co-border"></span></h2>
														<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Saepe dolore natus, corrupti. Error nulla, quia nemo porro hic explicabo aliquid labore cumque in, nesciunt alias suscipit accusamus laborum ad tempora tempore.</p>
													</div>
												</div>
											</div>
										</div>
									</div>
									<!-- END .item -->
								</div>
							
							</div>


						</div>
					</div>
				</section>
				
				<div class="fh5co-spacer fh5co-spacer-xlg"></div>

				<section id="fh5co-testimonial">
					<div class="container">
						<div class="row">
							<div class="col-md-12 text-center">
								<h2 class="fh5co-uppercase-heading-sm">Testimony</h2>
								<div class="owl-carousel-fullwidth fh5co-light-arrow owl-carousel-2">
									<div class="item">
										<blockquote>
											<p class="fh5co-serif">&ldquo;Design is not just what it looks like and feels like. Design is how it works.&rdquo;</p>
											<p class="fh5co-testimonial-author"><cite>&mdash; Steve Jobs</cite></p>
										</blockquote>
									</div>
									<!-- END .item -->
									<div class="item">
									
										<blockquote>
											<p class="fh5co-serif">&ldquo;Design is not just what it looks like and feels like. Design is how it works.&rdquo;</p>
											<p class="fh5co-testimonial-author"><cite>&mdash; Steve Jobs</cite></p>
										</blockquote>
									</div>
									<!-- END .item -->
								</div>
							</div>
						</div>
					</div>
				</section>
				
				<%@include file="footer.jsp" %>
		
			</div>
</body>
</html>