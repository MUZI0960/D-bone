package kr.or.ddit.medicalChart.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.CommonCodeVO;
import kr.or.ddit.vo.DiseaseVO;
import kr.or.ddit.vo.GroupOrderVO;
import kr.or.ddit.vo.MedicalChartVO;
import kr.or.ddit.vo.MedicalEquipmentVO;
import kr.or.ddit.vo.PreDiagnosisVO;
import kr.or.ddit.vo.ReceiptionVO;
import kr.or.ddit.vo.SurgeryKindVO;
import kr.or.ddit.vo.WaitingHistoryVO;

public interface MedicalChartService {
	//230503 이혜연------------------------------------------
	/**
	 * 수술 종류 리스트 불러오기
	 * @return list
	 */
	public List<SurgeryKindVO> retrieveSurgeryKindList();
	
	
	//230504 이혜연------------------------------------------
	/**
	 * 전체 질병 코드 불러오기
	 * @return list
	 */
	public List<DiseaseVO> retrieveDiseaseAllList();
	
	/**
	 * 환자 과거 차트 조회
	 * @param patientKey
	 * @return
	 */
	public List<MedicalChartVO> retrieveMedicalChartList(String patientKey);
	
//	230507 물리치료 장비 목록 조회
	/**
	 * 230506 대기실 환자 목록 조회
	 * @return
	 */
	public List<MedicalEquipmentVO> retrieveMedicalEquipmentList();
	
	//230507 치료부위 목록
	/**
	 * 치료 신체부위
	 * @return
	 */
	public List<CommonCodeVO> retrieveBodyPartList();
	
	//230510 진료실 대기 목록
	/**
	 * 진료실 기준 대기 목록 조회
	 * @param officeKey
	 * @return
	 */
	public List<WaitingHistoryVO> retrieveWaitingList(String officeKey);
	
	//230512 차트 생성
	/**
	 * 대기환자 호출시 차트번호 생성
	 * @return
	 */
	public String createChartNo();
	
	/**
	 * 차트 생성
	 * @param inputMap
	 * @return
	 */
	public int insertMchartdata(Map<String, Object> inputMap); 
	
	/**
	 * 그룹오더 신규 등록
	 * @param groupOder
	 * @return
	 */
	public int createGroupOrder(GroupOrderVO groupOder);
	
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
	 * 그룹오더 리스트 목록 출력
	 * @param empKey TODO
	 * @return
	 */
	public List<GroupOrderVO> getGroupOrderList(String empKey);


	/**
	 * 오더키로 해당 차트 조회하기 
	 * @param orderKey
	 * @return
	 */
	public MedicalChartVO retrieveMedicalChartByOrderKey(String orderKey);
}
