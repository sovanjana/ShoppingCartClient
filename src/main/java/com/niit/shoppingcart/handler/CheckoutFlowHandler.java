package com.niit.shoppingcart.handler;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

import com.niit.shoppingcart.dao.BillingAddressDAO;
import com.niit.shoppingcart.dao.CartDAO;
import com.niit.shoppingcart.dao.CartItemDAO;
import com.niit.shoppingcart.dao.UserDetailsDAO;
import com.niit.shoppingcart.model.BillingAddress;
import com.niit.shoppingcart.model.Cart;
import com.niit.shoppingcart.model.CartItem;
import com.niit.shoppingcart.model.Product;
import com.niit.shoppingcart.model.UserDetails;
import com.niit.shoppingcart.view.CheckoutDetails;

@Component
public class CheckoutFlowHandler {
	
	@Autowired
	Product product;	
	
	@Autowired
	private BillingAddress billingAddress;
	@Autowired
	private BillingAddressDAO billingAddressDAO;
	
	@Autowired
	UserDetails userDetails;	
	@Autowired
	UserDetailsDAO userDetailsDAO;
	
	@Autowired
	Cart cart;
	@Autowired
	CartDAO cartDAO;
	
	@Autowired
	CartItem cartItem;
	@Autowired
	CartItemDAO cartItemDAO;
	
	@Autowired
	HttpSession httpSession;
	
	CheckoutDetails checkoutDetails = new CheckoutDetails();

	public CheckoutDetails initFlow() {
		System.out.println("reached initFlow method of CheckOutFlowHandler...");
		
		userDetails = userDetailsDAO.get(SecurityContextHolder.getContext().getAuthentication().getName());
		checkoutDetails.setCart(cartDAO.getCartByUserId(userDetails.getId()));
		checkoutDetails.setUserDetails(userDetailsDAO.get(userDetails.getName()));
		
		System.out.println("leaving initFlow method of CheckOutFlowHandler...");
		return checkoutDetails;
	}
	
	public String addBillingAddress(CheckoutDetails checkoutDetails, BillingAddress billingAddress, UserDetails userDetails) {
		System.out.println("reached addBillingAddress method of CheckOutFlowHandler...");
		
		userDetails = userDetailsDAO.get(SecurityContextHolder.getContext().getAuthentication().getName());
		billingAddress.setUserId(userDetails.getId());
		checkoutDetails.setBillingAddress(billingAddress);	
		
		this.billingAddress.setBillingAddressId(billingAddress.getBillingAddressId());
		this.billingAddress.setUserId(userDetails.getId());
		this.billingAddress.setLine1(billingAddress.getLine1());
		this.billingAddress.setLine2(billingAddress.getLine2());
		this.billingAddress.setCity(billingAddress.getCity());
		this.billingAddress.setState(billingAddress.getState());
		this.billingAddress.setCountry(billingAddress.getCountry());
		this.billingAddress.setZipCode(billingAddress.getZipCode());
		
		System.out.println("leaving addBillingAddress method of CheckOutFlowHandler...");
		return "success";
	}
	
	public String saveOrderDetails(){
		//userDetails = userDetailsDAO.get(SecurityContextHolder.getContext().getAuthentication().getName());
		//List<CartItem> list = cartItemDAO.getCartItemByUserId(userDetails.getId());
		//cart = cartDAO.getCartByUserId(userDetails.getId());
		//cart.setCartId(cart.getCartId());
		//cart.setUserId(cart.getUserId());
		//cart.setCountProducts(list.size());
		//cartDAO.saveOrUpdate(cart);
		
		billingAddressDAO.saveOrUpdate(checkoutDetails.getBillingAddress());
		
		//httpSession.setAttribute("countProducts", cart.getCountProducts());
		
		return "success";
	}
	
}
