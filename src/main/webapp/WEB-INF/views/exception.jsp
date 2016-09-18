<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page isELIgnored="false" %>
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
	<div class=container>
		<div class=row>
			<div class="col-md-4 col-md-offset-4">
				<div class="content" style="width:60%">
					<a href="/ShoppingCartClient/" style="color:blue; text-align: justify;">Home</a>
					<fieldset>
						<legend style="color:red;">Error occurred</legend>
						${exception }
					</fieldset>
				</div>
			</div>
		</div>
	</div>
</body>
</html>