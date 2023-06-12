package kr.or.ddit.ward.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

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

@Mapper
public interface WardDAO {

	public List<WardBedVO> selectWardBedStatus();

	public int insertHospitalizeRecord(HospitalizeRecordVO hospitalizeRecordVO);

	public List<HospitalizeRecordVO> selectHospitalizePatientList();

	public MedicalChartVO selectMedicalChart(String orderKey);
	
	public int insertNurseChart(NurseChartVO nurseChartVO);

	public List<CommonCodeVO> selectDietKindList();

	public int insertDiet(DietVO vo);

	public List<NurseChartVO> selectNurseChartList(String hospitalizeRecordKey);

	public List<DietVO> selectDietList(String hospitalizeRecordKey);

	public int insertVital(VitalVO vo);

	public List<VitalVO> selectVitalList(String hospitalizeRecordKey);

	public int insertIO(IOVO vo);

	public List<IOVO> selectIOList(String hospitalizeRecordKey);

	public RoundsRecordVO selectRoundsRecord(String hospitalizeRecordKey);

	public List<MedicineVO> selectMedicineList();

	public int insertRoundsRecord(RoundsRecordVO vo);

	public int insertRoundsPrescription(RoundsPrescriptionVO roundsPrescription);

	public List<RoundsRecordVO> selectRoundsRecordList(String hospitalizeRecordKey);

	public int insertMedicineRecord(MedicineRecordVO vo);

	public List<MedicineRecordVO> selectMedicineRecordList(String hospitalizeRecordKey);
	
	public int updateHospitalizeRecordDate(String hospitalizeRecordKey);
	
	public int insertPayDetailDiet(String hospitalizeRecordKey);

	public int insertWaitingHistory(String hospitalizeRecordKey);

	public int insertPayDetailMedicine(String hospitalizeRecordKey);

	public int decreaseMedicine(String medicineKey);

	public int insertPayDetailHospitalization(String hospitalizeRecordKey);

	
}
