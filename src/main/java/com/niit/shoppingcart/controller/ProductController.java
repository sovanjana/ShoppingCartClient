package com.niit.shoppingcart.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.niit.shoppingcart.dao.ProductDAO;
import com.niit.shoppingcart.model.Product;

@Controller
public class ProductController {
	
	Logger log = LoggerFactory.getLogger(ProductController.class);
	
	@Autowired
	Product product;
	
	@Autowired
	private ProductDAO productDAO;

	@Autowired
	public void setProductDAO(ProductDAO productDAO) {
		this.productDAO = productDAO;
	}
	/*
	 * method : listProduct 
	 * 
	 * ${listProduct}
	 */
	@RequestMapping(value = "/product", method = RequestMethod.GET)
	public ModelAndView listProduct(){
		log.debug("listProduct method starts...");
		
		ModelAndView mv = new ModelAndView("home");
		mv.addObject("product", new Product());
		mv.addObject("listProduct", this.productDAO.list());
		
		log.debug("listProduct method ends...");
		return mv;
	}
	/*
	 * method : saveOrUpdateProduct 
	 * 
	 * ${saveOrUpdateProduct}
	 */
	@RequestMapping(value = "/product/saveorupdate", method = RequestMethod.POST)
	public String saveOrUpdateProduct(@ModelAttribute("product") Product product){
		log.debug("saveOrUpdateProduct method starts...");
		
		//ModelAndView mv = new ModelAndView("home");
		//mv.addObject("saveOrUpdateProduct", productDAO.saveOrUpdate(product));
			
		productDAO.saveOrUpdate(product);
		
		log.debug("saveOrUpdateProduct method ends...");
		//return mv;
		return "redirect:/product";
	}
	/*
	 * method : deleteProduct 
	 * 
	 * ${message}
	 */
	@RequestMapping("product/delete/{id}")
	public ModelAndView deleteProduct(@PathVariable("id") String id) throws Exception {
		log.debug("deleteProduct method starts...");
		
		ModelAndView mv = new ModelAndView("home");
		try{
			product = productDAO.get(id);
			productDAO.delete(product);
			mv.addObject("message", "Selected Product deleted successfully...");
		}
		catch(Exception e){
			mv.addObject("message", e.getMessage());
			e.printStackTrace();
		}
		
		log.debug("deleteProduct method ends...");
		return mv;
	}
	/*
	 * method : editProduct 
	 * 
	 * ${isAdminClickedProducts}
	 */
	@RequestMapping("product/edit/{id}")
	public ModelAndView editProduct(@PathVariable("id") String id){
		log.debug("editProduct method starts...");
		
		ModelAndView mv = new ModelAndView("home");
		mv.addObject("editProduct", this.productDAO.get(id));
		mv.addObject("listProduct", this.productDAO.list());
		mv.addObject("isAdminClickedProducts", "true");
		
		log.debug("editProduct method ends...");
		return mv;
	}
}
