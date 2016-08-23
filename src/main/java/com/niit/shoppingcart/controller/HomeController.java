package com.niit.shoppingcart.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.niit.shoppingcart.dao.CategoryDAO;
import com.niit.shoppingcart.dao.ProductDAO;
import com.niit.shoppingcart.dao.UserDetailsDAO;
import com.niit.shoppingcart.model.Category;
import com.niit.shoppingcart.model.UserDetails;

@Controller
public class HomeController {
	
	Logger log = LoggerFactory.getLogger(HomeController.class);
		
	@Autowired
	ProductDAO productDAO;
	
	/*@Autowired
	CategoryDAO categorydao;

	@Autowired
	Category category;
	
	*/
	
	@RequestMapping("/home")
	public ModelAndView home(HttpSession session) {		
		log.debug("home method starts....");
		
		ModelAndView mv = new ModelAndView("home");
		/*session.setAttribute("category", category);
		session.setAttribute("categoryList",categorydao.list()); 
		*/
		log.debug("home method ends....");
		return mv;
	}
	

	
	/*@RequestMapping("/Login")
	public ModelAndView login() {
		ModelAndView mv = new ModelAndView("Login");
		mv.addObject("userClickedLoginHere", "true");
		return mv;
	}
	
	@RequestMapping("/Register")
	public ModelAndView register() {
		ModelAndView mv = new ModelAndView("Registration");
		mv.addObject("userClickedRegisterHere", "true");
		return mv;
	}*/
}
