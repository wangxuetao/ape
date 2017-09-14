package com.dayuanit.ape.vo;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotBlank;

public class UserCompanyVO {
	
	private String userCompanyId;
	
	@NotBlank
	@Size(min = 2, max = 30, message = "公司名长度长度2-30")
	private String companyName;
	
	@NotBlank
	@Size(min = 3, max = 30, message = "职位长度3-30")
	private String position;
	
	@NotBlank
	@Size(min = 10, max = 700, message = "职位描述长度10-700")
	private String postDesc;
	
	@NotBlank
	@Size(min = 10, max = 10, message = "时间格式错误")
	private String startTime;
	
	private String endTime;
	
	public String getUserCompanyId() {
		return userCompanyId;
	}
	public void setUserCompanyId(String userCompanyId) {
		this.userCompanyId = userCompanyId;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getPostDesc() {
		return postDesc;
	}
	public void setPostDesc(String postDesc) {
		this.postDesc = postDesc;
	}

}
