package kr.or.ddit.product.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.ProductManagementVO;

@Mapper
public interface ProductManagementDAO {
	/**
	 * 의약품 리스트
	 * @return
	 */
	public List<ProductManagementVO> productList();


	/**
	 * 주문번호 받아와서 약품요청내역 삭제하기
	 * @param key
	 * @return
	 */
	public int deleteOrder(String key);

	/**
	 * 비품요청 번호 받아와서 약품요청내역 삭제하기
	 * @param key
	 * @return
	 */
	public int suppliesOrderRecord (String key);
}
