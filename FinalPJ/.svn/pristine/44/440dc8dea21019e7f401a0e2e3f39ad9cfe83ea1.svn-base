package kr.or.ddit.reserve.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.reserve.dao.ReserveDAO;
import kr.or.ddit.vo.ReserveVO;

@Service
public class ReserveServiceImpl implements ReserveService {
	@Inject
	private ReserveDAO dao;

	@Override
	public List<ReserveVO> selectReserve() {
		List<ReserveVO> list = dao.selectReserve();
		return list;
	}

	@Override
	public int modifyReserve(ReserveVO vo) {
		int cnt = dao.modifyReserve(vo);
		return cnt;
	}

}
