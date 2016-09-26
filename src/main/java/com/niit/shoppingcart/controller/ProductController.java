package com.niit.shoppingcart.controller;

import java.io.File;
import java.io.FileOutputStream;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.niit.shoppingcart.dao.CategoryDAO;
import com.niit.shoppingcart.dao.ProductDAO;
import com.niit.shoppingcart.dao.SupplierDAO;
import com.niit.shoppingcart.model.Category;
import com.niit.shoppingcart.model.Product;
import com.niit.shoppingcart.model.Supplier;
import com.niit.shoppingcart.util.Util;

@Controller
public class ProductController {
	
	Logger log = LoggerFactory.getLogger(ProductController.class);
	
	@Autowired
	Product product;
	
	@Autowired
	private ProductDAO productDAO;
	
	@Autowired
	SupplierDAO supplierDAO;

	@Autowired
	CategoryDAO categoryDAO;

	
	@Autowired
	public void setProductDAO(ProductDAO productDAO) {
		this.productDAO = productDAO;
	}
	/*
	 * method : listProduct 
	 * 
	 * ${productList}
	 */
	@RequestMapping(value = "/product", method = RequestMethod.GET)
	public String listProduct(Model model){
		log.debug("listProduct method starts...");		
		model.addAttribute("product", new Product());
		model.addAttribute("productList", this.productDAO.list());		
		log.debug("listProduct method ends...");
		return "redirect:/admin/adminProduct";
	}
	/*
	 * method : saveOrUpdateProduct 
	 * 
	 * ${saveOrUpdateProduct}
	 */
	@RequestMapping(value = "/product/saveorupdate", method = RequestMethod.POST)
	public String saveOrUpdateProduct(@ModelAttribute("product") Product product, HttpServletRequest request, 
										@RequestParam("file") MultipartFile file){
		System.out.println("bbbbb"+product.getId());
		log.debug("saveOrUpdateProduct method starts...");
		
		String newID = Util.removeComma(product.getId());
		System.out.println("aaaaaaaa"+newID);
		product.setId(newID);
		
		byte fileBytes[];
		FileOutputStream fos = null;
		
		String fileName = "";
		String productImage = "";
		ServletContext context = request.getServletContext();
		String realContextPath = context.getRealPath("/");
		String un = product.getName();
		if (file != null){
			fileName = realContextPath + "/resources/img/" + un + ".jpg";
			productImage = "resources/img/" + un + ".jpg";
			System.out.println("===" + fileName + "===");
			File fileobj = new File(fileName);
			try{
				fos = new FileOutputStream(fileobj);
				fileBytes = file.getBytes();
				fos.write(fileBytes);
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		String sid=product.getSupplier().getId();
		String cid=product.getCategory().getId();
		
		product.setProductImage(productImage);		
		
		Supplier ss=supplierDAO.get(sid);
		Category cc=categoryDAO.get(cid);
		
		product.setCategory(cc);
		product.setSupplier(ss);
		
		productDAO.saveOrUpdate(product);
		
		log.debug("saveOrUpdateProduct method ends...");
		return "redirect:/product";
	}	
	/*
	 * method : deleteProduct 
	 * 
	 * ${message}
	 */
	@RequestMapping("admin/product/delete/{id}")
	public String deleteProduct(@PathVariable("id") String id, ModelMap model) throws Exception {
		log.debug("deleteProduct method starts...");		
		try{
			product = productDAO.get(id);
			productDAO.delete(product);
			model.addAttribute("message", "Successfully Deleted...");
		}
		catch(Exception e){
			model.addAttribute("message", e.getMessage());
			e.printStackTrace();
		}		
		log.debug("deleteProduct method ends...");
		return "redirect:/product";
	}
	/* 
	 * 	method : editSelectedProduct 
	 * 
	 * 	${isAdminClickedProducts}
	 * 
	 */
	@RequestMapping("admin/product/edit/{id}")
	public String editSelectedProduct(@PathVariable("id") String id, Model model, RedirectAttributes redirectAttributes){
		
		redirectAttributes.addFlashAttribute("selectedProduct", productDAO.get(id));
		redirectAttributes.addFlashAttribute("selectedProductList", productDAO.list());
		redirectAttributes.addFlashAttribute("isAdminClickedProducts", "true");
		
		return "redirect:/editproduct";
	}
	/*
	 *  method : editProduct
	 *  
	 *  ${product}
	 *  ${productList}	
	 */
	@RequestMapping(value = "/editproduct", method = RequestMethod.GET)
	public String editProduct(@ModelAttribute("selectedProduct") final Object selectedProduct, @ModelAttribute("selectedProductList") final Object selectedProductList, Model model){
		
		model.addAttribute("product", selectedProduct);
		model.addAttribute("productList", selectedProductList);
		return "/home";
	}
	/*
	 *	..........Edit ends...........
	 */
	/* ~~~~~~~~~~~~~~~~~~~~~~~single-product-page~~~~~~~~~~~~~~~~~~~~~~~~~~~
	 * 
	 *	method : getSelectedProduct
	 *
	 *	${isUserClickedSingleProduct}
	 */
	@RequestMapping(value = "product/get/{id}")
	public String getSelectedProduct(@PathVariable("id") String id, Model model, RedirectAttributes redirectAttributes) {
		
		System.out.println("method getSelectedProduct(ProductController) is here...");
		redirectAttributes.addFlashAttribute("selectedProduct", productDAO.get(id));
		redirectAttributes.addFlashAttribute("isUserClickedSingleProduct", "true");
		
		return "redirect:/singleproduct";
	}
	/* ~~~~~~~~~~~~~~~~~~~~~
	 *	method : backToHome
	 *
	 *	${selectedProduct}	
	 */
	@RequestMapping(value = "/singleproduct", method = RequestMethod.GET)
	public String singleProduct(@ModelAttribute("selectedProduct") final Object selectedProduct, Model model) {

		model.addAttribute("product", selectedProduct);
		model.addAttribute("categoryList", this.categoryDAO.list());

		return "home";
	}
	
}
