<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>cart</title>
<%@ include file="includes/head.jsp"%>
</head>
<body>
	<%@include file="includes/footer.jsp"%>

	<!-- cart section begind -->
	<div class="container my-3">
		<div class="d-flex py-3">
			<h3>Total Price: 4675</h3>
			<a class="mx-3 btn btn-primary" href="cart-check-out">Check Out</a>
		</div>
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col">Price</th>
					<th scope="col">Buy Now</th>
					<th scope="col">Cancel</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>hgfh</td>
					<td>hgfhfh</td>
					<td>hgfhgf</td>
					<td>
						<form action="order-now" method="post" class="form-inline">
							<input type="hidden" name="id" value="" class="form-input">
							<div class="form-group d-flex justify-content-between">
								<a class="btn bnt-sm btn-incre"
									href=""><i
									class="fas fa-plus-square"></i></a> <input type="text"
									name="quantity" class="form-control"
									value="" readonly> <a
									class="btn btn-sm btn-decre"
									href=""><i
									class="fas fa-minus-square"></i></a>
							</div>
							<button type="submit" class="btn btn-primary btn-sm">Buy</button>
						</form>
					</td>
					<td><a href="" class="btn btn-sm btn-danger">Remove</a></td>
				</tr>
			</tbody>
		</table>
	</div>

	<!-- cart section ends -->

	<%@include file="includes/footer.jsp"%>
</body>
</html>