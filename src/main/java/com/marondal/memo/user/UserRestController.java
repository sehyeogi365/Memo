package com.marondal.memo.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.marondal.memo.user.bo.UserBO;
import com.marondal.memo.user.model.User;

@RestController // @Controller +  @ResponseBody
@RequestMapping("/user")
public class UserRestController {
	
	@Autowired
	private UserBO userBO;
	
	@PostMapping("/signup")
	public Map<String, String>signup(
			@RequestParam("loginId") String loginId
			, @RequestParam("password") String password
			, @RequestParam("name") String name
			, @RequestParam("email") String email) {
		//controller는 리퀘스트만 담당 
		int count = userBO.addUser(loginId, password, name, email);//bo에서 값 불러오기
	
		Map<String, String> resultMap = new HashMap<>();
		
		if(count == 1) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
	
		return resultMap;
		
	}
	
	@PostMapping("/signin")
	public Map<String, String> signin(
			@RequestParam("loginId")String loginId
			, @RequestParam("password") String password
			, HttpServletRequest request) {//http servlet 리퀘스트 객체를 얻어오고 그 객체로부터 얻어오고 그객체로부터  세션을 얻어온다.     
		
		User user = userBO.getUser(loginId, password);//일치하는 딱 하나의 객체 리턴
	
		//결과를 저장할 맵먼저 저장
		Map <String, String> resultMap = new HashMap<>();	
		
		if(user != null) {
			resultMap.put("result", "success");
			
			HttpSession session = request.getSession();
			//지금이 사용자가 로그인상태다 라는걸 저장.
			session.setAttribute("userId", user.getId());//user테이블의 id 세션이라는 공간에 유저아이디라는 키로 해당하는 아이디값을 저장시킴
			session.setAttribute("userName", user.getName());// 컨트롤러의 어떤 메소드에서든 다가져다 쓸수 있다. 
					//모든페이지서 이값을 사용할수있따.				// 어디서든 값을 저장하고 어디서든 갖다 쓸수 있다. 
			//무분별하게 값을저장하면 메모리를 많이 사용하게 되어 부하가 일어남 최소한으로 꼭필요한 정보만 저장하고 사용 (타임아웃)
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;//널여부에 따라서 로그인됐다 안됐따 판단
	
	}
	
}
