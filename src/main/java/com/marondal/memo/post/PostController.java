package com.marondal.memo.post;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.marondal.memo.post.bo.PostBO;
import com.marondal.memo.post.model.Post;

@Controller
@RequestMapping("post")
public class PostController {
	
	@Autowired
	private PostBO postBO;
	
	
	@GetMapping("/list/view")
	public String memoList(
			Model model
			, HttpSession session) {//controller 전체에 모델이란 객체 추가
		
		//메소드 여러개로 나눠서 처리할 필요가없음
		
		int userId = (Integer)session.getAttribute("userId");//이렇게 값얻옹기
						//object 라서 당연히 에러 뜸 (Integer)로
		List<Post> postList = postBO.getPostList(userId);
		model.addAttribute("postList", postList);//객체의 값 변수의 의미는 아무 의미 없다. 
	
		return "post/list";
	}
	
	@GetMapping("/create/view")
	public String memoCreate() {
		return "post/create";
	}
	
	@GetMapping("/detail/view")
	public String memoDetail(
			@RequestParam("id")int postId
			, Model model) {
		
		//정확한 기준 포스트테이블 아이디 기반 보여주기
		//파라미터 필요
		
		Post post = postBO.getPost(postId);//post객체 하나 
		
		model.addAttribute("post", post);
		
		return "post/detail";
	}
	
	
}
