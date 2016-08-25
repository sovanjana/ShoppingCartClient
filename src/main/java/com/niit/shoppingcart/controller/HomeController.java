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
import com.niit.shoppingcart.model.Product;
import com.niit.shoppingcart.model.UserDetails;

@Controller
public class HomeController {
	
	Logger log = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	Product product;
	
	@Autowired
	ProductDAO productDAO;
	
	@Autowired
	Category category;
	
	@Autowired
	CategoryDAO categoryDAO;
	
	@Autowired
	UserDetails userDetails;

	@Autowired
	UserDetailsDAO userDetailsDAO;
	

	//  ${categoryList}
	
	@RequestMapping("/home")
	public ModelAndView home(HttpSession session) {		
		log.debug("home method starts....");
		
		ModelAndView mv = new ModelAndView("home");
		session.setAttribute("category", category);
		session.setAttribute("categoryList",categoryDAO.list()); 
		
		log.debug("home method ends....");
		return mv;
	}
	/*
	 *	method : register
	 *
	 *	${registerSuccess}	
	 */
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public ModelAndView register(@ModelAttribute UserDetails userDetails){
		log.debug("register method starts...");
		
		userDetailsDAO.save(userDetails);
		
		ModelAndView mv = new ModelAndView("home");		
		mv.addObject("registerSuccess", "You have successfully registered...");
		
		log.debug("register method ends...");
		return mv;
	}
	/*
	 *	method : registerHere
	 *
	 *	${userClickedRegister}	
	 */
	@RequestMapping(value = "/registration")
	public ModelAndView registerHere(){
		log.debug("registerHere method starts...");		
		
		ModelAndView mv = new ModelAndView("home");
		mv.addObject("userDetails", userDetails);
		mv.addObject("userClickedRegister", "true");
		
		log.debug("registerHere method ends...");
		return mv;
		
	}
	/*
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
}
