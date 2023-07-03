<script src="maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrapValidator.js"></script>
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
						
							<li><a href="contact.jsp">Contact</a></li>
							
							<li><a href="#" data-toggle="modal" data-target="#myModal">Login<span class="glyphicon glyphicon-log-in"></span></a></li>
						</ul>
					</nav>

				</div>
			</header>
			<!--modal-->
	<!-- Button trigger modal -->

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
				<input type="button" class="close" data-dismiss="modal" aria-label="Close" value="X"/>
				<br>
			</div>
			
            <div class="modal-body">
				<div role="tabpanel">
                    <!-- Nav tabs -->
                    <ul class="nav nav-tabs" role="tablist">
                        <li role="presentation" class="active"><a href="#loginTab" aria-controls="loginTab" role="tab" data-toggle="tab">Login</a></li>
                        <li role="presentation"><a href="#signupTab" aria-controls="signupTab" role="tab" data-toggle="tab">Sign Up</a></li>
                    </ul>
				</div>
				
				<!-- Tab panes -->
				<div class="tab-content"  style="overflow-y: auto;min-height: 50%;height: 353px;overflow-x: hidden;">
					<div role="tabpanel" class="tab-pane active" id="loginTab">
					<!--login form-->
					<div class="fh5co-spacer fh5co-spacer-sm"></div>
					<script>
							$(function(){
								  var onClass = "on";
								  var showClass = "show";
								  
								  $("#eml").bind("checkval",function(){
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
								  
								  $("#pwd").bind("checkval",function(){
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
								$('#loginform').bootstrapValidator({
								message: 'This value is not valid',
								fields: {
									eml: {
										validators: {
											notEmpty: {
												message: 'The email address is required and cannot be empty'
											},
											emailAddress: {
												message: 'The email address is not valid'
											}
										}
									},
								pwd: {
									validators: {
									notEmpty: {
									message: 'Please enter password'
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
							input[id="eml"]{
								border: 0;
								border-bottom: 1px solid;
								outline: 0;
							}
							input[id="pwd"]{
								border: 0;
								border-bottom: 1px solid;
								outline: 0;
							}
						</style>
					
						<form action="${pageContext.request.contextPath}/LoginTest" method="post" id="loginform">
							<div class="col-md-8 col-md-offset-2">
								<div class="form-group" id="field--wrapper">
									<label class="col-lg-3 control-label">email</label>
									<input placeholder="User Name" id="eml" name="eml" type="text" class="form-control input-lg">
								</div>
							</div>
							<div class="col-md-8 col-md-offset-2">
								<div class="form-group" id="field--wrapper">
									<label class="col-lg-3 control-label">password</label>
									<input placeholder="Password" id="pwd" name="pwd" type="password" class="form-control input-lg">
								</div>	
							</div>
							
							<div class="col-md-offset-2">
								<div class="form-group">
									<input type="submit" class="btn btn-outline" value="Login">
									<a href=""></a>
									<a href="#" data-toggle="modal" data-target="#myChange" style="margin-left:85px;" data-dismiss="modal">Forgot password..!</a>
														
								</div>	
							</div>
						</form>
					<!--login form ends-->
					</div>
					
					<div role="tabpanel" class="tab-pane" id="signupTab">
					<!--Sign usignup-->
					<script type="text/javascript">

							$(document).ready(function() {
							 
							$('#signform').bootstrapValidator({
							message: 'This value is not valid',
							fields: {
							nm: {
								message: 'The username is not valid',
								validators: {
								notEmpty: {
								message: 'Please enter username'
								},
								regexp: {
								regexp: /^[a-zA-Z ]+$/,
								message: 'The username can only consist of alphabetical'
								}
								}
							},
							dob: {
								message: 'The contact is not valid',
								validators: {
								notEmpty: {
								message: 'Please select date of birth.'
								}
								}
							},
							con: {
								message: 'The contact is not valid',
								validators: {
								notEmpty: {
								message: 'Please enter contact no.'
								},
								regexp: {
								regexp: /^[789]\d{9}$/,
								message: 'The contact can only consist of number'
								},
								stringLength: {
								min: 10,
								max: 10,
								message: 'The contact must be 10 characters long'
								}
								}
							},
							eml: {
								validators: {
								notEmpty: {
								message: 'Please enter email'
								},
								emailAddress: {
								message: 'The input is not a valid email address'
								},
								identical: {
									field: 'eml',
									message: 'The email and its confirm are not the same'
									}
								}
							},
							ceml:{
								validators: {
								notEmpty: {
								message: 'Plaese enter confirm email'
								},
								emailAddress: {
								message: 'The input is not a valid email address'
								},
								identical: {
								field: 'eml',
								message: 'The email and its confirm are not the same'
								}
								}
							},
							pass: {
								validators: {
								notEmpty: {
								message: 'Please enter password'
								},
								stringLength: {
								min: 8,
								max: 16,
								message: 'The passward must be more than 8 and less than 16 characters long'
								},
								regexp: {
									regexp: /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*]).{8,16}$/,
									message: 'password must be alphanumeric capital alpabet & special characters '
								}
								}
							},
							cpass: {
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
								field: 'pass',
								message: 'The password and its confirm are not the same'
								}
								}
							}
							}
							});
							});
						</script>
					
					<form action="${pageContext.request.contextPath}/SignTest" method="post" id="signform">
									
						

						<div class="fh5co-spacer fh5co-spacer-sm"></div>
						
						<div class="col-md-8 col-md-offset-2">
							<div class="form-group">
								<span for="name" class="">Name</span>
								<input  placeholder="Name" id="name" name="nm" type="text" class="form-control input-lg" data-toggle="popover" data-trigger="focus" data-content="Enter Name :">
							</div>	
						</div>
						
						<div class="col-md-8 col-md-offset-2">
							<div class="form-group">
								<span for="email" class="">Email</span>
								<input placeholder="Email" id="email" name="eml" type="text" class="form-control input-lg" data-toggle="popover" data-trigger="focus" data-content="Enter E-mail :">
							</div>	
						</div>				
						
						<div class="col-md-8 col-md-offset-2">
							<div class="form-group">
								<span for="email" class="">Confirm Email</span>
								<input placeholder="Re Enter Email" id="cemail" name="ceml" type="text" class="form-control input-lg" data-toggle="popover" data-trigger="focus" data-content="Rewrite E-mail :">
							</div>	
						</div>
							
						<div class="col-md-8 col-md-offset-2">
							<div class="form-group">
								<span for="password" class="">Password</span>
								<input placeholder="Password" id="pwd1" type="password" name="pass" class="form-control input-lg" data-toggle="popover" data-trigger="focus" data-content="Enter passward :">
							</div>	
						</div>
					
						<div class="col-md-8 col-md-offset-2">
							<div class="form-group">
								<span for="cpassword" class="">Confirm Password</span>
								<input placeholder="Confirm Password" id="cpwd" type="password" name="cpass" class="form-control input-lg" data-toggle="popover" data-trigger="focus" data-content="Write confirm password :">
							</div>	
						</div>
						
						<div class="col-md-4 col-md-offset-2">
							<div class="form-group" id="bdiv">
								<span for="dob" class="">Date of Birth</span>
								<input placeholder="DD/MM/YYYY" id="dob" name="dob" type="text" class="form-control input-lg" data-toggle="popover" data-trigger="focus" data-content="Enter date of birth :">
							</div>	
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<span for="co_no" class="">Contact No.</span>
								<input placeholder="Contact Number" id="co_no" name="con" type="text" class="form-control input-lg" data-toggle="popover" data-trigger="focus" data-content="Enter contact no. :">
							</div>	
						</div>
						<div class="col-md-offset-2">
							<div class="form-group">
								<input type="submit" class="btn btn-outline" value="Register">
							</div>	
						</div>
					</form>
					
					<!--sign up form ends -->
					</div>
				</div>
            </div>
            <div class="modal-footer">
                <input type="button" class="btn btn-primary" data-dismiss="modal" value="close" />
            </div>
        </div>
    </div>
</div>
<!--moda ends-->

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>

<script>
$('#dob').datepicker({
  	format: "dd/mm/yyyy",
  	autoclose: true,
  	todayHighlight: true,
  	
  });
</script>				

<!-- Modal -->
  <div class="modal fade" id="myChange" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Forgot password</h4>
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
							
							<div class="col-md-offset-2">
								<div class="form-group">
									<input type="submit" class="btn btn-outline" value="Reset Password">
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