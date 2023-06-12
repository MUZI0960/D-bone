package kr.or.ddit.product.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.product.dao.ProductOrderRecordDAO;
import kr.or.ddit.vo.ProductOrderRecordVO;

@Service
public class ProductOrderRecordServiceImpl implements ProductOrderRecordService {
	@Inject
	private ProductOrderRecordDAO dao;

	@Override // 발주기록 조회하기
	public List<ProductOrderRecordVO> porList() {
		List<ProductOrderRecordVO> list = dao.porList();
		return list;
	}

	@Override
	public int insertPor(List<ProductOrderRecordVO> list) {
		int cnt = 0;
		String orderRequestNo = dao.getOrderRequestNo();
		for (ProductOrderRecordVO vo : list) {
			vo.setOrderRequestNo(orderRequestNo);
			cnt = dao.insertPor(vo);
		}
		return cnt;
	}


}
