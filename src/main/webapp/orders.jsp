<%@page import="cn.techtutorial.connection.DbCon" %>
<%@page import="cn.techtutorial.model.*" %>
<%@page import="java.util.*"%>
<%
		//(User) syas that it is type casted
		User auth = (User)request.getSession().getAttribute("auth");
		if(auth!=null){
			//no need to have the setattribute in login pagge because navbar which contains auth variable is not presen here
			request.setAttribute("auth",auth);
			//response.sendRedirect("index.jsp");
		}

		//cart list type beins
		ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");

		if (cart_list != null) {
			request.setAttribute("cart_list", cart_list);
		}	
	%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>orders</title>
<%@ include file="includes/head.jsp"%>
</head>
<body>
	<%@include file="includes/navbar.jsp"%>
	<h1>ddhasdjkahdkhjk</h1>
	<%@include file="includes/footer.jsp"%>
</body>
</html>