        package kr.or.ddit.medicalChart.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.medicalChart.service.MedicalChartService;
import kr.or.ddit.vo.CommonCodeVO;
import kr.or.ddit.vo.DiagnosisVO;
import kr.or.ddit.vo.DiseaseVO;
import kr.or.ddit.vo.GroupOrderPrescritionVO;
import kr.or.ddit.vo.GroupOrderVO;
import kr.or.ddit.vo.MedicalChartVO;
import kr.or.ddit.vo.MedicalEquipmentVO;
import kr.or.ddit.vo.SurgeryKindVO;
import kr.or.ddit.vo.WaitingHistoryVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 진료 페이지 컨트롤러
 * @author dlgpd
 *
 */
@Slf4j
@Controller
@RequestMapping("/medicalChart")
public class MedicalChartController {

	@Inject
	private MedicalChartService medicalChartService;
	
	
	/**
	 * 과거 진료차트 조회하기
	 * @param patientKey
	 * @return
	 */
	@GetMapping(value =  "preChartList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public List<MedicalChartVO> getMedicalChartList(@RequestParam("patientKey") String patientKey){
		List<MedicalChartVO> list = medicalChartService.retrieveMedicalChartList(patientKey);
		return list;
	}
	
	
	/**
	 * 질병, 물리치료, 신체리스트, 수술종류 등 목록 불러오기
	 * @return
	 */
	@GetMapping(value = "initList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public Map<String, Object>  getinitList() {
		// 목록 보내줄 것 - 
		//질병코드리스트
//		List<DiseaseVO> diseaseList = medicalChartService.retrieveDiseaseAllList();
		// 치료목록 리스트
		List<MedicalEquipmentVO> therapyEqList = medicalChartService.retrieveMedicalEquipmentList();
		// 신체 리스트
		List<CommonCodeVO> bodyList = medicalChartService.retrieveBodyPartList();
		// 수술목록 surgeryList
		List<SurgeryKindVO> surgeryList = medicalChartService.retrieveSurgeryKindList();
		
		
		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("diseaseList", diseaseList);
		map.put("therapyEqList", therapyEqList);
		map.put("bodyList", bodyList);
		map.put("surgeryList", surgeryList);
		
		return map;
	}
	
	@GetMapping(value = "getDisList",  produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public List<DiseaseVO> getDisList(){
		List<DiseaseVO> diseaseList =  medicalChartService.retrieveDiseaseAllList();
		return diseaseList;
	}
	
	
	
	@GetMapping(value = "mywaitingList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public List<WaitingHistoryVO> getMyWaitingList(@RequestParam("officeKey") String officeKey){
		List<WaitingHistoryVO> list = medicalChartService.retrieveWaitingList(officeKey);
		return list;
	}
	
	//create chart num 신규 차트번호 생헝
	@PostMapping(value = "createChartNo", produces = "text/plain; charset=UTF-8")
	@ResponseBody
	public String createChartNo() {
		String newChartNo = medicalChartService.createChartNo();
		return newChartNo;
	}
	
	
	//insert---------------------------------------------------------------------
	@PostMapping(value =  "insertChart", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String insertChart(@RequestBody Map<String, Object> model) {
		int cnt = medicalChartService.insertMchartdata(model);
		String result ="";
		if(cnt > 0) {
			result = "성공";
		}else {
			result = "실패";
		}
		
		return result;
	}
	
	@PostMapping(value = "createGroupOrder", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String insertGroupOrder(@RequestBody GroupOrderVO groupOrder) {
		int cnt  = 0;
		String result ="";
		
		if(groupOrder != null ) {
			cnt = medicalChartService.createGroupOrder(groupOrder);
		}
		
		
		if(cnt > 0) {
			result = "성공";
		}else {
			result = "실패";
		}
		
		return result;
	}
	
	@GetMapping(value =  "getGroupOrder", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<GroupOrderVO> getGroupOrder(@RequestParam("empKey") String empKey){
		List<GroupOrderVO> groupOrderList = medicalChartService.getGroupOrderList(empKey);
		return groupOrderList;
	}
	
	@GetMapping(value = "deleteGroupOrder", produces = "text/plain; charset=UTF-8")
	@ResponseBody
	public String deleteGroupOrder(@RequestParam("groupOrderKey") int groupOrderKey) {
		int cnt  = 0;
		String result ="성공";
		
		if(groupOrderKey >= 0) {
			cnt = medicalChartService.deleteGroupOrder(groupOrderKey);
		}
		
		if(cnt > 0) {
			result = "성공";
		}else {
			result = "실패";
		}
		
		return result;
	}
	
}
