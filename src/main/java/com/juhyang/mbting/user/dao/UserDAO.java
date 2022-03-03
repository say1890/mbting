package com.juhyang.mbting.user.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.juhyang.mbting.user.model.User;
import com.juhyang.mbting.user.model.UserCharacter;

@Repository
public interface UserDAO {

	public void InsertUser(
			@Param("loginId") String loginId,
			@Param("password")String password,
			@Param("userName")String userName,
			@Param("birthday") Date birthday,
			@Param("sex")String sex, 
			@Param("mbti")String mbti,
			@Param("email") String email

			);
	public User selectUser(
			@Param("loginId") String loginId,
			@Param("password")String password);
	
	
	public boolean IsDuplicate( @Param("loginId") String loginId);
	
	public int IsEmailExist( @Param("email") String email);
	
	
	public String selectUserByEmail(@Param("email") String email);
	
	public int updatePassword(@Param("loginId") String loginId, 
			@Param("password")String password);
	
	
	public int updateMatchingProfile(
			@Param("userId")int userId, 
			@Param("mymerit") String mymerit,
			@Param("myHobby") String myHobby, 
			@Param("myCharacter") String myCharacter, 
			@Param("yourMerit") String yourMerit, 
			@Param("yourHobby") String yourHobby,
			@Param("yourCharacter") String yourCharacter, 
			@Param("age") String age);
	
	
	public int updateBasicProfile(
			@Param("userId") int userId, 
			@Param("userName") String userName, 
			@Param("introduce") String introduce, 
			@Param("mbti") String mbti);
	
	public List<UserCharacter> selectOptions(@Param("userId")int userId);

	

}
