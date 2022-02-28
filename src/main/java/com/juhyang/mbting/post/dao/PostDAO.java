package com.juhyang.mbting.post.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.juhyang.mbting.post.model.post;

@Repository
public interface PostDAO {

	public int insertPost(
			@Param("subject") String subject, 
			@Param("content") String content,
			@Param("date") Date date, 
			@Param("imagePath") String imagePath);

	public List<post> selectPostList();

	
}
