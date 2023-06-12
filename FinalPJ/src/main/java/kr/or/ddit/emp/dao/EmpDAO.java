package kr.or.ddit.emp.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.EmpVOWrapper;
import kr.or.ddit.vo.Pagination;

@Mapper
public interface EmpDAO extends UserDetailsService {
	// 회원 추가
	public int insertEmp(EmpVO vo);
	
	// 회원목록 조회
//	public List<EmpVO> empList(Pagination<EmpVO> pagination);
//	public int selectTotalRecord(Pagination<EmpVO> pagination);
	public List<EmpVO> selectempList();

	// 회원 한명 조회
	public EmpVO selectEmp(String empKey);
	
	// 회원 수정
	public int updateEmp(EmpVO vo);
	
	// 회원 삭제
	
	//------------------------------------
	// 직원  계정 id 조회 - 시큐리티
	public EmpVO selectEmpSecurity(String empId);
	
	@Override
	default UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		EmpVO emp = selectEmpSecurity(username);
		switch (emp.getEmpJob()) {
		case "J001": emp.setEmpRole("ROLE_ADMIN"); break; // 원무과
		case "J002": emp.setEmpRole("ROLE_DOCTOR"); break; //의사
		case "J003": emp.setEmpRole("ROLE_NUS"); break; //간호사
		case "J004": emp.setEmpRole("ROLE_MT"); break; // 물리치료사
		case "J005": emp.setEmpRole("ROLE_PT"); break; // 도수
		case "J006": emp.setEmpRole("ROLE_RAD"); break; // 영상
		case "MASTER": emp.setEmpRole("ROLE_MASTER"); break;
		}
		return new EmpVOWrapper(emp);
	}
}