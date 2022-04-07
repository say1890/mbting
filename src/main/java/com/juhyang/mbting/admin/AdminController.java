package com.juhyang.mbting.admin;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.juhyang.mbting.post.bo.PostBO;
import com.juhyang.mbting.post.model.Post;

@Controller
@RequestMapping("/admin")
public class AdminController {



  @Autowired
  PostBO postBO;

  // view
  @RequestMapping("/add_post_view")
  public String welcome_view() {
    return "admin/addPost";
  }


  @RequestMapping("/question_view")
  public String question_view(Model model)

  {
    List<Post> postlist = postBO.getPostList();
    model.addAttribute("postList", postlist);
    return "admin/question";
  }

  @RequestMapping("/detail_view")
  public String detail_view(@RequestParam("postId") int postId, Model model)

  {
    Post post = postBO.getPost(postId);
    model.addAttribute("post", post);
    return "admin/PostDetail";
  }



}
