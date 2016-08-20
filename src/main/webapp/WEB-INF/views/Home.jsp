<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
	<c:if test="${userClickedLoginHere}">
	<jsp:include page="Login.jsp"></jsp:include>
	</c:if>

	<c:if test="${userClickedRegisterHere}">
	<jsp:include page="Registration.jsp"></jsp:include>
	</c:if>
	
	<h2>${message}</h2>
	<br>

	<jsp:include page="Login.jsp"></jsp:include>
	<jsp:include page="Registration.jsp"></jsp:include>
</body>
</html>