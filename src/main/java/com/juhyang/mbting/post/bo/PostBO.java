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

    List<PostForMyPage> postForMyPage = new ArrayList<>();

    PostForMyPage postDetail = new PostForMyPage();

    // 해당하는 user id로 댓글 가져오기
    List<Server_Comment> commentList = commentBO.getCommentListForMyPage(userId);
    for (Server_Comment Comment : commentList) {
      String comment = String.valueOf(Comment.getComment());
      int postId = Comment.getServer_postId();
      Post post = postDAO.selectPost(postId);
      String subject = post.getSubject();

      postDetail.setComment(comment);
      postDetail.setPostId(postId);
      postDetail.setSubject(subject);
    }

    postForMyPage.add(postDetail);

    return postForMyPage;
  }

  public int deletePost(int postId) {
    return postDAO.deletePost(postId);
  };
}
