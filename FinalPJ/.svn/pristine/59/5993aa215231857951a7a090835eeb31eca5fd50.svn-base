package kr.or.ddit.reservation.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.reservation.dao.ReservationDAO;
import kr.or.ddit.vo.CommonCodeVO;
import kr.or.ddit.vo.WaitingHospitalizationVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ReservationServiceImpl implements ReservationService {
	
	@Inject
	private ReservationDAO reservationDAO;
	
	

	@Override
	public List<WaitingHospitalizationVO> retrieveWaitingPatientList() {
		return reservationDAO.selectWaitingPatientList();
	}

	@Override
	public List<CommonCodeVO> retrieveGradeList() {
		return reservationDAO.selectGradeList();
	}

	@Override
	public int modifyWardGrade(WaitingHospitalizationVO vo) {
		return reservationDAO.updateWardGrade(vo);
	}


}
