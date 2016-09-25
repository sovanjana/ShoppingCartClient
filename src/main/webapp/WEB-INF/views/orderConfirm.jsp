<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ page isELIgnored="false"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
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

<body style="background-color: oldlace;">
	<div class="container">
		<div class="contact-us-area k-padding">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2">
					<fieldset>
						<h2 style="text-align: center;background-color: gold;">Confirm Order Details</h2>

						<div class="form-inner">
							<form:form commandName="billingAddress">
							
								<div class="one">
									<form:label path="billingAddressId" type="text" >Billing_Address Id : ${billingAddress.billingAddressId}</form:label>
								</div>
								<div class="one">
									<form:label path="userId" type="text" >User Id : ${billingAddress.userId}</form:label>
								</div>
								<div class="one">
									<form:label path="line1" type="text" >${billingAddress.line1}</form:label>
								</div>
								<div class="one">
									<form:label path="line2" type="text" >${billingAddress.line2}</form:label>
								</div>
								<div class="one-half">
									<form:label path="city" type="text" >${billingAddress.city}</form:label>									
								</div>
								<div class="one-half">
									<form:label path="state" type="text" >${billingAddress.state}</form:label>
								</div>
								<div class="one-half">
									<form:label path="country" type="text" >${billingAddress.country}</form:label>
								</div>
								<div class="one-half">
									<form:label path="zipCode" type="text" >${billingAddress.zipCode}</form:label>
								</div>

								<div class="reg-button k-padding-top-4">
								
								<input name="_eventId_saveSuccess" class="btn btn-info kp-button floatright" 
								type="submit" value="<spring:message text="Order Confirm" />" />
								
								
									<!-- <input name="_eventId_submit" class="btn btn-info kp-button floatright" 
									type="submit" value="<spring:message text="Confirm Details" />" /> 			 -->						
									
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