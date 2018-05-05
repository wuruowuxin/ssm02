package com.lzl.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.PageInfo;
import com.lzl.dto.RealEstateDTO;
import com.lzl.model.RealEstate;
import com.lzl.service.EstateService;

@Controller
@RequestMapping("/estate")
public class EstateController {

	@Autowired
	private EstateService estateService;
	
	@RequestMapping("/index")
	public String index(Model model) {
		PageInfo<RealEstate> pageInfo = estateService.getAll();
		model.addAttribute("page",pageInfo);
		return "estatelist";
	}
	
	@RequestMapping("/page")
	public String page(RealEstateDTO dto ,Model model) {
		//去获取数据
		PageInfo<RealEstate> pageInfo = estateService.listPage(dto);
		model.addAttribute("inputStr", dto.getInputValue());
		model.addAttribute("type", dto.getType());
		model.addAttribute("page", pageInfo);
		return "estatelist";
	}
	
}
