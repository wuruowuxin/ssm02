package com.lzl.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lzl.dto.RealEstateDTO;
import com.lzl.mapper.RealEstateMapper;
import com.lzl.model.RealEstate;
import com.lzl.service.EstateService;

@Service("EstateService")
public class EstateServiceImpl implements EstateService{

	@Autowired
	private RealEstateMapper realEstateMapper;
	
	@Override
	public PageInfo<RealEstate> getAll() {
		PageHelper.startPage(1, 2);
		List<RealEstate> l = realEstateMapper.listAll();
		PageInfo<RealEstate> pageInfo = new PageInfo<RealEstate>(l);
		pageInfo.setList(l);
		return pageInfo;
	}

	@Override
	public PageInfo<RealEstate> listPage(RealEstateDTO dto) {
		int type = dto.getType();
		if(type == 1) {
			//按照用户名查询
			PageHelper.startPage(dto.getPageNum(), 2);
			List<RealEstate> l = realEstateMapper.listWithName(dto.getInputValue());
			PageInfo<RealEstate> pageInfo = new PageInfo<RealEstate>(l);
			pageInfo.setList(l);
			return pageInfo;
		}else if(type == 2) {
			//按照身份证查询
			PageHelper.startPage(dto.getPageNum(), 2);
			List<RealEstate> l = realEstateMapper.listWithCardId(dto.getInputValue());
			PageInfo<RealEstate> pageInfo = new PageInfo<RealEstate>(l);
			pageInfo.setList(l);
			return pageInfo;
		}
		return null;
	}

	
}
