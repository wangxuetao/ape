package com.dayuanit.ape.vo;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotBlank;

public class OneWordVO {
	@NotBlank
	@Size(min = 5, max = 60, message = "用户名长度5-60")
	private String oneWord;

	public String getOneWord() {
		return oneWord;
	}

	public void setOneWord(String oneWord) {
		this.oneWord = oneWord;
	}
	
	
}
