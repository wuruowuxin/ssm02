package com.lzl.mapper;

import org.apache.ibatis.annotations.Param;

import com.lzl.model.Users;

public interface UsersMapper {

	Users login(Users u);
	
	int isExists(@Param("cardId")String cardId);
	
	int isDisable(String cardId);
	
	int insertTive(Users u);
}
