package com.spring.main.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.main.dao.GameDAO;

@Service
public class GameService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired GameDAO dao;
}
