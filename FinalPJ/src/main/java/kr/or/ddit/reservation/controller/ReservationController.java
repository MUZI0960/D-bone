
package kr.or.ddit.reservation.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.reservation.service.ReservationService;
import kr.or.ddit.surgery.service.SurgeryService;
import kr.or.ddit.vo.CommonCodeVO;
import kr.or.ddit.vo.PatientVO;
import kr.or.ddit.vo.SurgeryInfoVO;
import kr.or.ddit.vo.WaitingHospitalizationVO;
import kr.or.ddit.vo.WardBedVO;
import kr.or.ddit.ward.service.WardService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/reservation")
public class ReservationController {

	@Inject
	private WardService wardService;

	@Inject
	private ReservationService reservationService;

	@Inject
	private SurgeryService surgeryService;

	DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'", Locale.KOREA);

	/**
	 * 입원 병동 상태 불러오기
	 * 
	 * @return
	 */
	@GetMapping(value = "wardBedStatus", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<WardBedVO> getWardBedStatus() {

		return wardService.retrieveWardBedStatus();
	}

	/**
	 * 입원 대기 목록 불러오기
	 * 
	 * @return
	 */
	@GetMapping(value = "waitingPatientList", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<WaitingHospitalizationVO> getWaitingPatientList() {

		return reservationService.retrieveWaitingPatientList();

	}

	@GetMapping(value = "gradeList", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<CommonCodeVO> getGradeList() {

		return reservationService.retrieveGradeList();

	}

	/**
	 * 희망 등급 변동
	 */
	@PutMapping(value = "wardGrade", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String updateGrade(@RequestBody WaitingHospitalizationVO vo) {
		int result = reservationService.modifyWardGrade(vo);
		return result == 1 ? "success" : "fail";

	}

	@PostMapping(value = "hospitalizationRecord", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public void insertHospitalizationRecord(@RequestBody Map<String, Object> data) {
		log.info(data.toString());
		wardService.createHospitalizeRecord(data);

	}

	@GetMapping(value = "surgeryInfoList", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<Map<String, Object>> getSurgeryInfoList() {
		List<SurgeryInfoVO> list = surgeryService.retrieveSurgeryInfoList();
		List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();

		for (SurgeryInfoVO surgeryVO : list) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("allDay", false);
			map.put("id", surgeryVO.getSurgeryInfoKey());
			map.put("title", surgeryVO.getPatientName());
			map.put("start", surgeryVO.getSurgeryStartDate().toString());
			map.put("end", surgeryVO.getSurgeryEndDate().toString());
//			map.put("backgroundColor", "rgb(249,197,90)");
			result.add(map);
		}
		return result;
	}

	@PutMapping(value = "surgeryInfo", produces = MediaType.TEXT_PLAIN_VALUE)
	@ResponseBody
	// 수술 예약 수정
	public String updateSurgeryInfo(@RequestBody Map<String, Object> data) {
		log.info("일정 수정 시작!");

		SurgeryInfoVO vo = new SurgeryInfoVO();

		int surgeryInfoKey = Integer.parseInt(data.get("surgeryInfoKey").toString());
		vo.setSurgeryInfoKey(surgeryInfoKey);

		String startDateStr = data.get("surgeryStartDate").toString();
		LocalDateTime startDateUTC = LocalDateTime.parse(startDateStr, dateTimeFormatter);
		LocalDateTime startDate = startDateUTC.plusHours(9);
		vo.setSurgeryStartDate(startDate);

		String endDateStr = data.get("surgeryEndDate").toString();
		LocalDateTime endDateUTC = LocalDateTime.parse(endDateStr, dateTimeFormatter);
		LocalDateTime endDate = endDateUTC.plusHours(9);
		vo.setSurgeryEndDate(endDate);

		log.info("vo 정보 체킁 {}", vo.toString());
		int result = surgeryService.modifySurgeryInfo(vo);
		return result == 1 ? "success" : "fail";
	}

	@PostMapping(value = "surgeryInfo", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.TEXT_PLAIN_VALUE)
	@ResponseBody
	// 수술 예약 등록
	public String insertSurgeryInfo(@RequestBody Map<String, Object> data) {
		log.info("일정 삽입 시작!");

		SurgeryInfoVO vo = new SurgeryInfoVO();

		String hospitalizeRecordKey = data.get("hospitalizeRecordKey").toString();
		vo.setHospitalizeRecordKey(hospitalizeRecordKey);

		String surgeryManager = data.get("surgeryManager").toString();
		vo.setSurgeryManager(surgeryManager);

		String startDateStr = data.get("surgeryStartDate").toString();
		LocalDateTime startDateUTC = LocalDateTime.parse(startDateStr, dateTimeFormatter);
		LocalDateTime startDate = startDateUTC.plusHours(9);
		vo.setSurgeryStartDate(startDate);

		String endDateStr = data.get("surgeryEndDate").toString();
		LocalDateTime endDateUTC = LocalDateTime.parse(endDateStr, dateTimeFormatter);
		LocalDateTime endDate = endDateUTC.plusHours(9);
		vo.setSurgeryEndDate(endDate);

		log.info("vo 정보 체킁 {}", vo.toString());
		int result = surgeryService.createSurgeryInfo(vo);
		return result == 1 ? "success" : "fail";
	}

	// 수술 예약 대기 목록
	@GetMapping("waitingSurgeryList")
	@ResponseBody
	public List<PatientVO> getWaitingSurgeryList() {
		return surgeryService.retrieveWaitingSurgeryList();
	}

	// 수술 정보 조회
	@GetMapping(value = "surgeryInfo", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public SurgeryInfoVO getSurgeryInfo(@RequestParam String surgeryInfoKey) {
		log.info("키 확인 {}", surgeryInfoKey);
		return surgeryService.rertrieveSurgeryInfo(surgeryInfoKey);
	}
}
