package com.dayuanit.ape.domain;

public class UserInfo {
	private Integer id;
	private Integer userId;
	private String oneWord;
	private String aboutMe;
	private String skillDesc;
	private String expressDesc;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getOneWord() {
		return oneWord;
	}

	public void setOneWord(String oneWord) {
		this.oneWord = oneWord;
	}

	public String getAboutMe() {
		return aboutMe;
	}

	public void setAboutMe(String aboutMe) {
		this.aboutMe = aboutMe;
	}

	public String getSkillDesc() {
		return skillDesc;
	}

	public void setSkillDesc(String skillDesc) {
		this.skillDesc = skillDesc;
	}

	public String getExpressDesc() {
		return expressDesc;
	}

	public void setExpressDesc(String expressDesc) {
		this.expressDesc = expressDesc;
	}

}
