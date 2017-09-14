package com.dayuanit.ape.service;

import com.dayuanit.ape.domain.UserInfo;
import com.dayuanit.ape.vo.OneWordVO;

public interface UserInfoService {
	
    void saveAboutMe(int userId, String aboutMe);
	
	void saveSkillDesc(int userId, String skillDesc);
	
	UserInfo getUserInfo(int userId);
	
	String modifyOneWord(Integer userId, OneWordVO oneWordVO);

}
