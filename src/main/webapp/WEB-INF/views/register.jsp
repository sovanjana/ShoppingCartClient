<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
						<h2>Create an account</h2>
						<form:form action="registration" commandName="userDetails" method="post">
							<table>
								<tr>
									<td>
										<form:label path="id">
											<spring:message text="ID" />
										</form:label>
									</td>
									<td>
										<form:input path="id" pattern=".{6,7}" required="true" title="id should contains 6-7 characters" />
									</td>
								</tr>
								<tr>
									<td>
										<form:label path="name">
										<spring:message text="User Name" />
										</form:label>
									</td>
									<td>
											<form:input path="name" required="true" title="name should not be empty" />
									</td>
								</tr>
								<tr>
									<td>
										<form:label path="password">
											<spring:message text="Password" />
										</form:label>
									</td>
									<td>
										<form:password path="password" pattern=".{8,15}" required="true" title="password should contains 8-15 characters" />
									</td>
								</tr>
								<tr>
									<td>
										<form:label path="address">
											<spring:message text="Address" />
										</form:label>
									</td>
									<td>
										<form:input path="address" required="true" />
									</td>
								</tr>
								<tr>
									<td>
										<form:label path="phone">
											<spring:message text="Phone no" />
										</form:label>
									</td>
									<td>
										<form:input type="tel" path="phone" required="true"/>
										<%-- <form:input type="tel" path="mobile" pattern="^\d{10}$" required="true"/> --%>
									</td>
								</tr>
								<tr>
									<td>
										<form:label path="email">
											<spring:message text="Email" />
										</form:label>
									</td>
									<td>
										<form:input type="email" path="email" />
									</td>
								</tr>
								<tr>
									<td>
										<input type="submit" class="btn btn-info" style="margin: 10px;" value="<spring:message text="create account" />" />
									</td>
									<td>
										<input type="reset" class="btn btn-info" style="margin: 10px;" value="<spring:message text="Reset"/>" />
									</td>
								</tr>
							</table>
						</form:form>
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