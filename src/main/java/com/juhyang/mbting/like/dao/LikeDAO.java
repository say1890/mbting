package com.juhyang.mbting.like.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface LikeDAO {

	public boolean insertLike(@Param("userId")int userId,
				   @Param("receiver")int receiver);

	int countLike(@Param("userId")int userId);

	public int selectLikeCountByUserId(
			@Param("userId")int userId,
			@Param("receiver")int receiver);

	public List<Integer> selectHowLikesMe(@Param("userId")int userId);

}
