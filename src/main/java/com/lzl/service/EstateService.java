package com.lzl.service;

import com.github.pagehelper.PageInfo;
import com.lzl.dto.RealEstateDTO;
import com.lzl.model.RealEstate;

public interface EstateService {

	public PageInfo<RealEstate> getAll();
	
	public PageInfo<RealEstate> listPage(RealEstateDTO dto);
}
