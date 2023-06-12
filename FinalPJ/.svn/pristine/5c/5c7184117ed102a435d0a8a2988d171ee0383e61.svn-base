package kr.or.ddit.preDiagnosis.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.preDiagnosis.service.PreDiagnosisService;
import kr.or.ddit.vo.PreDiagnosisVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/preDiagnosis")
public class PreDiagnosisController {

	@Inject
	private PreDiagnosisService service;


	// 0508 문수정
	// -------------------------------------------------------------------------------
	/**
	 * 예진표 상세보기
	 * 
	 * @param patientKey
	 * @return
	 */
	@GetMapping(value = "/prediagnosisView.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public PreDiagnosisVO preDiagnosisView(@RequestParam("what") String patientKey) {
		log.debug("예진표 상세보기!!", patientKey);
		PreDiagnosisVO diagnosis = service.retrievePreDiagnosis(patientKey);
		return diagnosis;
	}

	@PostMapping(value = "preDiagnosisUpdate.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String updatePreDiagnosis(@RequestBody PreDiagnosisVO diagnosis) {
		int result = service.modifyPreDiagnosis(diagnosis);
		return result==1 ? "success" : "fail";
			
	}
}
