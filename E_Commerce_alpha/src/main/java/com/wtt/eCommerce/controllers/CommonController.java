package com.wtt.eCommerce.controllers;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.wtt.eCommerce.common.CommonBean;

@Controller
public class CommonController {

	private static final Logger logger = LogManager.getLogger();
	
	@RequestMapping(value = "/goToPage", method = RequestMethod.POST)
	public String goToPage(CommonBean bean,HttpServletRequest request, HttpServletResponse response,Map<String,Object> map) {
		logger.info("Inside goToPage method:-"+bean.toString());
		try {
			map.put("parameters", bean.getParameters());
			return ((String)bean.getPagePath()).replace(".jsp", "");
			
		} catch (Exception e) {
			logger.error("Exception occured",e);
		}
		return null;
	}
}
