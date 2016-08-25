package com.niit.shoppingcart.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.niit.shoppingcart.dao.SupplierDAO;
import com.niit.shoppingcart.model.Supplier;

@Controller
public class SupplierController {

	Logger log = LoggerFactory.getLogger(SupplierController.class);
	
	@Autowired
	private SupplierDAO supplierDAO;
	
	@Autowired
	Supplier supplier;

	@Autowired
	public void setSupplierDAO(SupplierDAO supplierDAO) {
		this.supplierDAO = supplierDAO;
	}	
	/*
	 *  method : listProduct
	 *  
	 *  ${supplierlist}
	 */
	@RequestMapping(value="/supplier", method = RequestMethod.GET)
	public String listSupplier(Model model){
		log.debug("listSupplier method starts....");
		
		model.addAttribute("supplier", new Supplier());
		model.addAttribute("supplierlist", this.supplierDAO.list());
		
		log.debug("listSupplier method ends....");
		return "redirect:/adminSupplier";
	}	
	/*
	 *  method : saveOrUpdateSupplier
	 *  
	 *  ${saveOrUpdateSupplier}
	 */
	@RequestMapping(value="/supplier/saveorupdate", method = RequestMethod.POST)
	public String saveOrUpdateSupplier(@ModelAttribute("supplier") Supplier supplier){
		log.debug("saveOrUpdateSupplier method startss....");
		
		supplierDAO.saveOrUpdate(supplier);
		
		log.debug("saveOrUpdateSupplier method ends....");
		return "redirect:/supplier";
	}
	/*
	 *  method : deleteSupplier
	 *  
	 *  ${message}
	 */
	@RequestMapping("supplier/delete/{id}")
	public String deleteSupplier(@PathVariable("id") String id, ModelMap model) throws Exception{
		log.debug("deleteSupplier method starts....");
		
		try{
			supplier = supplierDAO.get(id);			
			supplierDAO.delete(supplier);
			model.addAttribute("message", "Successfully Deleted...");
		}
		catch(Exception e){
			model.addAttribute("message", e.getMessage());
			e.printStackTrace();
		}
		//redirectAttrs.addFlashAttribute(arg0,arg1)
		
		log.debug("deleteSupplier method ends....");
		return "redirect:/supplier";
	}
	/*
	 *  method : editSupplier
	 *  
	 *  ${isAdminClickedSuppliers}
	 */
	@RequestMapping("/supplier/edit/{id}")
	public ModelAndView editSupplier(@PathVariable("id") String id){
		log.debug("editSupplier method starts....");
		
		ModelAndView model=new ModelAndView("home");
		System.out.println("editSupplier");
		model.addObject("supplier", this.supplierDAO.get(id));
		model.addObject("listSupplier", this.supplierDAO.list());
		model.addObject("isAdminClickedSuppliers", "true");
		
		log.debug("editSupplier method ends....");
		return model;
	}
}
