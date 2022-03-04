package com.juhyang.mbting.post.model;

import java.util.List;

import com.juhyang.mbting.comment.model.Server_Comment;

public class PostForMyPage {
private Post post;
private List<Server_Comment> commentList;
public Post getPost() {
	return post;
}
public void setPost(Post post) {
	this.post = post;
}
public List<Server_Comment> getCommentList() {
	return commentList;
}
public void setCommentList(List<Server_Comment> commentList) {
	this.commentList = commentList;
}



}
