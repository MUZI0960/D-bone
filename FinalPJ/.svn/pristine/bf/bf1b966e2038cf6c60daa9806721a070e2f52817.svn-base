package kr.or.ddit.ward.service;

import java.util.List;
import java.util.Map;

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
import kr.or.ddit.vo.WardBedVO;

public interface WardService {
	// 병동 침상 상태 
	public List<WardBedVO> retrieveWardBedStatus();
	
	// 입원 기록 생성 
	public void createHospitalizeRecord(Map<String, Object> data);

	// 입원 환자 목록 
	public List<HospitalizeRecordVO> retrieveHospitalizePatientList();

	// 진료차트 조회 
	public MedicalChartVO retrieveMedicalChart(String orderKey);

	// 간호 기록 생성 
	public int createNurseChart(NurseChartVO vo);
	
	// 간호 기록 불러오기 
	public List<NurseChartVO> retrieveNurseChartList(String hospitalizeRecordKey);

	// 식이 종류 조회 
	public List<CommonCodeVO> retrieveDietKindList();

	// 식이 기록 생성 
	public int createDiet(DietVO vo);

	// 식이 기록 조회 
	public List<DietVO> retrieveDietList(String hospitalizeRecordKey);

	// 바이탈 기록 생성 
	public int createVital(VitalVO vo);

	// 바이탈 기록 조회 
	public List<VitalVO> retrieveVitalList(String hospitalizeRecordKey);

	// IO 기록 생성 
	public int createIO(IOVO vo);

	// IO 기록 조회 
	public List<IOVO> retrieveIOList(String hospitalizeRecordKey);

	// 오늘 회진 내역 조회 
	public RoundsRecordVO selectRoundsRecord(String hospitalizeRecordKey);

	// 병동 약물 전체 조회 
	public List<MedicineVO> retrieveMedicineList();

	// 회진 기록 생성 
	public int createRoundsRecord(RoundsRecordVO vo);

	// 회진 기록 전체 조회 
	public List<RoundsRecordVO> retrieveRoundsRecordList(String hospitalizeRecordKey);

	// 약물 투약 기록 생성 
	public int createMedicineRecord(List<MedicineRecordVO> list);

	// 약물 투약 기록 전체 조회 
	public List<MedicineRecordVO> retrieveMedicineRecordList(String hospitalizeRecordKey);

	// 퇴원 업데이트 
	public int modifyWardInfoToCheckOut(HospitalizeRecordVO vo);

}
