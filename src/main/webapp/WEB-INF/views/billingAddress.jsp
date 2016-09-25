<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html >
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

<body style="background-color: oldlace;">
	<div class="container">
		<div class="contact-us-area k-padding">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2">
					<fieldset>
					<h2 style="text-align: center;background-color: gold;">Billing Address</h2>
					
					<div class="form-inner">
						<form:form commandName="billingAddress" method="post">

							<%-- <div class="one">
								<form:input path="billingAddressId" type="text" pattern=".{5,200}"
									required="true" placeholder="Billing_Address_Id" />
								<!-- to display validation message -->
								<c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('billingAddressId')}" var="err">
						  			${err.text}
								</c:forEach>
							</div> --%>
							<div class="one">
								<form:input path="line1" type="text" pattern=".{5,500}"
									required="true" title="address is too small"
									placeholder="Address Line1" />
								<!-- to display validation message -->
								<c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('line1')}" var="err">
						  			${err.text}
								</c:forEach>
							</div>

							<div class="one">
								<form:input type="text" path="line2" placeholder="Address Line 2" />
								<!-- to display validation message -->
								<c:forEach
									items="${flowRequestContext.messageContext.getMessagesBySource('line2')}"
									var="err">
						  					${err.text}
										</c:forEach>
							</div>

							<div class="one-half">
								<form:input path="city" pattern=".{3,50}" required="true"
									title="city name is too small."
									placeholder="City" />
								<!-- to display validation message -->
								<c:forEach
									items="${flowRequestContext.messageContext.getMessagesBySource('city')}"
									var="err">
						  					${err.text}
										</c:forEach>
							</div>

							<div class="one-half">
								<form:input type="text" path="state" pattern=".{3,50}" required="true" placeholder="State" />
								<!-- to display validation message -->
								<c:forEach
									items="${flowRequestContext.messageContext.getMessagesBySource('state')}"
									var="err">
						  					${err.text}
										</c:forEach>
							</div>

							<div class="one-half">
								<form:input path="country" type="text" required="true" pattern=".{3,50}"
									placeholder="Country" />
								<!-- to display validation message -->
								<c:forEach
									items="${flowRequestContext.messageContext.getMessagesBySource('country')}"
									var="err">
						  					${err.text}
										</c:forEach>
							</div>

							<div class="one-half">
								<form:input type="text" path="zipCode" required="true" pattern=".{6}" title="match zipCode(012345) pattern."
									placeholder="Zip Code" />
								<!-- to display validation message -->
								<c:forEach
									items="${flowRequestContext.messageContext.getMessagesBySource('zipCode')}"
									var="err">
						  					${err.text}
										</c:forEach>
							</div>


							<div class="reg-button k-padding-top-4">

								<input name="_eventId_proceed" class="btn btn-info kp-button floatright"
									type="submit" value="<spring:message text="Proceed" />" />
								
								<a href="user/cart" class="kp-button floatleft" >Back</a>
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