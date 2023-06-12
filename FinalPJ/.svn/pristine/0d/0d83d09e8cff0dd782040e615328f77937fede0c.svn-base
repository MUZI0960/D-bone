package kr.or.ddit.radiology.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.MedicalChartVO;
import kr.or.ddit.vo.RadiologyVO;
import kr.or.ddit.vo.WaitingHistoryVO;

public interface RadiologyService {
	/**
	 * x-ray실, MRI실 대기실 환자 조회
	 * @return
	 */
	public List<WaitingHistoryVO> retrieveWaitingList();
	
	/**
	 * 오더 키로 영상학과 기록물 찾기
	 * @param orderKey
	 * @return
	 */
	public RadiologyVO retrieveRadiology(String orderKey);
	
	
	/**
	 * xray 자료 업로드
	 * @param req TODO
	 * @param receiptkey TODO
	 * @return TODO
	 */
	public int createxrayData(MultipartHttpServletRequest req);
	
	
	/**
	 * 파일 조회
	 * @param attGroupNo
	 * @return TODO
	 */
	public List<AttachVO> viewData(int attGroupNo);
	
	
	
	/**
	 * 과거 진료차트 조회(영상촬영물 확인)
	 * @param patientKey
	 * @return
	 */
	public List<MedicalChartVO> retrievePreChartList(String patientKey);
}
