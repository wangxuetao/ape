package com.dayuanit.ape.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.dayuanit.ape.domain.User;

public interface UserMapper {
	
	int addUser(User user);

	User getUserByEmail(@Param("email") String email);
	
	User getUserByUserId(@Param("userId") Integer userId);
	
	int modifyEducationByUserId(Map<String, Object> map);
	
	int modifyContactByUserId(Map<String, Object> map);
	
	int modifyHackDomainByUserId(Map<String, Object> map);
	
	int modifyBlogCodeByUserId(Map<String, Object> map);
	
	int modifyBaseInfoByUserId(Map<String, Object> map);
	
	User getUserByHackDomain(@Param("hackDomain")String hackDomain);
	
 }
