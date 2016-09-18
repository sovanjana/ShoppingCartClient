package com.niit.shoppingcart.controller;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.niit.shoppingcart.dao.CategoryDAO;
import com.niit.shoppingcart.model.Category;
import com.niit.shoppingcart.util.Util;


@Controller
public class CategoryController {
	
Logger log = LoggerFactory.getLogger(CategoryController.class);
	
	@Autowired
	private CategoryDAO categoryDAO;
	
	@Autowired
	Category category;

	@Autowired
	public void setCategoryDAO(CategoryDAO categoryDAO) {
		this.categoryDAO = categoryDAO;
	}	
	/*
	 *  method : listProduct
	 *  
	 *  ${category}
	 *  ${categorylist}
	 */
	@RequestMapping(value="/category", method = RequestMethod.GET)
	public String listCategory(Model model){
		log.debug("listCategory method starts....");
		
		model.addAttribute("category", new Category());
		model.addAttribute("categoryList", categoryDAO.list());
		
		log.debug("listCategory method ends....");
		return "redirect:/adminCategory";
	}	
	/*
	 *  method : saveOrUpdateCategory
	 *  
	 *  
	 */
	@RequestMapping(value="/category/saveorupdate", method = RequestMethod.POST)
	public String saveOrUpdateCategory(@Valid @ModelAttribute("category") Category category, BindingResult result, Model model){
		log.debug("saveOrUpdateCategory method startss....");
		
		if(result.hasErrors()){
			return "redirect:/category";
		}
		String newID = Util.removeComma(category.getId());
		category.setId(newID);
		
		model.addAttribute("addCategory", categoryDAO.saveOrUpdate(category));
		model.addAttribute("addedCategory", "true");
		model.addAttribute("ctgAddedMsg", "Category added successfully...");
		
		log.debug("saveOrUpdateCategory method ends....");
		return "redirect:/category";
	}
	/*
	 *  method : deleteCategory
	 *  
	 *  ${message}
	 */
	@RequestMapping("category/delete/{id}")
	public String deleteCategory(@PathVariable("id") String id, ModelMap model) throws Exception{
		log.debug("deleteCategory method starts....");
		
		try{
			category = categoryDAO.get(id);			
			categoryDAO.delete(category);
			model.addAttribute("message", "Successfully Deleted...");
		}
		catch(Exception e){
			model.addAttribute("message", e.getMessage());
			e.printStackTrace();
		}

		log.debug("deleteCategory method ends....");
		return "redirect:/category";
	}
	/* 
	 * 	..........Delete ends...........
	 * 
	 *	..........Edit starts...........  
	 * 
	 *  method : editSelectedCategory
	 *  
	 *  ${selectedCategory}
	 *  ${selectedCategoryList}
	 */
	@RequestMapping(value = "category/edit/{id}")
	public String editSelectedCategory(@PathVariable("id") String id, Model model, RedirectAttributes redirectAttributes){
		
		redirectAttributes.addFlashAttribute("selectedCategory", categoryDAO.get(id));
		redirectAttributes.addFlashAttribute("selectedCategoryList", categoryDAO.list());
		redirectAttributes.addFlashAttribute("isAdminClickedCategories", "true");
		
		return "redirect:/editcategory";
	}
	/*
	 *  method : editCategory
	 *  
	 *  ${category}
	 *  ${categoryList}
	 */
	@RequestMapping(value = "/editcategory", method = RequestMethod.GET)
	public String editCategory(@ModelAttribute("selectedCategory") final Object selectedCategory, @ModelAttribute("selectedCategoryList") final Object selectedCategoryList, Model model){
		
		model.addAttribute("category", selectedCategory);
		model.addAttribute("categoryList", selectedCategoryList);
		model.addAttribute("editMsg", "Category edited successfull...");
		return "/home";
	}
	/*
	 *	..........Edit ends...........
	 */
}
