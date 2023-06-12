package kr.or.ddit.preDiagnosis.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.PreDiagnosisVO;

@Mapper
public interface PreDiagnosisDAO {

	// 0507 문수정-------------------------------------------------------
	/**
	 * 예진표 등록
	 * @param diagnosis
	 * @return
	 */
	public int insertPreDiagnosis(String patientKey);
	
	// 0508 문수정-------------------------------------------------------
	/**
	 * 예진표 상세보기
	 * @param patientKey
	 * @return
	 */
	public PreDiagnosisVO selectPreDiagnosis(String patient);
	
	// 0510 문수정-------------------------------------------------------
	/**
	 * 예진표 수정
	 * @param patientKey
	 * @return
	 */
	public int updatePreDiagnosis(PreDiagnosisVO diagnosis);
}
