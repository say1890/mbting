package com.juhyang.mbting.post.bo;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.juhyang.mbting.comment.bo.CommentBO;
import com.juhyang.mbting.comment.model.Server_Comment;
import com.juhyang.mbting.common.FileManagerService;
import com.juhyang.mbting.post.dao.PostDAO;
import com.juhyang.mbting.post.model.Post;
import com.juhyang.mbting.post.model.PostForMyPage;

@Service
public class PostBO {

	
	@Autowired
	PostDAO postDAO;
	@Autowired
	CommentBO commentBO;
	
	public int addPost(int userId, String subject, String content, Date date, MultipartFile file) {
		
		String filePath = FileManagerService.saveFile(userId, file);
		return postDAO.insertPost(subject, content, date, filePath);
	}

	public List<Post> getPostList() {
		return postDAO.selectPostList();
	}

	public Post getPost(int postId) {
		return postDAO.selectPost(postId);
	}

	public List<Post> getQuestionForMain(LocalDate now) {
		return postDAO.selectQuestion(now);
	}

	public Integer getPostId(LocalDate now) {
		return postDAO.selectPostId(now);
	}

	public List<PostForMyPage> getPostListForMypage(int userId) {

		List<Post> postList = postDAO.selectPostList(); //post를 전부 선택
		List<PostForMyPage> postForMyPage = new ArrayList<>();
		for(Post post:postList) {
			
			// 해당하는 post id로 댓글 가져오기 
			List<Server_Comment> commentList = commentBO.getCommentListForMyPage(post.getId(), userId);
			List<Integer> postId = commentBO.getPostId(userId);
			PostForMyPage postDetail = new PostForMyPage();
			for(int p:postId) {
				if(p==post.getId()) {
					postDetail.setPost(post);
				}
			
			}
			
	
			
			postDetail.setCommentList(commentList);
		
			
			postForMyPage.add(postDetail);
		}
		
		
		return postForMyPage;
	};
}
