package com.juhyang.mbting.comment.bo;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.juhyang.mbting.comment.dao.CommentDAO;
import com.juhyang.mbting.post.model.post;

@Service
public class CommentBO {
	@Autowired
	CommentDAO commentDAO;
	public int addComment(int postId, String comment, int userId, String userName) {
		// TODO Auto-generated method stub
	return commentDAO.insertComment(postId,comment,userId,userName);
	}
	public List<post> getCommentForMain(int postId) {
	return commentDAO.selectComment(postId);
	}

	
}
