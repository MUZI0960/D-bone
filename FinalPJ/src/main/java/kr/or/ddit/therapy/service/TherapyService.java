package kr.or.ddit.therapy.service;

import java.util.List;

import kr.or.ddit.vo.EquipmentStatusRecordVO;
import kr.or.ddit.vo.MedicalChartVO;
import kr.or.ddit.vo.MedicalEquipmentVO;
import kr.or.ddit.vo.PtEquipmentVO;
import kr.or.ddit.vo.PtRecordVO;
import kr.or.ddit.vo.PtRoomVO;
import kr.or.ddit.vo.ReceiptionVO;

public interface TherapyService {
	
	/**
	 * 물리치료 대기환자 목록
	 * @return List<ReceiptionVO>
	 */
	public List<ReceiptionVO> ptWaitingPatientList(); 
	
	/**
	 * 물리치료기구 상태관리를 위한 목록
	 * @return List<MedicalEquipmentVO>
	 */
	public List<MedicalEquipmentVO> ptEquipmentList();
	
	/**
	 * 물리치료기구 상태
	 * @param buyerKey
	 * @return MedicalEquipmentVO
	 */
	public MedicalEquipmentVO ptEquipmentDetail(int equipmentKey);
	
	/**
	 * 물리치료 상태 기록 목록 조회
	 * @param equipmentKey
	 * @return List<EquipmentStatusRecordVO>
	 */
	public List<EquipmentStatusRecordVO> ptEquipmentStatusList(int equipmentKey);
	
	
	/**
	 * 물리치료기구 상태 점검 입력
	 * @param eqStatusRecVO
	 */
	public void ptEquipmentStatusInsert(EquipmentStatusRecordVO eqStatusRecVO);
	
	
	/**
	 * 치료 진행을 위해 환자 오더에 맞는 물리치료기구 목록
	 * @param patientKey
	 * @return List<MedicalChartVO>
	 */
	public List<MedicalChartVO> ptEquipmentSelectList(String patientKey);
	
	/**
	 * 침상 상태 조회
	 * @param ptBedKey
	 * @return
	 */
	public List<PtRoomVO> ptRoomStatusSelect();
	
	/**
	 * 침상 상태변화
	 * @param ptRoomVO
	 */
	public void ptRoomStatusUpdate(PtRoomVO ptRoomVO);
	
	
	/**
	 * 치료기구 상태변화
	 * @param ptEquipmentVO
	 */
	public void ptEuipmentStatusUpdate(PtEquipmentVO ptEquipmentVO);
	
	
	/**
	 * 치료기록 추가
	 * @param prRecordVO
	 */
	public int ptRecordInsert(PtRecordVO prRecordVO, String receiptKey);
	
	/**
	 * 침상 상태 리스트
	 * @return List<PtRoomVO>
	 */
	public List<PtRoomVO> ptRoomSelectList();
	
	
	
	/**
	 * 침상현황 리스트
	 * @return List<PtRecordVO>
	 */
	public List<PtRecordVO> nowPtBedStatusList();
	
	/**
	 * 액팅 상세
	 * @return PtRecordVO
	 */
	public PtRecordVO actingDetail(String orderKey);
	
	
	/**
	 * 액팅 코멘트 업데이트 + 대기상태 히스토리 업데이트 (병과번호, 대기상태)
	 * @param ptRecordVO
	 */
	public int actingCommentUpdate(PtRecordVO ptRecordVO, String receiptKey);
	
	
	/**
	 * 환자 진료 차트
	 * @param orderKey
	 * @return MedicalChartVO
	 */
	public ReceiptionVO patientChartDetail(String orderKey);
	
	
	/**
	 * 침상 상태 상세 데이터
	 * @param orderKey
	 * @return
	 */
	public PtRecordVO ptBedStatusDetail(String orderKey);
	
	/**
	 * 기구상태 현환을 위한 리스트
	 * @return PtEquipmentVO
	 */
	public List<MedicalEquipmentVO> ptEqStatusList(); 
	
	
	public List<PtEquipmentVO> nowPtEqStatusDetail(int equipmentKey);
	

	
	/**
	 * 기구 상세관리 모달 기구 상태 업데이트 
	 * @param ptEquipmentVO
	 */
	public void ptEqDetailStatusUpdate(PtEquipmentVO ptEquipmentVO);
	
	public void eqDetailStatusUpdate(MedicalEquipmentVO medicalEquipmentVO);
	
}
