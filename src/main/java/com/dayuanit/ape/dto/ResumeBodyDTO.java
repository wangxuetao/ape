package com.dayuanit.ape.dto;

import java.util.List;

import com.dayuanit.ape.domain.UserInfo;

public class ResumeBodyDTO {
	private UserDTO user;
	private UserInfo userInfo;
	private List<CompanyDTO> companys;
	public UserDTO getUser() {
		return user;
	}
	public void setUser(UserDTO user) {
		this.user = user;
	}
	public UserInfo getUserInfo() {
		return userInfo;
	}
	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}
	public List<CompanyDTO> getCompanys() {
		return companys;
	}
	public void setCompanys(List<CompanyDTO> companys) {
		this.companys = companys;
	}
	
}
