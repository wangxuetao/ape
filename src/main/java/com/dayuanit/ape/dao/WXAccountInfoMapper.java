package com.dayuanit.ape.dao;

import org.apache.ibatis.annotations.Param;

import com.dayuanit.ape.domain.WXAccountInfo;

public interface WXAccountInfoMapper {
	
	int add(WXAccountInfo wxaInfo);
	
	int update(WXAccountInfo wxaInfo);
	
	WXAccountInfo getInfo(@Param("unionId") String unionId, @Param("userId") Integer userId);
}
