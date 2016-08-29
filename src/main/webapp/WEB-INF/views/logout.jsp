<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
	<div id="logout">
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-md-offset-4">
					<div class="col-md-4 col-md-offset-4">
						
						<c:url var="logout" value="/userlogout"></c:url>
						<form:form action="logout" method="GET">
							<table>
								<tr>
									<td><h2>You have successfully logged out...</h2>${logoutMessage}</td>
								</tr>
							</table>
						</form:form>
					</div>
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