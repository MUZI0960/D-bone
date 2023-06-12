package kr.or.ddit.pay.service;

import java.util.List;

import kr.or.ddit.vo.PayDetailVO;
import kr.or.ddit.vo.PayVO;

public interface PayService {
	public List<PayVO> selectPayWaitingList();
	
	public List<PayDetailVO> retrievePayDetailList(String payKey);

	public int modifyPayStatus(PayVO vo);
}
