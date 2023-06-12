package kr.or.ddit.medicalChart.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.CommonCodeVO;
import kr.or.ddit.vo.DiagnosisVO;
import kr.or.ddit.vo.DiseaseVO;
import kr.or.ddit.vo.GroupOrderPrescritionVO;
import kr.or.ddit.vo.GroupOrderVO;
import kr.or.ddit.vo.MedicalChartVO;
import kr.or.ddit.vo.MedicalEquipmentVO;
import kr.or.ddit.vo.OrderHistoryVO;
import kr.or.ddit.vo.PreDiagnosisVO;
import kr.or.ddit.vo.PrescriptionVO;
import kr.or.ddit.vo.RadiologyVO;
import kr.or.ddit.vo.ReceiptionVO;
import kr.or.ddit.vo.SurgeryKindVO;
import kr.or.ddit.vo.WaitingHistoryVO;

@Mapper
public interface MedicalChartDAO {
	//230503 이혜연------------------------------------------
	/**
	 * 수술 종류 리스트 불러오기
	 * @return list
	 */
	public List<SurgeryKindVO> selectSurgeryKindList();
	
	
	//230504 이혜연------------------------------------------
	
	/**
	 * 전체 질병 코드 불러오기
	 * @return list
	 */
	public List<DiseaseVO> selectDiseaseAllList();
	
	
	/**
	 * 환자 과거 차트 조회
	 * @param patientKey
	 * @return
	 */
	public List<MedicalChartVO> selectMedicalChartList(String patientKey);
	
//	230507 물리치료 장비 목록 조회
	/**
	 * 230506 대기실 환자 목록 조회
	 * @return
	 */
	public List<MedicalEquipmentVO> selectMedicalEquipmentList();
	
	
	//230507 치료부위 목록
	/**
	 * 치료 신체부위
	 * @return
	 */
	public List<CommonCodeVO> selectBodyPartList();
	
	//230510 치료부위 목록
	/**
	 * 진료실 기준 대기 목록 조회
	 * @param officeKey
	 * @return
	 */
	public List<WaitingHistoryVO> selectWaitingList(String officeKey);
	
	//230512 차트 생성
	/**
	 * 대기환자 호출시 차트번호 생성(selectMaxNum)
	 * @return
	 */
	public String createChartNo();
	
	// 오더 내역 생성하는 dao 받는 키는 오더 번호를 리턴 받도록
	/**
	 * @param orderHistory
	 * @return
	 */
	public int insertOrderHistory(OrderHistoryVO orderHistory);
	
	// 처방 내역 생성
	/**
	 * 처방 리스트 생성
	 * @param prescription
	 * @return
	 */
	public int insertPrescription(PrescriptionVO prescription);
	
	// 진단내역 입력
	/**
	 * @param diagnosis
	 * @return
	 */
	public int insertDiagnosis(DiagnosisVO diagnosis);
	// 최종 작성내용 update
	/**
	 * 최종 진료차트 작성
	 * @param mChart
	 * @return
	 */
	public int insertMChart(MedicalChartVO mChart);
	
	/**
	 * 재진료시 차트 업데이트 ex - 진단 코멘트
	 * @param medicalChartVO
	 * @return
	 */
	public int updateMChart(MedicalChartVO medicalChartVO);
	
	/**
	 * 환자 대기상태 변경(대기상태 히스토리 insert)
	 * @param waiting
	 * @return
	 */
	public int updateWaitingStatus(WaitingHistoryVO waiting);
	
	/**
	 * 차트번호로 접수키 찾기
	 * @param chartKey
	 * @return receptKey
	 */
	public String selectReceipKey(String chartKey);
	
	/**
	 * 해당 차트번호의 엑스레이 오더 내용이 있다면.
	 * @param chartKey
	 * @return
	 */
	public int selectCountXrayOrder(String chartKey);
	/**
	 * 해당 차트번호의 MRI 오더 내용이 있다면.
	 * @param chartKey
	 * @return
	 */
	public int selectCountMRIOrder(String chartKey);
	
	
	/**
	 * 수술 오더시 입원 등록
	 * @param chartKey TODO
	 * @return
	 */
	public int insertWaitingHospitalzation(String chartKey);
	
	/**
	 * 재진환자의 오더 내용이 변동될경우 등록
	 * @param order
	 * @return
	 */
	public int updateOrderHistory(OrderHistoryVO order);
	
	/**
	 * 그룹오더 신규 등록
	 * @param groupOder
	 * @return
	 */
	public int insertGroupOrder(GroupOrderVO groupOder);
	
	/**
	 * 그룹오더 수정
	 * @param groupOder
	 * @return
	 */
	public int updateGroupOrder(GroupOrderVO groupOder);
	
	/**
	 * 그룹오더 삭제
	 * @param groupOrderKey
	 * @return
	 */
	public int deleteGroupOrder(int groupOrderKey);
	
	/**
	 * 그룹오더 키에 의한 약품 목록 전체 삭제
	 * @param groupOrderKey
	 * @return
	 */
	public int deleteGroupOrderPrescriptTotal(int groupOrderKey);
	
	/**
	 * 그룹오더 약품 목록 등록
	 * @param groupOrderPrescrition
	 * @return
	 */
	public int insertGroupOrderPrescript(GroupOrderPrescritionVO groupOrderPrescrition);
	
	/**
	 * 그룹오더 약품 수정
	 * @param groupOrderPrescrition
	 * @return
	 */
	public int updateGroupOrderPrescript(GroupOrderPrescritionVO groupOrderPrescrition);
	
	/**
	 * 그룹오더 약품 삭제
	 * @param goPrescriptkey
	 * @return
	 */
	public int deleteGroupOrderPrescript(String goPrescriptkey);
	
	/**
	 * 그룹오더 리스트 목록 출력
	 * @param empKey TODO
	 * @return
	 */
	public List<GroupOrderVO> getGroupOrderList(String empKey);
	
	//-----------------------------촬영업무 후 재진료시 진료코드 변경사항 update
	public int updateDiagnosis(DiagnosisVO diagnosis);
//	public int deleteDiagnosis(String diagnosisKey);
	
	//----------------------------------------------------
	
	public int updatePrescription(PrescriptionVO prescriptionVO);
	public int deletePrescription(String prescriptionKey);
	//-------------------------------------------------------
	public int deleteOrderHistory(String orderKey);

	
	
	/**
	 * 오더 정보로 차트 찾기 (유림) 
	 * @param orderKey
	 * @return
	 */
	public MedicalChartVO selectMedicalChartByOrderKey(String orderKey);
	
	//-----------------------------------------------------------
	
	/**
	 * 접수완료 상태인지 확인하기
	 * @param receiptKey
	 * @return
	 */
	public String selectReceiptstatus(String receiptKey);


	/**
	 * 처방 번호로 처방 내역 찾기
	 * @param prescriptionKey
	 * @return
	 */
	public PrescriptionVO selectprescrition(String prescriptionKey);
	
	/**
	 * 차트번호로 진단내역 있는지 확인
	 * @param chartKey
	 * @return
	 */
	public DiagnosisVO selectDiagnosis(String chartKey);
	

}
