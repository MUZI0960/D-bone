package kr.or.ddit.patient.service;

import java.util.List;

import kr.or.ddit.vo.PatientVO;
import kr.or.ddit.vo.PayVO;
import kr.or.ddit.vo.ReceiptionVO;

public interface PatientService {
	
	//0503 문수정-------------------------------------------------------
	/**
	 * 환자 목록 조회
	 * @return
	 */
	public List<PatientVO> retrievePatientList();
	
	//0504 문수정-------------------------------------------------------
	/**
	 * 환자 1명 상세 조회
	 * @param patientKey
	 * @return
	 */
	public PatientVO retrievePatient(String patientKey);
	
	//0503 문수정-------------------------------------------------------
	/**
	 * 신규 환자 등록
	 * @param patient
	 */
	public int createPatient(PatientVO patient);
	
	
	//0504 문수정-------------------------------------------------------
	/**
	 * 환자 정보 수정
	 * @param patient
	 */
	public int modifyPatient(PatientVO patient);


	// 정민 -------------------------------------------------------

	/**
	 * 접수 완료 후에 진료대기환자 조회하기
	 * @return
	 */
	public List<ReceiptionVO>  selectReceipMember();

	/**
	 * 환자 상세 정보 조회 
	 * @param patientKey
	 * @return
	 */
	public PatientVO retrievePatientDetail(String patientKey);
	

	// 정민 -------------------------------------------------------	
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

	public List<PayVO> selectPayWaitingList();

	/**
	 * 방문한 환자의 수만 출력하기 위한 메소드
	 * @author 정민
	 * @return 리스트의 수로 월별 방문자수 구하기 [10명, 20명, 30명, 22명, 9명, 17명]
	 * 이런식으로 1월~6월까지의 수를 리스트로 넣어 반환하기
	 */
	public List selectPatientStatistics();


	/**
	 * 수납이 완료된 금액을 월별로 출력하기 [10만원, 20만원 15만원, 32만원, 27만원, 24만원]
	 * @return
	 */
	public List selectSales();

}
