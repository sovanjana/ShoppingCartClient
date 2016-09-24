package com.niit.shoppingcart.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.niit.shoppingcart.dao.CartDAO;
import com.niit.shoppingcart.dao.CartItemDAO;
import com.niit.shoppingcart.dao.ProductDAO;
import com.niit.shoppingcart.model.Cart;
import com.niit.shoppingcart.model.CartItem;
import com.niit.shoppingcart.model.Product;
import com.niit.shoppingcart.view.CartItemModel;

@Controller
public class CartController {

	Logger log = LoggerFactory.getLogger(ProductController.class);

	@Autowired
	private Product product;
	@Autowired
	private ProductDAO productDAO;

	@Autowired
	private Cart cart;
	@Autowired
	private CartDAO cartDAO;

	@Autowired
	private CartItem cartItem;
	@Autowired
	private CartItemDAO cartItemDAO;

	@Autowired
	HttpSession httpSession;

	/*	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ viewCart ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */	

	@RequestMapping("/user/cart/")
	public ModelAndView viewCart(Model model, Principal userName,
			@RequestParam(value = "cartItemRemoved", required = false) String cartItemRemoved) {
		
		ModelAndView mv = new ModelAndView("viewcart");
		String userId = userName.getName();
		if (cartItemRemoved != null) {
			model.addAttribute("cartItemRemoved", "Cart item removed successfully");
		}
		List<CartItemModel> cartItems = null;
		Cart cart = cartDAO.getCartByUserId(userId);
		// When there are products in cart
		if (returnProductName(userId) != null && !returnProductName(userId).isEmpty()) {
			cartItems = returnProductName(userId);
		} 
		// When there are no products in cart
		else {
			model.addAttribute("cartEmpty", "No products in cart");
			return mv;
		}
		mv.addObject("cartItems", cartItems);
		mv.addObject("total", cart.getGrandTotal());
		mv.addObject("countProducts", cartItems.size());
		return mv;
	}

	/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ removeCartItems ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

	@RequestMapping("/user/cart/remove/{cartItemId}")
	public String removeCartItems(@PathVariable("cartItemId") String cartItemId, Model model, Principal username) {
		System.out.println("delete from cartitem method...");
		
		cartItem = cartItemDAO.get(cartItemId);
		
		System.out.println("deletexxx from cartitem method...");
		
		String userId = cartItem.getUserId();
		String cartId = cartItem.getCartId();
		
		System.out.println("before delete method");
		
		cartItemDAO.delete(cartItem);
		
		System.out.println("after delete method");
		
		int countProducts = updateCartAgain(cartId, userId);
		
		model.addAttribute("countProducts", countProducts);
		httpSession.setAttribute("countProducts", countProducts);
		return "redirect:/user/cart/";
	}

	/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ returnProductName ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */	
	
	public List<CartItemModel> returnProductName(String userId) {
		List<CartItem> cartItems = cartItemDAO.getCartItemByUserId(userId);
		List<CartItemModel> cartItemModelList = new ArrayList<CartItemModel>();
		CartItemModel cartItemModel = null;
		for (CartItem item : cartItems) {
			cartItemModel = new CartItemModel();
			cartItemModel.setCartItem(item);
			product = productDAO.get(item.getProductId());
			cartItemModel.setProductName(product.getName());
			cartItemModel.setProductImage(product.getProductImage());
			cartItemModelList.add(cartItemModel);
		}
		return cartItemModelList;
	}

	/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ addToCart ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
	
	@RequestMapping("/user/cart/addToCart/{productId}")
	public String addToCart(@PathVariable("productId") String productId, Model model, Principal userName) {

		// Get the user id by its user name
		String userId = userName.getName();
		// Check whether a cart is present in the cart table
		if (cartDAO.getCartByUserId(userId) == null) {
			cart = new Cart();
			cart.setUserId(userId);
			cartDAO.saveOrUpdate(cart);
		} else {
			cart = cartDAO.getCartByUserId(userId);
		}
		String cartId = cart.getCartId();
		// get the product price
		product = productDAO.get(productId);

		String redirectPage = null;
		int codeRecieved = addCartItem(userId, productId, cartId);
		switch (codeRecieved) {
		case 0: {
			cartItem = new CartItem();
			cartItem.setCartId(cartId);
			cartItem.setUserId(userId);
			cartItem.setProductId(product.getId());
			cartItem.setCountProducts(1);
			cartItem.setGrandTotal(product.getPrice());
			cartItemDAO.saveOrUpdate(cartItem);
			System.out.println("Insertion of cartItem");
			updateCartAgain(cartId, userId);
			
			int nop = returnCountProducts(userId);
			httpSession.setAttribute("countProducts", nop);			
			
			redirectPage = "redirect:/home?addedtocart";
			break;
		}
		case 1:
			int nop = returnCountProducts(userId);
			httpSession.setAttribute("countProducts", nop);
			
			redirectPage = "redirect:/home?addedtocart";
		}
		return redirectPage;
	}	
	
	/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ returnCountProducts ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
		
	public int returnCountProducts(String userId) {
		if (userId != null) {
			int countProduct = cartDAO.getCartByUserId(userId).getCountProducts();
			return countProduct;
		}
		return 0;
	}
	
	// ---------------------------------------------------------------------------------------
	public int updateCartAgain(String cartId, String userId) {

		List<CartItem> listOfSelectedCartItems;
		// Now after getting the cartItem change grandTotal and No of Products
		listOfSelectedCartItems = cartItemDAO.getCartItemByUserId(userId);
		double grandTotal = 0;
		for (CartItem item : listOfSelectedCartItems) {
			grandTotal = grandTotal + item.getGrandTotal();
		}
		cart.setGrandTotal(grandTotal);

		int countProducts = listOfSelectedCartItems.size();

		cart.setCartId(cartId);
		cart.setUserId(userId);
		cart.setCountProducts(countProducts);
		cartDAO.saveOrUpdate(cart); // This method updates the cart

		return countProducts;
		// =========== Completed Adding the item to cart =====

	}

	// --------------------------------------------------------------------------------------------
	// This is the method which perform all the operations related to addition
	// of product cartItem
	public int addCartItem(String userId, String productId, String cartId) {

		List<CartItem> listOfSelectedCartItems = cartItemDAO.getCartItemByUserId(userId);
		Product product = productDAO.get(productId);
		for (CartItem item : listOfSelectedCartItems) {
			String itemProductId = item.getProductId();
			System.out.println(itemProductId);
			if (itemProductId != null) {
				if (itemProductId.equals(product.getId())) {
					item.setCountProducts(item.getCountProducts() + 1);

					item.setGrandTotal(item.getGrandTotal() + product.getPrice());

					cartItemDAO.saveOrUpdate(item);
					updateCartAgain(cartId, userId);
					return 1;
				}
			}
		}
		return 0; // Product is not present in cart we need to generate a new
					// one
	}

	
}
