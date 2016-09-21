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
		
		<link href="resources/css/singleproductstyle.css" rel="stylesheet">
	</head>
	
	<body>
		<div class="heading-banner">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <ul class="breadcrumb">
                        <li><a href="/ShoppingCartClient/">Home</a></li>
                        <li class="active">Product Details</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="single-product-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <div class="row">
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <div class="single-pro-tab-content">
                                <div class="tab-content">
                                    <div role="tabpanel" class="tab-pane active" id="home">
                                        <a href="#"><img src="${pageContext.request.contextPath}/${product.productImage}" alt="" /></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-6 col-xs-12 shop-list">
                            <div class="product-info product-single">
                                <h3>
                                    <a href="single-product.html">${product.name}</a></h3>
                                <div class="pro-rating">
                                    <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
                                        class="fa fa-star"></i><i class="fa fa-star"></i><a class="reviews" href="#">16 reviews</a>
                                    | <a class="add-review" href="#">Add Your Review</a>
                                </div>
                                <div class="pro-price">
                                    <span class="normal">${product.price}</span>
                                </div>
                                <hr class="page-divider">
                                <div class="product-desc">
                                    <p>${product.description}</p>
                                </div>
                                <hr class="page-divider">
                               
                                <div class="product-action">
                                    <div class="pro-button-top">
                                        <a href="#">Buy Now</a>
                                    </div>
                                    <div class="pro-button-bottom">
                                        <a href="user/cart/addToCart/${product.id}"><i class="fa fa-shopping-cart"></i></a>
                                    </div>
                                </div>
                                <hr class="page-divider small">
                                <table>
                                    <tbody>
                                        <tr>
                                            <td class="title">Product ID : </td>
                                            <td>${product.id}</td>
                                        </tr>
                                        <tr>
                                        	<td class="title">Product Name : </td>
                                            <td>${product.name}</td>
                                        </tr>
                                        <tr>
                                            <td class="title">Category : </td>
                                            <td>${product.category.name}</td>
                                        </tr>
                                        <tr>
                                        	<td class="title">Supplier : </td>
                                            <td>${product.supplier.name}</td>
                                        </tr>                                        
                                    </tbody>
                                </table>                                
                            </div>
                        </div>
                    </div>                    
                </div>
            </div>
        </div>
    </div>
    
    
    
    
    
    <!-- #### JAVASCRIPT FILES ### -->
		<script src="resources/js/jquery-1.11.0.min.js"></script>
		<script src="resources/js/bootstrap.min.js"></script>
		<script src="resources/js/jquery.cookie.js"></script>
		<script src="resources/js/front.js"></script>
		<script src="resources/js/main.js"></script>
		<script src="resources/js/plugins.js"></script>
		
		<!-- owl carousel -->
		<script src="resources/js/owl.carousel.min.js"></script>
	
	</body>
</html>