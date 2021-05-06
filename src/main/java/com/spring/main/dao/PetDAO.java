package com.spring.main.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.spring.main.dto.PetDTO;
import com.spring.main.dto.Pet_imgDTO;
import com.spring.main.dto.VaccinDTO;

public interface PetDAO {
	
	ArrayList<PetDTO> list(String id);

	int write(PetDTO dto);

	int writeFile(int pet_idx, String key, String string);

	void deletePet(int pet_idx);

	void upload(Pet_imgDTO imgDTO);

	ArrayList<VaccinDTO> vac_cat();

	ArrayList<VaccinDTO> vac_dog();

	int getIdx(String string);

	ArrayList<VaccinDTO> vac();

	void star(int pet_idx);

	List<Map> vaccList(String chk);

}
