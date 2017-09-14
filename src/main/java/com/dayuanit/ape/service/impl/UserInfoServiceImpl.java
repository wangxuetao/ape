package com.dayuanit.ape.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dayuanit.ape.dao.UserInfoMapper;
import com.dayuanit.ape.dao.UserMapper;
import com.dayuanit.ape.domain.User;
import com.dayuanit.ape.domain.UserInfo;
import com.dayuanit.ape.exception.BusException;
import com.dayuanit.ape.service.UserInfoService;
import com.dayuanit.ape.util.HtmlUtil;
import com.dayuanit.ape.vo.OneWordVO;

@Service
public class UserInfoServiceImpl implements UserInfoService{

	@Autowired 
	private UserInfoMapper userInfoMapper;
	
	@Autowired
	private UserMapper userMapper;

	@Override
	public void saveAboutMe(int userId, String aboutMe) {
		UserInfo userInfo = userInfoMapper.getUserInfo(userId);
		if (null == userInfo) {
			throw new BusException("用户信息不存在");
		}
		
		int row = userInfoMapper.updateAboutMe(aboutMe, userId);
		if(1 != row){
			throw new BusException("保存自我介绍失败");
		}
	}

	@Override
	public UserInfo getUserInfo(int userId) {
		return userInfoMapper.getUserInfo(userId);
		
	}

	@Override
	public void saveSkillDesc(int userId, String skillDesc) {
		
		UserInfo userInfo = userInfoMapper.getUserInfo(userId);
		if(null == userInfo){
			throw new BusException("用户信息不存在");
		}
		
		int row = userInfoMapper.updateSkillDesc(skillDesc, userId);
		if(1 != row){
			throw new BusException("保存失败");
		}
	}

	@Override
	public String modifyOneWord(Integer userId, OneWordVO oneWordVO) {
		//验证用户是否存在
		User existUser = userMapper.getUserByUserId(userId);
		if(null == existUser) {
			throw new BusException("用户不存在，无法添加信息");
		} 
		//修改签名
		UserInfo userInfo = userInfoMapper.getUserInfo(userId);
		userInfo.setOneWord(HtmlUtil.unSafeHtml(oneWordVO.getOneWord()));
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("oneWord", userInfo.getOneWord());
		map.put("userId", userId);
		
		int rows = userInfoMapper.modifyOneWordByUserId(map);
		if(1 != rows) {
			throw new BusException("修改签名失败");
		}
		
		return userInfoMapper.getUserInfo(userId).getOneWord();
		
	}




}
