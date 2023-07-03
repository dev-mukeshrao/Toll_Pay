
<%
response.setHeader( "Cache-Control", "no-store, no-cache, must-revalidate" );
response.addHeader( "Cache-Control", "post-check=0, pre-check=0" );
response.setHeader( "Pragma", "no-cache" );
%>

<%
	if(session.getAttribute("id")==null)
	{ 
%>
		<%@include file="mn1.jsp" %>
<%	}
	else
	{
%>
		<%@include file="mn2.jsp" %>
<%		
	}
%>