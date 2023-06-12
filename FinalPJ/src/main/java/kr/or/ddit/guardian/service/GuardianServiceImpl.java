package kr.or.ddit.guardian.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.guardian.dao.GuardianDAO;
import kr.or.ddit.vo.GuardianVO;

@Service
public class GuardianServiceImpl implements GuardianService {

	@Autowired
	private GuardianDAO guardianDAO;
	
	@Override
	public int modifyGuardian(GuardianVO guardian) {
		return guardianDAO.updateGuardian(guardian);
	}

}
