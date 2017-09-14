package com.dayuanit.ape.service;

import com.dayuanit.ape.domain.WXAccountInfo;


public interface ApeAuthenService {
	
	String getWxCodeUrl();
	
	WXAccountInfo processWXCallback(String code);
	
}
