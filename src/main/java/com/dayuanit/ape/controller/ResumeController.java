package com.dayuanit.ape.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dayuanit.ape.dto.AjaxResultDTO;
import com.dayuanit.ape.dto.ResumeBodyDTO;
import com.dayuanit.ape.dto.UserDTO;
import com.dayuanit.ape.service.ResumeService;
import com.dayuanit.ape.service.UserService;

@Controller
public class ResumeController extends BaseController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ResumeService resumeService;
	
	@RequestMapping("/resume/preview")
	public String preview(HttpServletRequest request) {
		try {
			UserDTO user = userService.getUserByUserId(getUserId(request));
			if (StringUtils.isBlank(user.getHackDomain())) {
				request.setAttribute("error", "请先填写简历域名");
				return "error";
			}
			return "redirect:/cv/" + user.getHackDomain();
		} catch(Exception e) {
			logger.error("预览错误，{}", e.getMessage(), e);
			return "error";
		}
		
	}
	
	@RequestMapping(value="/{hackDomain}")
	public String toResume(@PathVariable("hackDomain") String hackDomain, HttpServletRequest request) {
		try {
			ResumeBodyDTO dto = resumeService.previewResume(hackDomain);
			request.setAttribute("resume", dto);
			return "resume";
		} catch(Exception e) {
			request.setAttribute("error", "简历网址不存在");
			logger.error("预览简历异常,{}", e.getMessage(), e);
		}
		
		return "error";
	}
	
	@RequestMapping("/resume/getHackDomain")
	@ResponseBody
	public AjaxResultDTO getHackDomain(HttpServletRequest request) {
		UserDTO dto = userService.getUserByUserId(getUserId(request));
		if (null != dto && StringUtils.isNotBlank(dto.getHackDomain())) {
			return AjaxResultDTO.success();
		}
		
		return AjaxResultDTO.failed("请先填写简历域名");
	}
	
}
