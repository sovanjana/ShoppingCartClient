<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Shopping Cart</title>

<!-- Bootstrap, Font Awesome and jQuery css -->
<link href="resources/css/font-awesome.css" rel="stylesheet">
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/css/jquery-ui.min.css" rel="stylesheet">

<link href="resources/css/responsive.css" rel="stylesheet">

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
			<div class="contact-us-area k-padding">
				<div class="row">
					<div class="col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2">
						<fieldset>
							<c:if test="${param.error == 'true'}">
								<div class="fa fa-exclamation-triangle" style="color:red;    margin: -11px 0px 3px 8px;">
									Login Failed ! Please enter valid credentials...
								</div>
							</c:if>
							<legend>Login</legend>
							<div class="form-inner">
								<form:form name="login"
									action="${pageContext.request.contextPath}/j_spring_security_check"
									method="POST">
									<div class="one-half">
										<input type="text" name="username" required="true"
											placeholder="UserID">
									</div>
									<div class="one-half">
										<input type="password" name="password" required="true"
											placeholder="Password" />
									</div>
									<div>
										<input type="submit" name="submit"
											class="btn btn-info kp-button floatright" value="login">
									</div>
									<input type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}" />
								</form:form>
							</div>
						</fieldset>
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