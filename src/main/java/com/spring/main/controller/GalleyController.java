package com.spring.main.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.service.GalleryService;

@Controller
public class GalleyController {
	
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired GalleryService service;
	
	@RequestMapping(value = "/GalleryList", method = RequestMethod.GET)
	public ModelAndView BoardList(Model model) {
		logger.info("갤러리 리스트 : ");
		return service.GalleyList();
	}
	
}
