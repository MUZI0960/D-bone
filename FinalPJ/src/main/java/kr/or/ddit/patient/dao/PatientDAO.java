package kr.or.ddit.patient.dao;

import java.util.List;

import kr.or.ddit.vo.ReceiptionVO;
import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.PatientVO;
import kr.or.ddit.vo.PayVO;

@Mapper
public interface PatientDAO {
	
	//0503 문수정-------------------------------------------------------
	/**
	 * 환자리스트 목록 조회
	 * @return
	 */
	public List<PatientVO> selectPatientList();
	
	//0504 문수정-------------------------------------------------------
	/**
	 * 환자 상세 조회
	 * @param patientKey
	 * @return
	 */
	public PatientVO selectPatient(String patientKey); 
	
	//0503 문수정-------------------------------------------------------
	/**
	 * 환자 신규 등록
	 * @param patient
	 * @return >= 0 , 성공
	 */
	public int insertPatient(PatientVO patient);
	
	//0504 문수정-------------------------------------------------------
	/**
	 * 환자 수정 
	 * @param patient
	 * @return
	 */
	public int updatePatient(PatientVO patient);



	// 정민 쿼리-------------------------------------------------------

	/**
	 * 접수 완료 후에 진료대기환자 조회하기
	 * @return
	 */
	public List<ReceiptionVO> selectReceipMember();

	/**
	 * 환자 상세 정보 조회 
	 * @param patientKey
	 * @return
	 */
	public PatientVO selectPatientDetail(String patientKey);


	// 정민 쿼리-------------------------------------------------------
	/**
	 * 수납을 하기 위해 대기중인 환자 목록 조회하기
	 * @return
	 */
	public List<PatientVO> selectPayWaiting();
	
	
	// 정민 쿼리-------------------------------------------------------
	/**
	 * 수납이 완료된 환자들 진료확인서를 출력하기 위해 만든 쿼리
	 */
	public List<PatientVO> completePayment();
	
	
	// 정민 쿼리-------------------------------------------------------
	/**
	 * 	환자 진료끝난 후에 진료차트 POI로 출력하기
	 */
	public PatientVO selectMedicalCertificate(String patientKey);
	
	
	// 정민 쿼리-------------------------------------------------------
	/**
	 * 진료차트가 null 이 아닌 진료확인서를 출력하기 위해 뽑는 환자 리스트
	 */
	public List<PatientVO> selectJinRyoChartList();

	// 유림 수납 대기 목록 
	public List<PayVO> selectPayWaitingList();


	/**
	 * 수납이 완료된 환자들을 대상으로 방문수와 병원 매출액을 뽑기 위한 메서드
	 * @author 정민
	 * @return
	 */
	public List<PatientVO> selectStatisticsList();
	
	
	
	/**
	 * 수납페이지에서 결제가 완료된 사람의 영수증을 POI로 뽑기 위한 메소드
	 * @param payKey 수납이 완료된 해당 환자의 환자키
	 * @return 결제내역
	 */
	public PayVO selectReceipt(int payKey);
}