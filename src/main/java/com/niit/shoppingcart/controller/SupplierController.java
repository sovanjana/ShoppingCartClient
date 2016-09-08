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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.niit.shoppingcart.dao.SupplierDAO;
import com.niit.shoppingcart.model.Supplier;
import com.niit.shoppingcart.util.Util;

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
	 * 	..........list starts...........
	 * 
	 *  method : listProduct
	 *  
	 *  ${supplierList}
	 */
	@RequestMapping(value="/supplier", method = RequestMethod.GET)
	public String listSupplier(Model model){
		log.debug("listSupplier method starts....");
		
		model.addAttribute("supplier", new Supplier());
		model.addAttribute("supplierList", supplierDAO.list());
		
		log.debug("listSupplier method ends....");
		return "redirect:/adminSupplier";
	}	
	/*
	 * 	..........list ends...........
	 * 
	 *  ..........saveOrUpdate starts...........
	 *  
	 *  method : saveOrUpdateSupplier  
	 *  
	 */
	@RequestMapping(value="/supplier/saveorupdate", method = RequestMethod.POST)
	public String saveOrUpdateSupplier(@ModelAttribute("supplier") Supplier supplier, Model model){
		log.debug("saveOrUpdateSupplier method starts....");
		
		String newID = Util.removeComma(supplier.getId());
		supplier.setId(newID);
		
		model.addAttribute("addSupplier", supplierDAO.saveOrUpdate(supplier));		
		model.addAttribute("addedSupplier", "true");
		model.addAttribute("supAddedMsg", "Supplier added successfully...");
				
		log.debug("saveOrUpdateSupplier method ends....");
		return "redirect:/supplier";
	}
	/*
	 * 	..........saveOrUpdate ends...........
	 * 
	 * 	..........Delete starts...........	
	 * 
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
	 * 	..........Delete ends...........
	 * 
	 *	..........Edit starts...........  
	 * 
	 *  method : editSelectedSupplier
	 *  
	 *  
	 */
	@RequestMapping(value = "supplier/edit/{id}")
	public String editSelectedSupplier(@PathVariable("id") String id, Model model, RedirectAttributes redirectAttributes){
		
		redirectAttributes.addFlashAttribute("selectedSupplier", supplierDAO.get(id));
		redirectAttributes.addFlashAttribute("selectedSupplierList", supplierDAO.list());
		redirectAttributes.addFlashAttribute("isAdminClickedSuppliers", "true");
		
		return "redirect:/editsupplier";
	}
	/*
	 *  method : editSupplier
	 *  
	 *  ${supplier}
	 *  ${supplierList}
	 */
	@RequestMapping(value = "/editsupplier", method = RequestMethod.GET)
	public String editSupplier(@ModelAttribute("selectedSupplier") final Object selectedSupplier,@ModelAttribute("selectedSupplierList") final Object selectedSupplierList, Model model){
		
		model.addAttribute("supplier", selectedSupplier);
		model.addAttribute("supplierList", selectedSupplierList);
		return "/home";
	}
	/*
	 *	..........Edit ends...........
	 */
}
