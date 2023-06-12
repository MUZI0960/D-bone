package kr.or.ddit.mTherapy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.MtRecordVO;
import kr.or.ddit.vo.PayDetailVO;
import kr.or.ddit.vo.ReceiptionVO;

@Mapper
public interface MTherapyDAO {

	/**
	 * 도수치료 대기환자조회
	 * @return List<ReceiptionVO>
	 */
	public List<ReceiptionVO> mtWaitingPatientList();
	
	
	/**
	 * 환자 진료 차트
	 * @param patientKey
	 * @return ReceiptionVO
	 */
	public ReceiptionVO patientChartDetail(String orderKey);
	
	
	/**
	 * 도수치료 기록 추가
	 * @param mtRecordVO
	 * @return int
	 */
	public int mtRecordInsert(MtRecordVO mtRecordVO);
	
	
	/**
	 * 도수치료 평가 업데이트 
	 * @param mtRecordVO
	 * @return int
	 */
	public int mtRecordAssessUpdate(MtRecordVO mtRecordVO);
	
	/**
	 * 치료 진행 시 환자정보 조회
	 * @param orderKey
	 * @return ReceiptionVO
	 */
	public ReceiptionVO mtStartPatientInfoDetail(String orderKey);
	
	
	/**
	 * 기록지에 평가 업데이트 
	 * @param mtRecordVO
	 * @return int
	 */
	public int mtAssessmentUpdate(MtRecordVO mtRecordVO);
	
	
	/**
	 * 기록지에 SOAP 업데이트
	 * @param mtRecordVO
	 * @return int
	 */
	public int mtPlanUpdate(MtRecordVO mtRecordVO);
	
	
	/**
	 * 기록지에 comment 업데이트
	 * @param mtRecordVO
	 * @return int
	 */
	public int mtCommentUpdate(MtRecordVO mtRecordVO);
	
	/**
	 * 대기상태 업데이트
	 * @param waiting
	 * @return int
	 */
	public int mtHistoryUpdate(String receiptKey);

	
	/**
	 * 치료 완료 후 오더에 도수가 없다면 수납대기로 대기상태 변경
	 * @param receiptKey
	 * @return int
	 */
	public int waitingLocationUpdateToRE(String receiptKey);
	
	
	/**
	 * 도수 치료 기능 그래프 위한 데이터 리스트
	 * @param patientKey
	 * @return List<MtRecordVO>
	 */
	public List<MtRecordVO> mtChartDataList(String patientKey);
	
	
	/**
	 * 환자의 지난 도수치료 기록 리스트 
	 * @param patientKey
	 * @return List<MtRecordVO>
	 */
	public List<MtRecordVO> mtRecHistoryList(String patientKey);
	
	
	/**
	 * 도수치료 종료 시 수납 상세 내역 추가
	 * @param payDetailVO
	 * @return int
	 */
	public int mtPayDetailInsert(PayDetailVO payDetail);
	
}
