package kr.or.ddit.poi.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.patient.dao.PatientDAO;
import kr.or.ddit.poi.dao.PoiCostInsertDAO;
import kr.or.ddit.vo.PayDetailVO;
import kr.or.ddit.vo.PayVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class PoiCostInsertServiceImpl implements PoiCostInsertService {
	@Inject
	private PoiCostInsertDAO dao;
	
	@Inject
	private PatientDAO pdao;

	/**
	 * 접수페이지에서 POI 파일 다운로드하면 진료확인서 금액 추가하는 메소드
	 * @param receiptKey
	 * @return
	 */
	@Override
	public int insertDocPay(String receiptKey) {
		PayDetailVO payDetail = new PayDetailVO();
		payDetail.setReceiptKey(receiptKey);
		return dao.insertDocPay(payDetail);
		 
	}

	/**
	 * 수납페이지에서 결제가 완료된 사람의 영수증을 POI로 뽑기 위한 메소드
	 * @param payKey 수납이 완료된 해당 환자의 환자키
	 * @return 결제내역
	 */
	@Override
	public PayVO selectReceipt(int payKey) {
		return pdao.selectReceipt(payKey);
	}

}
