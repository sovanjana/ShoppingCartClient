package com.niit.shoppingcart.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.niit.shoppingcart.dao.CategoryDAO;
import com.niit.shoppingcart.dao.ProductDAO;
import com.niit.shoppingcart.dao.UserDetailsDAO;
import com.niit.shoppingcart.model.Category;
import com.niit.shoppingcart.model.UserDetails;
import com.niit.shoppingcart.util.Util;

@Controller
public class HomeController {
	
	Logger log = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	Category category;
	
	@Autowired
	CategoryDAO categoryDAO;
	
	@Autowired
	ProductDAO productDAO;
	
	@Autowired
	UserDetails userDetails;

	@Autowired
	UserDetailsDAO userDetailsDAO;
	
	/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~YY~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	 *	method : onLoad
	 *
	 *	${category}
	 *	${categoryList}	
	 */
	@RequestMapping(value = { "/", "/home"})
	public ModelAndView onLoad(HttpSession session) {		
		log.debug("onLoad method starts....");
		
		ModelAndView mv = new ModelAndView("home");
		session.setAttribute("category", category);
		session.setAttribute("categoryList", categoryDAO.list());
				
		System.out.println(categoryDAO.list());
		System.out.println("This is home page....");
		
		log.debug("onLoad method ends....");
		return mv;
	}
		
	/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~login~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	 *	method : login
	 *
	 *	${userClickedLogin}	
	 */
	@RequestMapping("/login")
	public ModelAndView login() {
		log.debug("login method starts...");
		
		ModelAndView mv = new ModelAndView("home");
		mv.addObject("userDetails", userDetails);
		mv.addObject("userClickedLogin", "true");
		
		log.debug("login method ends...");
		return mv;
	}		
	/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	 *	method : registerHere
	 *
	 *	${userClickedRegister}
	 *
	 */
	@RequestMapping(value = "/register")
	public ModelAndView registerHere(){
		
		ModelAndView mv = new ModelAndView("home");
		mv.addObject("userDetails", userDetails);
		mv.addObject("userClickedRegister", "true");
		//mv.addObject("userList", userDetailsDAO.list());
		
		return mv;
	}
	
	/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	 *	method : saveUserDetails
	 *
	 *	${addUser}
	 *	${registrationMsg}
	 */
	@RequestMapping(value="/registration", method = RequestMethod.POST)
	public ModelAndView saveUserDetails(@ModelAttribute("userDetails") UserDetails userDetails){
		log.debug("saveUserDetails method starts....");
		
		ModelAndView mv = new ModelAndView("home");
		/*	
		 * 	if(userDetailsDAO.get(userDetails.getID()) == null) {
		 * 		userDetailsDAO.save(userDetails);
		 * 		mv.addObject("registrationMsg", "You have successfully registered...");
		 * 	} else {
		 * 		mv.addObject("Msg", "user exist with this id...");
		 * 	}
		 */
		
		String newID = Util.removeComma(userDetails.getId());
		userDetails.setId(newID);
		
		mv.addObject("userDetails", userDetails);
		mv.addObject("addUser", userDetailsDAO.save(userDetails));
		
		mv.addObject("registeredUser", "true");
		mv.addObject("registrationMsg", "You have successfully registered...");
		
		
		log.debug("saveUserDetails method ends....");
		return mv;
	}
}
