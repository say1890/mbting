package com.juhyang.mbting.comment.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface CommentDAO {

	public int insertComment(
			@Param("postId") int postId,
			@Param("comment") String comment,
			@Param("userId") int userId,
			@Param("userName") String userName
			);

}
