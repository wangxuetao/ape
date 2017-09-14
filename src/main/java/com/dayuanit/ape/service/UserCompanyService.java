package com.dayuanit.ape.service;

import java.util.List;

import com.dayuanit.ape.dto.CompanyDTO;
import com.dayuanit.ape.vo.UserCompanyVO;

public interface UserCompanyService {
	
	List<CompanyDTO> listUserCompany(int userId, boolean format);
	
	void addUserCompany(UserCompanyVO userCompanyVO, int userId);
	
	void removeCompany(int userId, int companyId);

	CompanyDTO getCompany(int companyId, int userId);
	
	void updateUserCompany(UserCompanyVO userCompanyVO, int userId);
}
