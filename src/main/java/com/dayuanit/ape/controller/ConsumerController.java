package com.dayuanit.ape.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dayuanit.ape.dto.AjaxResultDTO;
import com.dayuanit.ape.exception.BusException;
import com.dayuanit.ape.service.UserInfoService;
import com.dayuanit.ape.service.UserService;
import com.dayuanit.ape.vo.BaseInfoVO;
import com.dayuanit.ape.vo.BlogCodeVO;
import com.dayuanit.ape.vo.ContactVO;
import com.dayuanit.ape.vo.EducationVO;
import com.dayuanit.ape.vo.HackDoMainVO;
import com.dayuanit.ape.vo.OneWordVO;
import com.dayuanit.ape.vo.RegistVO;

@Controller 
@RequestMapping("/consumer")
public class ConsumerController extends BaseController{
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private UserInfoService userInfoService;
	
	@RequestMapping("/toHome")
	public String toHome() {
		return "usercenter";
	}
	
	@RequestMapping("/toRegister")
	public String toRegister() {
		return "register";
	}
	
	@RequestMapping("/toBaseInfo")
	public String toBaseInfo() {
		return "baseInfo";
	}
	
	@RequestMapping("/toSchool")
	public String toSchool() {
		return "school";
	}
	
	@RequestMapping("/toContact")
	public String toContact() {
		return "contact";
	}
	
	@RequestMapping("/toHackDomain")
	public String toHackDomain() {
		return "hackDomain";
	}
	
	@RequestMapping("/toBlogCode")
	public String toBlogCode() {
		return "blogCode";
	}
	
	@RequestMapping("/toOneWord")
	public String toOneWord() {
		return "oneWord";
	}
	
	@RequestMapping("/register")
	@ResponseBody
	public AjaxResultDTO register(@Validated RegistVO registVO, BindingResult binding) {
		try{
			//registVO对输入的参数进行了判断，现在将其存在的错度信息输出到logger日志里
			String errorMessage = "";
			if (binding.hasErrors()) {
				List<ObjectError> errors = binding.getAllErrors();
				for (ObjectError oe : errors) {
					errorMessage += oe.getDefaultMessage();
				}
				
				return AjaxResultDTO.failed(errorMessage);
			}
			
			userService.regist(registVO);
			
		} catch(BusException be) {
			logger.error("注册异常:{}", be.getMessage(), be);
			return AjaxResultDTO.failed(be.getMessage());
		} catch(Exception e) {
			logger.error("注册异常:{}", e.getMessage(), e);
			return AjaxResultDTO.failed("注册失败");
		}
		
		return AjaxResultDTO.success();

	}
	
	@RequestMapping("/baseInfo")
	@ResponseBody
	public AjaxResultDTO BaseInfo(@Validated BaseInfoVO baseInfoVO, BindingResult binding, HttpServletRequest request) {
		try{
			//baseInfoVO对输入的参数进行了判断，现在将其存在的错度信息输出到logger日志里
			String errorMessage = "";
			if (binding.hasErrors()) {
				List<ObjectError> errors = binding.getAllErrors();
				for (ObjectError oe : errors) {
					errorMessage += oe.getDefaultMessage();
				}
				
				return AjaxResultDTO.failed(errorMessage);
			}
			
			userService.modifyBaseInfo(getUserId(request), baseInfoVO);
			
		} catch(BusException be) {
			logger.error("添加基本信息异常:{}", be.getMessage(), be);
			return AjaxResultDTO.failed(be.getMessage());
		} catch(Exception e) {
			logger.error("添加基本信息异常:{}", e.getMessage(), e);
			return AjaxResultDTO.failed(e.getMessage());
		}
		
		return AjaxResultDTO.success();
	}
	
	@RequestMapping("/school")
	@ResponseBody
	public AjaxResultDTO school(@Validated EducationVO educationVO, BindingResult binding, HttpServletRequest request) {
		try {
			String errorMessage = "";
			if (binding.hasErrors()) {
				List<ObjectError> errors = binding.getAllErrors();
				for (ObjectError oe : errors) {
					errorMessage += oe.getDefaultMessage();
				}
				
				return AjaxResultDTO.failed(errorMessage);
			}
			
			userService.modifyEducation(getUserId(request), educationVO);
		} catch (BusException be) {
			logger.error("添加学习信息异常:{}", be.getMessage(), be);
			return AjaxResultDTO.failed(be.getMessage());
		}catch (Exception e) {
			logger.error("添加学历信息异常:{}", e.getMessage(), e);
			return AjaxResultDTO.failed(e.getMessage());
		}
		
		return AjaxResultDTO.success();
	}
	
	@RequestMapping("/contact")
	@ResponseBody
	public AjaxResultDTO contact(@Validated ContactVO contactVO, BindingResult binding, HttpServletRequest request) {
		try {
			String errorMessage = "";
			if (binding.hasErrors()) {
				List<ObjectError> errors = binding.getAllErrors();
				for (ObjectError oe : errors) {
					errorMessage += oe.getDefaultMessage();
				}
				
				return AjaxResultDTO.failed(errorMessage);
			}
			
			userService.modifyContact(getUserId(request), contactVO);
		} catch (BusException be) {
			logger.error("添加联系方式异常:{}", be.getMessage(), be);
			return AjaxResultDTO.failed(be.getMessage());
		}catch (Exception e) {
			logger.error("添加联系方式异常:{}", e.getMessage(), e);
			return AjaxResultDTO.failed(e.getMessage());
		}
		
		return AjaxResultDTO.success();
	}
	
	@RequestMapping("/hackDomain")
	@ResponseBody
	public AjaxResultDTO hackDomain(@Validated HackDoMainVO hackDomainVO, BindingResult binding, HttpServletRequest request) {
		try {
			String errorMessage = "";
			if (binding.hasErrors()) {
				List<ObjectError> errors = binding.getAllErrors();
				for (ObjectError oe : errors) {
					errorMessage += oe.getDefaultMessage();
				}
				
				return AjaxResultDTO.failed(errorMessage);
			}
			
			userService.modifyHackDoMain(getUserId(request), hackDomainVO);
		} catch (BusException be) {
			logger.error("添加个人域名异常:{}", be.getMessage(), be);
			return AjaxResultDTO.failed(be.getMessage());
		}catch (Exception e) {
			logger.error("添加个人域名异常:{}", e.getMessage(), e);
			return AjaxResultDTO.failed(e.getMessage());
		}
		
		return AjaxResultDTO.success();
	}
	
	@RequestMapping("/saveBlogCode")
	@ResponseBody
	public AjaxResultDTO saveBlogCode(BlogCodeVO blogCodeVO, HttpServletRequest request) {
		try {
			if (StringUtils.isNotBlank(blogCodeVO.getBlogUrl()) && blogCodeVO.getBlogUrl().length() > 100) {
				return AjaxResultDTO.failed("地址太长");
			}
			
			if (StringUtils.isNotBlank(blogCodeVO.getCodeUrl()) && blogCodeVO.getCodeUrl().length() > 100) {
				return AjaxResultDTO.failed("地址太长");
			}
			
			userService.modifyBlogCode(getUserId(request), blogCodeVO);
		} catch (BusException be) {
			logger.error("添加源代码、博客域名异常:{}", be.getMessage(), be);
			return AjaxResultDTO.failed(be.getMessage());
		}catch (Exception e) {
			logger.error("添加源代码、博客域名异常:{}", e.getMessage(), e);
			return AjaxResultDTO.failed(e.getMessage());
		}
		
		return AjaxResultDTO.success();
	}
	
	@RequestMapping("/oneWord")
	@ResponseBody
	public AjaxResultDTO oneWord(@Validated OneWordVO oneWordVO, BindingResult binding, HttpServletRequest request) {
		String oneWord;
		try {
			String errorMessage = "";
			if (binding.hasErrors()) {
				List<ObjectError> errors = binding.getAllErrors();
				for (ObjectError oe : errors) {
					errorMessage += oe.getDefaultMessage();
				}
				
				return AjaxResultDTO.failed(errorMessage);
			}
			
			oneWord = userInfoService.modifyOneWord(getUserId(request), oneWordVO);
		} catch (BusException be) {
			logger.error("添加个性签名异常:{}", be.getMessage(), be);
			return AjaxResultDTO.failed(be.getMessage());
		}catch (Exception e) {
			logger.error("添加源个性签名异常:{}", e.getMessage(), e);
			return AjaxResultDTO.failed(e.getMessage());
		}
		
		return AjaxResultDTO.success(oneWord);
	}
}
