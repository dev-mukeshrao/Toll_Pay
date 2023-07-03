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
<%@include file="header.jsp" %>
<style type="text/css">
body, html{     
    -webkit-touch-callout: none;
    -webkit-user-select: none;
    -khtml-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;  
}

</style>
<script type="text/javascript">
function noMenu() {
	  return false;
	}
	function disableCopyPaste(elm) {
	  // Disable cut/copy/paste key events
	  elm.onkeydown = interceptKeys
	  // Disable right click events
	  elm.oncontextmenu = function() {
	    return false
	  }
	}
	function interceptKeys(evt) {
	  evt = evt||window.event // IE support
	  var c = evt.keyCode
	  var ctrlDown = evt.ctrlKey||evt.metaKey // Mac support
	  // Check for Alt+Gr (http://en.wikipedia.org/wiki/AltGr_key)
	  if (ctrlDown && evt.altKey) return true
	  // Check for ctrl+c, v and x
	  else if (ctrlDown && c==67) return false // c
	  else if (ctrlDown && c==86) return false // v
	  else if (ctrlDown && c==88) return false // x
	  // Otherwise allow
	  return true
	}
</script>
</head>
<body class="inner-page" oncontextmenu="return noMenu();" onkeydown="return disableCopyPaste();">
<%@include file="menu.jsp" %>
					   	 
<!-- START #fh5co-hero -->
			<aside id="fh5co-hero" style="background-image: url(images/hero3.jpg); height:300px; ">
				<div class="container">
					<div class="row">
						<div class="col-md-8 col-md-offset-2">
							<div class="fh5co-hero-wrap">
								<div class="fh5co-hero-intro">
										<h2>Transaction History<span></span></h2>
								</div>
							</div>
						</div>
					</div>
				</div>
			</aside>

			<div id="fh5co-main" style="margin-top: 300px !important; padding-top: 0px;">
				
				<section>
					<div class="container">
						<div class="row">
							<div class="fh5co-spacer fh5co-spacer-sm"></div>	
							<div class="col-md-12 well">
							<div class="table-responsive">
							<table id="sampleTable" class="table table-striped table-bordered">
			                  <thead>
			                    <tr>
			                      <th>Sr.No</th>
			                      <th>Name</th>
			                      <th>Vehicle No.</th>
			                      <th>Vehicle Type</th>
			                      <th>Journey Type</th>
			                      <th>Date Of Journey</th>
			                      <th>Total Cost</th>
			                      <th>List of TollBooth</th>
			                      <th>Cancel</th>
								  <th>Invoice</th>
			                    </tr>
			                  </thead>
			                  	                  <tbody>
		                   <%@include file="connection.jsp"%>
		                   
		                   <%
		                   		int uid=(int)session.getAttribute("id");
								ResultSet rs=null;
								try
								{
									String qry="select t_id,u_id,vh_no,vh_id,jh_id,TO_CHAR(doj,'DD/MM/YYYY'),t_pay,bth_nm from transaction where u_id="+uid;
									rs=stmt.executeQuery(qry);
									
									int cnt=1;
									while(rs.next())
									{
									//	System.out.println("id : "+rs.getInt(1)+"name : "+rs.getString(2));
									%>
										<tr>
					                      <td><%=cnt++ %></td>
					                      <%System.out.println("id : "+rs.getInt(2)); %>
					                      <td><%=getUserName(rs.getInt(2))%></td>
					                      <td><%=rs.getString(3)%></td>
					                      <td><%=getVhType(rs.getInt(4))%></td>
					                      <td><%=getJhType(rs.getInt(5))%></td>
					                      <td><%=rs.getString(6)%></td>
					                      <td><%=rs.getInt(7)%></td>
					                      <td><%=rs.getString(8)%></td>
					                      <%
					                      SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
					                      String date = sdf.format(new Date()); 
					                      String d2=rs.getString(6);
					                      Date d=sdf.parse(date);
					                      Date dd2=sdf.parse(d2);
					                      System.out.println("todayd : "+d+"bo date : "+dd2);
					                      if(d.before(dd2))
					                      {
					                      	%>
					                      <td align="center"><a class="btn btn-warning" href="${pageContext.request.contextPath}/CancelPayment?id=<%=rs.getInt(1)%>&flag=del">Cancel</a></td>
					                      <%}
					                      else
					                      {%>
					                      <td align="center"><button class="btn btn-warning " disabled>Cancel</button></td>
					                      <%}%>
										   <td align="center"><a class="btn btn-info" href="Invoice.jsp?id=<%=rs.getInt(1)%>">Invoice</a></td>
					                     
					                    </tr>
									<%
									}
									rs.close();
									stmt.close();
									con.close();
								}
								catch(Exception e)
								{
									  System.out.print(e);
								}
							%>
		                  </tbody>
		                  </table>
		                  </div>
							</div>
							<div class="fh5co-spacer fh5co-spacer-md"></div>
						</div>
					</div>
				</section>

<%@include file="footer.jsp" %>
</div>
    <script type="text/javascript" src="Admin/js/plugins/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="Admin/js/plugins/dataTables.bootstrap.min.js"></script>
    <script type="text/javascript">$('#sampleTable').DataTable();</script>
</body>
</html>

<%} %>
