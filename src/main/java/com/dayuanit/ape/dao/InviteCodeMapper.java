package com.dayuanit.ape.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.dayuanit.ape.domain.InviteCode;
import com.dayuanit.ape.domain.UserCode;

public interface InviteCodeMapper {
	int addInviteCode(InviteCode inviteCode);
	
	InviteCode queryCode(@Param("code") String inviteCode);
	
	int modifyCode(@Param("code") String code);
	
	int timeOutCode(@Param("codeId") Integer id);
	
	int addUserCode(UserCode userCode);
	
	List<UserCode> queryInviteId(@Param("userId") Integer userId);
	
	InviteCode queryInviteCode(@Param("inviteId") Integer inviteId);
	
	List<InviteCode> queryAllCode();
	
	int deleteCode(@Param("codeId") Integer id);
}
