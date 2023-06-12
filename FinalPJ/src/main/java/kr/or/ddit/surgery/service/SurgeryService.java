package kr.or.ddit.surgery.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.MedicalChartVO;
import kr.or.ddit.vo.PatientVO;
import kr.or.ddit.vo.PreExaminationVO;
import kr.or.ddit.vo.SurgeryInfoVO;

public interface SurgeryService {

	public List<PatientVO> retrievePreExaminationList();

	public MedicalChartVO retrieveMedicalChart(String hospitalizeRecordKey);

	public String createPreExaminationKey();

	public int createPreExamination(PreExaminationVO vo);

	public List<PatientVO> retrievePreExaminationCompleteList();

	public List<PatientVO> retrieveWaitingSurgeryList();

	public List<SurgeryInfoVO> retrieveSurgeryInfoList();

	public int modifySurgeryInfo(SurgeryInfoVO vo);

	public int createSurgeryInfo(SurgeryInfoVO vo);

	public SurgeryInfoVO rertrieveSurgeryInfo(String surgeryInfoKey);

	public List<PatientVO> retrieveSurgeryWaitingList();


}
