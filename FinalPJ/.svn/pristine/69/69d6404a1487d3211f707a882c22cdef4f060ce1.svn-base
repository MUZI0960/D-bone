package kr.or.ddit.surgery.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.MedicalChartVO;
import kr.or.ddit.vo.PatientVO;
import kr.or.ddit.vo.PreExaminationVO;
import kr.or.ddit.vo.SurgeryInfoVO;

@Mapper
public interface SurgeryDAO {

	public List<PatientVO> selectPreExaminationList();

	public MedicalChartVO selectMedicalChart(String hospitalizeRecordKey);

	public String selectPreExaminationKey();

	public int insertPreExamination(PreExaminationVO vo);

	public int updateHospitalizeRecord(Map<String, String> map);

	public int insertPayDetailExamination(String hospitalizeRecordKey);

	public List<PatientVO> selectPreExaminationCompleteList();

	public List<PatientVO> selectWaitingSurgeryList();

	public List<SurgeryInfoVO> selectSurgeryInfoList();

	public int updateSurgeryInfo(SurgeryInfoVO vo);

	public int insertSurgeryInfo(SurgeryInfoVO vo);

	public SurgeryInfoVO selectSurgeryInfo(String surgeryInfoKey);

	public List<PatientVO> selectSurgeryWaitingList();
}