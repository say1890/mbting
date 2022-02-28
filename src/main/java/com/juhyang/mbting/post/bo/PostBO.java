package com.juhyang.mbting.post.bo;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.juhyang.mbting.common.FileManagerService;
import com.juhyang.mbting.post.dao.PostDAO;
import com.juhyang.mbting.post.model.post;

@Service
public class PostBO {

	
	@Autowired
	PostDAO postDAO;
	
	public int addPost(int userId, String subject, String content, Date date, MultipartFile file) {
		
		String filePath = FileManagerService.saveFile(userId, file);
		return postDAO.insertPost(subject, content, date, filePath);
	}

	public List<post> getPostList() {
		return postDAO.selectPostList();
	};
}
