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
		<!-- ****************************************** TOP HEADER START ************************************************** -->
		<!-- Fixed navbar -->
		<nav class="navbar navbar-default navbar-fixed-top"  style="background-color: gold;" >
		<div class="container">
			<div class="navbar-header">
				<a class="btn btn-primary navbar-toggle" href="#cart"> <i
					class="fa fa-shopping-cart"></i> <span class="hidden-xs"></span>
				</a>
				<button type="button" class="navbar-toggle btn-default" data-toggle="collapse" data-target="#search">
					<span class="sr-only">Toggle search</span> <i class="fa fa-search"></i>
				</button>
				<button type="button" class="navbar-toggle btn-default" data-toggle="collapse" data-target="#logout">
					<span class="sr-only">Logout</span> <i class="fa fa-users"></i>
				</button>
			</div>	
			<div id="navbar" class="navbar-collapse collapse" style="float: right;     padding-top: 5px; ">
				<ul class="nav navbar-nav navbar-right">
					<c:choose>
						<c:when test="${empty loggedUser}">
							<li><a href="login">login</a></li>
							<li><a href="register">Signup</a></li>
						</c:when>	
						<c:when test="${not empty loggedUser}">
							<li><a href="logout">Logout</a></li>
							<li><a href="#">MyCart</a></li>	
							<!-- showing message on navbar after login -->	
							<li><a style="text-decoration: none;">Welcome!	${loggedUser}</a></li>
						</c:when>
					</c:choose>
				</ul>	
			</div>
			<div class="navbar-collapse collapse left" id="basket-overview">
				<a href="#" class="btn btn-primary navbar-btn"><i class="fa fa-shopping-cart"></i></a>
			</div>
			<!-- /.nav-collapse -->	
			<div class="navbar-collapse collapse left">
				<button type="button" class="btn navbar-btn btn-default" data-toggle="collapse" data-target="#search">
					<span class="sr-only">Toggle search</span> <i class="fa fa-search"></i>
				</button>
			</div>	
			<div class="collapse clearfix" id="search">	
				<form class="navbar-form" role="search">
					<div class="input-group">
						<input type="text" class="form-control" placeholder="Search">
						<span class="input-group-btn">	
							<button type="submit" class="btn btn-primary">
								<i class="fa fa-search"></i>
							</button>	
						</span>
					</div>
				</form>	
			</div>	
			<!--/.nav-collapse -->
		</div>
		</nav>
	
		<!-- ****************************************** TOP HEADER END ************************************************** -->
	
	
		<!-- ********************************************** NAVBAR START ************************************************** -->
	
		<div class="navbar navbar-default yamm" role="navigation" id="navbar" style="padding-top: 48px; background-color: whitesmoke;" >
			<div class="container" >
	
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
						<li><a href="home">Home</a></li>
						
						<!-- category list fetching on navbar -->
						<c:forEach items="${categoryList}" var="ctg">
						
						<li class="dropdown yamm-fw"><a href="#" class="dropdown-toggle" data-toggle="dropdown">${ctg.name}<b class="caret"></b></a>
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
							</ul>
						</li>
					</c:forEach>	
					</ul>					
				</div>	
								
			</div>	
		</div>
	
		<!-- ********************************************** NAVBAR END ************************************************** -->
		
	
		<!-- ~~~~~~~~~~~~~~~~~~~~ Admin work start ~~~~~~~~~~~~~~~~~~~~ -->
	
		
		
		
		
		
		<!-- AdminController -->		
		<div id="admin">
			<c:if test="${isAdmin == true }">
				<%@include file="admin.jsp"%>
			</c:if>
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
		
		<!-- ~~~~~~~~~~~~~~~~~~~~ Admin work end ~~~~~~~~~~~~~~~~~~~~ -->
	
		<!-- ********************************************* Message START ************************************************ -->
	
		<div id="message">
			<div class="container">
				<div class="row">
					<div class="col-md-4 col-md-offset-4">
						<div class="table-responsive">
							<form:form action="home">
								<table class="table table-condensed">
	
	
	
									<c:choose>
										<c:when test="${registeredUser == true}">
											<li><a style="text-decoration: none;">${registrationMsg}</a></li>
										</c:when>
										<c:when test="${loggedOut}">
											<li><a style="text-decoration: none;">${logoutMessage}</a></li>
										</c:when>
									</c:choose>
	
	
	
								</table>
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	
		<!-- ********************************************* Message START ************************************************ -->
		
		<!-- ************************************************ SLIDER *************************************************** -->
	
	
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
			<!-- /.item -->
	
		</div>
		<!-- /#slider -->
	
		<!-- ********************************************* SLIDER END ************************************************** -->

		<div id="all">

			<!-- *********************************************** ADVANTAGES ************************************************ -->
	
			<div id="advantages">	
				<div class="container">	
					<div class="col-md-12">	
						<div class="box text-center">
							<h3 class="text-uppercase">About Shopping Cart</h3>
							<p><a href="index.html"><strong>Shopping Cart</strong></a> we are the Earth's most customer centric company. We care for you...</p>	
							<div class="same-height-row row">	
								<div class="col-sm-3">	
									<div class="box same-height clickable no-border text-center-xs text-center-sm">
										<div class="icon">
											<i class="fa fa-heart-o"></i>
										</div>
										<h4>
											<a href="#">Satisfied customers</a>
										</h4>
									</div>	
								</div>
								<!-- /.col-sm-3 -->
	
								<div class="col-sm-3">	
									<div class="box same-height clickable no-border text-center-xs text-center-sm">
										<div class="icon">
											<i class="fa fa-tags"></i>
										</div>
										<h4>
											<a href="#">Best prices</a>
										</h4>
									</div>	
								</div>
								<!-- /.col-sm-3 -->
	
								<div class="col-sm-3">	
									<div class="box same-height clickable no-border text-center-xs text-center-sm">
										<div class="icon">
											<i class="fa fa-send-o"></i>
										</div>
										<h4>
											<a href="#">Next day delivery</a>
										</h4>
									</div>	
								</div>
								<!-- /.col-sm-3 -->
	
								<div class="col-sm-3">	
									<div class="box same-height clickable no-border text-center-xs text-center-sm">
										<div class="icon">
											<i class="fa fa-refresh"></i>
										</div>
										<h4>
											<a href="#">Free returns within 15 days</a>
										</h4>
									</div>	
								</div>
								<!-- /.col-sm-3 -->
									
							</div>	
						</div>	
					</div>
					<!-- /.col-md-12 -->	
				</div>
				<!-- /.container -->	
			</div>
			<!-- /#advantage -->
	
			<!-- ********************************************** ADVANTAGES END **************************************************** -->
	
	

			<!-- ************************************************** FOOTER ******************************************************** -->
	
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
							<li><a href="register">Register</a></li>
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
							<strong>NIIT</strong> <br>
							Raja S.C.Mullick Road <br>
							Garia<br>
							Kolkata-47 <br>
							West Bengal <br> 
							<strong>India</strong>
						</p>
						<hr>
						<a href="#">Go to contact page</a>	
					</div>	
					<div class="col-md-3 col-sm-6">	
						<h4>Get the news</h4>
						<p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.</p>
						<form>	
							<div class="input-group">	
								<input type="text" class="form-control"> 
									<span class="input-group-btn">
										<button class="btn btn-default" type="button">Subscribe!</button>
									</span>	
							</div>
							<!-- /input-group -->	
						</form>
						<hr>
						<h4>Stay in touch</h4>
						<p class="social">
							<a href="#"><i class="fa fa-facebook"></i></a> 
							<a href="#"><i class="fa fa-instagram"></i></a> 
							<a href="#"><i class="fa fa-google-plus"></i></a> 
							<a href="#"><i class="fa fa-twitter"></i></a>
						</p>	
					</div>
					<!-- /.col-md-3 -->	
				</div>
				<!-- /.container -->	
			</div>
			<!-- /#footer -->
	
		<!-- ************************************************ FOOTER END ******************************************************** -->
	
	    <!-- *********************************************** COPYRIGHT ********************************************************** -->
	
			<div id="copyright">	
				<div class="container">	
					<div class="col-md-12">	
						<p class="pull-left">
							&copy; 2016.<a href="#"><strong>Shopping Cart - </strong></a>Copyright by <strong>NIIT Ltd.</strong>
						</p>	
					</div>
					<!-- /.col-md-12 -->	
				</div>
				<!-- /.container -->	
			</div>
			
		<!-- ********************************************* COPYRIGHT END ******************************************************** -->
		
		</div>
		
		<!-- /#all -->
	
		<!-- #### JAVASCRIPT FILES ### -->
		<script src="resources/js/jquery-1.11.0.min.js"></script>
		<script src="resources/js/bootstrap.min.js"></script>
		<script src="resources/js/jquery.cookie.js"></script>
		<script src="resources/js/front.js"></script>
		
		<!-- owl carousel -->
		<script src="resources/js/owl.carousel.min.js"></script>
	
	</body>


</html>