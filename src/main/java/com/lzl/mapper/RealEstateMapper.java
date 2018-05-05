package com.lzl.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lzl.model.RealEstate;

public interface RealEstateMapper {

	List<RealEstate> listAll();
	
	List<RealEstate> listWithName(@Param("name")String inputValue);
	
	List<RealEstate> listWithCardId(@Param("cardId")String inputValue);
}
