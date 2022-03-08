package com.juhyang.mbting.like.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.juhyang.mbting.like.dao.LikeDAO;

@Service
public class LikeBO {

	@Autowired
	LikeDAO likeDAO;
	public int sendLike(int userId, int receiver) {
		return likeDAO.insertLike(userId, receiver);
		
	}
	
	//날 좋아하는 사람의 수
	public int countSender(int userId) {
		return likeDAO.countLike(userId);
		
	}

}
