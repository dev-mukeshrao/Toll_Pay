<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="cache-control" content="no-cache">
<%@include file="header.jsp" %>
</head>
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
										<h1>change your profile..</h1>
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
						
						<div class="table-responsive">
							<div class="fh5co-spacer fh5co-spacer-sm"></div>	
					<%@include file="connection.jsp" %>							
					<%
						int d1;
						String eml1="",n="",em="",dob="";
						d1=(int)session.getAttribute("id");
						Statement st=null;
						boolean b=false;
						ResultSet rs=null;
						long ph=0;
						int id=(int)session.getAttribute("id");						
						try
						{		
							Class.forName("oracle.jdbc.driver.OracleDriver");
							con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","tollpay_db","tollpay");
							stmt = con.createStatement();
							String qry="SELECT u.u_name,u.u_mobile,u.u_email,TO_CHAR(u.u_bod,'DD/MM/YYYY') FROM user_master u JOIN login l ON (u.u_email = l.l_email) WHERE l.l_id="+id;
							rs=stmt.executeQuery(qry);
							while(rs.next())
							{
								n=rs.getString(1);
								ph=rs.getLong(2);
								em=rs.getString(3);
								dob=rs.getString(4);
							}
							rs.close();
							stmt.close();
							con.close();
	
						}					
						catch(Exception e)
						{
							out.println(e);
						}
					
					            out.print(" <form align='center' action='editprofile.jsp' method='post'> ");
								out.print("<div class='col-md-3'>");	
								out.print("	<img src='#' class='img-circle' style='margin-left:110px;margin-top:20px;width:110px;height:90px;'>");
								out.print("</div>");
								out.print("<div class='col-md-6'>");
								out.print("<table class='table-responsive' align='center' style='margin-left:-5px;height:380px;'>");
								
								out.print("<tr>");	
								out.print("<td><h1>"+n+"</h1></td>");
								out.print("<td></td>");
								out.print("<td></td>");
								out.print("</tr>");
		
								out.print("<tr>");
								out.print("<td>Email</td>");
								out.print("<td>&nbsp; : &nbsp;</td>");
								out.print("<td>"+em+"</td>");
								out.print("</tr>");
								
								out.print("<tr>");
								out.print("<td>Phone</td>");
								out.print("<td>&nbsp; : &nbsp;</td>");
								out.print("<td>"+ph+"</td>");
								out.print("</tr>");
								
								out.print("<tr>");
								out.print("<td>Birth date</td>");
								out.print("<td>&nbsp; : &nbsp;</td>");
								out.print("<td>"+dob+"</td>");
								out.print("</tr>");
								
								out.print("<tr>");
								out.print("<td></td>");
								out.print("<td></td>");
								
								out.print("<td>");
								out.print("<br>");
								out.print("<div>");
								out.print("<input type='Submit' class='btn btn-primary' value='Edit profile' />");
								out.print("</div>");
								out.print("</td>");		
								out.print("</tr>");
								
								out.print("</table>");		
								out.print("</div>");
								out.print("</form>");	
							%>
										
							</div>
							<div class="fh5co-spacer fh5co-spacer-md"></div>
						</div>
						</div>
					</div>
				</section>

<%@include file="footer.jsp" %>
</div>
</body>
</html>