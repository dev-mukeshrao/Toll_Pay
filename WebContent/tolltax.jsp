<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="header.jsp" %>
 <script type="text/javascript" 
		  src="https://maps.googleapis.com/maps/api/js?v=3.20&amp;key=AIzaSyCS1_Ng_VD2_Gz8tSfCCUSks8koY5Lm9kk&amp;libraries=places,geometry">
		  </script>

<script typr="text/javascript" src="js/myMap.js"></script>		

</head>
<body class="inner-page" onLoad="initialize()">
<%@include file="menu.jsp" %>
<!-- START #fh5co-hero -->
			<aside id="fh5co-hero" style="background-image: url(images/hero3.jpg);">
				<div class="container">
					<div class="row">
						<div class="col-md-8 col-md-offset-2">
							<div class="fh5co-hero-wrap">
								<div class="fh5co-hero-intro">
										<h2>Dont know how many Toll Booths are there<span></span></h2>
										<h1>Find it Here....</h1>
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
								<form action="findRoute.jsp" method="post">
								<div class="col-md-8 col-md-offset-2">
										<h1 class="fh5co-uppercase-heading-sm text-center">Route</h1>
									</div>
									<div class="col-md-8 col-md-offset-2">
										<div class="form-group">
											<label for="source">Source</label>
											<div id="divloading1" style="display:block;">
												<img alt="Loading...Please Wait.." src="images/loading.gif"/>
											</div>
											<input class="form-control input-lg" id="start" name="start" type="text" size="15" value="" placeholder="Starting From" required>
										</div>	
									</div>
									<div class="col-md-8 col-md-offset-2">
										<div class="form-group">
											<label for="destination">Destination</label>
											<div id="divloading2" style="display: block;">
													<img alt="Loading...Please Wait.." src="images/loading.gif"/>
											</div>
											<input class="form-control input-lg" id="end" name="end" type="text" size="15" value="" placeholder="Going To" required>
										</div>	
									</div>
									
									<div class="col-md-8 col-md-offset-2">
										<div class="form-group">
											<label for="via">via</label>
											<input type="text" class="form-control input-lg" id="via" name="via" placeholder="Type city Name(Optional)" value="">
										</div>	
									</div>
									
									<div class="col-md-8 col-md-offset-2">
										<div class="form-group">
											<label for="tripType">tripType</label>
											<select id= "tripType" name="tripType" class="form-control input-lg">
												<option value="single" selected >Single Trip</option>
												<option value="return">Round Trip(24hrs)</option>
											</select>
										</div>	
									</div>
									
									<div class="col-md-8 col-md-offset-2">
										<div class="form-group">
											<label for="vehicleMode">vehicleMode</label>
											<select id = "vehicleMode" name="vehicleMode"  class="form-control input-lg" required>
											  <option value="car">Car/Jeep/Van</option>
											  <option value="lcv">LCV</option>
											  <option value="bus">Bus/Truck</option>
											  <option value="3axle">upto 3 Axle Vehicle</option>
											  <option value="4axle">4 to 6 Axle</option>
											  <option value="7axle">7 or more Axle</option>
											  <option value="hcm">HCM/EME</option>
											</select>
										</div>	
									</div>
									<div class="col-md-8 col-md-offset-2">
										<div class="form-group ">
											<input type="submit" class="btn btn-primary btn-lg" value="Search"  onClick="calcRoute()" >

										</div>	
									</div>
									
									
								</form>	
								<div class="col-md-8 col-md-offset-2"><p id="errorText" style="color:red;" ></p> </div>
							</div>
							
							<div class="fh5co-spacer fh5co-spacer-md"></div>	

						</div>
						
					</div>
				</section>
				
				
				<section>
					<div class="container">
						
						<div class="row">

							<div class="fh5co-spacer fh5co-spacer-sm"></div>
							<div class="mapDiv" >
							  <div id="map_canvas" style="width:100%;height:400px;display:none; "></div>
							</div>
						  </div>
					 </div> 
				  </div>
			</section>
	
<%@include file="footer.jsp" %>
</div>
</body>

</html>