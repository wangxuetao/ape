package com.dayuanit.ape.vo;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotBlank;

public class EducationVO {
	
	@NotBlank
	@Size(min = 4, max = 20, message = "院校名长度4-20")
	private String schoolName;
	
	@NotNull
	private Integer degree;
	
	@NotBlank
	private String graduTime;
	
	@NotBlank
	@Size(min = 2, max = 20, message = "专业长度2-20")
	private String major;

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String getSchoolName() {
		return schoolName;
	}

	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}

	public Integer getDegree() {
		return degree;
	}

	public void setDegree(Integer degree) {
		this.degree = degree;
	}

	public String getGraduTime() {
		return graduTime;
	}

	public void setGraduTime(String graduTime) {
		this.graduTime = graduTime;
	}

	
}
