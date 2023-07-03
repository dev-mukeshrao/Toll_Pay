<%@page import="java.net.URLEncoder"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>


</head>

 <%@include file="connection.jsp"%>
								   	 
<%

int sid;
long mobile=0;
String email="",name="",dob="";

SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/YY");
Date dt = new Date();
if(session.getAttribute("id")!=null)
{
	sid=(int)session.getAttribute("id");
	
	boolean b=false;
	ResultSet rs=null;
	try
	{		
		rs=stmt.executeQuery("select *from login");
		if(rs!=null)
		{
			while(rs.next())
			{
				if(sid==Integer.parseInt(rs.getString(1)))
				{
					b=true;
					email=rs.getString(3);
				}
			}
		}
		if(b)
		{
			rs=null;
			rs=stmt.executeQuery("select *from user_master");
			if(rs!=null)
			{
				while(rs.next())
				{
					if(email.equals(rs.getString(4)))
					{
			
						name=rs.getString(2);
						mobile= rs.getLong(3);
						dt = rs.getDate(5);
					}
				}
			}	
		}
		rs.close();
		stmt.close();
		con.close();
	}					
		catch(Exception e)
		{
			out.println(e);
		}
}
%>


<body>
<table>
	<tr>
		<td>tollplaza</td>
		<td><%=request.getParameter("toll") %></td>
	</tr>
	<tr>
		<td>vehicle type</td>
		<td><%=request.getParameter("vtype") %></td>
	</tr>
	<tr>
		<td>trip</td>
		<td><%=request.getParameter("trip") %></td>
	</tr>
	<tr>
		<td>payment</td>
		<td><%=request.getParameter("pay") %></td>
	</tr>
	<tr>
		<td>s id </td>
		<td><%=session.getAttribute("id") %></td>
	</tr>
	<tr>
		<td>nm </td>
		<td><%=name+" e "+email + " m "+mobile+" fb " + sdf.format(dt) %></td>
	</tr>
</table>


</body>
</html>	

<html>
<head>
<%@include file="header.jsp" %>

<!-- Include Date Range Picker -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>

<script>
	$(document).ready(function(){
		var date_input=$('input[name="date"]'); //our date input has the name "date"
		var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
		date_input.datepicker({
			format: 'dd/mm/yyyy',
			container: container,
			todayHighlight: true,
			autoclose: true,
			startDate: new Date(),
		})
	})
</script>
</head>
<body class="inner-page">
<%@include file="menu.jsp" %>
							   	 
<!-- START #fh5co-hero -->
			<aside id="fh5co-hero" style="background-image: url(images/hero3.jpg); height:300px; ">
				<div class="container">
					<div class="row">
						<div class="col-md-8 col-md-offset-2">
							<div class="fh5co-hero-wrap">
								<div class="fh5co-hero-intro">
										<h2>Process for Payment<span></span></h2>
								</div>
							</div>
						</div>
					</div>
				</div>
			</aside>

			<div id="fh5co-main" style="margin-top: 149px !important; padding-top: 0px;">
				
				<section>
					<div class="container">
						<div class="row">
							<div class="fh5co-spacer fh5co-spacer-sm"></div>	
							<div class="col-md-12 well">
								<form action="makePayment.jsp" method="post">
								<div class="col-md-8 col-md-offset-2">
										<h1 class="fh5co-uppercase-heading-sm text-center">Payment</h1>
									</div>
									
									<div class="col-md-8 col-md-offset-2">
										<div class="form-group">
											<div class="input-group input-group-lg">
											  <span class="input-group-addon">Name</span>
											  <input type="text" id="name" class="form-control input-lg" placeholder="Full Name" value="<%=name%>">
											</div>
										</div>	
									</div>
									
									<div class="col-md-4 col-md-offset-2">
										<div class="form-group">
											<div class="input-group input-group-lg">
											  <span class="input-group-addon">Email</span>
											  <input type="email" id="email" class="form-control input-lg" placeholder="Email Address" value="<%=email%>">
											</div>
										</div>	
									</div>
									
									<div class="col-md-4">
										<div class="form-group">
											<div class="input-group input-group-lg">
											  <span class="input-group-addon">Mobile</span>
											  <input type="number" id="mobile" class="form-control input-lg" placeholder="Mobile Number" value="<%=mobile%>">
											</div>
										</div>	
									</div>
									
									<div class="col-md-8 col-md-offset-2">
										<div class="form-group">
											<div class="input-group input-group-lg">
											  <span class="input-group-addon">Vehicle No.</span>
											  <input type="text" name="vh_no"  id="vh_no" class="form-control input-lg" placeholder="Vehicle Number">
											</div>
										</div>	
									</div>
								
									<div class="col-md-4 col-md-offset-2">
										<div class="form-group">
											<div class="input-group input-group-lg">
											  <span class="input-group-addon">Vehicle Type</span>
											  <input type="text" id="vh_type" class="form-control input-lg" disabled placeholder="" value="<%=getVhType(Integer.parseInt(request.getParameter("vtype"))) %>">
											    <input type="hidden" id="vid" name="vid" class="form-control input-lg" value="<%=request.getParameter("vtype")%>">
											</div>
										</div>	
									</div>
									
									<div class="col-md-4">
										<div class="form-group">
											<div class="input-group input-group-lg">
											  <span class="input-group-addon">Journey Type</span>
												 <input type="text" id="tr" class="form-control input-lg" disabled placeholder="" value="<%=getJhType(Integer.parseInt(request.getParameter("trip"))) %>">
											    <input type="hidden" id="trip" name="trip" class="form-control input-lg" value="<%=request.getParameter("trip")%>">
											</div>
										</div>	
									</div>
									
									<div class="col-md-8 col-md-offset-2">
										<div class="form-group">
											<div class="input-group input-group-lg">
											  <span class="input-group-addon">Date Of Journey</span>
										<!-- 	  <input type="Date" name="doj"  id="doj" class="form-control input-lg" placeholder="select Date of journey"> -->
											
												<input class="form-control" id="date" name="date" placeholder="MM/DD/YYYY" type="text"/>
											</div>
										</div>	
									</div>
									
									<div class="col-md-8 col-md-offset-2">
										<div class="form-group">
					<div class="table-responsive">
				
						<table class="table table-hover" id="tbl" style="border: 0;">
							<tr>
								<td colspan="2"><b>Route Details of </b><%=request.getParameter("s")%> <b> to</b> <%=request.getParameter("d") %></td>
							</tr>
								
							<tr>
								<th>TollPlaza Name</th>
								<th>Rate</th>
							</tr>
							
							
								<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
								
								<%
									String nt=request.getParameter("toll");
									String vtype=request.getParameter("vtype") ;
									String trip=request.getParameter("trip");
									double rate=0.00;
									int crate=0;
								%>	
								
								<c:forTokens items="<%=nt %>" delims="," var="name">
								   <tr>
								   	<td><c:out value="${name}"/></td>
								   	 <c:set var="nm" value="${name}"/>
								   	
								   	 
									 <%
									    String bnm = ""; 
									 	
									    bnm = bnm + (String)pageContext.getAttribute("nm");  
									    System.out.println("bnm :"+bnm);
									    System.out.println("vtype :"+vtype);
									    
									    ResultSet rs=null;
										try
										{											
											// to get booth id and vehicle id
											int bid=getBoothId(bnm);
											String ttype=getJhType(Integer.parseInt(trip));
											Class.forName("oracle.jdbc.driver.OracleDriver");
											con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","tollpay_db","tollpay");
											stmt = con.createStatement();
											String qry="select * from rate where bth_id="+bid+"and vh_id="+vtype;
											rs=stmt.executeQuery(qry);
											while(rs.next())
											{
												
												if(ttype.equals("single trip"))
												{
													System.out.println("SINGLE RATE for booth : "+bid+" of vehicle : "+vtype+" is :"+rs.getInt(4));
													crate=rs.getInt(4);
													
												}
												if(ttype.equals("return trip"))
												{
													System.out.println("return RATE for booth : "+bid+" of vehicle : "+vtype+" is :"+rs.getInt(5));		
													crate=rs.getInt(5);
												}
												rate=rate+crate;
											}
											rs.close();
											stmt.close();
											con.close();
										}
										catch(Exception e){e.printStackTrace();}
									  %>  
								   
								   	<td id="rt"><%=crate%></td><%crate=0; %>
								   </tr>
								</c:forTokens>
								
				
							<tr>
								<td align="right">Total Cost :</td>
								<td><%=rate %></td>
								
							</tr>
								
						</table>
						
				</div>
			</div>
									<input type="hidden" name="ntoll" id="ntoll" value="<%=nt %>">
									<input type="hidden" name="rt" id="rt" value="<%=rate %>">
									<input type="hidden" name="dtime" id="dtime" value="<%=request.getParameter("dtime")%>"> 
									<input type="hidden" name="start" id="start" value="<%=request.getParameter("s")%>"> 
									<input type="hidden" name="end" id="end" value="<%=request.getParameter("d")%>"> 
									
									<%System.out.println("dtime : "+request.getParameter("dtime")+" start : "+request.getParameter("s")+" end : "+request.getParameter("d")); %>
									<div class="col-md-8 col-md-offset-2" align="right">
										<div class="form-group ">
											<input type="submit" class="btn btn-primary btn-lg" value="Pay &#8377; <%=request.getParameter("pay") %>">
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

<%}%>