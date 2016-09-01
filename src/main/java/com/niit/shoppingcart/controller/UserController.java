package com.niit.shoppingcart.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niit.shoppingcart.dao.CategoryDAO;
import com.niit.shoppingcart.dao.SupplierDAO;
import com.niit.shoppingcart.dao.UserDetailsDAO;
import com.niit.shoppingcart.model.Category;
import com.niit.shoppingcart.model.UserDetails;

@Controller
public class UserController {

	@Autowired
	UserDetails userDetails;

	@Autowired
	UserDetailsDAO userDetailsDAO;

	@Autowired
	Category category;

	@Autowired
	CategoryDAO categoryDAO;

	
	@Autowired
	SupplierDAO supplierDAO;

	Logger log = LoggerFactory.getLogger(UserController.class);

	/*
	 * method : userLogin
	 * 
	 *	${errorMessage}
	 *	${loggedUser}
	 *	${loggedUserId}
	 *
	 */
	@RequestMapping("/userlogin")
	public ModelAndView userLogin(@RequestParam(value = "name") String userID, @RequestParam(value = "password") String password, HttpSession session) {
		log.debug("login method starts...");

		ModelAndView mv = new ModelAndView("home");
		boolean isValidUser = userDetailsDAO.isValidUser(userID, password);

		log.debug("isValidUser running..." + isValidUser);

		if (isValidUser == true) {
			userDetails = userDetailsDAO.get(userID);
			
			session.setAttribute("loggedUser", userDetails.getName());
			session.setAttribute("loggedUserId", userDetails.getId());
			
			if (userDetails.isAdmin()) {
				mv.addObject("isAdmin", "true");
				session.setAttribute("supplierList", supplierDAO.list());
			} else {
				mv.addObject("isAdmin", "false");	
				
				/* cart = cartDAO.get(userID);
				 mv.addObject("cart", cart);
				 List<Cart> cartList = cartDAO.list();
				 mv.addObject("cartList", cartList);
				 mv.addObject("cartSize", cartList.size());*/
			}
		}
		else {
			mv.addObject("invalidData", "true");
			mv.addObject("errorMessage", "Invalid Input...");			
		}
		log.debug("login method ends...");
		return mv;
	}
	/*
	 * method : logout
	 * 
	 * ${loggedOut == true}
	 * ${logoutMessage}
	 * 
	 */
	@RequestMapping("/logout")
	public ModelAndView userLogout(HttpServletRequest request, HttpSession session) {
		log.debug("logout method starts...");

		ModelAndView mv = new ModelAndView("home");
		
		session.invalidate();
		session = request.getSession();
				
		session.setAttribute("category", category);
		session.setAttribute("categoryList", categoryDAO.list());

		mv.addObject("loggedOut", "true");
		mv.addObject("logoutMessage", "successfully logged-out...");

		log.debug("logout method ends...");
		return mv;

	}
	
}
