package com.dayuanit.ape.vo;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotBlank;

public class HackDoMainVO {
	
	@NotBlank
	@Size(min = 1, max = 20, message = "域名长度为1-20")
	@Pattern(regexp="^[a-z0-9-]{0,20}$", message="域名由[字母、数字和下划线\"-\"]的任意组合，长度1-20位")
	private String hackDomain;

	public String getHackDomain() {
		return hackDomain;
	}

	public void setHackDomain(String hackDomain) {
		this.hackDomain = hackDomain;
	}
}
