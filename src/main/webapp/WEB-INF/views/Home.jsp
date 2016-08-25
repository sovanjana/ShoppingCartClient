<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

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
    <link href="resources/css/style.default.css" rel="stylesheet" id="theme-stylesheet">

    <link rel="shortcut icon" href="resources/favicon.png">
    
    <!-- owl carousel css -->
    <link href="resources/css/owl.carousel.css" rel="stylesheet">
    <link href="resources/css/owl.theme.css" rel="stylesheet">

</head>

<body>

    <!-- ********************************************** NAVBAR START ************************************************** -->

    <div class="navbar navbar-default navbar-fixed-top yamm" role="navigation" id="navbar">
        <div class="container">
            <div class="navbar-header">

                <div class="navbar-buttons">
                
                    <button type="button" class="navbar-toggle btn-primary" data-toggle="collapse" data-target="#navigation">
                        <span class="sr-only">Toggle navigation</span>
                        <i class="fa fa-align-justify"></i>
                    </button>
                    <a class="btn btn-primary navbar-toggle" href="#">
                        <i class="fa fa-shopping-cart"></i>  <span class="hidden-xs"></span>
                    </a>
                    <button type="button" class="navbar-toggle btn-default" data-toggle="collapse" data-target="#search">
                        <span class="sr-only">Toggle search</span>
                        <i class="fa fa-search"></i>
                    </button>
                    <button type="button" class="navbar-toggle btn-default" data-toggle="modal" data-target="#login-modal">
                        <span class="sr-only">User login</span>
                        <i class="fa fa-users"></i>
                    </button>

                </div>
            </div>
            

            <div class="navbar-collapse collapse" id="navigation">

                <ul class="nav navbar-nav navbar-left">
                    <li><a href="home">Home</a></li>
                    <%--<li class="dropdown yamm-fw">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Men<b class="caret"></b></a>
                        <ul class="dropdown-menu">

                            <li>
                                <div class="yamm-content">
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <img src="resources/img/men.jpg" class="img-responsive hidden-xs" alt="">
                                        </div>
                                        <div class="col-sm-3">
                                            <h3>Clothing</h3>
                                            <ul>
                                                <li><a href="#">T-shirts</a>
                                                </li>
                                                <li><a href="#">Shirts</a>
                                                </li>
                                                <li><a href="#">Pants</a>
                                                </li>
                                                <li><a href="#">Accessories</a>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="col-sm-3">
                                            <h3>Clothing</h3>
                                            <ul>
                                                <li><a href="#">T-shirts</a>
                                                </li>
                                                <li><a href="#">Shirts</a>
                                                </li>
                                                <li><a href="#">Pants</a>
                                                </li>
                                                <li><a href="#">Accessories</a>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="col-sm-3">
                                            <h3>Shoes</h3>
                                            <ul>
                                                <li><a href="#">Trainers</a>
                                                </li>
                                                <li><a href="#">Sandals</a>
                                                </li>
                                                <li><a href="#">Hiking shoes</a>
                                                </li>
                                                <li><a href="#">Casual</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="footer clearfix hidden-xs">
                                    <h4 class="pull-right">Men</h4>
                                    <div class="buttons pull-left">
                                        <a href="#" class="btn btn-default"><i class="fa fa-tags"></i> Sales</a>
                                        <a href="#" class="btn btn-default"><i class="fa fa-star-o"></i> Favourites</a>
                                        <a href="#" class="btn btn-default"><i class="fa fa-globe"></i> Brands</a>
                                    </div>
                                </div>

                            </li>
                        </ul>
                    </li>
                    <li class="dropdown yamm-fw">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Women <b class="caret"></b></a>
                        <ul class="dropdown-menu">

                            <li>
                                <div class="yamm-content">
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <img src="resources/img/women.jpg" class="img-responsive hidden-xs" alt="">
                                        </div>
                                        <div class="col-sm-3">
                                            <h3>Clothing</h3>
                                            <ul>
                                                <li><a href="#">T-shirts</a>
                                                </li>
                                                <li><a href="#">Shirts</a>
                                                </li>
                                                <li><a href="#">Pants</a>
                                                </li>
                                                <li><a href="#">Accessories</a>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="col-sm-3">
                                            <h3>Clothing</h3>
                                            <ul>
                                                <li><a href="#">T-shirts</a>
                                                </li>
                                                <li><a href="#">Shirts</a>
                                                </li>
                                                <li><a href="#">Pants</a>
                                                </li>
                                                <li><a href="#">Accessories</a>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="col-sm-3">
                                            <h3>Shoes</h3>
                                            <ul>
                                                <li><a href="#">Trainers</a>
                                                </li>
                                                <li><a href="#">Sandals</a>
                                                </li>
                                                <li><a href="#">Hiking shoes</a>
                                                </li>
                                                <li><a href="#">Casual</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="footer clearfix hidden-xs">
                                    <h4 class="pull-right">Women</h4>
                                    <div class="buttons pull-left">
                                        <a href="#" class="btn btn-default"><i class="fa fa-tags"></i> Sales</a>
                                        <a href="#" class="btn btn-default"><i class="fa fa-star-o"></i> Favourites</a>
                                        <a href="#" class="btn btn-default"><i class="fa fa-globe"></i> Brands</a>
                                    </div>
                                </div>

                            </li>
                        </ul>
                    </li>
                    <li class="dropdown yamm-fw">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="200">Template <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <div class="yamm-content">
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h5>Homepage</h5>
                                            <ul>
                                                <li><a href="index.html">Homepage</a>
                                                </li>
                                            </ul>
                                            <h5>Shop</h5>
                                            <ul>
                                                <li><a href="#">Category</a>
                                                </li>
                                                <li><a href="#">Product detail</a>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="col-sm-3">
                                            <h5>User</h5>
                                            <ul>
                                                <li><a href="#">Register / login</a>
                                                </li>
                                                <li><a href="#">Orders history</a>
                                                </li>
                                                <li><a href="#">Order history detail</a>
                                                </li>
                                                <li><a href="#">Wishlist</a>
                                                </li>
                                                <li><a href="#">Customer account / change password</a>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="col-sm-3">
                                            <h5>Order process</h5>
                                            <ul>
                                                <li><a href="#">Shopping cart</a>
                                                </li>
                                                <li><a href="#">Checkout - Address</a>
                                                </li>
                                                <li><a href="#">Checkout - Delivery Method</a>
                                                </li>
                                                <li><a href="#">Checkout - Payment Method</a>
                                                </li>
                                                <li><a href="#">Checkout - Order Review</a>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="col-sm-3">
                                            <h5>Pages and blog</h5>
                                            <ul>
                                                <li><a href="#">Blog listing</a>
                                                </li>
                                                <li><a href="#">Blog Post</a>
                                                </li>
                                                <li><a href="#">FAQ</a>
                                                </li>
                                                <li><a href="#">Contact</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>      <!-- /.yamm-content -->
                            </li>
                        </ul>
                    </li>--%>
                    <li><a href="#">Contact</a></li>                                    
                    
                    <c:choose>
                    	<c:when test = "${empty loggedUser}">
                    		<li><a href="login">login</a></li>                    
                    		<li><a href="#">Register</a></li>
                    	</c:when>
                    	<c:when test="${not empty loggedUser}">
                    		<li>Welcome!</li>
                    		<li><a href="#">Logout</a></li>
                    		<li><a href="#">MyCart</a></li>
                    	</c:when>
                    </c:choose>
               </ul>

            </div>      <!--/.nav-collapse -->

            <div class="navbar-collapse collapse right" id="basket-overview">
                <a href="#" class="btn btn-primary navbar-btn"><i class="fa fa-shopping-cart"></i></a>
            </div>      /.nav-collapse

            <div class="navbar-collapse collapse right">
                <button type="button" class="btn navbar-btn btn-default" data-toggle="collapse" data-target="#search">
                    <span class="sr-only">Toggle search</span>
                    <i class="fa fa-search"></i>
                </button>
            </div>

            <div class="navbar-collapse collapse right">
                <button type="button" class="btn navbar-btn btn-default" data-toggle="modal" data-target="#login-modal">
                    <span class="sr-only">User login</span>
                    <i class="fa fa-users"></i>
                </button>
            </div>

            <div class="collapse clearfix" id="search">

                <form class="navbar-form" role="search">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Search">
                        <span class="input-group-btn">

			<button type="submit" class="btn btn-primary"><i class="fa fa-search"></i></button>

		    </span>
                    </div>
                </form>

            </div>      <!--/.nav-collapse -->

        </div>

    </div>      <!-- /#navbar -->
    
    
    
    
    

   <!--  ~~~~~~ LOGIN MODAL START ~~~~~ -->

    <%-- <div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="Login" aria-hidden="true">
        <div class="modal-dialog modal-sm">

            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="Login">Customer login</h4>
                </div>
                <div class="modal-body">
                    <form action="#" method="post">
                        <div class="form-group">
                            <input type="text" class="form-control" id="email" placeholder="email">
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control" id="password" placeholder="password">
                        </div>

                        <p class="text-center">
                            <button class="btn btn-primary"><i class="fa fa-sign-in"></i> Log in</button>
                        </p>

                    </form>

                    <p class="text-center text-muted">Not registered yet?</p>
                    <p class="text-center text-muted"><a href="register.html"><strong>Register now</strong></a>! It is easy and done in 1&nbsp;minute and gives you access to special discounts and much more!</p>

                </div>
            </div>
        </div>
    </div> --%>

    <!-- ~~~~~~ LOGIN MODAL END ~~~~~ -->

    
    <!-- ********************************************** NAVBAR END ************************************************** -->

	<!-- Admin -->
	
	<div id="admin">
		<c:if test="${isAdmin == true }">
			<%@include  file= "admin.jsp"%>
		</c:if>
		<div id="supplier">
			<c:if test="${isAdminClickedSuppliers == true}">
				<%@ include file = "admin.jsp" %>
				<%@ include file = "supplier.jsp" %>
			</c:if>
		</div>
		<div id="category">
			<c:if test="${isAdminClickedCategories == true}">
				<%@ include file = "admin.jsp" %>
				<%@ include file = "category.jsp" %>
			</c:if>
		</div>
		<div id="product">
			<c:if test="${isAdminClickedProducts == true}">
				<%@ include file = "admin.jsp" %>
				<%@ include file = "product.jsp" %>
			</c:if>
		</div>
		
	</div>
	<div id="loginHere">
		<c:if test="${userClickedLogin == true || invalidData == true}">
			<div id="error">
				${errorMessage}
			</div>
			<%@ include file = "login.jsp" %>
		</c:if>		
	</div>
	
	
	
	
	
	

<%--     <!-- ********************************************* SLIDER START ************************************************ -->


    <div id="slider" class="owl-carousel owl-theme">
    
        <div class="item">
            <a><img src="resources/img/slide1.jpg" alt="" class="img-responsive"></a>
        </div>
        <div class="item">
            <a href="#"><img src="resources/img/slide2.jpg" alt="" class="img-responsive"></a>
        </div>
        <div class="item">
            <a href="#"><img src="resources/img/slide3.jpg" alt="" class="img-responsive"></a>
        </div>
        <div class="item">
            <a href="#"><img src="resources/img/slide4.jpg" alt="" class="img-responsive"></a>
        </div>
        <div class="item">
            <a href="#"><img src="resources/img/slide5.jpg" alt="" class="img-responsive"></a>
        </div>
        <div class="item">
            <a href="#"><img src="resources/img/slide6.jpg" alt="" class="img-responsive"></a>
       
         </div>      <!-- /.item -->

    </div>      <!-- /#slider -->

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
                                <h4><a href="#">Satisfied customers</a></h4>
                            </div>
                
                        </div>      <!-- /.col-sm-3 -->
                
                        <div class="col-sm-3">
                
                            <div class="box same-height clickable no-border text-center-xs text-center-sm">
                                <div class="icon">
                                    <i class="fa fa-tags"></i>
                                </div>
                                <h4><a href="#">Best prices</a></h4>
                            </div>
                
                        </div>      <!-- /.col-sm-3 -->
                
                        <div class="col-sm-3">
                
                            <div class="box same-height clickable no-border text-center-xs text-center-sm">
                                <div class="icon">
                                    <i class="fa fa-send-o"></i>
                                </div>
                                <h4><a href="#">Next day delivery</a></h4>
                            </div>
                
                        </div>      <!-- /.col-sm-3 -->
                
                        <div class="col-sm-3">
                
                            <div class="box same-height clickable no-border text-center-xs text-center-sm">
                                <div class="icon">
                                    <i class="fa fa-refresh"></i>
                                </div>
                                <h4><a href="#">Free returns within 15 days</a></h4>
                            </div>
                
                        </div>      <!-- /.col-sm-3 -->
                
                    </div>

                </div>

            </div>      <!-- /.col-md-12 -->

        </div>      <!-- /.container -->

    </div>      <!-- /#advantage -->
    
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
                    <li><a href="#" data-toggle="modal" data-target="#login-modal">Login</a></li>
                    <li><a href="register.html">Regiter</a></li>
                </ul>
                <hr class="hidden-md hidden-lg hidden-sm">

            </div>

            <div class="col-md-3 col-sm-6">
            
                <h4>Top categories</h4>
                <h5>Men</h5>
                <ul>
                    <li><a href="#">T-shirts</a></li>
                    <li><a href="#">Shirts</a></li>
                    <li><a href="#">Accessories</a></li>
                </ul>
                <h5>Ladies</h5>
                <ul>
                    <li><a href="#">T-shirts</a></li>
                    <li><a href="#">Skirts</a></li>
                    <li><a href="#">Pants</a></li>
                    <li><a href="#">Accessories</a></li>
                </ul>
                    <hr class="hidden-md hidden-lg">

            </div>
            
            <div class="col-md-3 col-sm-6">

                <h4>Where to find us</h4>
                <p><strong>NIIT Ltd.</strong>
                    <br>Raja S.C.Mullick Road
                    <br>Garia
                    <br>Kolkata-47
                    <br>West Bengal
                    <br>
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
                        <span class="input-group-btn"><button class="btn btn-default" type="button">Subscribe!</button></span>
                    
                    </div>      <!-- /input-group -->
                
                </form>
                <hr>
                <h4>Stay in touch</h4>
                <p class="social">
                    <a href="#"><i class="fa fa-facebook-square"></i></a>
                    <a href="#"><i class="fa fa-instagram"></i></a>
                    <a href="#"><i class="fa fa-google-plus"></i></a>
                    <a href="#"><i class="fa fa-envelope"></i></a>
                </p>
            
            </div>    <!-- /.col-md-3 -->

        </div>    <!-- /.container -->

    </div>    <!-- /#footer -->

   <!-- ************************************************ FOOTER END ******************************************************** -->

    <!-- *********************************************** COPYRIGHT ********************************************************** -->
 
    <div id="copyright">

        <div class="container">
        
            <div class="col-md-12">
        
                <p class="pull-left">&copy; 2016.<a href="index.html"><strong>Shopping Cart - </strong></a>Copyright by <strong>NIIT</strong></a></p>
                        
            </div>      <!-- /.col-md-12 -->
        
        </div>      <!-- /.container -->

    </div>      <!-- /#copyright -->
    
    <!-- ********************************************* COPYRIGHT END ******************************************************** -->
    </div>
    <!-- /#all --> 

    --%>


    <!-- #### JAVASCRIPT FILES ### -->

    <script src="resources/js/jquery-1.11.0.min.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>
    <script src="resources/js/jquery.cookie.js"></script>
    <script src="resources/js/front.js"></script>

    

    <!-- owl carousel -->
    <script src="resources/js/owl.carousel.min.js"></script>

</body>


</html>