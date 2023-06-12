package kr.or.ddit.pay.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.pay.dao.PayDAO;
import kr.or.ddit.receipt.dao.ReceiptDAO;
import kr.or.ddit.vo.PayDetailVO;
import kr.or.ddit.vo.PayVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 수납내역, 수납 상세내역 관리
 * 
 * @author dlgpd
 *
 */
@Slf4j
@Service
public class PayServiceImpl implements PayService {
	@Inject
	private PayDAO payDAO;
	
	@Inject
	private ReceiptDAO receiptDAO;

	@Override
	public List<PayVO> selectPayWaitingList() {
		return payDAO.selectpayWaitingList();
	}

	@Override
	public List<PayDetailVO> retrievePayDetailList(String payKey) {

		return payDAO.selectPayDetailList(payKey);
	}

	@Override
	public int modifyPayStatus(PayVO vo) {

		int result = 0;
		result += payDAO.updatePayStatus(vo);
		if (vo.getReceiptKey() != null) {
			result += receiptDAO.updateReceiptStatus(vo.getReceiptKey());
		}
		return result;
	}

}
