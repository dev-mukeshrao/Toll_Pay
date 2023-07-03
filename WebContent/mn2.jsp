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
	
%>

<!-- START #fh5co-header -->
			<header id="fh5co-header-section" role="header" class="" >
				<div class="container">
					
					<!-- START #fh5co-logo -->
					<h1 id="fh5co-logo" class="pull-left"><a href="index.html">TollPay</a></h1>
					
					<!-- START #fh5co-menu-wrap -->
					<nav id="fh5co-menu-wrap" role="navigation">
						<ul class="sf-menu" id="fh5co-primary-menu">
							<li class="active">
								<a href="index.jsp">Home</a>
							</li>
							 <li>
								<a href="findRoute.jsp">TollTax</a>
							</li>
									
							<li><a href="transaction.jsp">Transaction</a></li>
							<li><a href="Rcontact.jsp">Contact</a></li>
							<%@include file="getType.jsp" %>
							<li class="dropdown responsive"><a class="fh5co-sub-ddown" href="#"><%=getUserName((int)session.getAttribute("id")) %></a>
				                <ul class="fh5co-sub-menu">
				                  <li><a href="#" data-toggle="modal" data-target="#myChange"> <span class="glyphicon glyphicon-cog"></span>&nbsp;CHANGE PASSWORD</a></li>
				                
				                  <li><a href="profile.jsp" style="margin-top:5px;margin-bottom:5px;"> <span class="glyphicon glyphicon-user"></span>&nbsp;PROFILE</a></li>
				                  
				                  <li><a href="Logout.jsp"><span class="glyphicon glyphicon-log-out"></span>&nbsp;LOGOUT</a></li>
				                </ul>
				              </li>
						</ul>
					</nav>

				</div>
			</header>
			<!--modal-->
	<!-- Button trigger modal -->
				

<!-- Modal -->
  <div class="modal fade" id="myChange" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Change passward</h4>
        </div>
        <div class="modal-body">
        <!--login form-->
					<div class="fh5co-spacer fh5co-spacer-sm"></div>
						
						
						<script>
							$(function(){
								  var onClass = "on";
								  var showClass = "show";
								  
								  $("#neml").bind("checkval",function(){
									var label = $(this).prev("label");
									if(this.value !== ""){
									  label.addClass(showClass);
									} else {
									  label.removeClass(showClass);
									}
								  }).on("keyup",function(){
									$(this).trigger("checkval");
								  }).on("focus",function(){
									$(this).prev("label").addClass(onClass);
								  }).on("blur",function(){
									  $(this).prev("label").removeClass(onClass);
								  }).trigger("checkval");
								  
								  $("#opwd").bind("checkval",function(){
										var label = $(this).prev("label");
										if(this.value !== ""){
										  label.addClass(showClass);
										} else {
										  label.removeClass(showClass);
										}
									  }).on("keyup",function(){
										$(this).trigger("checkval");
									  }).on("focus",function(){
										$(this).prev("label").addClass(onClass);
									  }).on("blur",function(){
										  $(this).prev("label").removeClass(onClass);
									  }).trigger("checkval");
								  
								  $("#npwd").bind("checkval",function(){
										var label = $(this).prev("label");
										if(this.value !== ""){
										  label.addClass(showClass);
										} else {
										  label.removeClass(showClass);
										}
									  }).on("keyup",function(){
										$(this).trigger("checkval");
									  }).on("focus",function(){
										$(this).prev("label").addClass(onClass);
									  }).on("blur",function(){
										  $(this).prev("label").removeClass(onClass);
									  }).trigger("checkval");
								  
								  $("#ncpwd").bind("checkval",function(){
										var label = $(this).prev("label");
										if(this.value !== ""){
										  label.addClass(showClass);
										} else {
										  label.removeClass(showClass);
										}
									  }).on("keyup",function(){
										$(this).trigger("checkval");
									  }).on("focus",function(){
										$(this).prev("label").addClass(onClass);
									  }).on("blur",function(){
										  $(this).prev("label").removeClass(onClass);
									  }).trigger("checkval");
							});
							
							$(document).ready(function() {	 
								$('#Changepassform').bootstrapValidator({
								message: 'This value is not valid',
								fields: {
									neml: {
										validators: {
											notEmpty: {
												message: 'The email address is required and cannot be empty'
											},
											emailAddress: {
												message: 'The email address is not valid'
											}
										}
									},
								opwd: {
									validators: {
									notEmpty: {
									message: 'Please enter password'
									}
									}
									},
									npwd: {
										validators: {
										notEmpty: {
										message: 'Please enter password'
										},
										stringLength: {
										min: 8,
										max: 16,
										message: 'The passward must be more than 8 and less than 16 characters long'
										}
										}
									},
									ncpwd: {
										validators: {
										notEmpty: {
										message: 'Please enter confirm password'
										},
										stringLength: {
										min: 8,
										max: 16,
										message: 'The passward must be more than 8 and less than 16 characters long'
										},
										identical: {
										field: 'npwd',
										message: 'The new password and its confirm are not the same'
										}
										}
									}
								}
								});
								});
						</script>
						<style>
							#field--wrapper {
							  position:relative;
							  margin-bottom:20px;
							}
							label {
							  position:absolute;
							  top:10px;
							  left:0;
							  font-size:18px;
							  color:#aaa;
							  transition: all 0.1s linear;
							  opacity:0;
							}
							label.on {
							  color:#4481C4;
							}
							label.show {
							  top:10px;
							  opacity:10;
							  margin-left:125px;
							}

							body {
							  padding:0px;
							  -webkit-backface-visibility: hidden;
							}
							input[id="neml"]{
								border: 0;
								border-bottom: 1px solid;
								outline: 0;
							}
							input[id="opwd"]{
								border: 0;
								border-bottom: 1px solid;
								outline: 0;
							}
							input[id="npwd"]{
								border: 0;
								border-bottom: 1px solid;
								outline: 0;
							}
							input[id="ncpwd"]{
								border: 0;
								border-bottom: 1px solid;
								outline: 0;
							}
						</style>
						
				
						
						<form action="${pageContext.request.contextPath}/ChangepassTest" id="Changepassform" method="post">
							<div class="col-md-8 col-md-offset-2">
								<div class="form-group" id="field--wrapper">
									<label class="col-lg-3 control-label">email</label>
									<input placeholder="username" id="neml" name="neml" type="text" class="form-control input-lg">
								</div>
							</div>
							<div class="col-md-8 col-md-offset-2">
								<div class="form-group" id="field--wrapper">
									<label class="col-lg-3 control-label">old password</label>
									<input placeholder="old password" id="opwd" name="opwd" type="password" class="form-control input-lg">
								</div>	
							</div>
							<div class="col-md-8 col-md-offset-2">
								<div class="form-group" id="field--wrapper">
									<label class="col-lg-3 control-label">new password</label>
									<input placeholder="new password" id="npwd" name="npwd" type="password" class="form-control input-lg">
								</div>	
							</div>
							<div class="col-md-8 col-md-offset-2">
								<div class="form-group" id="field--wrapper">
									<label class="col-lg-3 control-label">confirm password</label>
									<input placeholder="confirm password" id="ncpwd" name="ncpwd" type="password" class="form-control input-lg">
								</div>	
							</div>							
							<div class="col-md-offset-2">
								<div class="form-group">
									<input type="submit" class="btn btn-outline" value="Submit">
								</div>	
							</div>
						</form>
					<!--login form ends-->
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button></br>
        </div>
      </div>
      
    </div>
  </div>
  <!-- End Modal -->
