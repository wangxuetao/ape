package com.dayuanit.ape.vo;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;

public class RegistVO {

	@NotBlank
	@Email
	private String email;

	@NotBlank
	@Size(min = 6, max = 16, message = "密码长度6-16")
	private String password;

	@NotBlank
	@Size(min = 6, max = 16, message = "密码长度6-16")
	private String confirmPassword;
	
	@NotBlank
	@Size(min = 6, max = 6, message = "邀请码长度6，区分大小写")
	private String inviteCode;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

	public String getInviteCode() {
		return inviteCode;
	}

	public void setInviteCode(String inviteCode) {
		this.inviteCode = inviteCode;
	}

	
	
}
