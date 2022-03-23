package com.juhyang.mbting.admin;

import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.juhyang.mbting.post.bo.PostBO;
import com.juhyang.mbting.post.model.Post;

@RestController
public class AdminRestController {

	//달력데이터조회

		@PostMapping("/calender_view/getData")
		public List<Post>  getCalData(
				PostBO postBO,
		        Model model) throws Exception {
			
			List<Post> postList = postBO.getPostList();
			return postList;
		    
		    
		  
		}


}
