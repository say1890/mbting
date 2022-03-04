package com.juhyang.mbting.comment.dao;

import java.time.LocalDate;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.juhyang.mbting.comment.model.Server_Comment;
import com.juhyang.mbting.post.model.Post;

@Repository
public interface CommentDAO {

	public int insertComment(
			@Param("postId") int postId,
			@Param("comment") String comment,
			@Param("userId") int userId,
			@Param("userName") String userName
			);

	public List<Post> selectComment(@Param("postId")int postId);

	public int deleteComment(@Param("commentId")int commentId);


	public List<Server_Comment> selectCommentListForMypage(@Param("postId") int id, @Param("userId")int userId);

	public List<Server_Comment> selectCommentedPost( @Param("userId") int userId);

	public List<Integer> selectPostId(@Param("userId") int userId);

}
