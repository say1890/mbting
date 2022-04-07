package com.juhyang.mbting.post;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.juhyang.mbting.post.bo.PostBO;

@RestController
@RequestMapping("/post")
public class PostRestController {

  @Autowired
  PostBO postBO;

  @PostMapping("/create")
  public Map<String, String> createPost(@RequestParam("subject") String subject,
      @RequestParam("content") String content, @RequestParam("date") String dateString,
      @RequestParam(value = "file", required = false) MultipartFile file,
      HttpServletRequest request) throws ParseException {

    HttpSession session = request.getSession();
    int userId = (Integer) session.getAttribute("userId");
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    Date date = sdf.parse(dateString);
    int count = postBO.addPost(userId, subject, content, date, file);

    Map<String, String> result = new HashMap<>();
    if (count == 1) {
      result.put("result", "success");
    } else {
      result.put("result", "fail");
    }

    return result;
  }

  @GetMapping("/delete")
  public Map<String, String> postDelete(@RequestParam("postId") int postId) {

    int count = postBO.deletePost(postId);

    Map<String, String> result = new HashMap<>();
    if (count == 1) {
      result.put("result", "success");
    } else {
      result.put("result", "fail");
    }

    return result;
  }

}
