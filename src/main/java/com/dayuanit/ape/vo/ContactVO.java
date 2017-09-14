package com.dayuanit.ape.vo;

import javax.validation.constraints.Size;

public class ContactVO {
	
	@Size(min=0, max=11, message="手机号码长度11位")
	private String phone;
	
	@Size(min=0, max=20, message="微信号长度3-20位")
	private String wx;
	
	@Size(min=0, max=20, message="QQ号长度3-20位")
	private String qq;

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getWx() {
		return wx;
	}

	public void setWx(String wx) {
		this.wx = wx;
	}

	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

}
