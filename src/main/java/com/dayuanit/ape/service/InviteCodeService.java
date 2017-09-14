package com.dayuanit.ape.service;

import java.util.List;

import com.dayuanit.ape.domain.InviteCode;

public interface InviteCodeService {
	boolean addCode(Integer num);
	
	InviteCode listAllCode(String code);
	
	boolean useCode(String code);
	
	boolean addUserCode(Integer userId);
	
	List<String> queryInvite(Integer userId);
}
