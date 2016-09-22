package com.niit.shoppingcart.view;

import java.io.Serializable;

import com.niit.shoppingcart.model.CartItem;

public class CartItemModel implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 11L;
	
	private CartItem cartItem;
	
	private String productName;
	
	private String productImage;

	public CartItemModel() {
	}

	public CartItemModel(CartItem cartItem, String productName) {
		this.cartItem = cartItem;
		this.productName = productName;
	}

	/* getters/setters for all the fields taken... */
	
	public CartItem getCartItem() {
		return cartItem;
	}

	public String getProductImage() {
		return productImage;
	}

	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}

	public void setCartItem(CartItem cartItem) {
		this.cartItem = cartItem;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

}
