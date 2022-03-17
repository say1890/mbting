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

	public List<Integer> getWhoLikesMe(int userId) {
		return likeDAO.selectWhoLikesMe(userId);
		
		
	}

	// 내가 좋아하는 사람도 날 좋아하는지 체크
	public int checkIfHeLikesMe(int userId, int receiver) {
		return likeDAO.selectHisLike(userId, receiver);
	}
	// 내가 보낸 좋아요 갯수 세기
	public int countSendLike(int userId) {
		return likeDAO.selectSendLike(userId);
	}

	// 내가 좋아요 보낸 id 리스트
	public List<Integer> getWhoILike(int userId) {
		return likeDAO.selectWhoILike(userId);
	}

	//  싫어요 보내기
	public boolean sendDislike(int userId, int receiver) {
		return likeDAO.insertDislike(userId, receiver);
		 
		
	}
	



}
