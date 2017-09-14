package com.dayuanit.ape.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dayuanit.ape.apeenums.InviteCodeEnum;
import com.dayuanit.ape.dao.InviteCodeMapper;
import com.dayuanit.ape.domain.InviteCode;
import com.dayuanit.ape.domain.UserCode;
import com.dayuanit.ape.exception.BusException;
import com.dayuanit.ape.service.InviteCodeService;
import com.dayuanit.ape.util.DateUtil;
import com.dayuanit.ape.util.InviteCodeUtil;

@Service
public class InviteCodeServiceImpl implements InviteCodeService {
	protected final static Logger logger = LoggerFactory.getLogger(InviteCodeServiceImpl.class);
	
	@Autowired
	private InviteCodeMapper inviteCodeMapper;
	
	@Override
	@Transactional(rollbackFor=Exception.class)
	public boolean addCode(Integer num) {
		
		try{
			int row=0;
			Set<String> codeSet = new HashSet<String>();
			do {
			String code = InviteCodeUtil.getCode();
			if(code.length()>6||code.contains(";")||code.contains("o")||code.contains("0")
				||code.contains("1")||code.contains("z")||code.contains("2")){
				continue;
			}
			else{
				codeSet.add(code);
			}
			}while(codeSet.size()<num); 
			
			for(String code :codeSet) {
				InviteCode inviteCode = new InviteCode();
				inviteCode.setCode(code);
				inviteCode.setStatus(0);
				inviteCode.setEndTime(DateUtil.addByMonth(new Date(), 3));
				row=inviteCodeMapper.addInviteCode(inviteCode);
				if(row!=1) {
					throw new BusException("生成邀请码异常");
				}
			}
		}catch(BusException e){
			logger.error("邀请码生成异常{}",e.getMessage());
			return false;
		}
		return  true;
	}
	
	@Override
	public InviteCode listAllCode(String code) {
		return  inviteCodeMapper.queryCode(code);
	}

	@Override
	public boolean useCode(String code) {
		int row =0;
		
		if(StringUtils.isBlank(code)) {
			throw new BusException("邀请码不能为空");
		}
		
		InviteCode ic =listAllCode(code);
		
		if(ic==null) {
			throw new BusException("邀请码不存在");
		}
		
		if(InviteCodeEnum.已使用.getStatus()==ic.getStatus()) {
			throw new BusException("邀请码已被使用");
		}
		
		if(InviteCodeEnum.已过期.getStatus()==ic.getStatus()||
				new Date().getTime()-ic.getEndTime().getTime()>0) {
			throw new BusException("邀请码已过期");
		}
		
		if(ic.getCode().equalsIgnoreCase(code)) {
			 row =inviteCodeMapper.modifyCode(code);
		}
		return row==1?true:false;
	}
	
	@Override
	@Transactional(rollbackFor=Exception.class)
	public boolean addUserCode(Integer userId) {
		int row=0;
		try{
		
		Set<String> codeSet = new HashSet<String>();
		List<UserCode> listcode=inviteCodeMapper.queryInviteId(userId);
		if(listcode.size()!=0) {
			throw new BusException("您已生成过邀请码");
		}
		
			do {
				String code = InviteCodeUtil.getCode();
				if(code.length()>6||code.contains(";")||code.contains("o")||code.contains("0")
						||code.contains("1")||code.contains("z")||code.contains("2")){
					continue;
				}
				else{
					codeSet.add(code);
				}
			}while(codeSet.size()<5);
			
			for(String code :codeSet) {
				UserCode uc = new UserCode();
				InviteCode inviteCode = new InviteCode();
				inviteCode.setCode(code);
				//设置为未使用初始化状态
				inviteCode.setStatus(0);
				
				//设置过期时间为30分钟
				inviteCode.setEndTime(DateUtil.addByMonth(new Date(), 3));
				row=inviteCodeMapper.addInviteCode(inviteCode);
				
				if(row!=1) {
					throw new BusException("生成邀请码失败");
				}
				uc.setUserId(userId);
				uc.setInviteId(inviteCode.getId());
				row = inviteCodeMapper.addUserCode(uc);
				
				if(row!=1) {
					throw new BusException("生成邀请码失败");
				}
			}
			
		}catch(Exception e){
				logger.error("邀请码生成异常{}",e.getMessage());
				return false;
		}
		return true;
	}

	@Override
	public List<String> queryInvite(Integer userId) {
		 List<UserCode> inviteId= inviteCodeMapper.queryInviteId(userId);
		 List<String> codeList = new ArrayList<String>();
		 for(UserCode uc:inviteId) {
			if(null==inviteCodeMapper.queryInviteCode(uc.getInviteId())) {
				throw new BusException("你的邀请码已过期");
			}
			
			if(inviteCodeMapper.queryInviteCode(uc.getInviteId()).getStatus()==0){
				 
				 codeList.add(inviteCodeMapper.queryInviteCode(uc.getInviteId()).getCode());
			 }
		 }
		return codeList;
	}
}
