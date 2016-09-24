<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>Oops! 403</title>
		<meta charset=utf-8 />
		
		<link href="../../../resources/css/bootstrap.min.css" rel="stylesheet">
		<link href="../../../resources/css/bootstrap.min.css" rel="stylesheet">
		<link href="../../../resources/css/bootstrap.min.css" rel="stylesheet">
		<link href="../../../resources/css/bootstrap.min.css" rel="stylesheet">
		<link href="../../../resources/css/jquery-ui.min.css" rel="stylesheet">
		<link href="../../../resources/css/error.css" rel="stylesheet">				
	</head>	
	<body>
		<div class="wrap">
		<fieldset>
			<legend>Error Description</legend>
				${exception}
			</fieldset>
			<div class="logo">				
				<p>OOPS! - Could not Find it</p>
				<img src="../../../resources/img/error.png"/>		
				<div class="sub">
					<p><a href="/ShoppingCartClient/home">Back To Home</a></p>
				</div>
			</div>
		</div>		
		<script src="../../../resources/js/error.js"></script>
		<script src="../../../resources/js/jquery-1.11.0.min.js"></script>
		<script src="../../../resources/js/bootstrap.min.js"></script>
	</body>
</html>