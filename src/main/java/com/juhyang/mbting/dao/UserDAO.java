package com.juhyang.mbting.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserDAO {

	public void InsertUser(
			@Param("loginId") String loginId,
			@Param("password")String password,
			@Param("email") String email
			);

	public boolean IsDuplicate( @Param("loginId") String loginId);

}
