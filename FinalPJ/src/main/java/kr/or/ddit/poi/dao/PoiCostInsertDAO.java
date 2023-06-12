package kr.or.ddit.poi.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.PayDetailVO;

@Mapper
public interface PoiCostInsertDAO {
	/**
	 * 접수페이지에서 POI 파일 다운로드하면 진료확인서 금액 추가하는 메소드
	 * @param receiptKey
	 * @return
	 */
	public int insertDocPay(PayDetailVO payDetail);

}
