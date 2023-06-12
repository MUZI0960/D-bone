package kr.or.ddit.reservation.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.CommonCodeVO;
import kr.or.ddit.vo.WaitingHospitalizationVO;

public interface ReservationService {
	
	public List<WaitingHospitalizationVO> retrieveWaitingPatientList();
	
	public List<CommonCodeVO> retrieveGradeList();
	
	public int modifyWardGrade(WaitingHospitalizationVO vo);

}
