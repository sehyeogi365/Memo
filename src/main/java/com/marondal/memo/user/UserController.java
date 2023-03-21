package com.marondal.memo.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {//회원가입 폼 만들려면 레이아웃 부터
	
	@GetMapping("/signup/view")
	public String signupInput() {
		return "user/signup";
	}
	
	@GetMapping("/signin/view")
	public String signinInput() {
		return "user/signin";
	}
	//전반적인 요청처리는 똑같다.
	
	@GetMapping("/signout")
	public String signout(HttpServletRequest request) {// 없으면 객체 만들라 jsp servlet 할때 썼던 객체		
		//로그인을 반대로 하면된다. 저장을 했다면 이번엔 지운다.
		//리퀘스트 객체를 통해 얻어올수있지만 더 간단하게.
		HttpSession session = request.getSession();
		session.removeAttribute("userId");//어떤키를 삭제할지?
		session.removeAttribute("userName");//어떤키를 삭제할지?
		
		return "redirect:/user/signin/view";//redirect시키기 특수한형태 이미 완성된 페이지를 보여주기 위해 해당하는 url 쓰기
		
		
	
	}
	
}
