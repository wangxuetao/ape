package com.dayuanit.ape.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.dayuanit.ape.constant.LoginConstant;
import com.dayuanit.ape.domain.WXAccountInfo;
import com.dayuanit.ape.exception.BusException;

public abstract class BaseController {
	
	protected final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public int getUserId(HttpServletRequest request) {
		HttpSession session = request.getSession();
		Object obj = (Object)session.getAttribute(LoginConstant.LOGIN_FLAG);
		if (null != obj) {
			WXAccountInfo user = (WXAccountInfo)obj; 
			return user.getUserId();
		}
		
		throw new BusException("未登录");
	}
	
	public WXAccountInfo getUser(HttpServletRequest request) {
		HttpSession session = request.getSession();
		Object obj = (Object)session.getAttribute(LoginConstant.LOGIN_FLAG);
		if (null != obj) {
			WXAccountInfo user = (WXAccountInfo)obj; 
			return user;
		}
		
		throw new BusException("未登录");
	}
}
