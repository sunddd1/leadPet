package com.spring.main.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.dao.BoardDAO;
import com.spring.main.dao.GalleryDAO;
import com.spring.main.dto.BoardDTO;

@Service
public class GalleryService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Value("#{config['Globals.root']}") String root;
	@Autowired GalleryDAO dao;
	

	public ModelAndView GalleyList() {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<BoardDTO> list = dao.GalleryList();
		mav.addObject("GalleryList",list);
		mav.setViewName("Board/GalleryList");
		return mav;
	}

}
