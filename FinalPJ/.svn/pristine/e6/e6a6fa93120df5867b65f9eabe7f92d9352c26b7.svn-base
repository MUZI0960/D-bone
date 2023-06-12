package kr.or.ddit.buyer.service;

import java.util.List;

import kr.or.ddit.vo.BuyerVO;
import kr.or.ddit.vo.OfficeSuppliesOrderRecodVO;
import kr.or.ddit.vo.OfficeSuppliesVO;

public interface BuyerService {
	
	// 0515 문수정 -------------------------------
	/**
	 * 거래처 목록 조회
	 * @return
	 */
	public List<BuyerVO> retrieveBuyerList();
	
	// 0515 문수정 -------------------------------
	/**
	 * 환자 상세 조회
	 * @param buyerKey
	 * @return
	 */
	public BuyerVO retrieveBuyer(String buyerKey);
	
	// 0516 문수정 -------------------------------
	/**
	 * 거래처 신규 등록
	 * @param buyer
	 * @return
	 */
	public int createBuyer(BuyerVO buyer);
	
	// 0517 문수정 -------------------------------
	/**
	 * 거래처 수정
	 * @param buyer
	 * @return
	 */
	public int modifyBuyer(BuyerVO buyer);
	
	// 0517 문수정 --------------------------------------------
	/**
	 * 의료 비품 목록 조회
	 * @return
	 */
	public List<OfficeSuppliesVO> retrieveOfficeSuppliesList();
	
	// 0518 문수정 --------------------------------------------
	/**
	 * 의료 비품 등록
	 * @param officeSupplies
	 * @return
	 */
	public int createOfficeSupplies(OfficeSuppliesVO officeSupplies);
	
	// 0520 문수정 --------------------------------------------
	/**
	 * 의료 비품 상세 보기
	 * @param suffliesKey
	 * @return
	 */
	public OfficeSuppliesVO retrieveOfficeSupplies(String suffliesKey);
	
	// 0520 문수정 --------------------------------------------
	/**
     * 의료 비품 삭제
     * @param suffliesKey 비품 번호
     * @return 삭제 성공 여부 (boolean)
     */
    public boolean deleteOfficeSupplies(String suffliesKey);
    
    // 0522 문수정 --------------------------------------------
    /**
     * 의료 비품 신청(등록)
     * @param officeSuppliesOrderRecod
     * @return
     */
    public int createOfficeSuppliesOrderRecod(OfficeSuppliesOrderRecodVO officeSuppliesOrderRecod);
	
    // 0523 문수정 --------------------------------------------
	/**
	 * 의료 비품 요청 목록 조회
	 * @return
	 */
	public List<OfficeSuppliesOrderRecodVO> retrieveOfficeSuppliesOrderRecodList();
    
}
