<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ page isELIgnored="false"%>
<!-- Css -->
<spring:url value="/resources/css" var="css" />
<spring:url value="/resources/images" var="images" />
<!-- JavaScript -->
<spring:url value="/resources/js" var="js" />
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

<body>
	<div class="container-fluid">
		<div class="content">
			<div class="container">
				<div class="jumbotron">
					<h1>Order Confirmed,Product will be delivered shortly.</h1>
					<form:form>
						<input name="_eventId_saveSuccess" class="btn btn-info kp-button floatright" 
								type="submit" value="<spring:message text="Order Confirm" />" />

									
					
					
					
						<input type="submit" name="_eventId_successSave"  value="Home" class="btn btn-lg btn-info">
						
					</form:form>				
				</div>
			</div>
		</div>
	</div>
</body>

</html>