package com.niit.shoppingcart.view;

import java.io.Serializable;

import com.niit.shoppingcart.model.BillingAddress;
import com.niit.shoppingcart.model.Cart;
import com.niit.shoppingcart.model.UserDetails;

public class CheckoutDetails implements Serializable {	
	/**
	 * 
	 */
	private static final long serialVersionUID = 11L;

	private BillingAddress billingAddress;
	
	private Cart cart;
	
	private UserDetails userDetails;
	
	/* Constructor (with and without parameter)... */

	public CheckoutDetails(BillingAddress billingAddress, Cart cart, UserDetails userDetails) {
		this.billingAddress = billingAddress;
		this.cart = cart;
		this.userDetails = userDetails;
	}
	public CheckoutDetails() {
	}	
	
	/* getters/setters for all the fields taken... */
	
	public BillingAddress getBillingAddress() {
		return billingAddress;
	}
	public void setBillingAddress(BillingAddress billingAddress) {
		this.billingAddress = billingAddress;
	}

	public Cart getCart() {
		return cart;
	}
	public void setCart(Cart cart) {
		this.cart = cart;
	}

	public UserDetails getUserDetails() {
		return userDetails;
	}
	public void setUserDetails(UserDetails userDetails) {
		this.userDetails = userDetails;
	}
	
	
}