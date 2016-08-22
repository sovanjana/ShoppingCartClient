package com.niit.shoppingcart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.niit.shoppingcart.dao.ProductDAO;

@Controller
public class HomeController {
	
	@Autowired
	ProductDAO productDAO;

	@RequestMapping("/")
	public ModelAndView home() {		
		ModelAndView mv = new ModelAndView("Home");
		mv.addObject("message", "Thankyou for visiting...");
		return mv;
	}
	
	@RequestMapping("/Login")
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
	}
}
