package com.dayuanit.ape.service.impl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dayuanit.ape.apeenums.DegreeEnum;
import com.dayuanit.ape.apeenums.SexEnum;
import com.dayuanit.ape.domain.User;
import com.dayuanit.ape.domain.UserInfo;
import com.dayuanit.ape.dto.CompanyDTO;
import com.dayuanit.ape.dto.ResumeBodyDTO;
import com.dayuanit.ape.dto.UserDTO;
import com.dayuanit.ape.service.ResumeService;
import com.dayuanit.ape.service.UserCompanyService;
import com.dayuanit.ape.service.UserInfoService;
import com.dayuanit.ape.service.UserService;
import com.dayuanit.ape.util.DateUtil;
import com.dayuanit.ape.util.HtmlUtil;

@Service
public class ResumeServiceImpl implements ResumeService {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private UserInfoService userInfoService;
	
	@Autowired
	private UserCompanyService userCompanyService;

	@Override
	public ResumeBodyDTO previewResume(String hackDomain) {
		User user = userService.getUserByHackDomain(hackDomain);
		
		UserDTO dto = new UserDTO();
		if (null != user.getBirthday()) {
			dto.setBirthday(DateUtil.dateToString(user.getBirthday()));
		}
		dto.setBlogUrl(user.getBlogUrl());
		dto.setCodeUrl(user.getCodeUrl());
		dto.setEmail(user.getEmail());
		if (null != user.getGraduTime()) {
			dto.setGraduTime(DateUtil.dateToString(user.getGraduTime()));
		}
		
		dto.setMajor(user.getMajor());
		dto.setHackDomain(user.getHackDomain());
		dto.setPhone(user.getPhone());
		dto.setQq(user.getQq());
		dto.setRealName(user.getRealName());
		dto.setSchoolName(user.getSchoolName());
		dto.setWx(user.getWx());
		if (StringUtils.isBlank(user.getSex())) {
			dto.setSexValue(null);
			dto.setSex(SexEnum.MAN.getSex());
		} else {
			dto.setSexValue(SexEnum.getSexEnum(user.getSex()).getName());
			dto.setSex(user.getSex());
		}
		
		if (null == user.getDegree()) {
			dto.setDegreeValue(null);
			dto.setDegree(String.valueOf(DegreeEnum.BACHELOR.getDegree()));
		} else {
			dto.setDegree(String.valueOf(user.getDegree()));
			dto.setDegreeValue(DegreeEnum.getDegree(user.getDegree()).getName());
		}
		
		UserInfo userInfo = userInfoService.getUserInfo(user.getId());
		userInfo.setAboutMe(userInfo.getAboutMe());
		userInfo.setExpressDesc(userInfo.getExpressDesc());
		userInfo.setOneWord(userInfo.getOneWord());
		userInfo.setSkillDesc(userInfo.getSkillDesc());
		
		List<CompanyDTO> companys = userCompanyService.listUserCompany(user.getId(), false);
		for (CompanyDTO company : companys) {
			company.setPostDesc(company.getPostDesc());
		}
		
		ResumeBodyDTO resume = new ResumeBodyDTO();
		resume.setCompanys(companys);
		resume.setUser(dto);
		resume.setUserInfo(userInfo);
		return resume;
	}

}
