package kr.or.ddit.commons.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping
public class ErrorPageController {
	@GetMapping("/error403Page")
	public String error403Page() throws Exception{
		return "error/error403";
	}
	
	@GetMapping("/error404Page")
	public String error404Page() throws Exception{
		return "error/error404";
	}

}
