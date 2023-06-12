package kr.or.ddit.ward.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.pay.dao.PayDAO;
import kr.or.ddit.reservation.dao.ReservationDAO;
import kr.or.ddit.vo.CommonCodeVO;
import kr.or.ddit.vo.DietVO;
import kr.or.ddit.vo.HospitalizeRecordVO;
import kr.or.ddit.vo.IOVO;
import kr.or.ddit.vo.MedicalChartVO;
import kr.or.ddit.vo.MedicineRecordVO;
import kr.or.ddit.vo.MedicineVO;
import kr.or.ddit.vo.NurseChartVO;
import kr.or.ddit.vo.RoundsPrescriptionVO;
import kr.or.ddit.vo.RoundsRecordVO;
import kr.or.ddit.vo.VitalVO;
import kr.or.ddit.vo.WardBedVO;
import kr.or.ddit.ward.dao.WardDAO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class WardServiceImpl implements WardService {

	@Inject
	private WardDAO wardDAO;

	@Inject
	private ReservationDAO reservationDAO;

	@Inject
	private PayDAO payDAO;

	@Override
	public List<WardBedVO> retrieveWardBedStatus() {
		return wardDAO.selectWardBedStatus();
	}

	@Transactional
	@Override
	public void createHospitalizeRecord(Map<String, Object> data) {
		// 입원 기록 등록
		HospitalizeRecordVO hospitalizeRecordVO = new HospitalizeRecordVO();
		hospitalizeRecordVO.setPatientKey(data.get("patientKey").toString());
		hospitalizeRecordVO.setWardBedKey((Integer) data.get("wardBedKey"));
		wardDAO.insertHospitalizeRecord(hospitalizeRecordVO);

		log.info("확인하세여 {}", hospitalizeRecordVO.getHospitalizeRecordKey());

		// 수납키 생성
		payDAO.insertPay(hospitalizeRecordVO.getHospitalizeRecordKey());

		// 입원 대기 환자 상태변경 
		reservationDAO.updateReservationStatus(data.get("waitingKey").toString());
	}

	@Override
	public List<HospitalizeRecordVO> retrieveHospitalizePatientList() {
		return wardDAO.selectHospitalizePatientList();
	}

	@Override
	public MedicalChartVO retrieveMedicalChart(String orderKey) {
		return wardDAO.selectMedicalChart(orderKey);
	}

	@Override
	public int createNurseChart(NurseChartVO vo) {
		return wardDAO.insertNurseChart(vo);
	}

	@Override
	public List<CommonCodeVO> retrieveDietKindList() {
		return wardDAO.selectDietKindList();

	}

	@Override
	public int createDiet(DietVO vo) {
		return wardDAO.insertDiet(vo);
	}

	@Override
	public List<NurseChartVO> retrieveNurseChartList(String hospitalizeRecordKey) {
		return wardDAO.selectNurseChartList(hospitalizeRecordKey);
	}

	@Override
	public List<DietVO> retrieveDietList(String hospitalizeRecordKey) {
		return wardDAO.selectDietList(hospitalizeRecordKey);
	}

	@Override
	public int createVital(VitalVO vo) {
		return wardDAO.insertVital(vo);
	}

	@Override
	public List<VitalVO> retrieveVitalList(String hospitalizeRecordKey) {
		return wardDAO.selectVitalList(hospitalizeRecordKey);
	}

	@Override
	public int createIO(IOVO vo) {
		return wardDAO.insertIO(vo);
	}

	@Override
	public List<IOVO> retrieveIOList(String hospitalizeRecordKey) {
		return wardDAO.selectIOList(hospitalizeRecordKey);
	}

	@Override
	public RoundsRecordVO selectRoundsRecord(String hospitalizeRecordKey) {
		return wardDAO.selectRoundsRecord(hospitalizeRecordKey);
	}

	@Override
	public List<MedicineVO> retrieveMedicineList() {
		return wardDAO.selectMedicineList();
	}

	@Transactional
	@Override
	public int createRoundsRecord(RoundsRecordVO vo) {
		int result = 0;
		// 회진 기록
		result += wardDAO.insertRoundsRecord(vo);

		List<RoundsPrescriptionVO> list = vo.getRoundsPrescriptionList();

		for (RoundsPrescriptionVO roundsPrescriptionVO : list) {
			roundsPrescriptionVO.setRoundsRecordKey(vo.getRoundsRecordKey());
			result += wardDAO.insertRoundsPrescription(roundsPrescriptionVO);
		}

		return result;

	}

	@Override
	public List<RoundsRecordVO> retrieveRoundsRecordList(String hospitalizeRecordKey) {
		return wardDAO.selectRoundsRecordList(hospitalizeRecordKey);
	}

	@Transactional
	@Override
	public int createMedicineRecord(List<MedicineRecordVO> list) {

		int result = 0;

		for (MedicineRecordVO vo : list) {
			result += wardDAO.insertMedicineRecord(vo);
			result += wardDAO.decreaseMedicine(vo.getMedicineKey());
		}

		return result;

	}

	@Override
	public List<MedicineRecordVO> retrieveMedicineRecordList(String hospitalizeRecordKey) {
		return wardDAO.selectMedicineRecordList(hospitalizeRecordKey);
	}

	@Transactional
	@Override
	public int modifyWardInfoToCheckOut(HospitalizeRecordVO vo) {
		// 퇴원처리 순서
		int result = 0;

		// hospitalizeRecord의 check out date를 sysdate로 업데이트
		result += wardDAO.updateHospitalizeRecordDate(vo.getHospitalizeRecordKey());
		log.info("dao 1개째 실행 결과 : {}", result);

		// 식대
		result += wardDAO.insertPayDetailDiet(vo.getHospitalizeRecordKey());
		log.info("dao 2개째 실행 결과 : {}", result);
		
		// 의약품비
		result += wardDAO.insertPayDetailMedicine(vo.getHospitalizeRecordKey());
		log.info("dao 3개째 실행 결과 : {}", result);
		
		// 입원비
		result += wardDAO.insertPayDetailHospitalization(vo.getHospitalizeRecordKey());
		log.info("dao 4개째 실행 결과 : {}", result);

		// 환자 로케이션 수납실로 이동
		result += wardDAO.insertWaitingHistory(vo.getHospitalizeRecordKey());
		log.info("dao 5개째 실행 결과 : {}", result);
		
		
		return result;
	}

}
