package com.dayuanit.ape.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dayuanit.ape.domain.UserInfo;
import com.dayuanit.ape.dto.AjaxResultDTO;
import com.dayuanit.ape.exception.BusException;
import com.dayuanit.ape.service.UserInfoService;
import com.dayuanit.ape.util.HtmlUtil;

@Controller
public class UserInfoController extends BaseController{
	
	@Autowired
	private UserInfoService userInfoService;
	
	@RequestMapping("/user/toAboutMe")
	public String toAboutMe(HttpServletRequest request) {
		try {
			UserInfo userInfo = userInfoService.getUserInfo(getUserId(request));
			request.setAttribute("aboutMe", HtmlUtil.unShowHtml(userInfo.getAboutMe(), 26));
			
			request.setAttribute("aboutMeEdit", HtmlUtil.unShowHtml(userInfo.getAboutMe()));
		} catch (BusException ee) {
		} catch (Exception e) {
			logger.error("获取用户info信息失败,{}", e.getMessage(), e);
		}

		return "aboutMe";
	}
	
	@RequestMapping("/userInfo/saveAboutMe")
	@ResponseBody
	public AjaxResultDTO saveAboutMe(String aboutMe, HttpServletRequest request) {
		if(StringUtils.isBlank(aboutMe)){
			return AjaxResultDTO.failed("请输入自我介绍");
		}
		
		aboutMe = HtmlUtil.unSafeToHtml(aboutMe);
		
		try{
			userInfoService.saveAboutMe(getUserId(request), aboutMe);
			return AjaxResultDTO.success(aboutMe);
		}catch(BusException be){
			return AjaxResultDTO.failed(be.getMessage());
		}catch(Exception e){
			logger.error("保存自我简介异常，{}", e.getMessage(), e);
			return AjaxResultDTO.failed("保存失败");
		}
	}
	
	
	@RequestMapping("/user/toSkill")
	public String toSkill(HttpServletRequest request) {
		
		UserInfo userInfo = userInfoService.getUserInfo(getUserId(request));
		
		request.setAttribute("skillDesc", HtmlUtil.unShowHtml(userInfo.getSkillDesc(), 26));
		request.setAttribute("skillDescEdit", HtmlUtil.unShowHtml(userInfo.getSkillDesc()));
		return "skill";
	}
	
	@RequestMapping("/userInfo/saveSkillDesc")
	@ResponseBody
	public AjaxResultDTO saveSkillDesc(String skillDesc, HttpServletRequest request) throws BusException{
		if(StringUtils.isBlank(skillDesc)){
			return AjaxResultDTO.failed("请在输入技能描述");
		}
		
		if (skillDesc.length() > 700) {
			return AjaxResultDTO.failed("技能描述需在700字符以内");
		}
		
		try{
			skillDesc = HtmlUtil.unSafeToHtml(skillDesc);
			System.out.println(skillDesc);
			userInfoService.saveSkillDesc(getUserId(request), skillDesc);
		}catch(BusException e){
			return AjaxResultDTO.failed(e.getMessage());
		}catch(Exception ee){
			ee.printStackTrace();
			return AjaxResultDTO.failed("保存失败");
		}
		return AjaxResultDTO.success(skillDesc);
	}

}
