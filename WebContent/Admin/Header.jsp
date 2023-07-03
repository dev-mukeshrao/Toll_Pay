
<%
	if(session.getAttribute("admid")==null)
	{ 
%>
		<%@include file="login.jsp" %>
<%	}
	
	else
	{
		if(session.getAttribute("type")=="admin")
		{
%>
			<%@include file="adminMenu.jsp" %>
<%		
		}
		if(session.getAttribute("type")=="operator")
		{
%>
			<%@include file="operatorMenu.jsp" %>
<%		}
		
	}
%>