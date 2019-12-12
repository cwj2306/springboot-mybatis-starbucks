package com.cos.starbucks;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TestController {

	@GetMapping("/test")
	public @ResponseBody String test() {
		return "test complete";
	}
	
	@GetMapping("/lookjsp")
	public String test2() {
		return "home";
	}
}

