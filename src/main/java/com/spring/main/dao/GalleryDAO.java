package com.spring.main.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.main.dto.BoardDTO;
import com.spring.main.dto.PetDTO;

public interface GalleryDAO {

	ArrayList<BoardDTO> GalleryList();

	PetDTO GalwriteForm(String id);

	HashMap<String, Object> interestConfirm(String id, String bbs_id);

	int addInterestButton(String id, String bbs_id);

	int cancleInterestButton(String id, String bbs_id);

}
