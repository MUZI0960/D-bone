package kr.or.ddit.reserve.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.ReserveVO;

@Mapper
public interface ReserveDAO {
	// 일정 조회
	public List<ReserveVO> selectReserve();
	
	// 일정 수정
	public int modifyReserve(ReserveVO vo);
}
