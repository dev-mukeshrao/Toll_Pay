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
<style>
.padding {
    padding-left:20%;
    
}
.right{
	text-align:right;
}
</style>

<script>
function printDiv(divName) {

     var printContents = document.getElementById(divName).innerHTML;
     var originalContents = document.body.innerHTML;

     document.body.innerHTML = printContents;

     window.print();

     document.body.innerHTML = originalContents;
}
</script>
<%@include file="header.jsp" %>
<link rel="stylesheet" href="css/myinvoicestyle.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Invoice</title>

</head>
<body style="padding-left:30px; padding-right: 30px; background-color:#f2f0ee;">

<%@include file="connection.jsp"%>
<%@include file="getType.jsp" %>
<%
						int d1,inid=0;
						inid=Integer.parseInt(request.getParameter("id"));
											
						d1=(int)session.getAttribute("id");
						Statement st=null;
						boolean b=false;
						ResultSet rs=null,rs1=null;
						long ph=0;
						String name="",email="",start="",end="",dtime="";
						String vh_no="",vh_ty="",jh_ty="";
						String tollbooth[];
						String bthnm="";
						String dt="";
						int vh_id=0,jh_id=0;
						String[] str;
						int grandtotal=0;
						int id=(int)session.getAttribute("id");	
						
						System.out.println("user id : "+d1+"i id : "+inid);
						try
						{		
							
							String qry="SELECT t_id,u_id,vh_no,vh_id,jh_id,TO_CHAR(doj,'DD/MM/YYYY'),t_pay,bth_nm,source,destination,jhtime from transaction WHERE t_id="+inid;
							String qry1="SELECT u.u_name,u.u_mobile,u.u_email FROM user_master u JOIN login l ON (u.u_email = l.l_email) WHERE l.l_id="+id;

							rs=stmt.executeQuery(qry1);
						while(rs.next())
							{
								name=rs.getString(1);
								ph=rs.getLong(2);
								email=rs.getString(3);
							}
							rs.close();
							
							
							rs1=stmt.executeQuery(qry);
							while(rs1.next())
							{
									bthnm=rs1.getString(8);
								vh_no=rs1.getString(3);
								vh_id=rs1.getInt(4);
								vh_ty=getVhType(rs1.getInt(4));
								jh_id=rs1.getInt(5);
								jh_ty=getJhType(rs1.getInt(5));
								dt=rs1.getString(6);
								grandtotal=rs1.getInt(7);
								start=rs1.getString(9);
								end=rs1.getString(10);
								dtime=rs1.getString(11);
								
							}
							System.out.println("booth list...."+bthnm);
							 
							
							rs1.close();
							stmt.close();
							con.close();
	
						}					
						catch(Exception e)
						{
							out.println(e);
						}
						
						%>




	<div class="row">
		 <div class="col-lg-3"></div>
			<div class="col-lg-6"  id="printableArea" style="background-color: #ffffff; padding-left: 10px; padding-right: 10px;">
			<div class="row">
				<div class="col-lg-8">
					<h1  style="margin-top: 40px;"><strong>TollPay</strong></h1>
				</div>
				<div class="col-lg-6">
					<h4><strong>Date of Journey:</strong><%=dt %></h4>
				</div>
			
			</div>	
		<hr class="style18" />
	
	<div class="row">
		
		<div class="col-xs-4" align="center">
		<div style="margin-top: 20px;">
		<h4><strong>From:</strong> <%=start %></h4> 
		</div>
		</div>
		<div class="col-xs-4" align="center">
		<h6><strong>Journey Hours : </strong><%=dtime %></h6>
			<hr class="style6" />
		</div>
		<div style="margin-top: 20px;">
			<div class="col-xs-4" align="center">
				<h4><strong>To:</strong> <%=end %></h4>
			</div>
		</div>
	
	</div>
	<hr class="style7" />
	
	
	<div class="row">
	<div>
	
	</div>
		<div class="col-xs-6" align="left">
		<address>
		
			<h4><strong>Name &nbsp;&nbsp;:</strong> &nbsp;&nbsp;<%=name %><br>
			<strong>Email &nbsp;&nbsp;:</strong> &nbsp;&nbsp;<%=email %><br>
			<strong>Contact No. &nbsp;&nbsp;:</strong> &nbsp;&nbsp;<%=ph %><br>
			</h4>
		</address>
	</div>
	<div class="col-xs-6" align="left">
		<address align="right">
			<h4 style="text-align: left;width: 276px;margin-left: 98px;">
			<strong>Vehicle No. &nbsp;&nbsp;:</strong> &nbsp;&nbsp;<%=vh_no %><br>
			<strong>Vehicle Type &nbsp;&nbsp;:</strong> &nbsp;&nbsp;<%=vh_ty %><br>
			<strong>Journey Type &nbsp;&nbsp;:</strong> &nbsp;&nbsp;<%=jh_ty %><br>
			</h4>
		</address>
	</div>
	
	</div>
	<hr class="style7" />
	
	
	<div class=" col-xs-12">
	<div class="table-responsive">
		<div class="table table-hover">
		<table class="table" border="0">
			<tbody>
				<tr><th colspan="2">Route & Toll-Rate</th>
				</tr>
				<tr>
				
				<th>Booth Name</th>
			
				<th>Rate</th>
				</tr> 
				<%
				str=bthnm.split(",");
				for(int i=0;i<str.length;i++){
								System.out.println("booth "+i+"is.."+str[i]);%>
								<tr>
								
								<td ><%=str[i] %></td>
								
								<td><%=getRate(getBoothId(str[i]),vh_id,jh_id) %></td>
						</tr>
						<%	} %>
			
			
			<tr>
			<th class="right">Total Cost</th><td><%=grandtotal %></td></tr>
			
			</tbody>
			</table>
		</div>
	</div>

	<button type="button"  onclick="printDiv('printableArea')" class="btn btn-info">Print<i class="glyphicon glyphicon-print"></i></button>
	
</div>

</div>
			
			
			<div class="col-lg-3"></div>
			
</div>


</body>
</html>
<%}%>