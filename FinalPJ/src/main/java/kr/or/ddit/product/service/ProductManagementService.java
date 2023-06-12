package kr.or.ddit.product.service;

import java.util.List;

import kr.or.ddit.vo.ProductManagementVO;

public interface ProductManagementService {
	/**
	 * 의약품 리스트 출력만하기
	 * @return
	 */
	public List<ProductManagementVO> productList();

	/**
	 * 주문번호 받아와서 약품요청내역 삭제하기
	 * @param key
	 * @return
	 */
	public int deleteOrder(List<String> key);

	/**
	 * 비품요청 번호 받아와서 약품요청내역 삭제하기
	 * @param key
	 * @return
	 */
	public int suppliesOrderRecord(List<String> key);
}
