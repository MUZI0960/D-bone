package kr.or.ddit.patient.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.or.ddit.patient.service.PatientService;
import kr.or.ddit.pay.service.PayService;
import kr.or.ddit.vo.PatientVO;
import kr.or.ddit.vo.PayVO;
import kr.or.ddit.vo.ReceiptionVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/patient")
public class PatientController {

	@Inject
	private PatientService service;
	@Inject
	private PayService payService;

	// 0503 문수정-------------------------------------------------------
	/**
	 * 환자 목록 조회 컨트롤러
	 * 
	 * @return
	 */
	@GetMapping(value = "/patientList.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public List<PatientVO> patientList() {
		List<PatientVO> patientList = new ArrayList<PatientVO>();
		patientList = service.retrievePatientList();
		return patientList;

	}

	// 0505 문수정-------------------------------------------------------
	/**
	 * 환자 상세 보기 컨트롤러
	 * 
	 * @param patientKey
	 * @return
	 */
	@GetMapping("/patientView.do")
	@ResponseBody
	public PatientVO patientView(@RequestParam("what") String patientKey) {
		PatientVO patient = service.retrievePatient(patientKey);
		log.info("환자 상세보기 : {}", patient);
		return patient;
	}

	// 0503 문수정-------------------------------------------------------
	/**
	 * 신규 환자 등록 컨트롤러
	 * 
	 * @param patient
	 * @return
	 */
	@PostMapping(value = "/patientInsert.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String insertPatient(@RequestBody PatientVO patient) {
		log.info(patient.toString());
		int result = service.createPatient(patient);
		return result == 1 ? "success" : "fail";
	}

	// 0504 문수정-------------------------------------------------------
	/**
	 * 환자 정보 수정 컨트롤러
	 * 
	 * @param patient
	 * @return
	 */
	@PostMapping(value = "patientUpdate.do", produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String updatePatient(@RequestBody PatientVO patient) {
		int result = service.modifyPatient(patient);

		return result == 1 ? "success" : "false";
	}

	// 정민------------------------------------------------------------------------------------------------
	/**
	 * 접수페이지에서 환자목록 뽑기 
	 * @return
	 */
	@GetMapping("/retrieveMember")
	@ResponseBody
	public List<ReceiptionVO> retrieveMember() {
		return service.selectReceipMember();
	}

	// 정민------------------------------------------------------------------------------------------------
	/**
	 * 수납대기환자 목록 출력하기
	 */
	@GetMapping("/paywaiting")
	@ResponseBody
	public List<PayVO> retrievePayWaiting() {
		return payService.selectPayWaitingList();
	}
	
	// 정민------------------------------------------------------------------------------------------------
	/**
	 * document jsp에서 진료확인서를 뽑기 위해 수납이 완료된 회원 조회하기
	 * @return
	 */
	@GetMapping("/completePayment")
	public List<PatientVO> retreiveDiagnosis(){
		log.info("수납이완료된 환자 {}",service.completePayment());
		return service.completePayment();
	}
	
	

	// 환자 상세 정보 보는 method
	// 유림
	@GetMapping("patientDetail")
	@ResponseBody
	public PatientVO getPatientDetail(@RequestParam String patientKey) {
		PatientVO vo = service.retrievePatientDetail(patientKey);
		log.info(vo.toString());
		return vo;
	}
	
	
	// 정민------------------------------------------------------------------------------------------------
	// 환자 진료끝난 후에 진료차트 POI로 출력하기
	@GetMapping("medicalCertificate")
	public PatientVO medicalCertificate(@RequestParam String patientKey) {
		log.info("환자키 {} ",patientKey);
		return service.selectMedicalCertificate(patientKey);
	}
	

	// 정민------------------------------------------------------------------------------------------------
	/**
	 * 진료차트를 뽑고자 원하는 환자리스트. 이 환자 리스트는 진료차트키가 null이 아닌 것만 출력함
	 * @return
	 */
	@GetMapping("jinryoChartList")
	public List<PatientVO> jinryoChartList(){
		return service.selectJinRyoChartList();
	}
	
	// 유림 수납 대기 목록 뽑기 
	@GetMapping(value="payWaitingList", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<PayVO> getPayWaitingList(){
		return service.selectPayWaitingList();
	}


	/**
	 * 월별 방문자수 구하기
	 * @return [1~6월]
	 */
	@GetMapping("patientController/statistics")
	public List patientStatistics(){
		return service.selectPatientStatistics();
	}

	/**
	 * 월별 매출액 뽑기
	 * @return
	 */
	@GetMapping("patientController/sales")
	public List sales(){
		return service.selectSales();
	}
}
