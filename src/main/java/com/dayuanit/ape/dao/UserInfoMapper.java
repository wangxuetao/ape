package com.dayuanit.ape.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.dayuanit.ape.domain.UserInfo;

public interface UserInfoMapper{
	

	int insertUserInfo(UserInfo userInfo);
	
	UserInfo getUserInfo(@Param("userId")int userId);
	
	int updateAboutMe(@Param("aboutMe")String aboutMe, @Param("userId")int userId);
	
	int updateSkillDesc(@Param("skillDesc")String skillDesc, @Param("userId")int userId);
	
	int modifyOneWordByUserId(Map<String, Object> map);

}
	
	
