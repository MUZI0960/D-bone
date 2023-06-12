package kr.or.ddit.radiology.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.MedicalChartVO;
import kr.or.ddit.vo.RadiologyVO;
import kr.or.ddit.vo.WaitingHistoryVO;

@Mapper
public interface RadiologyDAO {
	
	/**
	 * x-ray실, MRI실 대기실 환자 조회
	 * @return
	 */
	public List<WaitingHistoryVO> selectWaitingList();
	
	/**
	 * 과거 진료차트 조회(영상촬영물 확인)
	 * @param patientKey
	 * @return
	 */
	public List<MedicalChartVO> selectPreChartList(String patientKey);
	
	/**
	 * 오더 키로 찾기
	 * @param orderKey
	 * @return
	 */
	public RadiologyVO selectRadiology(String orderKey);
	
	
	/**
	 * xRay 자료 등록
	 * @param radiology
	 * @return
	 */
	public int insertXrayRadiology(RadiologyVO radiology);
	
	/**
	 * 영상 자료 등록 후 대기상태 변경 대기중 -> 진료 히스토리 insert
	 * @param receiptkey
	 */
	public int updateWaitingStatus(String receiptkey);
	
	
	/**
	 * 접수번호로 영상자료 확인
	 * @param receiptKey (xray나 MRI)
	 * @return
	 */
	public List<RadiologyVO> selectRadData(String receiptKey);
	
	
	/**
	 * 차트번호로 영상자료 확인
	 * @param chartKey
	 * @return
	 */
	public List<RadiologyVO> selectRadDataForChartKey(String chartKey);
}
