package com.lzl.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lzl.model.Users;
import com.lzl.pojo.Msg;
import com.lzl.service.UsersService;

@Controller
@RequestMapping("/users")
public class UsersController {
	
	@Autowired
	private UsersService usersService;
	
	@RequestMapping("/login")
	public String login(Users u,Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		Users users = usersService.login(u);
		if(users != null) {
			session.setAttribute("users", users);
			session.removeAttribute("msg");
			return "estatelist";
		}else {
			//搞定它失败的原因
			boolean idExits = usersService.isExists(u.getCardId());
			Msg msg = new Msg();
			if(!idExits) {
				//该账号不存在,请先注册
				msg.setCode(404);
				msg.setMessage("该账号不存在,请先注册");
			}else {
				boolean isDisable = usersService.isDisable(u.getCardId());
				if(isDisable) {
					//1 被禁用
					msg.setCode(505);
					msg.setMessage("登陆失败,该账号已被冻结");
				}else {
					//2密码错误
					msg.setCode(503);
					msg.setMessage("登录失败,身份证号或密码错误");
				}
			}
			session.setAttribute("msg", msg);
			return "redirect:/";
		}
	}
	
	@RequestMapping("/isUsed/{id}")
	@ResponseBody
	public Msg isUsed(@PathVariable("id") String cardId) {
		boolean idExits = usersService.isExists(cardId);
		Msg msg = new Msg();
		if(idExits) {
			msg.setCode(1);
			msg.setMessage("身份证号已经被注册");
		}else {
			msg.setCode(0);
			msg.setMessage("身份证号可以使用");
		}
		return msg;
	}
	
	@RequestMapping("/register")
	public void register(Users u,HttpServletRequest request,HttpServletResponse response,Model model) {
		int row = usersService.register(u);
		if(row == 1) {
			try {
				request.setAttribute("sucRegister", 1);
				request.getRequestDispatcher("/register.jsp").forward(request, response);
			} catch (ServletException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		request.getSession().removeAttribute("users");
		return "redirect:/";
	}
}
