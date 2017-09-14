package com.dayuanit.ape.quartz;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.dayuanit.ape.apeenums.InviteCodeEnum;
import com.dayuanit.ape.dao.InviteCodeMapper;
import com.dayuanit.ape.domain.InviteCode;
import com.dayuanit.ape.util.DateUtil;

public class QueryInviteCode {
	
	@Autowired
	private InviteCodeMapper inviteCodeMapper;
	
	public void queryInvitedCode() {
		System.err.println("正在定时查询邀请码:"+DateUtil.dateToString1(new Date()));
		List<InviteCode> allCode =inviteCodeMapper.queryAllCode();
		
		for(InviteCode inviteCode:allCode) {
			handleCode(inviteCode);
		}
	}
	
	private void handleCode(InviteCode inviteCode) {
		
		if(inviteCode.getStatus()==InviteCodeEnum.已使用.getStatus()||
		   inviteCode.getStatus()==InviteCodeEnum.已过期.getStatus()) {
			inviteCodeMapper.deleteCode(inviteCode.getId());
		}
		
		if(inviteCode.getStatus()==InviteCodeEnum.未使用.getStatus()
		&&new Date().getTime()-inviteCode.getEndTime().getTime()<0) {
			System.err.println("未有过期邀请码:"+DateUtil.dateToString1(new Date()));
			return;
		}
		else{
			System.err.println("修改邀请码状态:"+DateUtil.dateToString1(new Date()));
			inviteCodeMapper.modifyCode(inviteCode.getCode());
		}
		
	}
}
