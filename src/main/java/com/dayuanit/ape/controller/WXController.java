package com.dayuanit.ape.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dayuanit.ape.constant.LoginConstant;
import com.dayuanit.ape.domain.WXAccountInfo;
import com.dayuanit.ape.dto.AjaxResultDTO;
import com.dayuanit.ape.exception.BusException;
import com.dayuanit.ape.service.ApeAuthenService;

@Controller
@RequestMapping("/wxAuthen")
public class WXController extends BaseController {
	
	@Autowired
	private ApeAuthenService apeAuthenService;

	@RequestMapping("/wxLogin")
	@ResponseBody
	public AjaxResultDTO wxLogin() {
		return AjaxResultDTO.success(apeAuthenService.getWxCodeUrl());
	}
	
	@RequestMapping("/callback")
	public String wxAuthenWebCallback(String code, String state, HttpServletRequest req, HttpServletResponse resp) {
		logger.info("微信网页登录异步回调，参数cdoe={},state={}", code, state);
		try {
			WXAccountInfo userInfo = apeAuthenService.processWXCallback(code);
			req.getSession().setAttribute(LoginConstant.LOGIN_FLAG, userInfo);
			return "redirect:/";
		} catch (BusException be) {
			return "redirect:/error.jsp";
		} catch (Exception e) {
			logger.error("微信登录异常{}", e.getMessage(), e);
			return "redirect:/error.jsp";
		}
	}
}
