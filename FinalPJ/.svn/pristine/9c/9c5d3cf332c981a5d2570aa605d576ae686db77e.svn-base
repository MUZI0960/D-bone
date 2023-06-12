package kr.or.ddit.pay.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.PayDetailVO;
import kr.or.ddit.vo.PayVO;

/**
 * 수납내역, 수납 상세내역 관련
 * @author dlgpd
 *
 */
@Mapper
public interface PayDAO {
	
	/**
	 * 진료비 수납 상세 내역 등록
	 * @param payDetail
	 * @return
	 */
	public int insertPayDetailForDiagnosis(PayDetailVO payDetail);
	
	/**
	 * 처방내역 수납 상세 내역 등록
	 * @param payDetail
	 * @return
	 */
	public int insertPayDetailForPrescription(PayDetailVO payDetail);

	/**
	 * 차트번호로 해당 수납내역이 있는지 확인(처방내역 확인)
	 * @param chartkey
	 * @return
	 */
	public PayDetailVO selectPayDetailPrescrition(String chartkey);
	
	/**
	 * 재진료시 해당 차트의 진료 수납내역이 있는지 확인
	 * @param chartkey
	 * @return
	 */
	public PayDetailVO selectPayDetailDiagnosis(String chartkey);
	/**
	 * 재진료시 처방내역금액 변동 있을경우 update
	 * @param payDetail
	 * @return
	 */
	public int updatePrescritionPayDetail(PayDetailVO payDetail);
	
	//-------------------------------------------------------------------
	
	/**
	 * 영상학과 수납내역 등록
	 * @param payDetail
	 * @return
	 */
	public int insertRadiologyPayDetail(PayDetailVO payDetail);
	
	/**
	 * 수납목록 조회
	 * @return
	 */
	public List<PayVO> selectpayWaitingList(); 
	
	
	public List<PayDetailVO> selectPayDetailList(String payKey);

	public int updatePayStatus(PayVO vo);

	public int insertPay(String hospitalizeRecordKey); 
	
	
}
