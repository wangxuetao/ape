package com.dayuanit.ape.test;

import static org.junit.Assert.assertEquals;

import java.util.Date;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.dayuanit.ape.dao.WXAccountInfoMapper;
import com.dayuanit.ape.domain.WXAccountInfo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:spring/spring-config-test.xml")
@Transactional
public class WXAccountInfoMapperTest {
	
	@Autowired
	private WXAccountInfoMapper wXAccountInfoMapper;
	
	private WXAccountInfo wxAccountInfo;

	@Before
	public void init() {
		wxAccountInfo = new WXAccountInfo();
		wxAccountInfo.setAccessToken("xxxx");
		wxAccountInfo.setCity("xxx");
		wxAccountInfo.setExpiresDate(new Date());
		wxAccountInfo.setHeadImgUrl("http://");
		wxAccountInfo.setNickName("tom");
		wxAccountInfo.setOpenId("xx");
		wxAccountInfo.setPrivilege("xx");
		wxAccountInfo.setSex(1);
		wxAccountInfo.setUnionId("xxx");
		wxAccountInfo.setUserId(10000);
	}
	
	@Test
	@Rollback
	public void testAdd() {
		int rows = wXAccountInfoMapper.add(wxAccountInfo);
		assertEquals(1, rows);
	}
	
	@Test
	@Rollback
	public void testUpate() {
		wXAccountInfoMapper.add(wxAccountInfo);
		wxAccountInfo.setAccessToken("yyyyy");
		wxAccountInfo.setRefreshToken("xxxx");
		int rows = wXAccountInfoMapper.update(wxAccountInfo);
		assertEquals(1, rows);
	}
	
	@Test
	public void testgetInfo() {
		wXAccountInfoMapper.add(wxAccountInfo);
		WXAccountInfo tmpInfo = wXAccountInfoMapper.getInfo(wxAccountInfo.getUnionId(), null);
		assertEquals(wxAccountInfo.getUnionId(), tmpInfo.getUnionId());
		tmpInfo = wXAccountInfoMapper.getInfo(null, wxAccountInfo.getUserId());
		assertEquals(wxAccountInfo.getUserId(), tmpInfo.getUserId());
	}
}
