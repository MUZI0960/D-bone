package kr.or.ddit.commons.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	@RequestMapping("/index.do")
	public String index() {
		return "login/login";
	}
}
