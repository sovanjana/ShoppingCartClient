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
	<div class="container">
		<div class="contact-us-area k-padding">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2">
					<fieldset>
					<legend>Join Us</legend>
					
					<div class="form-inner">
						<form:form commandName="userDetails" method="post">

							<div class="one-half">
								<form:input path="id" type="text" pattern=".{6,10}"
									required="true" title="id should contains 6-10 characters"
									placeholder="UserID" />
								<!-- to display validation message -->
								<c:forEach
									items="${flowRequestContext.messageContext.getMessagesBySource('id')}"
									var="err">
						  					${err.text}
										</c:forEach>
							</div>

							<div class="one-half">
								<form:input type="text" path="name" required="true"
									title="name should not be empty" placeholder="UserName" />
								<!-- to display validation message -->
								<c:forEach
									items="${flowRequestContext.messageContext.getMessagesBySource('name')}"
									var="err">
						  					${err.text}
										</c:forEach>
							</div>

							<div class="one-half">
								<form:password path="password" pattern=".{5,10}" required="true"
									title="password should contains 5-10 characters"
									placeholder="Password" />
								<!-- to display validation message -->
								<c:forEach
									items="${flowRequestContext.messageContext.getMessagesBySource('password')}"
									var="err">
						  					${err.text}
										</c:forEach>
							</div>

							<div class="one-half">
								<form:input type="text" path="phone" pattern=".{10}" required="true"
									placeholder="Phone No." />
								<!-- to display validation message -->
								<c:forEach
									items="${flowRequestContext.messageContext.getMessagesBySource('phone')}"
									var="err">
						  					${err.text}
										</c:forEach>
							</div>

							<div class="one-half">
								<form:input path="address" type="text" required="true"
									placeholder="Address" />
								<!-- to display validation message -->
								<c:forEach
									items="${flowRequestContext.messageContext.getMessagesBySource('address')}"
									var="err">
						  					${err.text}
										</c:forEach>
							</div>

							<div class="one-half">
								<form:input type="text" path="email" required="true"
									placeholder="Email" />
								<!-- to display validation message -->
								<c:forEach
									items="${flowRequestContext.messageContext.getMessagesBySource('email')}"
									var="err">
						  					${err.text}
										</c:forEach>
							</div>


							<div class="reg-button k-padding-top-4">

								<input name="_eventId_submit" class="btn btn-info kp-button floatright"
									type="submit" value="<spring:message text="Create Account" />" />
								
								<a href="home" class="kp-button floatleft" >Home</a>
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