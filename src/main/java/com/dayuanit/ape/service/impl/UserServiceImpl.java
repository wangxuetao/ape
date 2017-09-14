package com.dayuanit.ape.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dayuanit.ape.apeenums.DegreeEnum;
import com.dayuanit.ape.apeenums.SexEnum;
import com.dayuanit.ape.dao.UserInfoMapper;
import com.dayuanit.ape.dao.UserMapper;
import com.dayuanit.ape.domain.User;
import com.dayuanit.ape.domain.UserInfo;
import com.dayuanit.ape.dto.UserDTO;
import com.dayuanit.ape.exception.BusException;
import com.dayuanit.ape.service.InviteCodeService;
import com.dayuanit.ape.service.UserService;
import com.dayuanit.ape.util.DateUtil;
import com.dayuanit.ape.util.HtmlUtil;
import com.dayuanit.ape.vo.BaseInfoVO;
import com.dayuanit.ape.vo.BlogCodeVO;
import com.dayuanit.ape.vo.ContactVO;
import com.dayuanit.ape.vo.EducationVO;
import com.dayuanit.ape.vo.HackDoMainVO;
import com.dayuanit.ape.vo.LoginVo;
import com.dayuanit.ape.vo.RegistVO;

@Service("userService")
public class UserServiceImpl implements UserService{

	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private InviteCodeService inviteCodeService;
	
	@Autowired 
	private UserInfoMapper userInfoMapper;

	@Override
	@Transactional(rollbackFor = Exception.class)
	public void regist(RegistVO registVO) throws Exception {
		// 验证用户是否存在
		User existUser = userMapper.getUserByEmail(registVO.getEmail());
		if (null != existUser) {
			throw new BusException("用户名已注册");
		}
		
		if(!registVO.getPassword().equals(registVO.getConfirmPassword())) {
			throw new BusException("密码不一致");
		}
		
		if(!inviteCodeService.useCode(registVO.getInviteCode())) {
			throw new BusException("邀请码无效");
		}
		
		User user = new User();
		user.setEmail(HtmlUtil.unSafeToHtml(registVO.getEmail()));
		String password = registVO.getEmail() + registVO.getPassword();
		user.setPassword(DigestUtils.md5Hex(password.getBytes()));
		
		int rows = userMapper.addUser(user);
		
		if(1 != rows) {
			throw new BusException("注册失败");
		}
		
		boolean flag = inviteCodeService.addUserCode(user.getId());
		if(!flag) {
			throw new BusException("验证码生成失败");
		}
		
		//增加用户info信息
		UserInfo info = new UserInfo();
		info.setUserId(user.getId());
		rows = userInfoMapper.insertUserInfo(info);
		
		if(1 != rows) {
			throw new BusException("注册失败");
		}
	}
	
	@Override
	public UserDTO getUserByUserId(Integer userId) {
		User user = userMapper.getUserByUserId(userId);
		if (null == user) {
			throw new BusException("用户不存在");
		}
		
		UserDTO dto = new UserDTO();
		if (null != user.getBirthday()) {
			dto.setBirthday(DateUtil.dateToString(user.getBirthday()));
		}
		dto.setBlogUrl(user.getBlogUrl());
		dto.setCodeUrl(user.getCodeUrl());
		dto.setEmail(user.getEmail());
		if (null != user.getGraduTime()) {
			dto.setGraduTime(DateUtil.dateToString(user.getGraduTime()));
		}
		
		dto.setMajor(user.getMajor());
		dto.setHackDomain(user.getHackDomain());
		dto.setPhone(user.getPhone());
		dto.setQq(user.getQq());
		dto.setRealName(user.getRealName());
		dto.setSchoolName(user.getSchoolName());
		dto.setWx(user.getWx());
		if (StringUtils.isBlank(user.getSex())) {
			dto.setSexValue(null);
			dto.setSex(SexEnum.MAN.getSex());
		} else {
			dto.setSexValue(SexEnum.getSexEnum(user.getSex()).getName());
			dto.setSex(user.getSex());
		}
		
		if (null == user.getDegree()) {
			dto.setDegreeValue(null);
			dto.setDegree(String.valueOf(DegreeEnum.BACHELOR.getDegree()));
		} else {
			dto.setDegree(String.valueOf(user.getDegree()));
			dto.setDegreeValue(DegreeEnum.getDegree(user.getDegree()).getName());
		}
		
		return dto;
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public void modifyEducation(Integer userId, EducationVO educationVO) throws Exception {
		//查询是否存在此用户，并且检查是否存在学历信息
		User existUser = userMapper.getUserByUserId(userId);
		if(null == existUser) {
			throw new BusException("用户不存在");
		}
		
		existUser.setSchoolName(HtmlUtil.unSafeHtml(educationVO.getSchoolName()));
		existUser.setDegree(educationVO.getDegree());
		existUser.setMajor(HtmlUtil.unSafeHtml(educationVO.getMajor()));
		
		if(StringUtils.isNotBlank(educationVO.getGraduTime())) {
			existUser.setGraduTime(DateUtil.stringToDate(educationVO.getGraduTime()));
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("schoolName", existUser.getSchoolName());
		map.put("degree", existUser.getDegree());
		map.put("graduTime", existUser.getGraduTime());
		map.put("userId", userId);
		map.put("major", existUser.getMajor());
		
		int rows = userMapper.modifyEducationByUserId(map);
		if(1 != rows) {
			throw new BusException("添加学历失败");
		}
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public void modifyContact(Integer userId, ContactVO contactVO) {
		// 查询是否存在此用户
		User existUser = userMapper.getUserByUserId(userId);
		if(null == existUser) {
			throw new BusException("用户不存在");
		}
		
		existUser.setPhone(HtmlUtil.unSafeHtml(contactVO.getPhone()));
		existUser.setQq(HtmlUtil.unSafeHtml(contactVO.getQq()));
		existUser.setWx(HtmlUtil.unSafeHtml(contactVO.getWx()));
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("phone", existUser.getPhone());
		map.put("wx", existUser.getWx());
		map.put("qq", existUser.getQq());
		map.put("userId", userId);
		int rows = userMapper.modifyContactByUserId(map);
		
		if(1 != rows) {
			throw new BusException("添加联系方式失败");
		}
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public void modifyHackDoMain(Integer userId, HackDoMainVO hackDomainVO) {
		// 查询是否存在此用户
		User existUser = userMapper.getUserByUserId(userId);
		if (null == existUser) {
			throw new BusException("用户不存在");
		}
		
		if (hackDomainVO.getHackDomain().equals(existUser.getHackDomain())) {
			return;
		}
		
		User domainUser = userMapper.getUserByHackDomain(hackDomainVO.getHackDomain());
		if (null != domainUser && !domainUser.getId().equals(userId)) {
			throw new BusException("域名已经存在");
		}
		
		existUser.setHackDomain(HtmlUtil.unSafeHtml(hackDomainVO.getHackDomain()));
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("hackDomain", existUser.getHackDomain());
		map.put("userId", userId);
		
		int rows = userMapper.modifyHackDomainByUserId(map);
		if(1 != rows) {
			throw new BusException("保存域名失败");
		}
		
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public void modifyBlogCode(Integer userId, BlogCodeVO blogCodeVO) {
		// 查询是否存在此用户
		User existUser = userMapper.getUserByUserId(userId);
		if (null == existUser) {
			throw new BusException("用户不存在");
		}

		// 没有相同的域名，可以修改域名
		existUser.setCodeUrl(HtmlUtil.unSafeHtml(blogCodeVO.getCodeUrl()));
		existUser.setBlogUrl(HtmlUtil.unSafeHtml(blogCodeVO.getBlogUrl()));
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("blogUrl", existUser.getBlogUrl());
		map.put("codeUrl", existUser.getCodeUrl());
		map.put("userId", userId);

		int rows = userMapper.modifyBlogCodeByUserId(map);
		if (1 != rows) {
			throw new BusException("保存失败");
		}
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public void modifyBaseInfo(Integer userId, BaseInfoVO baseInfoVO) throws Exception {
		// 查询是否存在此用户
		User existUser = userMapper.getUserByUserId(userId);
		if (null == existUser) {
			throw new BusException("用户不存在，无法添加信息");
		}
		
		existUser.setRealName(HtmlUtil.unSafeHtml(baseInfoVO.getRealName()));
		existUser.setSex(HtmlUtil.unSafeHtml(baseInfoVO.getSex()));
		existUser.setEmail(HtmlUtil.unSafeHtml(baseInfoVO.getEmail()));
		
		if(StringUtils.isNotBlank(baseInfoVO.getBirthday())) {
			existUser.setBirthday(DateUtil.stringToDate(baseInfoVO.getBirthday()));
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("realName", existUser.getRealName());
		map.put("sex", existUser.getSex());
		map.put("birthday", existUser.getBirthday());
		map.put("userId", userId);
		map.put("email", existUser.getEmail());
		
		int rows = userMapper.modifyBaseInfoByUserId(map);
		if(1 != rows) {
			throw new BusException("保存失败");
		}
		
	}

	@Override
	public void login(LoginVo loginVo) {
		if(StringUtils.isBlank(loginVo.getEmail())){
			throw new BusException("邮箱不能为空");
		}
		if(StringUtils.isBlank(loginVo.getPassword())){
			throw new BusException("密码不能为空");
		}
		
		User loginUser = userMapper.getUserByEmail(loginVo.getEmail());
		if(null == loginUser){
			throw new BusException("邮箱名不存在");
		}
		String xinPassword = loginVo.getEmail() + loginVo.getPassword();
		String newPassword = DigestUtils.md5Hex(xinPassword.getBytes());
		if(!newPassword.equals(loginUser.getPassword())){
			throw new BusException("密码不正确");
		}
		
	}

	@Override
	public User getUserByEmail(LoginVo loginVo) {
		
		return userMapper.getUserByEmail(loginVo.getEmail());
		
	}

	@Override
	public User getUserByHackDomain(String hackDomain) {
		User user = userMapper.getUserByHackDomain(hackDomain);
		if (null == user) {
			throw new BusException("简历网址不正确");
		}
		
		return user;
	}

	@Override
	@Transactional(rollbackFor=Exception.class)
	public User regist4WX() {
		User user = new User();
		
		int rows = userMapper.addUser(user);
		
		if(1 != rows) {
			throw new BusException("用户注册失败");
		}
		
		UserInfo info = new UserInfo();
		info.setUserId(user.getId());
		
		rows = userInfoMapper.insertUserInfo(info);
		if (1 != rows) {
			throw new BusException("用户注册失败");
		}
		
		return user;
	}
	
}
