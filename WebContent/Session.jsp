<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%
	response.setContentType("text/html");
	HttpSession s=request.getSession();
	int i=(int)s.getAttribute("id");
	out.println("ID "+i);
%>