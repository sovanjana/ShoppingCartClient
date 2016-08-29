<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Shopping Cart</title>

		<!-- Bootstrap and Font Awesome css -->
		<link href="resources/css/font-awesome.css" rel="stylesheet">
		<link href="resources/css/bootstrap.min.css" rel="stylesheet">

		<link rel="shortcut icon" href="resources/favicon.png">
	</head>
	<body>
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-md-offset-4">
					<div class="table-responsive">
						<h2>Manage Product</h2>
						<c:url var="addProduct" value="/product/saveorupdate"></c:url>
						<form:form action="${addProduct}" commandName="product">

							<table class="table table-condensed">
								<tr>
									<td colspan="2">Add Directory</td>
								</tr>
								<tr>
									<td><form:label path="id">
										<spring:message text="ProductId" />
										</form:label>
									</td>
									<c:choose>
										<c:when test="${!empty product.id}">
											<td>
												<form:input path="id" disabled="true" readonly="true" />
											</td>
										</c:when>
										<c:otherwise>
											<td>
												<form:input path="id" pattern=".{6,7}" required="true" title="id should contains 6-7 characters." />
											</td>
										</c:otherwise>
									</c:choose>
									<form:hidden path="id" />
								</tr>
								<tr>
									<form:input path="id" hidden="true"/>
									<td>
										<form:label path="name">
											<spring:message text="ProductName" />
										</form:label>
									</td>
									<td>
										<form:input path="name" required="true" />
									</td>
								</tr>
								<tr>
									<td>
										<form:label path="description">
											<spring:message text="ProductDescription" />
										</form:label>
									</td>
									<td>
										<form:input path="description" required="true" />
									</td>
								</tr>
								<tr>
									<td>
										<form:label path="price">
											<spring:message text="ProductPrice" />
										</form:label>
									</td>
									<td>
										<form:input path="price" required="true" />
									</td>
								</tr>
								<tr>
									<td>
										<form:label path="supplier">
											<spring:message text="Supplier" />
										</form:label>
									</td>
									<td>
										<form:select path="supplier.id" items="${supplierList}" itemValue="id" itemLabel="id" />
									</td>
								</tr>
								<tr>
									<td>
										<form:label path="category">
											<spring:message text="Category" />
										</form:label>
									</td>
									<td>
										<form:select path="category.name" items="${categoryList}" itemValue="name" itemLabel="name" />
									</td>
								</tr>
								<tr>
									<td><form:hidden path="productImage"/></td>
								</tr>
								<tr>
									<td>Choose Image</td>
									<td><input type="file" name="file"/></td>
								</tr>
								
								<tr>
									<td colspan="2">
										<c:if test="${!empty product.name}">
											<input type="submit" class="btn btn-info" value="Edit Product" />
										</c:if> 
										<c:if test="${empty product.name}">
											<input type="submit" class="btn btn-info" value="Add Product" />
										</c:if>
									</td>
								</tr>
							</table>
						</form:form>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<div class="table-responsive">
						<h2>Product List</h2>
						<c:if test="${!empty productList}">
							<table class="table table-condensed">
								<tr>
									<th width="80">Product ID</th>
									<th width="120">Product Name</th>
									<th width="120">Product Description</th>
									<th width="80">Product Price</th>
									<th width="80">Product Category</th>
									<th width="80">Product Supplier</th>
									<th width="60">Edit</th>
									<th width="60">Delete</th>
								</tr>
								<c:forEach items="${productList}" var="product">
									<tr>
										<td>${product.id}</td>
										<td>${product.name}</td>
										<td>${product.description}</td>
										<td>${product.price}</td>
										<td>${product.category.name}</td>
										<td>${product.supplier.name}</td>
										<td>
											<a href="<c:url value='product/edit/${product.id}'/>" class="btn btn-info" role="button">Edit</a>
										</td>
										<td>
											<a href="<c:url value='product/delete/${product.id}'/>" class="btn btn-info" role="button">Delete</a>
										</td>
									</tr>
								</c:forEach>
							</table>
						</c:if>
					</div>
				</div>
			</div>
		</div>
				
		
			
		<!--  JAVASCRIPT FILES  -->
		<script src="resources/js/jquery-1.11.0.min.js"></script>
		<script src="resources/js/bootstrap.min.js"></script>
		<script src="resources/js/jquery.cookie.js"></script>
		<script src="resources/js/front.js"></script>
	</body>
</html>