package com.dayuanit.ape.test;

import static org.junit.Assert.assertEquals;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.dayuanit.ape.dao.WXAccountMapper;
import com.dayuanit.ape.domain.WXAccount;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:spring/spring-config-test.xml")
@Transactional
public class WXAccountMapperTest {
	
	@Autowired
	private WXAccountMapper wXAccountMapper;
	
	private WXAccount wxAccount;

	@Before
	public void init() {
		wxAccount = new WXAccount();
		wxAccount.setAccessToken("xxx");
		wxAccount.setExpiresIn(7200);
		wxAccount.setOpenId("999");
		wxAccount.setRefreshToken("ooooo");
		wxAccount.setScope("req");
	}
	
	@Test
	@Rollback
	public void addCode() {
		int rows = wXAccountMapper.add(wxAccount);
		assertEquals(1, rows);
	}
}
