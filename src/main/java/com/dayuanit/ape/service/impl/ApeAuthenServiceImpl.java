package com.dayuanit.ape.service.impl;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dayuanit.ape.authen.handler.WXAuthenWebHandler;
import com.dayuanit.ape.constant.ErrorCodeConstant;
import com.dayuanit.ape.dao.WXAccountInfoMapper;
import com.dayuanit.ape.domain.User;
import com.dayuanit.ape.domain.WXAccountInfo;
import com.dayuanit.ape.exception.BusException;
import com.dayuanit.ape.service.ApeAuthenService;
import com.dayuanit.ape.service.UserService;

@Service
public class ApeAuthenServiceImpl implements ApeAuthenService {
	protected final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Resource(name="wxAuthenHandler")
	private WXAuthenWebHandler wxAuthenHandler;
	
	@Autowired
	private WXAccountInfoMapper wXAccountInfoMapper;
	
	@Autowired
	private UserService userService;

	@Override
	public String getWxCodeUrl() {
		return wxAuthenHandler.createAuthenRequest();
	}

	@Override
	public WXAccountInfo processWXCallback(String code) {
		WXAccountInfo wxInfo = wxAuthenHandler.processAuthen(code);
		
		// 查看用户是否存在表中 存在则更新token 反之 到user表增加数据，然后再增加wx用户表
		WXAccountInfo existInfo = wXAccountInfoMapper.getInfo(wxInfo.getUnionId(), null);
		if (null == existInfo) {
			//注册新用户信息
			User user = userService.regist4WX();
			if (null == user) {
				throw new BusException("微信登录失败", ErrorCodeConstant.WX_NEW_USER_SAVE);
			}
			
			wxInfo.setUserId(user.getId());
			
			//新增微信用户信息
			int rows = wXAccountInfoMapper.add(wxInfo);
			if (1 != rows) {
				throw new BusException("微信登录失败", ErrorCodeConstant.WX_INFO_SAVE);
			}
			
			return wxInfo;
			
		} else {
			//更新token
			existInfo.setAccessToken(wxInfo.getAccessToken());
			existInfo.setExpiresDate(wxInfo.getExpiresDate());
			existInfo.setRefreshToken(wxInfo.getRefreshToken());
			existInfo.setOpenId(wxInfo.getOpenId());
			existInfo.setScope(wxInfo.getScope());
			
			int rows = wXAccountInfoMapper.update(existInfo);
			if (1 != rows) {
				throw new BusException("微信登录失败", ErrorCodeConstant.WX_UPDATE_INFO);
			}
			
			return existInfo;
		}
		
	}

}
