package kr.or.ddit.ward.controller;

import java.util.List;

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

import kr.or.ddit.vo.CommonCodeVO;
import kr.or.ddit.vo.DietVO;
import kr.or.ddit.vo.HospitalizeRecordVO;
import kr.or.ddit.vo.IOVO;
import kr.or.ddit.vo.MedicalChartVO;
import kr.or.ddit.vo.MedicineRecordVO;
import kr.or.ddit.vo.MedicineVO;
import kr.or.ddit.vo.NurseChartVO;
import kr.or.ddit.vo.RoundsRecordVO;
import kr.or.ddit.vo.VitalVO;
import kr.or.ddit.ward.service.WardService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/ward")
public class WardController {

	@Inject
	private WardService wardService;

	@GetMapping(value = "hospitalizePatientList", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<HospitalizeRecordVO> getHospitalizationPatientList() {
		return wardService.retrieveHospitalizePatientList();
	}

	@GetMapping(value = "medicalChart", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public MedicalChartVO getMedicalChart(String orderKey) {

		return wardService.retrieveMedicalChart(orderKey);

	}

	@GetMapping(value = "dietKindList", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<CommonCodeVO> getDietKindList() {
		return wardService.retrieveDietKindList();
	}

	@PostMapping(value = "nurseChart", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.TEXT_PLAIN_VALUE)
	@ResponseBody
	public String insertNurseChart(@RequestBody NurseChartVO vo) {

		int result = wardService.createNurseChart(vo);
		return result == 1 ? "success" : "fail";
	}

	@PostMapping(value = "diet", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.TEXT_PLAIN_VALUE)
	@ResponseBody
	public String insertDiet(@RequestBody DietVO vo) {

		int result = wardService.createDiet(vo);
		return result == 1 ? "success" : "fail";
	}

	/**
	 * 선택한 환자의 모든 간호기록 가져오기 (입원기록 기준으로)
	 * 
	 * @param hospitalizeRecordKey
	 * @return
	 */
	@GetMapping(value = "nurseCharList", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<NurseChartVO> getNurseChartList(@RequestParam String hospitalizeRecordKey) {
		return wardService.retrieveNurseChartList(hospitalizeRecordKey);
	}

	/**
	 * 선택한 환자의 모든 식이기록 가져오기 (입원기록 기준으로)
	 * 
	 * @param hospitalizeRecordKey
	 * @return
	 */
	@GetMapping(value = "dietList", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<DietVO> getDietList(@RequestParam String hospitalizeRecordKey) {

		return wardService.retrieveDietList(hospitalizeRecordKey);
	}

	/**
	 * 선택한 환자의 모든 바이탈기록 가져오기 (입원기록 기준으로)
	 * 
	 * @param hospitalizeRecordKey
	 * @return
	 */
	@GetMapping(value = "vitalList", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<VitalVO> getVitalList(@RequestParam String hospitalizeRecordKey) {

		return wardService.retrieveVitalList(hospitalizeRecordKey);
	}

	/**
	 * 선택한 환자의 모든 IO기록 가져오기 (입원기록 기준으로)
	 * 
	 * @param hospitalizeRecordKey
	 * @return
	 */
	@GetMapping(value = "ioList", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<IOVO> getIOList(@RequestParam String hospitalizeRecordKey) {
		return wardService.retrieveIOList(hospitalizeRecordKey);
	}

	@PostMapping(value = "vital", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.TEXT_PLAIN_VALUE)
	@ResponseBody
	public String insertVital(@RequestBody VitalVO vo) {
		log.info(vo.toString());
		int result = wardService.createVital(vo);
		return result == 1 ? "success" : "fail";
	}

	@PostMapping(value = "io", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.TEXT_PLAIN_VALUE)
	@ResponseBody
	public String insertIO(@RequestBody IOVO vo) {
		log.info(vo.toString());
		int result = wardService.createIO(vo);
		return result == 1 ? "success" : "fail";
	}

	@GetMapping(value = "roundsRecord", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public RoundsRecordVO getTodayRoundsRecord(@RequestParam String hospitalizeRecordKey) {
		RoundsRecordVO roundsRecordVO = wardService.selectRoundsRecord(hospitalizeRecordKey);
		if (roundsRecordVO == null)
			roundsRecordVO = new RoundsRecordVO();
		return roundsRecordVO;

	}

	@GetMapping(value = "medicineList", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<MedicineVO> getMedicineList() {
		return wardService.retrieveMedicineList();
	}

	@PostMapping(value = "roundsRecord", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.TEXT_PLAIN_VALUE)
	@ResponseBody
	public String insertRoundsRecord(@RequestBody RoundsRecordVO vo) {
		int result = wardService.createRoundsRecord(vo);

		if (result == vo.getRoundsPrescriptionList().size() + 1) {
			return "success";
		} else {
			return "fail";
		}
	}

	@GetMapping(value = "roundsRecordList", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<RoundsRecordVO> getRoundsRecordList(@RequestParam String hospitalizeRecordKey) {
		return wardService.retrieveRoundsRecordList(hospitalizeRecordKey);
	}

	@PostMapping(value = "medicineRecord", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.TEXT_PLAIN_VALUE)
	@ResponseBody
	public String insertMedicineRecord(@RequestBody List<MedicineRecordVO> list) {
		int result = wardService.createMedicineRecord(list);
		return result == list.size() * 2 ? "success" : "fail";
	}

	@GetMapping(value = "medicineRecordList", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<MedicineRecordVO> getmedicineRecordList(@RequestParam String hospitalizeRecordKey) {
		return wardService.retrieveMedicineRecordList(hospitalizeRecordKey);
	}

	@PutMapping(value = "checkOut", produces = MediaType.TEXT_PLAIN_VALUE)
	@ResponseBody
	public String updateWardInfoToCheckOut(@RequestBody HospitalizeRecordVO vo) {
		log.info("퇴실 체크 {}",vo.toString());
		int result = wardService.modifyWardInfoToCheckOut(vo);
		return result == 5 ? "success" : "fail";
	}
}
