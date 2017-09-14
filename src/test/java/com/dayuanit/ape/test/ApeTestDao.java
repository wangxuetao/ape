package com.dayuanit.ape.test;

import static org.junit.Assert.assertEquals;

import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.dayuanit.ape.dao.ApeTest;
import com.dayuanit.ape.dao.InviteCodeMapper;
import com.dayuanit.ape.domain.InviteCode;
import com.dayuanit.ape.util.DateUtil;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:spring/spring-config-test.xml")

public class ApeTestDao {
	
	@Autowired
	private ApeTest apeTest;

	@Autowired
	private InviteCodeMapper inviteCodeMapper;


//	@Test
//	public void testAddApe() {
//		int rows = apeTest.addApe("jack",2);
//		assertEquals(1, rows);
//	}
	
	
	@Test
	public void addCode() {
		InviteCode ic = new InviteCode();
		ic.setCode("123yru");
		ic.setStatus(0);
		ic.setEndTime(DateUtil.add(new Date(), 30));
		int rows =inviteCodeMapper.addInviteCode(ic);
		assertEquals(1, rows);
	}
}
