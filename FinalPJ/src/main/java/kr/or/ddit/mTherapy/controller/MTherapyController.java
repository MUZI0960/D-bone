package kr.or.ddit.mTherapy.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.mTherapy.service.MTherapyService;
import kr.or.ddit.vo.MtRecordVO;
import kr.or.ddit.vo.ReceiptionVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping
@Slf4j
public class MTherapyController {

	@Inject
	private MTherapyService mTherapyService;
	
	@GetMapping(value = "/mtWaitingPatientList.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<ReceiptionVO> mtWaitingPatientList(){
		return mTherapyService.mtWaitingPatientList();
	}
	
	@GetMapping(value = "/mtPatientChartDetail.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ReceiptionVO patientChartDetail(@RequestParam("orderKey")String orderKey) {
		log.debug("chPatientKey 왔니? {}", orderKey);
		return mTherapyService.patientChartDetail(orderKey);
	}
	
	@PostMapping(value = "/mtRecordInsert.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String mtRecordInsert(@RequestBody MtRecordVO mtRecordVO, @RequestParam("receiptKey") String receiptKey) {
		 int cnt = mTherapyService.mtRecordInsert(mtRecordVO, receiptKey); 
		 
		 String result = "";
		 
		 if(cnt > 0) {
			 result  = "도수치료 기록 인서트 success";
		 }else {
			 result  = "도수치료 기록 인서트 fail";
		 }
		 
		 return result;
	}
	
	@PostMapping(value = "/mtRecordAssessUpdate.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String mtRecordAssessUpdate(@RequestBody MtRecordVO mtRecordVO){
		mTherapyService.mtRecordAssessUpdate(mtRecordVO);
		return "도수치료 기록 평가 업데이트 success";
	}
	
	
	@GetMapping(value = "mtStartPatientInfoDetail.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ReceiptionVO mtStartPatientInfoDetail(@RequestParam("orderKey")String orderKey){
		return mTherapyService.mtStartPatientInfoDetail(orderKey);
		
	}
	
	@PostMapping(value = "mtAssessmentUpdate.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String mtAssessmentUpdate(@RequestBody MtRecordVO mtRecordVO) {
		mTherapyService.mtAssessmentUpdate(mtRecordVO);
		return "도수치료 기록지 평가 업데이트 완료";
	}
	
	@PostMapping(value = "mtPlanUpdate.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String mtPlanUpdate(@RequestBody MtRecordVO mtRecordVO) {
		mTherapyService.mtPlanUpdate(mtRecordVO);
		return "도수치료 기록지 SOAP 업데이트 완료";
	}
	
	@PostMapping(value = "mtCommentUpdate.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String mtCommentUpdate(@RequestBody MtRecordVO mtRecordVO,@RequestParam("receiptKey") String receiptKey) {
		int cnt = mTherapyService.mtCommentUpdate(mtRecordVO, receiptKey);
		
		String result = "";
		
		if(cnt>0) {
			result = "대기상태 변경 성공";
		}else {
			result = "대기상태 변경 실패";
		}
		return result;
	}
	
	@GetMapping(value = "mtChartDataList.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<MtRecordVO> mtChartDataList(@RequestParam("patientKey")String patientKey){
		return mTherapyService.mtChartDataList(patientKey);
	}
	
	
	@GetMapping(value = "mtRecHistoryList.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<MtRecordVO> mtRecHistoryList(@RequestParam("patientKey")String patientKey){
		return mTherapyService.mtRecHistoryList(patientKey);
	}
	
	
}
