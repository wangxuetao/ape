package com.dayuanit.ape.vo;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;

public class BaseInfoVO {

	@NotBlank
	@Size(min = 1, max = 10, message = "用户名长度1-10")
	private String realName;

	@NotBlank
	private String sex;

	@NotBlank
	private String birthday;

	@NotBlank
	@Email
	@Size(min = 5, max = 30, message = "邮箱长度5-30")
	private String email;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

}
