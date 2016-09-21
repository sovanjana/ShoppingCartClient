<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Shopping Cart</title>
</head>
<body>
	
	<div class="table-outer productMainDiv">
		<c:choose>
			<c:when test="${not empty cartEmpty}">
				<h2 style="margin: auto; text-align: center;">No products in cart</h2>
			</c:when>
			<c:otherwise>
				<table class="table table-hover table-reponsive table-cart">
					<thead>
						<%
							int i = 1;
							int j = 0;
						%>
						<tr class="table-primary">

							<c:forEach items="${cartItems}" var="cartItem">
								<%
									j++;
								%>
							</c:forEach>

							<th>Sr.No <span>( <%
													out.println(j);
												%> )
							</span></th>
							<th>Product Image</th>
							<th>Product Name</th>
							<th>Product Quantity</th>
							<th>Total Price</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${cartItems}" var="c">
							<tr>
								<td>
									<%
										out.println(i);
									%>
								</td>
								<td><img
									src="${images}/product/${c.cartItem.productId}.png"
									class="cart-Image img-thumbnail"></td>
								<td>${c.productName}</td>
								<td>${c.cartItem.countProducts}</td>
								<td><span class="fa fa-inr"></span>
									${c.cartItem.grandTotal}</td>
								<td>
									<div class="btn-group-vertical">
										<a onclick="return confirm('Do you really want to remove ?')"
											href="${contextPath}/user/cart/remove/${c.cartItem.cartItemId}"
											class="btn btn-md btn-danger"><span
											class="glyphicon glyphicon-remove-sign"></span> Remove</a>
									</div>
								</td>
							</tr>
							<%
								i++;
							%>
						</c:forEach>
						
					</tbody>
				</table>
				<c:choose>
					<c:when test="${not empty zeroGrandTotal }">
						<a class="col-xs-offset-5 btn btn-lg btn-success" disabled="true">Checkout
							&nbsp;&nbsp;<span class="fa fa-inr"></span>0
						</a>
					</c:when>
					<c:otherwise>
						<a class="col-xs-offset-5 btn btn-lg btn-success"
							href="${contextPath}/cart_checkout">Checkout &nbsp;&nbsp;<span
							class="fa fa-inr"></span> ${total}
						</a>
					</c:otherwise>
				</c:choose>
			</c:otherwise>
			<%-- ----- for no product present --%>
		</c:choose>
		<a href="/ShoppingCartClient/home">home</a>
	</div>
</body>
</html>