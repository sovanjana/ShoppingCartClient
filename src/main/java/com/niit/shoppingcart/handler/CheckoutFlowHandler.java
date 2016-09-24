package com.niit.shoppingcart.handler;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.binding.message.MessageBuilder;
import org.springframework.binding.message.MessageContext;
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
		userDetails = userDetailsDAO.get(SecurityContextHolder.getContext().getAuthentication().getName());
		checkoutDetails.setCart(cartDAO.getCartByUserId(userDetails.getId()));
		checkoutDetails.setUserDetails(userDetailsDAO.get(userDetails.getName()));
		return checkoutDetails;
	}
	
	/*public String validateDetails(CheckoutDetails checkoutDetails, BillingAddress billingAddress, MessageContext messageContext){
		
		String status = "success";
		
		this.billingAddress.setUserId(userDetails.getId());
		
		if(billingAddress.getLine1().isEmpty()){
			messageContext.addMessage(new MessageBuilder().error().source("line1").defaultText("line1 cannot be Empty").build());
		
			status = "failure";
		}		
		if(billingAddress.getCity().isEmpty()){
			messageContext.addMessage(new MessageBuilder().error().source("city").defaultText("city name cannot be Empty").build());
		
			status = "failure";
		}		
		if(billingAddress.getState().isEmpty()){
			messageContext.addMessage(new MessageBuilder().error().source("state").defaultText("state name cannot be Empty").build());
		
			status = "failure";
		}		
		if(billingAddress.getCountry().isEmpty()){
			messageContext.addMessage(new MessageBuilder().error().source("country").defaultText("country name cannot be Empty").build());
		
			status = "failure";
		}		
		if(billingAddress.getZipCode().isEmpty()){
			messageContext.addMessage(new MessageBuilder().error().source("zipCode").defaultText("Zip Code is mandatory").build());
		
			status = "failure";
		}		
		return status;
	}*/

	public String addBillingAddress(CheckoutDetails checkoutDetails, BillingAddress billingAddress) {
		System.out.println("i'm in addBillingAddress method...1");
		
		userDetails = userDetailsDAO.getUserDetailsByName(SecurityContextHolder.getContext().getAuthentication().getName());
		
		System.out.println("i'm in addBillingAddress method...2");
		
		billingAddress.setUserId(userDetails.getId());
		
		System.out.println("i'm in addBillingAddress method...3");
		
		checkoutDetails.setBillingAddress(billingAddress);
				
		System.out.println("i'm in addBillingAddress method...4");
		
		this.billingAddress.setUserId(userDetails.getId());
		this.billingAddress.setLine1(billingAddress.getLine1());
		this.billingAddress.setLine2(billingAddress.getLine2());
		this.billingAddress.setCity(billingAddress.getCity());
		this.billingAddress.setState(billingAddress.getState());
		this.billingAddress.setCountry(billingAddress.getCountry());
		this.billingAddress.setZipCode(billingAddress.getZipCode());
		
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
