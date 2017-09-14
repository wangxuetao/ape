package com.dayuanit.ape.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.dayuanit.ape.domain.UserCompany;

public interface UserCompanyMapper {
    
	List<UserCompany> listUserCompany(@Param("userId")Integer userId);
	
	int addUserCompany(UserCompany userCompany);
	
	int updateCompanyById(UserCompany userCompany);
	
	int removeCompany(@Param("userId")Integer userId, @Param("id")Integer id);
    
	UserCompany getCompanyByName(@Param("companyName")String companyName);
	
	UserCompany getCompanyById(@Param("companyId")Integer companyId);
	
}
