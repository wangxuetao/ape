package com.dayuanit.ape.apeenums;

import com.dayuanit.ape.exception.BusException;

public enum InviteCodeEnum {
	未使用(0, "未使用"), 已使用(1, "已使用"), 已过期(2, "已过期");
	
	private int status;
	private String desc;
	
	public String getDesc() {
		return desc;
	}

	public int getStatus() {
		return status;
	}

	private InviteCodeEnum(int status, String desc) {
		this.status = status;
		this.desc = desc;
	}
	
	public static InviteCodeEnum getOrderStatus(int statu) {
		
		for (InviteCodeEnum om : InviteCodeEnum.values()) {
			if (statu == om.getStatus()) {
				return om;
			}
		}
		
		throw new BusException("邀请码状态错误");
	}
}
