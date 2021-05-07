package com.spring.main.service;

import java.util.ArrayList;

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
		ArrayList<BoardDTO> list = dao.GalleryList();
		logger.info("갤러리 리스트 확인 : " + list);
		return null;
	}

}