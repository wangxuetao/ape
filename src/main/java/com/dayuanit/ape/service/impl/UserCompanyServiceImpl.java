package com.dayuanit.ape.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dayuanit.ape.dao.UserCompanyMapper;
import com.dayuanit.ape.domain.UserCompany;
import com.dayuanit.ape.dto.CompanyDTO;
import com.dayuanit.ape.exception.BusException;
import com.dayuanit.ape.service.UserCompanyService;
import com.dayuanit.ape.util.DateUtil;
import com.dayuanit.ape.util.HtmlUtil;
import com.dayuanit.ape.vo.UserCompanyVO;

@Service
public class UserCompanyServiceImpl implements UserCompanyService{
    
	@Autowired
	private UserCompanyMapper userCompanyMapper;
	
	@Override
	public List<CompanyDTO> listUserCompany(int userId, boolean format) {
		List<CompanyDTO> listUserCompanyDTO = new ArrayList<CompanyDTO>();
		
		List<UserCompany> listUserCompany = userCompanyMapper.listUserCompany(userId);
		for(UserCompany userCompany : listUserCompany){
			CompanyDTO companyDTO = new CompanyDTO();
			
			companyDTO.setCompanyName(userCompany.getCompanyName());
			companyDTO.setPosition(userCompany.getPosition());
			companyDTO.setPostDesc(userCompany.getPostDesc());
			if (format) {
				companyDTO.setPostDesc(HtmlUtil.unShowHtml(userCompany.getPostDesc(), 26));
			}
			
			companyDTO.setStartTime(DateUtil.dateToString(userCompany.getStartTime()));
			if (null != userCompany.getEndTime()) {
				companyDTO.setEndTime(DateUtil.dateToString(userCompany.getEndTime()));
			} else {
				companyDTO.setEndTime("至今");
			}
			
			companyDTO.setId(userCompany.getId());
			
			listUserCompanyDTO.add(companyDTO);
		}
		
		return listUserCompanyDTO; 
	}

	@Override
	public void addUserCompany(UserCompanyVO userCompanyVO, int userId) {
		UserCompany userCompany = new UserCompany();
		userCompany.setCompanyName(HtmlUtil.unSafeToHtml(userCompanyVO.getCompanyName()));
		userCompany.setPosition(HtmlUtil.unSafeToHtml(userCompanyVO.getPosition()));
		userCompany.setPostDesc(HtmlUtil.unSafeToHtml(userCompanyVO.getPostDesc()));
		userCompany.setStartTime(DateUtil.stringToDate(userCompanyVO.getStartTime()));
		if (StringUtils.isNotBlank(userCompanyVO.getEndTime())) {
			userCompany.setEndTime(DateUtil.stringToDate(userCompanyVO.getEndTime()));
		}
		
		userCompany.setUserId(userId);
		System.out.println(userCompany.getPostDesc());
		int row = userCompanyMapper.addUserCompany(userCompany);
		if(1 != row){
			throw new BusException("添加工作经历失败");
		}
	}

	@Override
	public void removeCompany(int userId, int companyId) {
		int row = userCompanyMapper.removeCompany(userId, companyId);
		if(1 != row){
			throw new BusException("删除工作经历失败");
		}
	}

	@Override
	public CompanyDTO getCompany(int companyId, int userId) {
		UserCompany userCompany = userCompanyMapper.getCompanyById(companyId);
		if (null == userCompany) {
			throw new BusException("工作经历不存在");
		}
		
		if (userId != userCompany.getUserId().intValue()) {
			throw new BusException("真要偷窥他人之简历？");
		}
		
		CompanyDTO companyDTO = new CompanyDTO();
		
		companyDTO.setCompanyName(userCompany.getCompanyName());
		companyDTO.setPosition(userCompany.getPosition());
		companyDTO.setPostDesc(HtmlUtil.unShowHtml(userCompany.getPostDesc()));
		companyDTO.setStartTime(DateUtil.dateToString(userCompany.getStartTime()));
		if (null != userCompany.getEndTime()) {
			companyDTO.setEndTime(DateUtil.dateToString(userCompany.getEndTime()));
		}
		
		companyDTO.setId(userCompany.getId());
		
		return companyDTO;
	}

	@Override
	public void updateUserCompany(UserCompanyVO userCompanyVO, int userId) {
		UserCompany company = userCompanyMapper.getCompanyById(Integer.valueOf(userCompanyVO.getUserCompanyId()));
		if (null == company) {
			throw new BusException("工作经历不存在");
		}
		
		if (company.getUserId().intValue() != userId) {
			throw new BusException("他人简历，看看即可");
		}
		
		company.setCompanyName(HtmlUtil.unSafeToHtml(userCompanyVO.getCompanyName()));
		company.setPosition(HtmlUtil.unSafeToHtml(userCompanyVO.getPosition()));
		company.setPostDesc(HtmlUtil.unSafeToHtml(userCompanyVO.getPostDesc()));
		company.setStartTime(DateUtil.stringToDate(userCompanyVO.getStartTime()));
		if (StringUtils.isNotBlank(userCompanyVO.getEndTime())) {
			company.setEndTime(DateUtil.stringToDate(userCompanyVO.getEndTime()));
		} else {
			company.setEndTime(null);
		}
		
		int row = userCompanyMapper.updateCompanyById(company);
		if(1 != row) {
			throw new BusException("更新工作经历失败");
		}
	}  
}
