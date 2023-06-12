package kr.or.ddit.reservation.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.CommonCodeVO;
import kr.or.ddit.vo.PatientVO;
import kr.or.ddit.vo.WaitingHospitalizationVO;

@Mapper
public interface ReservationDAO {
	
	public List<WaitingHospitalizationVO> selectWaitingPatientList();
	
	public List<CommonCodeVO> selectGradeList();
	
	public int updateWardGrade(WaitingHospitalizationVO vo);
	
	public int updateReservationStatus(String waitingKey);

}
