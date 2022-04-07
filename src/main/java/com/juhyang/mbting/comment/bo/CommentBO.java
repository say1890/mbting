package com.juhyang.mbting.comment.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.juhyang.mbting.comment.dao.CommentDAO;
import com.juhyang.mbting.comment.model.Server_Comment;
import com.juhyang.mbting.post.model.Post;

@Service
public class CommentBO {
  @Autowired
  CommentDAO commentDAO;

  public int addComment(int postId, String comment, int userId, String userName) {
    return commentDAO.insertComment(postId, comment, userId, userName);
  }

  public List<Post> getCommentForMain(int postId) {
    return commentDAO.selectComment(postId);
  }

  public int deleteComment(int commentId) {
    return commentDAO.deleteComment(commentId);
  }

  public List<Server_Comment> getCommentedPost(int userId) {
    return commentDAO.selectCommentedPost(userId);
  }

  public List<Server_Comment> getCommentListForMyPage(int userId) {
    return commentDAO.selectCommentListForMypage(userId);
  }

  public List<Integer> getPostId(int userId) {
    return commentDAO.selectPostId(userId);
  }


}
