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
import com.dayuanit.ape.dto.CompanyDTO;
import com.dayuanit.ape.exception.BusException;
import com.dayuanit.ape.service.UserCompanyService;
import com.dayuanit.ape.vo.UserCompanyVO;

@Controller
public class UserCompanyController extends BaseController{
	
	@Autowired
	private UserCompanyService userCompanyService;
	
	@RequestMapping("/userCompany/addUserCompany")
	@ResponseBody
	public AjaxResultDTO addUserCompany(@Validated UserCompanyVO userCompanyVO, BindingResult binding, HttpServletRequest request){
		String errorMessage = "";
		UserCompanyVO userCompanyVO1 = null;
		try{
			if (binding.hasErrors()) {
				List<ObjectError> errors = binding.getAllErrors();
				for (ObjectError oe : errors) {
					errorMessage += oe.getDefaultMessage();
				}
				
				return AjaxResultDTO.failed(errorMessage);
			}
			
			System.out.println(userCompanyVO.getPostDesc());
			
			 userCompanyService.addUserCompany(userCompanyVO, getUserId(request));
		}catch(BusException e){
			return AjaxResultDTO.failed(e.getMessage());
		}catch(Exception ee){
			ee.printStackTrace();
			return AjaxResultDTO.failed("添加工作经历失败");
		}
		return AjaxResultDTO.success(userCompanyVO1);	
	}
	
	@RequestMapping("/userCompany/editUserCompany")
	@ResponseBody
	public AjaxResultDTO editUserCompany(@Validated UserCompanyVO userCompanyVO, BindingResult binding, HttpServletRequest request) {
		if (StringUtils.isBlank(userCompanyVO.getUserCompanyId())) {
			return AjaxResultDTO.failed("请求参数不正确");
		}
		
		try {
			userCompanyService.updateUserCompany(userCompanyVO, getUserId(request));
			return AjaxResultDTO.success();
		} catch(BusException be) {
			return AjaxResultDTO.failed(be.getMessage());
		} catch(Exception e) {
			logger.error("更新简历失败,{}", e.getMessage(), e);
			return AjaxResultDTO.failed("更新工作经历失败");
		}
	}
	
	@RequestMapping("/userCompany/removeCompany")
	@ResponseBody
	public AjaxResultDTO removeCompany(String companyId, HttpServletRequest request){
		try{
			userCompanyService.removeCompany(getUserId(request), Integer.parseInt(companyId));
		}catch(BusException e){
			return AjaxResultDTO.failed(e.getMessage());
		}catch(Exception ee){
			return AjaxResultDTO.failed("删除工作经历失败");
		}
		return AjaxResultDTO.success();
		
	}
	
	@RequestMapping("/userCompany/getCompany")
	@ResponseBody
	public AjaxResultDTO getCompany(String companyId, HttpServletRequest request){
		try{
			if (StringUtils.isBlank(companyId)) {
				return AjaxResultDTO.failed("请求参数不正确");
			}
			
			CompanyDTO companyDTO = userCompanyService.getCompany(Integer.parseInt(companyId), getUserId(request));

			return AjaxResultDTO.success(companyDTO);
		}catch(BusException e){
			return AjaxResultDTO.failed(e.getMessage());
		}catch(Exception ee){
			return AjaxResultDTO.failed("查询工作经历失败");
		}
	}
	
}
