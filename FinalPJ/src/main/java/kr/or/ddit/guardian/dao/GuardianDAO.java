package kr.or.ddit.guardian.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.GuardianVO;

@Mapper
public interface GuardianDAO {
	
	// 0510 문수정 ---------------------------------------------------
	/**
	 * 보호자 등록
	 * @param guardian
	 * @return
	 */
	public int insertGuardian(String patientKey);
	
	
	// 0511 문수정 ---------------------------------------------------
	/**
	 * 보호자 정보 수정
	 * @param guardian
	 * @return
	 */
	public int updateGuardian(GuardianVO guardian);
}
