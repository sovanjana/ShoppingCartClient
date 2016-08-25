package com.niit.shoppingcart.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.niit.shoppingcart.dao.CategoryDAO;
import com.niit.shoppingcart.model.Category;
import com.niit.shoppingcart.model.Supplier;


@Controller
public class CategoryController {
	
	Logger log = LoggerFactory.getLogger(CategoryController.class);
	
	@Autowired
	Category category;
	
	@Autowired
	private CategoryDAO categoryDAO;
	
	@Autowired
	public void setCategoryDAO(CategoryDAO categoryDAO) {
		this.categoryDAO = categoryDAO;
	}

	/*
	 *  method : listCategory
	 *  
	 *  ${listCategory}
	 */
	@RequestMapping(value = "/category", method = RequestMethod.GET)
	public ModelAndView listCategory(){
		log.debug("listCategory method starts...");
		
		ModelAndView mv = new ModelAndView("home");
		mv.addObject("category", new Category());
		mv.addObject("listCategory", this.categoryDAO.list());
		
		log.debug("listCategory method starts...");
		return mv;
	}
	
	/*
	 *  method : saveOrUpdateCategory
	 *  
	 *  ${saveOrUpdateCategory}
	 */
	@RequestMapping(value = "/category/saveorupdate", method = RequestMethod.POST)
	public String saveOrUpdateCategory(@ModelAttribute("category") Category category){
		log.debug("saveOrUpdateCategory method starts...");
		
		categoryDAO.saveOrUpdate(category);

		log.debug("saveOrUpdateCategory method starts...");
		return "redirect:/category";
	}
	
	/*
	 *  method : deleteCategory
	 *  
	 *  ${message}
	 */
	@RequestMapping("category/delete/{id}")
	public String deleteCategory(@PathVariable("id") String id, ModelMap model) throws Exception{
		
		/*
		log.debug("deleteCategory method starts...");
		
		ModelAndView mv = new ModelAndView("home");
		try{
			category = categoryDAO.get(id);
			categoryDAO.delete(category);
			mv.addObject("message", "Selected Category deleted successfully...");
		}
		catch(Exception e){
			mv.addObject("message", e.getMessage());
			e.printStackTrace();
		}		
		log.debug("deleteCategory method starts...");
		return mv;
		*/
		
		
		log.debug("deleteSupplier method starts....");
		
		try{
			category = categoryDAO.get(id);			
			categoryDAO.delete(category);
			model.addAttribute("message", "Successfully Deleted...");
		}
		catch(Exception e){
			model.addAttribute("message", e.getMessage());
			e.printStackTrace();
		}
		//redirectAttrs.addFlashAttribute(arg0,arg1)
		
		log.debug("deleteSupplier method ends....");
		return "redirect:/category";
	}
	
	/*
	 *  method : editCategory
	 *  
	 *  ${isAdminClickedCategories}
	 */
	@RequestMapping("category/edit/{id}")
	public ModelAndView editCategory(@PathVariable("id") String id){
		log.debug("editCategory method starts...");
		
		ModelAndView mv = new ModelAndView("home");
		mv.addObject("category", this.categoryDAO.get(id));
		mv.addObject("listCAtegory", this.categoryDAO.list());
		mv.addObject("isAdminClickedCategories", "true");
		
		log.debug("editCategory method ends...");
		return mv;
	}
}
