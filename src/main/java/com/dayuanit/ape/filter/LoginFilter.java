package com.dayuanit.ape.filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dayuanit.ape.constant.LoginConstant;


public class LoginFilter implements Filter{
	
	private static List<String> list;

	@Override
	public void destroy() {
		System.out.println("========login filter destory======");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// 判断URL是否为受保护的请求
		
		HttpServletRequest req = (HttpServletRequest)request;
		String targetURI = req.getRequestURI();
		
		
		if (!list.contains(targetURI)) {
			System.out.println(targetURI + "受保护的地址");
			// 如果是受保护的 要判断用户是否登录
			HttpSession session = req.getSession(false);
			
			if (null != session) {
				Object loginFlag = session.getAttribute(LoginConstant.LOGIN_FLAG);
				if (null != loginFlag) {
					// 已登录 放行
					chain.doFilter(request, response);
					return;
				}
			}
			
			System.out.println(targetURI + "session为空");
			
			//未登录 跳转到登录页面
			HttpServletResponse resp = (HttpServletResponse)response;
			resp.sendRedirect(req.getServletContext().getContextPath() + "/user/toLogin.do");
			return;
		}
		
		chain.doFilter(request, response);
		
	}

	@Override
	public void init(FilterConfig cofing) throws ServletException {
		System.out.println("========login filter init======");
		
		String fileName = cofing.getInitParameter("whiteUrlFile");
		String key = cofing.getInitParameter("whiteUrlKey");
		
		//TODO 获取受保护的地址列表
		Properties pro = new Properties();
		try {
			pro.load(this.getClass().getClassLoader().getResourceAsStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		String whiteUrl = (String)pro.get(key);
		String[] urls = whiteUrl.split(",");
		
		list = new ArrayList<String>();
		
		for(String url : urls) {
			System.out.println(url);
			list.add(cofing.getServletContext().getContextPath() + url);
		}
		
		for (String xx : list) {
			System.out.println(xx);
		}
		
	}
	
}
