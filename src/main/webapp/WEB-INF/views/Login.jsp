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
	<div id="login">
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-md-offset-4">
				
					<form:form action="userlogin" method="POST">
						<table>
							<tr>
								<td>User Name (ID) : </td>
								<td><input type="text" name="name"></td>
							</tr>
							<tr>
								<td>Password : </td>
								<td><input type="password" name="password"></td>
							</tr>
							<tr>
								<td colspan="2"><input type="submit" class="btn btn-info" value="login"></td>
								
							</tr>							
						</table>
					</form:form><br>
					${errorMessage}
					<br>
					<!-- ${invalidData} -->
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