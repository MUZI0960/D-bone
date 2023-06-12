package kr.or.ddit.preDiagnosis.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.preDiagnosis.dao.PreDiagnosisDAO;
import kr.or.ddit.vo.PreDiagnosisVO;

@Service
public class PreDiagnosisServiceImpl implements PreDiagnosisService {
	
	@Autowired
	private PreDiagnosisDAO diagnosisDAO;
	

	// 0508 문수정 -------------------------------------------------
	/**
	 * 예진표 상세조회
	 */
	@Override
	public PreDiagnosisVO retrievePreDiagnosis(String patientKey) {
		return diagnosisDAO.selectPreDiagnosis(patientKey);
	}


	// 0510 문수정 -------------------------------------------------
	/**
	 * 예진표 수정
	 */
	@Override
	public int modifyPreDiagnosis(PreDiagnosisVO diagnosis) {
		return diagnosisDAO.updatePreDiagnosis(diagnosis);
	}

}
