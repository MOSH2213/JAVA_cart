<%@page import="cn.techtutorial.connection.DbCon"%>
<%@page import="cn.techtutorial.dao.*"%>
<%@page import="cn.techtutorial.model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
//(User) syas that it is type casted
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
}

ProductDao pd = new ProductDao(DbCon.getConnection());
List<Product> products = pd.getAllProducts();

//cart list type beins
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");

if (cart_list != null) {
	request.setAttribute("cart_list", cart_list);
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

	<!-- product card sart here -->
	<div class="container">
		<div class="card-header my-3">All Products</div>
		<div class="row">
			<% 
				if(!products.isEmpty()){
					for(Product p:products){%>
						<div class="col-md-3 my-3">
						<div class="card w-100">
							<img class="card-img-top" src="product-images/<%=p.getImage()%>"
								alt="Card image cap">
							<div class="card-body">
								<h5 class="card-title"><%=p.getName()%></h5>
								<h6 class="price">$<%=p.getPrice() %></h6>
								<h6 class="category"><%=p.getCategory()%></h6>
								<div class="mt-3 d-flex justify-content-between flex-wrap">
									<a class="btn btn-dark" href="add-to-cart?id=<%=p.getId()%>">AddtoCart</a> 
									<a class="btn btn-primary" href="">WHISHLIST</a>
									<a class="btn btn-primary" href="order-now?quantity=1&id=<%=p.getId()%>">Buy Now</a>
								</div>
							</div>
						</div>
					</div>
					<%}
				}
			
				else{%>
					<h1>NO PRODUCTS FOUND</h1>
				<%}
			
			%>
			
		</div>
	</div>
	<!-- PRODUCT CARDENDS HERE -->

	<%@include file="includes/footer.jsp"%>
</body>
</html>