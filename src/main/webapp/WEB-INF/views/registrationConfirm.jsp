<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Shopping Cart</title>

<!-- Bootstrap and Font Awesome css -->
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
	<div class="container">
		<div class="contact-us-area k-padding">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2">
					<fieldset>
						<legend>Confirm Details</legend>

						<div class="form-inner">
							<form:form commandName="userDetails">
								<div class="one-half">
									<form:label path="id" type="text" >${userDetails.id}</form:label>
								</div>
								<div class="one-half">
									<form:label path="name" type="text" >${userDetails.name}</form:label>
								</div>
								<div class="one-half">
									<form:label path="password" type="text" >${userDetails.password}</form:label>									
								</div>
								<div class="one-half">
									<form:label path="address" type="text" >${userDetails.address}</form:label>
								</div>
								<div class="one-half">
									<form:label path="phone" type="text" >${userDetails.phone}</form:label>
								</div>
								<div class="one-half">
									<form:label path="email" type="text" >${userDetails.email}</form:label>
								</div>

								<div class="reg-button k-padding-top-4">

									<input name="_eventId_submit" class="btn btn-info kp-button floatright" 
									type="submit" value="<spring:message text="Confirm Details" />" /> 
									
									<input name="_eventId_edit" class="btn btn-info kp-button floatleft"
										type="submit" value="<spring:message text="Edit Details" />" />
								</div>

							</form:form>
						</div>
					</fieldset>
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