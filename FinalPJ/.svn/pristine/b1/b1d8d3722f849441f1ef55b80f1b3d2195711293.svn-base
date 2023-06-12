package kr.or.ddit.surgery.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.surgery.dao.SurgeryDAO;
import kr.or.ddit.vo.MedicalChartVO;
import kr.or.ddit.vo.PatientVO;
import kr.or.ddit.vo.PreExaminationVO;
import kr.or.ddit.vo.SurgeryInfoVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class SurgeryServiceImpl implements SurgeryService {
	
	@Inject
	private SurgeryDAO surgeryDAO;
	
	@Override
	public List<PatientVO> retrievePreExaminationList() {
		return surgeryDAO.selectPreExaminationList();
	}

	@Override
	public MedicalChartVO retrieveMedicalChart(String hospitalizeRecordKey) {
		return surgeryDAO.selectMedicalChart(hospitalizeRecordKey);
	}

	@Override
	public String createPreExaminationKey() {
		return surgeryDAO.selectPreExaminationKey();
	}

	@Transactional
	@Override
	public int createPreExamination(PreExaminationVO vo) {
		int result = 0;
		// 검사 insert 
		result += surgeryDAO.insertPreExamination(vo);
		
		// 검사 결과 update
		Map<String, String> map = new HashMap<String, String>();
		map.put("hospitalizeRecordKey", vo.getHospitalizeRecordKey());
		map.put("status", vo.getStatus());
		result += surgeryDAO.updateHospitalizeRecord(map);
		
		// 검사 비용 insert 
		result += surgeryDAO.insertPayDetailExamination(vo.getHospitalizeRecordKey());
		return result;
	}

	@Override
	public List<PatientVO> retrievePreExaminationCompleteList() {
		return surgeryDAO.selectPreExaminationCompleteList();
	}

	@Override
	public List<PatientVO> retrieveWaitingSurgeryList() {
		return surgeryDAO.selectWaitingSurgeryList();
	}

	@Override
	public List<SurgeryInfoVO> retrieveSurgeryInfoList() {
		return surgeryDAO.selectSurgeryInfoList();
	}

	@Override
	public int modifySurgeryInfo(SurgeryInfoVO vo) {
		return surgeryDAO.updateSurgeryInfo(vo);
	}

	@Override
	public int createSurgeryInfo(SurgeryInfoVO vo) {
		return surgeryDAO.insertSurgeryInfo(vo);
	}

	@Override
	public SurgeryInfoVO rertrieveSurgeryInfo(String surgeryInfoKey) {
		return surgeryDAO.selectSurgeryInfo(surgeryInfoKey);
	}

	@Override
	public List<PatientVO> retrieveSurgeryWaitingList() {
		return surgeryDAO.selectSurgeryWaitingList();
	}

}
