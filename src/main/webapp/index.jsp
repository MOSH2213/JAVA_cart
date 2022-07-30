<%@page import="cn.techtutorial.connection.DbCon" %>
<%@page import="cn.techtutorial.model.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
	<%
		//(User) syas that it is type casted
		User auth = (User)request.getSession().getAttribute("auth");
		if(auth!=null){
			request.setAttribute("auth",auth);
		}
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>index</title>
<%@ include file="includes/head.jsp"%>
</head>
<body>
	<%@include file="includes/navbar.jsp"%>
	<% out.print(DbCon.getConnection()); %>
	<%@include file="includes/footer.jsp"%>
</body>
</html>