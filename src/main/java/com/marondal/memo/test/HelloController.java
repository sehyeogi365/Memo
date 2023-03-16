package com.marondal.memo.test;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HelloController {
	
	@GetMapping("/hello")
	@ResponseBody //response한내용이 그대로 담긴다는뜻
	public String hello() {
		return "Hello Wolrd";
	}
	
	@GetMapping("/hello/jsp")
	public String helloJsp() {
		return "hello";
	}
}
