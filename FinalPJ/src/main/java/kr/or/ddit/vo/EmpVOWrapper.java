package kr.or.ddit.vo;

import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class EmpVOWrapper extends User{

	private EmpVO empUser;
	
	public EmpVOWrapper(EmpVO empUser) {
		super(empUser.getEmpId(), empUser.getEmpPass(), AuthorityUtils.createAuthorityList(empUser.getEmpRole()));
		
		if (empUser != null) {
			switch (empUser.getEmpJob()) {
			case "J001": empUser.setEmpRole("ROLE_ADMIN"); break; // 원무과
			case "J002": empUser.setEmpRole("ROLE_DOCTOR"); break; //의사
			case "J003": empUser.setEmpRole("ROLE_NUS"); break; //간호사
			case "J004": empUser.setEmpRole("ROLE_MT"); break; // 물리치료사
			case "J005": empUser.setEmpRole("ROLE_PT"); break; // 도수
			case "J006": empUser.setEmpRole("ROLE_RAD"); break; // 영상
			case "MASTER": empUser.setEmpRole("ROLE_MASTER"); break;
			}
			
			this.empUser = empUser;
		}
	}
	
	public EmpVO getRealUser() {
		return empUser;
	}
	
}
