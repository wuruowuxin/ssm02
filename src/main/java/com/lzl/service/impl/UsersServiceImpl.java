package com.lzl.service.impl;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lzl.mapper.UsersMapper;
import com.lzl.model.Users;
import com.lzl.service.UsersService;

@Service("UsersService")
public class UsersServiceImpl implements UsersService{

	@Autowired
	private UsersMapper usersMapper;

	@Override
	public Users login(Users u) {
		Users users = usersMapper.login(u);
		return users;
	}

	@Override
	public boolean isExists(String cardId) {
		int row = usersMapper.isExists(cardId);
		if(row == 1) {
			return true;
		}
		return false;
	}

	@Override
	public boolean isDisable(String cardId) {
		int row = usersMapper.isDisable(cardId);
		if(row == 1) {
			return true;
		}
		return false;
	}

	@Override
	public int register(Users u) {
		u.setCreateTime(new Date());
		String endChar = u.getCardId().substring(u.getCardId().length()-1);
		int num = Integer.parseInt(endChar);
		if(num % 2 == 0) {
			u.setGender(0);
		} else {
			u.setGender(1);
		}
		int row = usersMapper.insertTive(u);
		return row;
	}
	
	
}
