package kr.or.ddit.product.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.product.dao.ProductManagementDAO;
import kr.or.ddit.vo.ProductManagementVO;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ProductManagementServiceImpl implements ProductManagementService {
	@Inject
	private ProductManagementDAO dao;

	@Override
	public List<ProductManagementVO> productList() {
		List<ProductManagementVO> productList = dao.productList();
		log.info("약품리스트 확인하기", productList);
		return productList;
	}


	/**
	 * 주문번호 받아와서 약품요청내역 삭제하기
	 * @param key
	 * @return
	 */
	@Override
	public int deleteOrder(List<String> key) {
		int cnt = 0;
		for (String p : key) {
			dao.deleteOrder(p);
			cnt++;
		}
		return cnt;
	}


	/**
	 * 비품요청 번호 받아와서 약품요청내역 삭제하기
	 * @param key
	 * @return
	 */
	@Override
	public int suppliesOrderRecord(List<String> key) {
		int cnt = 0;
		for (String p : key) {
			dao.suppliesOrderRecord(p);
			cnt++;
		}
		return cnt;
	}

}
