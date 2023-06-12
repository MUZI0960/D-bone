package kr.or.ddit.preDiagnosis.service;

import kr.or.ddit.vo.PreDiagnosisVO;

public interface PreDiagnosisService {
	
	// 0508 문수정 ----------------------------------------------
	/**
	 * 예진표 상세 조회
	 * @param patientKey
	 * @return
	 */
	public PreDiagnosisVO retrievePreDiagnosis(String patientKey);
	
	// 0510 문수정 ----------------------------------------------
	/**
	 * 예진표 수정
	 * @param diagnosis
	 * @return
	 */
	public int modifyPreDiagnosis(PreDiagnosisVO diagnosis);
}
