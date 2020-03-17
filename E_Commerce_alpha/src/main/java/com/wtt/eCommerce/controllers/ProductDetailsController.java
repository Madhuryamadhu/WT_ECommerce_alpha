package com.wtt.eCommerce.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wtt.eCommerce.products.ProductDetailsBean;
import com.wtt.eCommerce.products.ProductDetailsDAO;

@Controller
public class ProductDetailsController {

	
	private static final Logger logger = LogManager.getLogger();

	@RequestMapping(value = "/loadPages", method = RequestMethod.POST)
	public String getPage(@RequestBody ProductDetailsBean bean,HttpServletRequest request, HttpServletResponse response) {
		logger.info("Inside getPage method:-"+bean.toString());
		try {
			
		} catch (Exception e) {
			logger.error("Exception occured",e);
		}
		logger.info("returning from getPage method:-"+bean.toString());
		return "/userPages/products/productPage";
	}
	
	
	//This function will get you the products
	@RequestMapping(value = "/loadProducts", method = RequestMethod.POST)
	public @ResponseBody ProductDetailsBean getProducts(@RequestBody ProductDetailsBean bean,HttpServletRequest request, HttpServletResponse response) {
		logger.info("Inside getProducts method:-"+bean.toString());
		ProductDetailsDAO productDao=new ProductDetailsDAO();
		try {
			
			if(productDao.getProductListForView(bean)) {
				logger.info("got product list!!");
			}else {
				logger.info("failed to get product list!!");
			}
		} catch (Exception e) {
			logger.error("Exception occured",e);
		}
		logger.info("returning from getProducts method:-"+bean.toString());
		return bean;
	}
}
