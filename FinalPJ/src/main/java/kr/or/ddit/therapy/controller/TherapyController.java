package kr.or.ddit.therapy.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.therapy.service.TherapyService;
import kr.or.ddit.vo.EquipmentStatusRecordVO;
import kr.or.ddit.vo.MedicalChartVO;
import kr.or.ddit.vo.MedicalEquipmentVO;
import kr.or.ddit.vo.PtEquipmentVO;
import kr.or.ddit.vo.PtRecordVO;
import kr.or.ddit.vo.PtRoomVO;
import kr.or.ddit.vo.ReceiptionVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping
public class TherapyController {

	@Inject
	private TherapyService therapyService;
	
	@GetMapping(value = "/ptWaitingPatientList.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<ReceiptionVO> ptWaitingPatientList(){
		List<ReceiptionVO> list =  therapyService.ptWaitingPatientList();
		return list;
	}
	// 물리치료 기구목록
	@GetMapping(value = "/ptEquipmentList.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<MedicalEquipmentVO> ptEquipmentList(){
		List<MedicalEquipmentVO> list = therapyService.ptEquipmentList();
		return list;
	}
	
	@GetMapping(value = "/ptEquipmentDetail.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public MedicalEquipmentVO ptEquipmentDetail(@RequestParam("what") int equipmentKey) {
		MedicalEquipmentVO equipmentVO = therapyService.ptEquipmentDetail(equipmentKey);
		return equipmentVO;
	}
	
	@GetMapping(value = "/ptEquipmentStatusList.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<EquipmentStatusRecordVO> ptEquipmentStatusList(@RequestParam("eqKey")int equipmentKey){
		List<EquipmentStatusRecordVO> list = therapyService.ptEquipmentStatusList(equipmentKey);
		return list;
	}
	
	
	@PostMapping(value = "/ptEquipmentStatusInsert.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String ptEquipmentStatusInsert(@RequestBody EquipmentStatusRecordVO eqStatusRecVO) {
		therapyService.ptEquipmentStatusInsert(eqStatusRecVO);
		
		log.debug("insert 확인 : {} ", eqStatusRecVO);
		
		return "success";
	}
	
	@GetMapping(value = "/ptEquipmentSelectList.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<MedicalChartVO> ptEquipmentSelectList(@RequestParam("who") String patientKey){
		List<MedicalChartVO> list = therapyService.ptEquipmentSelectList(patientKey);
		return list;
	}
	
	@GetMapping(value = "/ptRoomStatusSelect.do", produces = "application/json;charset=UTF-8" )
	@ResponseBody
	public List<PtRoomVO> ptRoomStatusSelect(){
		return therapyService.ptRoomStatusSelect();
	}
	
	
	@PostMapping(value = "/ptRoomStatusUpdate.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String ptRoomStatusUpdate(@RequestBody PtRoomVO ptRoomVO) {
		therapyService.ptRoomStatusUpdate(ptRoomVO);
		return "침상 업데이트 success";
	}
	
	@PostMapping(value = "/ptEuipmentStatusUpdate.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String ptEuipmentStatusUpdate(@RequestBody PtEquipmentVO ptEquipmentVO) {
		therapyService.ptEuipmentStatusUpdate(ptEquipmentVO);
		
		log.debug("ptEquipmentVO 왔니 : {}", ptEquipmentVO);
		return "장비 업데이트 success";
	}
	
	@PostMapping(value = "/ptRecordInsert.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String ptRecordInsert(@RequestBody PtRecordVO ptRecordVO, @RequestParam("receiptKey") String receiptKey) {
		log.info("확인 데이터 receiptkey : {}", receiptKey);
		
		int cnt = therapyService.ptRecordInsert(ptRecordVO, receiptKey);
		
		String result = "";
		
		if(cnt > 0) {
			result = "success";
		}else {
			result = "fail";
		}
		return result;
	}
	
	@GetMapping(value = "/ptRoomSelectList.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<PtRoomVO> ptRoomSelectList(){
		return therapyService.ptRoomSelectList();
	} 
	
	@GetMapping(value = "/nowPtBedStatusList.do", produces = "application/json;charset=UTF-8" )
	@ResponseBody
	public List<PtRecordVO> nowPtBedStatusList(){
		return therapyService.nowPtBedStatusList();
	}
	
	
	@GetMapping(value = "/actingDetail.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public PtRecordVO actingDetail(@RequestParam("orderKey")String orderKey) {
		return therapyService.actingDetail(orderKey);
	}
	
	
	@PostMapping(value = "/actingCommentUpdate.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String actingCommentUpdate(@RequestBody PtRecordVO ptRecordVO, @RequestParam("receiptKey") String receiptKey) {
		int cnt = therapyService.actingCommentUpdate(ptRecordVO, receiptKey);
		log.debug("comment 업데이트 {}", ptRecordVO, receiptKey);
		
		String result = "";
		
		if(cnt>0) {
			result = "성공";
		}else {
			result = "실패";
			
		}
		
		return result;
	}
	
	
	@GetMapping(value = "/patientChartDetail.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ReceiptionVO patientChartDetail(@RequestParam("orderKey")String orderKey) {
		log.debug("orderKey 왔니? {}", orderKey);
		return therapyService.patientChartDetail(orderKey);
	}
	
	
	// 침상 상세 데이터
	@GetMapping(value = "/ptBedStatusDetail.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public PtRecordVO ptBedStatusDetail(@RequestParam("orderKey")String orderKey) {
		return therapyService.ptBedStatusDetail(orderKey);
	}
	
	@GetMapping(value = "ptEqStatusList.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<MedicalEquipmentVO> ptEqStatusList(){
		return therapyService.ptEqStatusList();
	}
	
	@GetMapping(value = "nowPtEqStatusDetail.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<PtEquipmentVO> nowPtEqStatusDetail(@RequestParam("eqKey")int equipmentKey){
		return therapyService.nowPtEqStatusDetail(equipmentKey);
	}
	
	@PostMapping(value = "ptEqDetailStatusUpdate.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String ptEqDetailStatusUpdate(@RequestBody PtEquipmentVO ptEquipmentVO) {
		therapyService.ptEqDetailStatusUpdate(ptEquipmentVO);
		return "pteq 상태관리 업데이트 완료";
	}
	
	@PostMapping(value = "eqDetailStatusUpdate.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String eqDetailStatusUpdate(@RequestBody MedicalEquipmentVO medicalEquipmentVO) {
		therapyService.eqDetailStatusUpdate(medicalEquipmentVO);
		return "eq 상태관리 업데이트 완료";
	}
}
