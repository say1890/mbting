package com.juhyang.mbting.comment.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.juhyang.mbting.comment.dao.CommentDAO;

@Service
public class CommentBO {
	@Autowired
	CommentDAO commentDAO;
	public int addComment(int postId, String comment, int userId, String userName) {
		// TODO Auto-generated method stub
	return commentDAO.insertComment(postId,comment,userId,userName);
	}

	
}
