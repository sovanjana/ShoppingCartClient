<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page isELIgnored="false"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html >

<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">	
		<title>Shopping Cart</title>
		
		<!-- Bootstrap and Font Awesome css -->
		<link href="../../resources/css/font-awesome.css" rel="stylesheet">
		<link href="../../resources/css/bootstrap.min.css" rel="stylesheet">
		<link href="../../resources/css/jquery-ui.min.css" rel="stylesheet">
		
		<link href="../../resources/css/responsive.css" rel="stylesheet">
		
		<!-- Theme stylesheet -->
		<link href="../../resources/css/style.default.css" rel="stylesheet"
			id="theme-stylesheet">
		
		<!-- favicon -->
		<link rel="shortcut icon" href="../../resources/favicon.png">
		
		<!-- owl carousel css -->
		<link href="../../resources/css/owl.carousel.css" rel="stylesheet">
		<link href="../../resources/css/owl.theme.css" rel="stylesheet">
	</head>

<body style="background-color: oldlace;">
	<div class="container">
		<!-- <div class="row"> -->
			<div class="col-md-8 col-md-offset-2 col-sm-12">
				<div class="table-responsive">
					<h2 style="text-align: center;background-color: gold;">Cart List</h2>
					<c:choose>
						<c:when test="${not empty cartEmpty}">
							<h2 style="margin: auto; text-align: center;">${cartEmpty}</h2>
							<a href="/ShoppingCartClient/home" class="btn btn-info kp-button">Continue Shopping</a>
						</c:when>
						<c:otherwise>
							<table class="table table-condensed">
								<%
									int i = 1;
									int j = 0;
								%>
								<tr style="background-color: #e6e6ff;">
									<c:forEach items="${cartItems}" var="cartItem">
										<%
											j++;
										%>
									</c:forEach>
									<th width="80">Sr.No <span>( <%
										out.println(j);
									%> )
									</span>
									</th>
									<th width="120">Product Name</th>
									<th width="120">Product Image</th>
									<th width="80">Product Name</th>
									<th width="80">Product Quantity</th>
									<th width="80">Total Price</th>
									<th width="60">Remove</th>
								</tr>
								
								<c:forEach items="${cartItems}" var="c">
									<tr>
										<td>
											<%
												out.println(i);
											%>
										</td>
										<td>${c.productName}</td>
										<td><img
											src="${pageContext.request.contextPath}/${c.productImage}"
											style="width: 60px"></td>
										<td>${c.productName}</td>
										<td>${c.cartItem.countProducts}</td>
										<td><span class="fa fa-inr"></span>${c.cartItem.grandTotal}</td>
										<td><a
											onclick="return confirm('Do you really want to remove ?')"
											href="${contextPath}/user/cart/remove/${c.cartItem.cartItemId}"
											class="btn btn-danger"><span
												class="fa fa-remove"></span>  Remove</a></td>
									</tr>
									<%
										i++;
									%>
								</c:forEach>
							</table>
							<c:choose>
								<c:when test="${not empty zeroGrandTotal }">
									<a class="col-xs-offset-5 btn btn-lg btn-success kp-button floatright"
										disabled="true">Checkout &nbsp;&nbsp;<span
										class="fa fa-inr"></span>0
									</a>
								</c:when>
								<c:otherwise>
									<a class="btn btn-info kp-button floatright"
										href="${contextPath}/cart_checkout">Checkout &nbsp;&nbsp;<span
										class="fa fa-inr"></span> ${total}
									</a>
									<a href="/ShoppingCartClient/home" class="btn btn-info kp-button">Continue Shopping</a>
								</c:otherwise>
							</c:choose>
						</c:otherwise>
						<%-- ----- for no product present --%>
					</c:choose>					
				</div>
			</div>
		</div>



	<!--  JAVASCRIPT FILES  -->
	<script src="../../resources/js/jquery-1.11.0.min.js"></script>
	<script src="../../resources/js/bootstrap.min.js"></script>
	<script src="../../resources/js/jquery.cookie.js"></script>
	<script src="../../resources/js/front.js"></script>
</body>
</html>