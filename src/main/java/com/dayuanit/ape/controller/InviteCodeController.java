package com.dayuanit.ape.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dayuanit.ape.dto.AjaxResultDTO;
import com.dayuanit.ape.exception.BusException;
import com.dayuanit.ape.service.InviteCodeService;
import com.dayuanit.ape.vo.RegistVO;

@Controller
public class InviteCodeController extends BaseController{
    
	@Autowired
	private InviteCodeService inviteCodeService;
	
	
	@RequestMapping("/user/toInviteCode.do")
	public String toInviteCode(HttpServletRequest request) {
		
		return "inviteCode";
	}
	
	@RequestMapping("/userInfo/listInviteCode.do")
	@ResponseBody()
	public AjaxResultDTO listInviteCode(HttpServletRequest request){
		List<String> listCode = null;
		try{
			listCode = inviteCodeService.queryInvite(getUserId(request));
			
			if(0 == listCode.size()){
				 return AjaxResultDTO.failed("查询邀请码失败");
				}
		}catch(BusException e){
			return AjaxResultDTO.failed(e.getMessage());
		}catch(Exception ee){
			ee.printStackTrace();
			return AjaxResultDTO.failed("查询邀请码失败");
		}
		
	    return AjaxResultDTO.success(listCode); 
	}
}
