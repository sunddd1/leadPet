package com.spring.main.dao;

import java.util.ArrayList;

import com.spring.main.dto.BoardDTO;
import com.spring.main.dto.PetDTO;

public interface GalleryDAO {

	ArrayList<BoardDTO> GalleryList();

	PetDTO GalwriteForm(String id);

}
