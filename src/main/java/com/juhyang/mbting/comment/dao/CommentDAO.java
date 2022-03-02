package com.juhyang.mbting.comment.dao;

import java.time.LocalDate;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.juhyang.mbting.post.model.post;

@Repository
public interface CommentDAO {

	public int insertComment(
			@Param("postId") int postId,
			@Param("comment") String comment,
			@Param("userId") int userId,
			@Param("userName") String userName
			);

	public List<post> selectComment(@Param("postId")int postId);

}
