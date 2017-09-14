package com.dayuanit.ape.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dayuanit.ape.constant.ApeConstant;
import com.dayuanit.ape.constant.LoginConstant;
import com.dayuanit.ape.domain.User;
import com.dayuanit.ape.domain.UserInfo;
import com.dayuanit.ape.dto.AjaxResultDTO;
import com.dayuanit.ape.dto.CompanyDTO;
import com.dayuanit.ape.dto.UserDTO;
import com.dayuanit.ape.exception.BusException;
import com.dayuanit.ape.service.UserCompanyService;
import com.dayuanit.ape.service.UserInfoService;
import com.dayuanit.ape.service.UserService;
import com.dayuanit.ape.util.DyCodecUtil;
import com.dayuanit.ape.vo.LoginVo;

@Controller
public class UserController extends BaseController{
	
	private final static Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private UserInfoService userInfoService;
	
	@Autowired
	private UserCompanyService userCompanyService;
	
	@Value("#{configProperties['rember_key']}")
	private String pwdKey = "1q2w3e47";
	
	private static final int COOK_LIFE = 365 * 24 * 60 * 60;
	
	@RequestMapping("/toHome")
	public String toHome() {
		return "usercenter";
	}
	
	@RequestMapping("/user/toBaseInfo")
	public String toBaseInfo(HttpServletRequest request) {
		try {
			UserDTO user = userService.getUserByUserId(getUserId(request));
			request.setAttribute("user", user);
		} catch (BusException be) {
			logger.error("基本信息：{}",be.getMessage(), be);
		} catch (Exception e) {
			logger.error("基本信息：{}",e.getMessage(), e);
		}
		return "baseInfo";
	}
	
	@RequestMapping("/user/toSchool")
	public String toSchool(HttpServletRequest request) {
		try {
			UserDTO user = userService.getUserByUserId(getUserId(request));
			request.setAttribute("user", user);
		} catch (BusException be) {
			logger.error("学历信息：{}",be.getMessage(), be);
		} catch (Exception e) {
			logger.error("学历信息：{}",e.getMessage(), e);
		}
		return "school";
	}
	
	@RequestMapping("/user/toContact")
	public String toContact(HttpServletRequest request) {
		try {
			UserDTO user = userService.getUserByUserId(getUserId(request));
			request.setAttribute("user", user);
			
		} catch (BusException be) {
			logger.error("联系方式信息：{}",be.getMessage(), be);
		} catch (Exception e) {
			logger.error("联系方式信息：{}",e.getMessage(), e);
		}
		return "contact";
	}
	
	@RequestMapping("/user/toHackDomain")
	public String toHackDomain(HttpServletRequest request) {
		try {
			UserDTO user = userService.getUserByUserId(getUserId(request));
			request.setAttribute("user", user);
		} catch (BusException be) {
			logger.error("联系方式信息：{}",be.getMessage(), be);
		} catch (Exception e) {
			logger.error("联系方式信息：{}",e.getMessage(), e);
		}
		return "hackDomain";
	}
	
	@RequestMapping("/user/toOneWord")
	public String toOneWord(HttpServletRequest request) {
		try {
			UserInfo info = userInfoService.getUserInfo(getUserId(request));
			request.setAttribute("info", info);
		} catch (BusException be) {
			logger.error("联系方式信息：{}",be.getMessage(), be);
		} catch (Exception e) {
			logger.error("联系方式信息：{}",e.getMessage(), e);
		}
		return "oneWord";
	}
	
	@RequestMapping("/user/toCompanyExpress")
	public String toCompanyExpress(HttpServletRequest request) {
		try {
			List<CompanyDTO> listCompany = userCompanyService.listUserCompany(getUserId(request), true);
			request.setAttribute("listCompany", listCompany);
		} catch(Exception e) {
			logger.error("查询工作经历异常，{}", e.getMessage(), e);
		}
		
		return "companyExpress";
	}
	
	@RequestMapping("/user/toCompanyEdit")
	public String toCompanyEdit(int companyId, HttpServletRequest request) {
		try {
			CompanyDTO company = userCompanyService.getCompany(companyId, getUserId(request));
			request.setAttribute("company", company);
			return "companyEdit";
		} catch(Exception e) {
			logger.error("查询工作经历异常，{}", e.getMessage(), e);
		}
		
		return "error";
	}
	
	@RequestMapping("/user/toBlogCode")
	public String toBlogCode(HttpServletRequest request) {
		try {
			UserDTO user = userService.getUserByUserId(getUserId(request));
			request.setAttribute("user", user);
			return "blogCode";
		} catch (BusException be) {
			logger.error("联系方式信息：{}",be.getMessage(), be);
		} catch (Exception e) {
			logger.error("联系方式信息：{}",e.getMessage(), e);
		}
		
		return "error";
	}
	
	@RequestMapping("/user/toLogin")
	public String toLogin(HttpServletRequest request) {
		Cookie[] cks = request.getCookies();
		String email = null;
		if (null != cks) {
			for (Cookie ck : cks) {
				if (ApeConstant.REMBER_USERNAME_FLAG.equals(ck.getName())) {
					email = ck.getValue();
				}
				
				if (ApeConstant.REMBER_PWD_FLAG.equals(ck.getName())) {
					request.setAttribute("password", "000000");
				}
			}
		}
		
		request.setAttribute("email", email);
		
		return "login";
	}
	
	@RequestMapping("/user/toRegister")
	public String toRegister() {
		
		return "register";
	}
	
	private void remberPwd(LoginVo loginVo, HttpServletRequest request, HttpServletResponse response, boolean flush) {
		if (!loginVo.isRemberPwd()) {
			Cookie cookie = new Cookie(ApeConstant.REMBER_PWD_FLAG, "");
			cookie.setMaxAge(0);
			cookie.setPath("/");
			response.addCookie(cookie);
			return;
		}
		System.out.println(pwdKey);
		boolean createCookFlag = true;
		Cookie[] cks = request.getCookies();
		if (null != cks) {
			for (Cookie ck : cks) {
				if (ApeConstant.REMBER_PWD_FLAG.equals(ck.getName())) {
					createCookFlag = false;
				}
			}
		}
		
		if (flush || createCookFlag) {
			//创建cookie
			String orig = loginVo.getPassword();
			String sign = DyCodecUtil.encodeMsg(orig.getBytes(), pwdKey.getBytes());
			System.out.println("sign=" + sign);
			Cookie cookie = new Cookie(ApeConstant.REMBER_PWD_FLAG, sign);
			cookie.setMaxAge(COOK_LIFE);
			cookie.setPath("/");
			
			Cookie usernameCookie = new Cookie(ApeConstant.REMBER_USERNAME_FLAG, loginVo.getEmail());
			usernameCookie.setMaxAge(COOK_LIFE);
			usernameCookie.setPath("/");
			
			response.addCookie(cookie);
			response.addCookie(usernameCookie);
		}
	}
	
	@RequestMapping("/user/login")
	@ResponseBody
	public AjaxResultDTO login(LoginVo loginVo, HttpSession session, HttpServletRequest request, HttpServletResponse response){
		try{
			//解析记住密码
			String sign = null;
			String rName = null;
			Cookie[] cks = request.getCookies();
			
			if (null != cks) {
				for (Cookie ck : cks) {
					if (ApeConstant.REMBER_PWD_FLAG.equals(ck.getName())) {
						sign = ck.getValue();
						System.out.println("登录sign=" + sign);
					}
					
					if (ApeConstant.REMBER_USERNAME_FLAG.equals(ck.getName())) {
						rName = ck.getValue();
					}
				}
			}
			
			boolean flush = false;
			if (loginVo.getEmail().equals(rName) && loginVo.isRemberPwd()) {
				if (StringUtils.isNotBlank(sign)) {
					String password = DyCodecUtil.decodeMsg(sign.getBytes(), pwdKey.getBytes());
					System.out.println("解密后的paaword=" + password);
					loginVo.setPassword(password);
					flush = true;
				}
			}
			
			userService.login(loginVo);
			User user = userService.getUserByEmail(loginVo);
			session.setAttribute(LoginConstant.LOGIN_FLAG, user);
			
			remberPwd(loginVo, request, response, flush);
			
			return AjaxResultDTO.success();
		}catch(BusException be){
			be.printStackTrace();
			logger.error("登录异常：{}",be.getMessage(), be);
			return AjaxResultDTO.failed(be.getMessage());
		}catch(Exception e){
			e.printStackTrace();
			logger.error("登录异常：{}",e.getMessage(), e);
			return AjaxResultDTO.failed("登录失败");
		}
		
	}
	
	@RequestMapping("/user/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (null != session) {
			session.invalidate();
		}
		
		return "login";
	}
	
}
