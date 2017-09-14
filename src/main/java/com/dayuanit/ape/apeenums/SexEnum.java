package com.dayuanit.ape.apeenums;

import com.dayuanit.ape.exception.BusException;

public enum SexEnum {
	
	MAN("M","男"), WOMAN("F", "女");
	
	private String sex;
	private String name;
	
	private SexEnum(String sex, String name) {
		this.sex = sex;
		this.name = name;
	}
	
	public String getSex() {
		return sex;
	}

	public String getName() {
		return name;
	}

	public static SexEnum getSexEnum(String sex) {
		
		for (SexEnum om : SexEnum.values()) {
			if (sex.equals(om.getSex())) {
				return om;
			}
		}
		
		throw new BusException("性别错误");
	}

}
