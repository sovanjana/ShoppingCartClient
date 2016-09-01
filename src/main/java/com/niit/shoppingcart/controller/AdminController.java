package com.niit.shoppingcart.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.niit.shoppingcart.dao.CategoryDAO;
import com.niit.shoppingcart.dao.ProductDAO;
import com.niit.shoppingcart.dao.SupplierDAO;
import com.niit.shoppingcart.model.Category;
import com.niit.shoppingcart.model.Product;
import com.niit.shoppingcart.model.Supplier;



@Controller
public class AdminController {
	
	Logger log = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	Product product;

	@Autowired
	ProductDAO productDAO;
	
	@Autowired
	Category category;
	
	@Autowired
	CategoryDAO categoryDAO;
	
	@Autowired
	Supplier supplier;
	
	@Autowired
	SupplierDAO supplierDAO;
	/*
	 *	method : product
	 * 
	 *	${isAdminClickedProducts}
	 *	${productList} 
	 */
	@RequestMapping("/adminProduct")
	public ModelAndView product(){
		log.debug("products method starts...");
		
		ModelAndView mv = new ModelAndView("home");
		mv.addObject("product", product);
		mv.addObject("isAdminClickedProducts", "true");
		mv.addObject("productList", productDAO.list());
		
		log.debug("products method ends...");
		return mv;
	}
	/*
	 * 	method : supplier
	 * 
	 *	${isAdminClickedSuppliers}
	 *	${supplierList} 
	 */
	@RequestMapping("/adminSupplier")
	public ModelAndView supplier(){
		log.debug("suppliers method starts...");
		
		ModelAndView mv = new ModelAndView("home");
		mv.addObject("supplier", supplier);
		mv.addObject("isAdminClickedSuppliers", "true");
		mv.addObject("supplierList", supplierDAO.list());
		
		
		
		log.debug("products method ends...");
		return mv;
	}
	/*
	 * 	method : category
	 *
	 *	${isAdminClickedCategories}
	 *	${categoryList} 
	 */
	@RequestMapping("/adminCategory")
	public ModelAndView category(){
		log.debug("categories method starts...");
		
		ModelAndView mv = new ModelAndView("home");
		mv.addObject("category", category);
		mv.addObject("isAdminClickedCategories", "true");
		mv.addObject("categoryList", categoryDAO.list());
		
		log.debug("categories method ends...");
		return mv;
	}
}
