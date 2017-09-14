package com.dayuanit.ape.apeenums;

import com.dayuanit.ape.exception.BusException;

public enum DegreeEnum {
	
	BACHELOR(1, "本科"), SPECIALTY(2, "专科"), GRADUATE_STUDENT(3, "研究生"), DOCTOR_OF_PHILOSOPHY(4, "博士");

	private Integer degree;
	private String name;
	
	private DegreeEnum(Integer degree, String name) {
		this.degree = degree;
		this.name = name;
	}
	
	public static DegreeEnum getDegree(Integer degree) {
		for(DegreeEnum de : DegreeEnum.values()) {
			if(degree == de.getDegree()) {
				return de;
			}
		}
		
		throw new BusException("学历状态出现问题");
	}
	
	public Integer getDegree() {
		return degree;
	}
	
	public String getName() {
		return name;
	}

}
