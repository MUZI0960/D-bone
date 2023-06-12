package kr.or.ddit.reserve.service;

import java.util.List;

import kr.or.ddit.vo.ReserveVO;

public interface ReserveService {
	// 일정 조회
	public List<ReserveVO> selectReserve();
	
	// 일정 수정
	public int modifyReserve(ReserveVO vo);
}
