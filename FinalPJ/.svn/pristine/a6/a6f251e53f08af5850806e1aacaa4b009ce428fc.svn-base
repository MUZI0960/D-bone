package kr.or.ddit.therapy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.EquipmentStatusRecordVO;
import kr.or.ddit.vo.MedicalChartVO;
import kr.or.ddit.vo.MedicalEquipmentVO;
import kr.or.ddit.vo.OrderHistoryVO;
import kr.or.ddit.vo.PayDetailVO;
import kr.or.ddit.vo.PtEquipmentVO;
import kr.or.ddit.vo.PtRecordVO;
import kr.or.ddit.vo.PtRoomVO;
import kr.or.ddit.vo.ReceiptionVO;

@Mapper
public interface TherapyDAO {
	
	/**
	 * 물리치료 대기환자 목록
	 * @return
	 */
	public List<ReceiptionVO> ptWaitingPatientList();
	
	/**
	 * 물리치료기구 상태관리를 위한 목록
	 * @return
	 */
	public List<MedicalEquipmentVO> ptEquipmentList();
	
	/**
	 * 물리치료기구 상세조회
	 * @param buyerKey
	 * @return
	 */
	public MedicalEquipmentVO ptEquipmentDetail(int equipmentKey);
	
	/**
	 * 물리치료기구 상태기록 목록
	 * @param equipmentKey
	 * @return List<EquipmentStatusRecordVO>
	 */
	public List<EquipmentStatusRecordVO> ptEquipmentStatusList(int equipmentKey);
	
	/**
	 * 물리치료기구 상태 점검 입력
	 * @param eqStatusRec
	 */
	public int ptEquipmentStatusInsert(EquipmentStatusRecordVO eqStatusRec);
	
	
	/**
	 * 치료 진행을 위해 환자 오더에 맞는 물리치료기구 목록
	 * @param patientKey
	 * @return List<MedicalChartVO>
	 */
	public List<MedicalChartVO> ptEquipmentSelectList(String patientKey);
	
	
	/**
	 * 침상 상태 조회
	 * @param ptBedKey
	 * @return PtRoomVO
	 */
	public List<PtRoomVO> ptRoomStatusSelect(); 
	
	/**
	 * 침상 상태 업데이트 
	 * @param ptBedKey
	 * @return int
	 */
	public int ptRoomStatusUpdate(PtRoomVO ptRoomVO);
	
	/**
	 * 치료기구 상태 업데이트
	 * @param ptEquipmentCode
	 * @return int
	 */
	public int ptEuipmentStatusUpdate(PtEquipmentVO ptEquipmentVO);
	
	/**
	 * 치료 기록 추가
	 * @param ptRecordVO
	 * @return int
	 */
	public int ptRecordInsert(PtRecordVO ptRecordVO); 
	
	
	/**
	 * 침상 상태 리스트
	 * @return List<PtRoomVO>
	 */
	public List<PtRoomVO> ptRoomSelectList();
	
	
	/**
	 * 침상 현황 리스트
	 * @return List<PtRecordVO>
	 */
	public List<PtRecordVO> nowPtBedStatusList();
	
	
	/**
	 * 액팅 상세
	 * @return PtRecordVO
	 */
	public PtRecordVO actingDetail(String orderKey);
	
	/**
	 * 액팅 코멘트 추가
	 * @param ptRecordVO
	 * @return int
	 */
	public int actingCommentUpdate(PtRecordVO ptRecordVO);
	
	
	/**
	 * 환자 진료 차트
	 * @param orderKey
	 * @return MedicalChartVO
	 */
	public ReceiptionVO patientChartDetail(String orderKey);
	
	
	/**
	 * 대기상태 업데이트
	 * @param waiting
	 * @return int
	 */
	public int ptHistoryUpdate(String receiptKey);
	
	/**
	 * 침상번호에 따른 치료 상세
	 * @param orderKey
	 * @return MedicalChartVO
	 */
	public PtRecordVO ptBedStatusDetail(String orderKey);
	
	
	/**
	 * 치료 완료 후 오더에 도수가 없다면 수납대기로 대기상태 변경
	 * @param receiptKey
	 * @return int
	 */
	public int waitingLocationUpdateToRE(String receiptKey);	
	
	/**
	 * 치료 완료 후 오더에 도수가 있다면 도수대기로 대기상태 변경
	 * @param receiptKey
	 * @return int
	 */
	public int waitingLocationUpdateToMT(String receiptKey);
	
	
	/**
	 * 접수번호에 따른 오더목록 조회
	 * @param receiptKey
	 * @return List<OrderHistoryVO>
	 */
	public List<OrderHistoryVO> orderKindSelectList(String receiptKey);
	
	
	/**
	 * 치료기구 상태 현황 조회를 위한 리스트
	 * @return List<PtEquipmentVO>
	 */
	public List<MedicalEquipmentVO> ptEqStatusList();
	
	
	/**
	 * 현재 물리치료 기구 상태 현황 조회 위해서
	 * @param equipmentKey
	 * @return List<PtEquipmentVO>
	 */
	public List<PtEquipmentVO> nowPtEqStatusDetail(int equipmentKey);
	
	
	/**
	 * 상세관리 모달 치료기구상태 업데이트
	 * @param ptEquipmentVO
	 * @return int
	 */
	public int ptEqDetailStatusUpdate(PtEquipmentVO ptEquipmentVO);
	
	
	/**
	 * 상세관리 모달 치료기구상태 업데이트
	 * @param medicalEquipmentVO
	 * @return int
	 */
	public int eqDetailStatusUpdate(MedicalEquipmentVO medicalEquipmentVO);
	
	
	/**
	 * 물리치료 종료 시 수납 상세 내역 추가
	 * @param payDetailVO
	 * @return int
	 */
	public int ptPayDetailInsert(PayDetailVO payDetail);
	
}
