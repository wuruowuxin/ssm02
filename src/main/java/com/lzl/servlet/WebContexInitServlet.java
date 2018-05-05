package com.lzl.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

/**
 * 设置一个上下文路径
 * @author Administrator
 *
 */
@WebServlet(urlPatterns = {},loadOnStartup = 2)
public class WebContexInitServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public void init() throws ServletException{
		getServletContext().setAttribute("ctx", getServletContext().getContextPath());
	}
}
