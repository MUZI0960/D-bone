package kr.or.ddit.product.dao;

import kr.or.ddit.vo.ProductOrderRecordVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ProductOrderRecordDAO {
	// 주문목록 조회
    public List<ProductOrderRecordVO> porList();
    public int insertPor(ProductOrderRecordVO vo);
    
    // 시퀀스는 증가하고 주문번호는 증가하지 않기 위해 selectKey로 미리 생성해주기
    public String getOrderRequestNo();
}
