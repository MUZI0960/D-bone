package kr.or.ddit.poi.service;

import kr.or.ddit.vo.PayVO;

public interface PoiCostInsertService {
	/**
	 * 접수페이지에서 POI 파일 다운로드하면 진료확인서 금액 추가하는 메소드
	 * @param receiptKey
	 * @return
	 */
	public int insertDocPay(String receiptKey);
	
	
	/**
	 * 수납페이지에서 결제가 완료된 사람의 영수증을 POI로 뽑기 위한 메소드
	 * @param payKey 수납이 완료된 해당 환자의 환자키
	 * @return 결제내역
	 */
	public PayVO selectReceipt(int payKey);
}
