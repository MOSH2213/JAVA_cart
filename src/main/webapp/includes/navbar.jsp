<nav class="navbar navbar-expand-lg bg-light text-dark">
	<div class="container">
		<a class="navbar-brand" href="index.jsp">SHOPPER</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="index.jsp">Home</a></li>
				<li class="nav-item"><a class="nav-link" href="cart.jsp">Cart<span class="badge badge-danger">${cart_list.size()}</span></a></li>
				<%
					//auth eka error enne eeka define nehe kiyala habai navbar eka anik pages walata giyaama eeke thiyena nisa awlk nehe
					if(auth !=null){%>
						<li class="nav-item"><a class="nav-link" href="orders.jsp">Orders</a></li>
						<li class="nav-item"><a class="nav-link" href="log-out">Logout</a></li>
					<%}
					else{%>
						<li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
					<%}
				%>
				
				
			</ul>
		</div>
	</div>
</nav>