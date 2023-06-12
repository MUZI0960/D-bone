package kr.or.ddit.mTherapy.service;

import java.util.List;

import kr.or.ddit.vo.MtRecordVO;
import kr.or.ddit.vo.ReceiptionVO;

public interface MTherapyService {

	/**
	 * 도수치료 대기환자조회
	 * @return List<ReceiptionVO>
	 */
	public List<ReceiptionVO> mtWaitingPatientList();
	
	/**
	 * 환자 진료 차트
	 * @param orderKey
	 * @return MedicalChartVO
	 */
	public ReceiptionVO patientChartDetail(String orderKey);
	
	/**
	 * 도수치료 기록 추가
	 * @param mtRecordVO
	 */
	public int mtRecordInsert(MtRecordVO mtRecordVO, String receiptKey);
	
	/**
	 * 도수치료 평가 업데이트 
	 * @param mtRecordVO
	 */
	public void mtRecordAssessUpdate(MtRecordVO mtRecordVO);
	
	
	/**
	 * 도수치료 치료진행 시 환자 상세정보
	 * @param orderKey
	 * @return ReceiptionVO
	 */
	public ReceiptionVO mtStartPatientInfoDetail(String orderKey);
	
	
	/**
	 * 도수치료 평가 업데이트
	 * @param mtRecordVO
	 */
	public void mtAssessmentUpdate(MtRecordVO mtRecordVO);
	
	
	/**
	 * 도수치료 SOAP 업데이트
	 * @param mtRecordVO
	 */
	public void mtPlanUpdate(MtRecordVO mtRecordVO);
	
	
	/**
	 * 도수치료 comment 업데이트 + 대기상태 히스토리 업데이트
	 * @param mtRecordVO
	 */
	public int mtCommentUpdate(MtRecordVO mtRecordVO, String receiptKey);
	
	
	/**
	 * 도수치료 그래프 위한 데이터 리스트 
	 * @param patientKey
	 * @return List<MtRecordVO>
	 */
	public List<MtRecordVO> mtChartDataList(String patientKey);
	
	
	/**
	 * 도수치료 지난 히스토리 릭스트
	 * @param patientKey
	 * @return List<MtRecordVO>
	 */
	public List<MtRecordVO> mtRecHistoryList(String patientKey);
	
	
}
