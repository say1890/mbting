package com.juhyang.mbting.like.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.juhyang.mbting.like.dao.LikeDAO;

@Service
public class LikeBO {

	@Autowired
	LikeDAO likeDAO;
	public boolean sendLike(int userId, int receiver) {
		//좋아요 누른 상태 - > true
		if(this.isLike(userId,receiver)) {
			return true;
		} 
		// 좋아요 안누른 상태 -> false
		else {
			likeDAO.insertLike(userId, receiver);
			return false;
		}
		
		
	}
	
	public boolean isLike(int userId, int receiver) {
		
		return !(likeDAO.selectLikeCountByUserId(userId, receiver) == 0);
				 
	}

	//날 좋아하는 사람의 수
	public int countSender(int userId) {
		return likeDAO.countLike(userId);
		
	}

	public List<Integer> getHowLikesMe(int userId) {
		return likeDAO.selectHowLikesMe(userId);
		
		
	}


}
