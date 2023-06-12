package kr.or.ddit.emp.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.Pagination;

public interface EmpService {
	// 사원 추가
	public int insertEmp(MultipartHttpServletRequest req, MultipartFile file);

	/*
	 * // 사원목록 조회 public void empList(Pagination<EmpVO> pagination);
	 */
	public List<EmpVO> selectempList();

	// 사원 상세조회
	public EmpVO selectEmp(String empKey);

	// 사원 수정
	public int updateEmp(MultipartHttpServletRequest req, MultipartFile file);

	// 사원 삭제

	// -----------230506 시큐리티
	// 직원 계정 id 조회 - 시큐리티
	public EmpVO retrieveEmpSecurity(String empId);
	

	/**
	 * 파일 조회
	 * @param attGroupNo
	 * @return TODO
	 */
	public List<AttachVO> viewData(int attGroupNo);
}
