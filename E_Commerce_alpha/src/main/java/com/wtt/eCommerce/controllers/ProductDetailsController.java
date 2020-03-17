package com.wtt.eCommerce.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wtt.eCommerce.products.ProductDetailsBean;

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
}
