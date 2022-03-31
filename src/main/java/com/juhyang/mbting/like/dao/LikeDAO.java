package com.juhyang.mbting.like.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface LikeDAO {

	public boolean insertLike(@Param("userId") int userId, @Param("receiver") int receiver);

	int countLike(@Param("userId") int userId);

	public int selectLikeCountByUserId(@Param("userId") int userId, @Param("receiver") int receiver);

	public List<Integer> selectWhoLikesMe(@Param("userId") int userId);

	public int selectHisLike(@Param("userId") int userId, @Param("receiver") int receiver);

	public int selectSendLike(@Param("userId") int userId);

	public List<Integer> selectWhoILike(@Param("userId") int userId);

	public int deleteLike(@Param("HisId") int id, @Param("myId") int myId);

	public boolean insertDislike(@Param("userId") int userId, @Param("receiver") int receiver);

	public String selectLikeTime(@Param("receiver") int receiver, @Param("userId") int userId);

	public int selectHateCountByUserId(@Param("userId") int userId, @Param("receiver") int receiver);

}
