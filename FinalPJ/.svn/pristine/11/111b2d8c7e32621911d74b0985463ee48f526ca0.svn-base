package kr.or.ddit.surgery.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.surgery.service.SurgeryService;
import kr.or.ddit.vo.MedicalChartVO;
import kr.or.ddit.vo.PatientVO;
import kr.or.ddit.vo.PreExaminationVO;
import kr.or.ddit.vo.SurgeryInfoVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/surgery")
public class SurgeryController {

	@Inject
	private SurgeryService surgeryService;

	@GetMapping("preExaminationList")
	@ResponseBody
	public List<PatientVO> getPreExaminationList() {
		return surgeryService.retrievePreExaminationList();
	}

	@GetMapping("medicalChart")
	@ResponseBody
	public MedicalChartVO getMedicalChart(@RequestParam String hospitalizeRecordKey) {
		log.info("잘들어오나?{}", hospitalizeRecordKey);
		return surgeryService.retrieveMedicalChart(hospitalizeRecordKey);
	}

	@GetMapping("preExaminationKey")
	@ResponseBody
	public String getPreExaminationKey() {
		return surgeryService.createPreExaminationKey();
	}

	@PostMapping(value = "preExamination", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.TEXT_PLAIN_VALUE)
	@ResponseBody
	public String createPreExamination(@RequestBody PreExaminationVO vo) {
		int result = surgeryService.createPreExamination(vo);
		return result == 3 ? "success" : "fail";
	}

	@GetMapping("preExaminationCompleteList")
	@ResponseBody
	public List<PatientVO> getPreExaminationCompleteList() {
		return surgeryService.retrievePreExaminationCompleteList();
	}
	
	@GetMapping("surgeryWaitingList")
	@ResponseBody
	public List<PatientVO> getSurgeryWaitingList(){
		return surgeryService.retrieveSurgeryWaitingList();
	}
}
