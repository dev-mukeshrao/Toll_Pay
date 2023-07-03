<script src="maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrapValidator.js"></script>
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
<script>
			$(document).ready(function()
			{				 
				$('#FindRoute').bootstrapValidator({
							message: 'This value is not valid',
							fields: {
							start: {
								message: 'The start city name is not valid',
								validators: {
								notEmpty: {
								message: 'Please enter start city name'
								},
								regexp: {
								regexp: /^[a-zA-Z]+$/,
								message: 'The start city name can only consist of alphabetical'
								}
								}
							},
							
							end: {
								message: 'The end city name is not valid',
								validators: {
								notEmpty: {
								message: 'Please enter end city name'
								},
								regexp: {
								regexp: /^[a-zA-Z]+$/,
								message: 'The end city name can only consist of alphabetical'
								}
								}
							}
							}
							});
							});
						</script>			

<body class="inner-page" onLoad="initialize()">
<%@include file="menu.jsp" %>

<aside id="fh5co-hero" style="background-image: url(images/hero3.jpg);">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="fh5co-hero-wrap">
					<div class="fh5co-hero-intro">
							<h2>Edit Route Details<span></span></h2>
							<br>
				<form action="#" method="post" id="FindRoute">
					<div class="col-md-2">
						<div class="form-group">
							<label for="start" class="">Source</label>
							<div id="divloading1" style="display: block;">
								<img alt="Loading...Please Wait.." src="images/loading.gif"/>
							</div>
							<input class="form-control input-lg" id="start" type="text" size="15" name="start" value="" placeholder="Starting From" required>
						</div>	
					</div>
					<div class="col-md-2">
						<div class="form-group">
							<label for="destination">Destination</label>
							<div id="divloading2" style="display: block;">
								<img alt="Loading...Please Wait.." src="images/loading.gif"/>
							</div>
							<input class="form-control input-lg" id="end" type="text" size="15" name="end" value="" placeholder="Going To" required>
						</div>	
					</div>
					<div class="col-md-2">
						<div class="form-group">
							<label for="via">via</label>
							<input type="text" class="form-control input-lg" id="via" name="via" placeholder="Via city(Optional)" value="">						</div>	
					</div>
					<div class="col-md-2">
						<div class="form-group">
							<label for="tripType">tripType</label>
							<%@include file="connection.jsp"%>
							<select id = "tripType" name="tripType"  class="form-control input-lg" required>
			                   <%
									ResultSet rs1=null;
									try
									{
										String qry="select * from journey_master";
										rs1=stmt.executeQuery(qry);
										
										int cnt=1;
										while(rs1.next())
										{
											System.out.println("id : "+rs1.getInt(1)+"name : "+rs1.getString(2));
										%>
						                      <option value="<%=rs1.getInt(1) %>" ><%=rs1.getString(2)%></option>
										<%
										}
										rs1.close();
										
									}
									catch(Exception e)
									{System.out.print(e);}
								%>
							</select>
						</div>	
					</div>
					<div class="col-md-2">
						<div class="form-group">
							<label for="vehicleMode">vehicleMode</label>
							<select id = "vehicleMode" name="vehicleMode"  class="form-control input-lg" required>
			                   <%
									rs1=null;
									try
									{
										String qry="select * from vehicle_master";
										rs1=stmt.executeQuery(qry);
										
										int cnt=1;
										while(rs1.next())
										{
											System.out.println("id : "+rs1.getInt(1)+"name : "+rs1.getString(2));
										%>
						                      <option value="<%=rs1.getInt(1) %>" ><%=rs1.getString(2)%></option>
										<%
										}
										rs1.close();
										stmt.close();
										con.close();
									}
									catch(Exception e)
									{System.out.print(e);}
								%>
							</select>
						</div>	
					</div>
					<div class="col-md-2">
						<div class="form-group">
						<label for="edit" class="sr-only">Edit</label><br>
							<input type="button" class="btn btn-primary btn-lg" value="Search"  onClick="initialize();" >

						</div>	
					</div>
					
					
					<input type="hidden" value="contactFlag" name="contactFlag">
				</form>	
					
							
					</div>
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
				<h4 class="panel-title">
					<form name="frm">
						
						<input type="hidden" name="dis">  
					</form>
					<a data-toggle="collapse"  data-parent="#accordion" href="#collapse3" style="text-decoration:none;font-size:20px;color:#2299B5">
					Route Details </a>
			  	</h4>				
			</div>
			
			</div>
			
		<div class="container">
			<div class="row">	
				<div class="col-md-8">
					<div id="divloading3" style="display: block;">
						<img alt="Loading...Please Wait.." src="images/loading.gif"/>
					</div>
					<div class="mapDiv" >
						  <div id="map_canvas" style="width:100%;height:500px;"></div>
					</div>
				</div>
				
				<div id="displayTollCharges" class="col-md-4">
				
				</div>
			</div>
			</div>
				<div class="fh5co-spacer fh5co-spacer-md"></div>	

		</div>
			
		</div>
	</section>
			
</div>

			
			
<%@include file="footer.jsp" %>
</div>
</body>
</html>