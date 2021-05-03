package com.spring.main.dao;

import java.util.ArrayList;

import com.spring.main.dto.PetDTO;

public interface PetDAO {
	
	ArrayList<PetDTO> list();

	int write(PetDTO dto);

	void writeFile(String key, String string, int pet_idx);

}
