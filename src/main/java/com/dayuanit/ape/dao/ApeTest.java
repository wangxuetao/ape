package com.dayuanit.ape.dao;

import org.apache.ibatis.annotations.Param;

public interface ApeTest {
	int addApe(@Param("username") String username, @Param("id")int id);
}
