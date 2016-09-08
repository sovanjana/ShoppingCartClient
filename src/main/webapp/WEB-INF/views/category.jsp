<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<title>Shopping Cart</title>
		
		<!-- Bootstrap and Font Awesome css -->
		<link href="resources/css/font-awesome.css" rel="stylesheet">
		<link href="resources/css/bootstrap.min.css" rel="stylesheet">
		
		<!-- Theme stylesheet -->
		<link href="resources/css/style.default.css" rel="stylesheet"
			id="theme-stylesheet">
		
		<!-- favicon -->
		<link rel="shortcut icon" href="resources/favicon.png">
		
		<!-- owl carousel css -->
		<link href="resources/css/owl.carousel.css" rel="stylesheet">
		<link href="resources/css/owl.theme.css" rel="stylesheet">
		
	</head>
<body>
	
	
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="table-responsive">
					<h2>Manage Category</h2>
					<c:url var="addCategory" value="/category/saveorupdate"></c:url>
					<form:form action="${addCategory}" commandName="category">
						<table class="table table-condensed">
							<tr>
								<td colspan="2">Add Directory</td>
							</tr>
							<tr>
								<td><form:label path="id">
										<spring:message text="CategoryId" />
									</form:label>
								</td>
								<c:choose>
									<c:when test="${!empty category.id}">
										<td>
											<form:input path="id" disabled="true" readonly="true" />
										</td>
									</c:when>
									<c:otherwise>
										<td>
											<form:input path="id" pattern=".{6,10}" required="true" title="id should contains 6-10 characters." />
										</td>
									</c:otherwise>
								</c:choose>
								<form:hidden path="id" />
							</tr>
							<tr>
								<td>
									<form:label path="name">
										<spring:message text="CategoryName" />
									</form:label>
								</td>
								<td>
									<form:input path="name" required="true" />
								</td>
							</tr>
							<tr>
								<td>
									<form:label path="description">
										<spring:message text="CategoryDescription" />
									</form:label>
								</td>
								<td>
									<form:input path="description" required="true" />
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<c:if test="${!empty category.name}">
										<input type="submit" class="btn btn-info" value="Edit Category"/>										
									</c:if> 
									<c:if test="${empty category.name}">
										<input type="submit" class="btn btn-info" value="Add Category" />
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
					<h2>Category List</h2>
					<c:if test="${!empty categoryList}">
						<table class="table table-condensed">
							<tr>
								<th width="80">Category ID</th>
								<th width="120">Category Name</th>
								<th width="120">Category Description</th>
								<th width="60">Edit</th>
								<th width="60">Delete</th>
							</tr>
							<c:forEach items="${categoryList}" var="category">
								<tr>
									<td>${category.id}</td>
									<td>${category.name}</td>
									<td>${category.description}</td>
									<td>
										<a href="<c:url value='category/edit/${category.id}'/>" class="btn btn-info" role="button">Edit</a>
									</td>
									<td>
										<a href="<c:url value='category/delete/${category.id}'/>" class="btn btn-info" role="button">Delete</a>
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