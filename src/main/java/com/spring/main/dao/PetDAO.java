package com.spring.main.dao;

import java.util.ArrayList;

import com.spring.main.dto.PetDTO;
import com.spring.main.dto.Pet_imgDTO;

public interface PetDAO {
	
	ArrayList<PetDTO> list(String id);

	int write(PetDTO dto);

	int writeFile(int pet_idx, String key, String string);

	void deletePet(int pet_idx);

	void upload(Pet_imgDTO imgDTO);

}
