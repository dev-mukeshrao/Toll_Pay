<%
response.setHeader( "Cache-Control", "no-store, no-cache, must-revalidate" );
response.addHeader( "Cache-Control", "post-check=0, pre-check=0" );
response.setHeader( "Pragma", "no-cache" );

%>
 
<body>
<div class="container">
			<div class="row">
				<div class="col-md-4">
					<div class="table-responsive">
				
						<table class="table table-hover" id="tbl">
							<tr>
								<th colspan="2">Route Summary</th>
							</tr>
							<tr>
								<td id="noofplaza" colspan="2">No. of Toll Gates on route : <%=request.getParameter("l") %> </td>
							</tr>
							<tr>
								<td id="distance" colspan="2">Total Distance in Km : <%=request.getParameter("d") %></td>
							</tr>
							<tr>
								<td id="dtime" colspan="2">Driving Time : <%=request.getParameter("s") %></td>
							</tr>
							<tr>
								<td id="dtime" colspan="2"></td>
							</tr>
							<tr>
								<th colspan="2">TollPlaza Details</th>
							</tr>

							<tr>
								<th>TollPlaza Name</th>
								<th>Rate</th>
							</tr>
							
							
								<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
								
								<%
									String nt=request.getParameter("nt");
									String vtype=request.getParameter("v");
									String trip=request.getParameter("t");
									System.out.println("trip : "+trip);
									double rate=0.00;
									int crate=0;
								%>	
								
								<c:forTokens items="<%=nt %>" delims="," var="name">
								   <tr>
								   	<td><c:out value="${name}"/></td>
								   	 <c:set var="nm" value="${name}"/>
								   	 <%@include file="connection.jsp"%>
								   	 
								   	<%!
					                   	public int getBoothId(String nm)
				                   		{
				                	   		int bthid=0;
				                	   		
				                	   		Connection con = null;
				                			Statement stmt1=null;
				                	   		ResultSet r=null;
				                	   		try
											{
				                	   			Class.forName("oracle.jdbc.driver.OracleDriver");
												con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","tollpay_db","tollpay");
												stmt1 = con.createStatement();
												String qry="select bth_id from booth_master where bth_name = '"+nm+"'";//.toLowerCase()+"'";
												r=stmt1.executeQuery(qry);
												while(r.next())
												{
													bthid=r.getInt("bth_id");
												}
												System.out.println(bthid);
												con.close();
												stmt1.close();
												r.close();
											}
				                	   		catch(Exception e)
				                	   		{e.printStackTrace();}
				                	   		
				                	   		return bthid;
				                   		}
									%>
									<%!
										public String getJhType(int id)
											{
												String type="";
												
												Connection con = null;
												Statement stmt1=null;
												ResultSet r=null;
										  		try
												{
										  			Class.forName("oracle.jdbc.driver.OracleDriver");
													con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","tollpay_db","tollpay");
													stmt1 = con.createStatement();
													String qry="select jh_type from journey_master where jh_id = '"+id+"'";//.toLowerCase()+"'";
													r=stmt1.executeQuery(qry);
													while(r.next())
													{
														type=r.getString(1);
													}
												//	System.out.println(bthid);
													r.close();
													stmt1.close();
													con.close();
												}
										 		catch(Exception e)
										 		{e.printStackTrace();}
										 		
										 		return type;
											}
									%>
									
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
											
											con.close();
											stmt.close();
											rs.close();
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
						
						<form action="pay.jsp?toll=<%=nt%>&vtype=<%=vtype%>&pay=<%=rate%>&trip=<%=trip %>&dtime=<%=request.getParameter("s") %>&s=<%=request.getParameter("j")%>&d=<%=request.getParameter("e")%>" method="post">
							<input type="submit" class="btn btn-primary btn-lg" value="payment" name="submit">
 
						</form>
				</div>
			</div>
</div>
</div>
</body>