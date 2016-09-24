<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ page isELIgnored="false"%>

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

<body>
	<!-- ****************************************** URL ******************************************* -->
	<c:url var="signup" value="springFlow" />
	<c:url var="adminCategory" value="/admin/adminCategory" scope="session"></c:url>
	<c:url var="adminProduct" value="/admin/adminProduct" scope="session"></c:url>
	<c:url var="adminSupplier" value="/admin/adminSupplier" scope="session"></c:url>
	<c:url var="cart" value="user/cart/" scope="session"></c:url>

	<!-- ****************************************** TOP HEADER START ************************************************** -->

	<nav class="navbar navbar-default navbar-fixed-top"
		style="background-color: gold;">
	<div class="container">

		<div class="navbar-header">
			<a class="btn btn-primary navbar-toggle floatleft" href="user/cart" style="border-color: #204d74;background-color: #286090;"> <i
				class="fa fa-shopping-cart"></i> <span class="hidden-xs"></span>
			</a>
			<c:if test="${pageContext.request.userPrincipal.name == null}">				
				<a class="btn btn-success navbar-toggle" href="${pageContext.request.contextPath}/login" style="border-color: #204d74;background-color: #00b300;"> <i
					class="fa fa-sign-in"></i> <span class="hidden-xs"></span>
				</a>			
			</c:if>
			<c:if test="${pageContext.request.userPrincipal.name != null}">
				<a class="btn btn-danger navbar-toggle" href="${pageContext.request.contextPath}/logout" style="border-color: #204d74;background-color: #b30000;"> <i
					class="fa fa-sign-out"></i> <span class="hidden-xs"></span>
				</a>
			</c:if>
		</div>
		<div id="navbar" class="navbar-collapse collapse"
			style="float: right;">
			<ul class="nav navbar-nav navbar-right">
				<c:if test="${pageContext.request.userPrincipal.name != null}">
					<li
						style="margin: 2px 0 0px 0px; padding: 5px 0 7px 0px; background-color: #efef66;">
						<a>Welcome! ${pageContext.request.userPrincipal.name}</a>
					</li>
				</c:if>
				<c:if test="${pageContext.request.userPrincipal.name == null}">
					<div class="navbar-collapse collapse left" id="basket-overview">
						<li><a href="${pageContext.request.contextPath}/login"
							class="btn btn-primary navbar-btn" style="font-size: 12px;">Login</a></li>
					</div>
				</c:if>
				<c:if test="${pageContext.request.userPrincipal.name != null}">
					<div class="navbar-collapse collapse left" id="basket-overview">
						<li><a href="${pageContext.request.contextPath}/logout"
							class="btn btn-primary navbar-btn" style="font-size: 12px;">Logout</a></li>
					</div>
				</c:if>
				<c:if test="${pageContext.request.userPrincipal.name == null}">
					<div class="navbar-collapse collapse left" id="basket-overview">
						<li><a href="${signup}" class="btn btn-primary navbar-btn"
							style="font-size: 12px;">Sign Up</a></li>
					</div>
				</c:if>
			</ul>
		</div>
		<security:authorize access="hasRole('ROLE_USER')">
			<div class="navbar-collapse collapse left" id="basket-overview">
				<a href="${cart}" class="btn btn-primary navbar-btn"> <i
					class="fa fa-shopping-cart">   ${countProducts}</i>
				</a>
				
			</div>
		</security:authorize>
		<security:authorize access="isAnonymous()">
			<div class="navbar-collapse collapse left" id="basket-overview">
				<a href="${cart}" class="btn btn-primary navbar-btn"> <i
					class="fa fa-shopping-cart"></i>
				</a>
			</div>
		</security:authorize>		
	</div>
	</nav>

	<!-- ****************************************** TOP HEADER END ************************************************** -->

	<!-- ********************************************** NAVBAR START ************************************************** -->

	<div class="navbar navbar-default yamm" role="navigation" id="navbar"
		style="padding-top: 48px; background-color: #e6e6ff;">
		<div class="container">

			<div class="navbar-header">
				<div class="navbar-buttons">
					<!-- toggle navigation -->
					<button type="button" class="navbar-toggle btn-primary"
						data-toggle="collapse" data-target="#navigation">
						<span class="sr-only">Toggle navigation</span> <i
							class="fa fa-align-justify"></i>
					</button>
				</div>
			</div>

			<div class="navbar-collapse collapse" id="navigation">
				<ul class="nav navbar-nav navbar-left">

					<security:authorize access="isAnonymous()">
						<li><a href="/ShoppingCartClient/">Home</a></li>
						<c:forEach items="${categoryList}" var="ctg">
							<li class="dropdown yamm-fw"><a href="#"
								class="dropdown-toggle" data-toggle="dropdown">${ctg.name}<b
									class="caret"></b></a>
								<ul class="dropdown-menu">
									<li>
										<div class="yamm-content">
											<div class="row">
												<div class="col-sm-3">
													<ul>
														<c:forEach items="${ctg.products}" var="product">
															<li><a href="product/get/${product.id}">${product.name}</a></li>
														</c:forEach>
													</ul>
												</div>
											</div>
										</div>
										<div class="footer clearfix hidden-xs">
											<h4 class="pull-right">${ctg.name}</h4>
										</div>
									</li>
								</ul></li>
						</c:forEach>
					</security:authorize>

					<security:authorize access="hasRole('ROLE_USER')">
						<li><a href="/ShoppingCartClient/home">Home</a></li>
						<c:forEach items="${categoryList}" var="ctg">
							<li class="dropdown yamm-fw"><a href="#"
								class="dropdown-toggle" data-toggle="dropdown">${ctg.name}<b
									class="caret"></b></a>
								<ul class="dropdown-menu">
									<li>
										<div class="yamm-content">
											<div class="row">
												<div class="col-sm-3">
													<ul>
														<c:forEach items="${ctg.products}" var="product">
															<li><a href="product/get/${product.id}">${product.name}</a></li>
														</c:forEach>
													</ul>
												</div>
											</div>
										</div>
										<div class="footer clearfix hidden-xs">
											<h4 class="pull-right">${ctg.name}</h4>
										</div>
									</li>
								</ul></li>
						</c:forEach>
					</security:authorize>

					<security:authorize access="hasRole('ROLE_ADMIN')">
						<li><a href="/ShoppingCartClient/home">Home</a></li>
						<li><a href="${adminCategory}">Category</a></li>
						<li><a href="${adminSupplier}">Supplier</a></li>
						<li><a href="${adminProduct}">Product</a></li>
					</security:authorize>
				</ul>
			</div>

		</div>
	</div>

	<!-- ********************************************** NAVBAR END ************************************************** -->

	<div id="admin">
		<div id="supplier">
			<c:if test="${isAdminClickedSuppliers == true}">
				<%@ include file="admin.jsp"%>
				<%@ include file="supplier.jsp"%>
			</c:if>
		</div>
		<div id="category">
			<c:if test="${isAdminClickedCategories == true}">
				<%@ include file="admin.jsp"%>
				<%@ include file="category.jsp"%>
			</c:if>
		</div>
		<div id="product">
			<c:if test="${isAdminClickedProducts == true}">
				<%@ include file="admin.jsp"%>
				<%@ include file="product.jsp"%>
			</c:if>
		</div>
	</div>

	<div id="loginHere">
		<c:if test="${userClickedLogin == true || invalidData == true}">
			<%@ include file="login.jsp"%>
		</c:if>
	</div>

	<div id="registerHere">
		<c:if test="${userClickedRegister == true}">
			<%@ include file="register.jsp"%>
		</c:if>
	</div>

	<div id="singleProduct">
		<c:if test="${isUserClickedSingleProduct == true}">
			<%@ include file="singleproduct.jsp"%>
		</c:if>
	</div>
	

	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ isAnonymous ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!-- ****** SLIDER ******* -->

	<security:authorize access="isAnonymous()">
	<div id="slider" class="owl-carousel owl-theme">

		<div class="item">
			<a><img src="resources/img/slide1.jpg" alt=""
				class="img-responsive"></a>
		</div>
		<div class="item">
			<a href="#"><img src="resources/img/slide2.jpg" alt=""
				class="img-responsive"></a>
		</div>
		<div class="item">
			<a href="#"><img src="resources/img/slide3.jpg" alt=""
				class="img-responsive"></a>
		</div>
		<div class="item">
			<a href="#"><img src="resources/img/slide4.jpg" alt=""
				class="img-responsive"></a>
		</div>
		<div class="item">
			<a href="#"><img src="resources/img/slide5.jpg" alt=""
				class="img-responsive"></a>
		</div>
		<div class="item">
			<a href="#"><img src="resources/img/slide6.jpg" alt=""
				class="img-responsive"></a>
		</div>
	</div>

	<!-- ******* SLIDER END ******* -->

	<div id="all">

	<!-- ******* ADVANTAGES ******* -->

		<div id="advantages">
			<div class="container">
				<div class="col-md-12">
					<div class="box text-center">
						<h3 class="text-uppercase">About Shopping Cart</h3>
						<p>
							<a href="#"><strong>Shopping Cart</strong></a> we are
							the Earth's most customer centric company. We care for you...
						</p>
						<div class="same-height-row row">
							<div class="col-sm-3">
								<div
									class="box same-height clickable no-border text-center-xs text-center-sm">
									<div class="icon">
										<i class="fa fa-heart-o"></i>
									</div>
									<h4>
										<a href="#">Satisfied customers</a>
									</h4>
								</div>
							</div>
							<div class="col-sm-3">
								<div
									class="box same-height clickable no-border text-center-xs text-center-sm">
									<div class="icon">
										<i class="fa fa-tags"></i>
									</div>
									<h4>
										<a href="#">Best prices</a>
									</h4>
								</div>
							</div>
							<div class="col-sm-3">
								<div
									class="box same-height clickable no-border text-center-xs text-center-sm">
									<div class="icon">
										<i class="fa fa-send-o"></i>
									</div>
									<h4>
										<a href="#">Next day delivery</a>
									</h4>
								</div>
							</div>
							<div class="col-sm-3">
								<div
									class="box same-height clickable no-border text-center-xs text-center-sm">
									<div class="icon">
										<i class="fa fa-refresh"></i>
									</div>
									<h4>
										<a href="#">Free returns within 15 days</a>
									</h4>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- ****** ADVANTAGES END ******* -->

		<!-- ******* FOOTER START ****** -->

		<div id="footer">
			<div class="container">
				<div class="col-md-3 col-sm-6">
					<h4>Pages</h4>
					<ul>
						<li><a href="#">About us</a></li>
						<li><a href="#">Terms and conditions</a></li>
						<li><a href="#">FAQ</a></li>
						<li><a href="#">Contact us</a></li>
					</ul>
					<hr>
					<h4>User section</h4>
					<ul>
						<li><a href="login">Login</a></li>
						<li><a href="${signup}">Sign Up</a></li>
					</ul>
					<hr class="hidden-md hidden-lg hidden-sm">
				</div>
				<div class="col-md-3 col-sm-6">
					<h4>Top categories</h4>

					<c:forEach items="${categoryList}" var="ctg">
						<ul>
							<li><a href="#">${ctg.name}</a></li>
						</ul>
					</c:forEach>
					<hr class="hidden-md hidden-lg">
				</div>
				<div class="col-md-3 col-sm-6">
					<h4>Where to find us</h4>
					<p>
						<strong>NIIT</strong> <br> Raja S.C.Mullick Road <br>
						Garia<br> Kolkata-47 <br> West Bengal <br> <strong>India</strong>
					</p>
					<hr>
					<a href="#">Go to contact page</a>
				</div>
				<div class="col-md-3 col-sm-6">
					<h4>Get the news</h4>
					<p class="text-muted">Lorem ipsum dolor sit amet, consectetur
						adipiscing elit, sed do eiusmod tempor.</p>
					<form>
						<div class="input-group">
							<input type="text" class="form-control"> <span
								class="input-group-btn">
								<button class="btn btn-default" type="button">Subscribe!</button>
							</span>
						</div>
					</form>
					<hr>
					<h4>Stay in touch</h4>
					<p class="social">
						<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
							class="fa fa-instagram"></i></a> <a href="#"><i
							class="fa fa-google-plus"></i></a> <a href="#"><i
							class="fa fa-twitter"></i></a>
					</p>
				</div>
			</div>
		</div>
		
		<!-- ****** FOOTER END ******* -->

		<!-- ****** COPYRIGHT START ******* -->

		<div id="copyright">
			<div class="container">
				<div class="col-md-12">
					<p class="pull-left">
						&copy; 2016.<a href="#"><strong>Shopping Cart - </strong></a>Copyright
						by <strong>NIIT Ltd.</strong>
					</p>
				</div>
			</div>
		</div>

	<!-- ****** COPYRIGHT END ******* -->
	
	</div>
	</security:authorize>
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ isAnonymous end ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ROLE_USER start ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	
	<security:authorize access="hasRole('ROLE_USER')">	
	
	<!-- ******* SLIDER START ******* -->
	
	<div id="slider" class="owl-carousel owl-theme">

		<div class="item">
			<a><img src="resources/img/slide1.jpg" alt=""
				class="img-responsive"></a>
		</div>
		<div class="item">
			<a href="#"><img src="resources/img/slide2.jpg" alt=""
				class="img-responsive"></a>
		</div>
		<div class="item">
			<a href="#"><img src="resources/img/slide3.jpg" alt=""
				class="img-responsive"></a>
		</div>
		<div class="item">
			<a href="#"><img src="resources/img/slide4.jpg" alt=""
				class="img-responsive"></a>
		</div>
		<div class="item">
			<a href="#"><img src="resources/img/slide5.jpg" alt=""
				class="img-responsive"></a>
		</div>
		<div class="item">
			<a href="#"><img src="resources/img/slide6.jpg" alt=""
				class="img-responsive"></a>
		</div>
	</div>

	<!-- ****** SLIDER END ****** -->

	<div id="all">

	<!-- ****** ADVANTAGES START****** -->

		<div id="advantages">
			<div class="container">
				<div class="col-md-12">
					<div class="box text-center">
						<h3 class="text-uppercase">About Shopping Cart</h3>
						<p>
							<a href="#"><strong>Shopping Cart</strong></a> we are
							the Earth's most customer centric company. We care for you...
						</p>
						<div class="same-height-row row">
							<div class="col-sm-3">
								<div
									class="box same-height clickable no-border text-center-xs text-center-sm">
									<div class="icon">
										<i class="fa fa-heart-o"></i>
									</div>
									<h4>
										<a href="#">Satisfied customers</a>
									</h4>
								</div>
							</div>
							<div class="col-sm-3">
								<div
									class="box same-height clickable no-border text-center-xs text-center-sm">
									<div class="icon">
										<i class="fa fa-tags"></i>
									</div>
									<h4>
										<a href="#">Best prices</a>
									</h4>
								</div>
							</div>
							<div class="col-sm-3">
								<div
									class="box same-height clickable no-border text-center-xs text-center-sm">
									<div class="icon">
										<i class="fa fa-send-o"></i>
									</div>
									<h4>
										<a href="#">Next day delivery</a>
									</h4>
								</div>
							</div>
							<div class="col-sm-3">
								<div
									class="box same-height clickable no-border text-center-xs text-center-sm">
									<div class="icon">
										<i class="fa fa-refresh"></i>
									</div>
									<h4>
										<a href="#">Free returns within 15 days</a>
									</h4>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	<!-- ******* ADVANTAGES END ******* -->

	<!-- ****** FOOTER START****** -->

		<div id="footer">
			<div class="container">
				<div class="col-md-3 col-sm-6">
					<h4>Pages</h4>
					<ul>
						<li><a href="#">About us</a></li>
						<li><a href="#">Terms and conditions</a></li>
						<li><a href="#">FAQ</a></li>
						<li><a href="#">Contact us</a></li>
					</ul>
					<hr>
					<h4>User section</h4>
					<ul>
						<li><a href="login">Login</a></li>
						<li><a href="${signup}">Sign Up</a></li>
					</ul>
					<hr class="hidden-md hidden-lg hidden-sm">
				</div>
				<div class="col-md-3 col-sm-6">
					<h4>Top categories</h4>

					<c:forEach items="${categoryList}" var="ctg">
						<ul>
							<li><a href="#">${ctg.name}</a></li>
						</ul>
					</c:forEach>
					<hr class="hidden-md hidden-lg">
				</div>
				<div class="col-md-3 col-sm-6">
					<h4>Where to find us</h4>
					<p>
						<strong>NIIT</strong> <br> Raja S.C.Mullick Road <br>
						Garia<br> Kolkata-47 <br> West Bengal <br> <strong>India</strong>
					</p>
					<hr>
					<a href="#">Go to contact page</a>
				</div>
				<div class="col-md-3 col-sm-6">
					<h4>Get the news</h4>
					<p class="text-muted">Lorem ipsum dolor sit amet, consectetur
						adipiscing elit, sed do eiusmod tempor.</p>
					<form>
						<div class="input-group">
							<input type="text" class="form-control"> <span
								class="input-group-btn">
								<button class="btn btn-default" type="button">Subscribe!</button>
							</span>
						</div>
					</form>
					<hr>
					<h4>Stay in touch</h4>
					<p class="social">
						<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
							class="fa fa-instagram"></i></a> <a href="#"><i
							class="fa fa-google-plus"></i></a> <a href="#"><i
							class="fa fa-twitter"></i></a>
					</p>
				</div>
			</div>
		</div>
		
	<!-- ****** FOOTER END ******* -->

	<!-- ****** COPYRIGHT START******* -->

		<div id="copyright">
			<div class="container">
				<div class="col-md-12">
					<p class="pull-left">
						&copy; 2016.<a href="#"><strong>Shopping Cart - </strong></a>Copyright
						by <strong>NIIT Ltd.</strong>
					</p>
				</div>
			</div>
		</div>

	<!-- ****** COPYRIGHT END ****** -->

	</div>
	</security:authorize>
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ROLE_USER end ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

	<!-- #### JAVASCRIPT FILES ### -->
	<script src="resources/js/jquery-1.11.0.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/jquery.cookie.js"></script>
	<script src="resources/js/front.js"></script>

	<!-- owl carousel -->
	<script src="resources/js/owl.carousel.min.js"></script>

</body>


</html>