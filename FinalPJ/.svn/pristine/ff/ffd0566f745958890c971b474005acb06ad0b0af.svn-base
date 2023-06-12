package kr.or.ddit.commons.controller;

import java.security.Principal;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.emp.service.EmpService;
import kr.or.ddit.vo.EmpVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class WelcomePageController {
	@Inject
	private EmpService service;
	
	@RequestMapping("/welcome.do")
	public String index(Principal principal, HttpSession session) {
		
		EmpVO emp = service.retrieveEmpSecurity(principal.getName());
		
		session.setAttribute("authEmp", emp);
		return "login/welcomPage";
	}
}
