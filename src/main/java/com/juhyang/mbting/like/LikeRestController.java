package com.juhyang.mbting.like;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.juhyang.mbting.like.bo.LikeBO;

@RestController
public class LikeRestController {
  @Autowired
  LikeBO likeBO;

  @GetMapping("/like")
  public Map<String, Boolean> SendLike(@RequestParam("receiver") int receiver,
      HttpServletRequest request, Model model) {
    HttpSession session = request.getSession();
    int userId = (Integer) session.getAttribute("userId");
    boolean isLike = likeBO.sendLike(userId, receiver);
    int checkIfHeLikesMe = likeBO.checkIfHeLikesMe(userId, receiver);

    Map<String, Boolean> result = new HashMap<>();
    result.put("isLike", isLike);
    if (checkIfHeLikesMe == 1) {
      result.put("WeLikeEachOther", true);
    }
    return result;

  }

  @GetMapping("/dislike")
  public Map<String, Boolean> disLike(@RequestParam("receiver") int receiver,
      HttpServletRequest request, Model model) {
    HttpSession session = request.getSession();
    int userId = (Integer) session.getAttribute("userId");
    boolean isHate = likeBO.sendHate(userId, receiver);

    Map<String, Boolean> result = new HashMap<>();
    result.put("isHate", isHate);
    return result;

  }

}
