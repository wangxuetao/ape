package com.dayuanit.ape.service;

import com.dayuanit.ape.domain.User;
import com.dayuanit.ape.dto.UserDTO;
import com.dayuanit.ape.vo.BaseInfoVO;
import com.dayuanit.ape.vo.BlogCodeVO;
import com.dayuanit.ape.vo.ContactVO;
import com.dayuanit.ape.vo.EducationVO;
import com.dayuanit.ape.vo.HackDoMainVO;
import com.dayuanit.ape.vo.LoginVo;
import com.dayuanit.ape.vo.RegistVO;

public interface UserService {
	
	void regist(RegistVO registVO) throws Exception;
	
	UserDTO getUserByUserId(Integer userId);
	
	void modifyEducation(Integer userId, EducationVO educationVO) throws Exception;
	
	void modifyContact(Integer userId, ContactVO contactVO);
	
	void modifyHackDoMain(Integer userId, HackDoMainVO hackDomainVO);
	
	void modifyBlogCode(Integer userId, BlogCodeVO blogCodeVO);
	void login(LoginVo loginVo);
	
	User getUserByEmail(LoginVo loginVo);
	
	void modifyBaseInfo(Integer userId, BaseInfoVO baseInfoVO) throws Exception;
	
	User getUserByHackDomain(String hackDomain);
	
	User regist4WX();
	
}
