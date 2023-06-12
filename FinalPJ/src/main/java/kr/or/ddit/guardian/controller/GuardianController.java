package kr.or.ddit.guardian.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.guardian.service.GuardianService;
import kr.or.ddit.vo.GuardianVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/guardian")
public class GuardianController {

	@Inject
	private GuardianService service;

	// 0511 문수정 ----------------------------------------------------------------
	/**
	 * 보호자 정보 수정
	 * 
	 * @param guardian
	 * @return
	 */
	@PostMapping(value = "guardianUpdate.do", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String updateGuardian(@RequestBody GuardianVO guardian) {
		log.info(guardian.toString());
		int result = service.modifyGuardian(guardian);
		return result == 1 ? "success" : "fail";
	}
}
