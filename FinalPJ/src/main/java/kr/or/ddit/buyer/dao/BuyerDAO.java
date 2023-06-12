package kr.or.ddit.buyer.dao;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.BuyerVO;
import kr.or.ddit.vo.OfficeSuppliesOrderRecodVO;
import kr.or.ddit.vo.OfficeSuppliesVO;

@Mapper
public interface BuyerDAO {
	
	// 0515 문수정 --------------------------------------
	/**
	 * 거래처 목록 조회
	 * @return
	 */
	public List<BuyerVO> selectBuyerList();
	
	// 0515 문수정 --------------------------------------
	/**
	 * 거래처 상세 조회
	 * @param buyerKey
	 * @return
	 */
	public BuyerVO selectBuyer(String buyerKey);
	
	// 0516 문수정 --------------------------------------
	/**
	 * 거래처 신규 등록
	 * @param buyer
	 * @return
	 */
	public int insertBuyer(BuyerVO buyer);
	
	
	// 0517 문수정 --------------------------------------
	/**
	 * 거래처 수정
	 * @param buyer
	 * @return
	 */
	public int updateBuyer(BuyerVO buyer);
	
	// 0517 문수정 ---------------------------------------- 
	/**
	 * 의료 비품 목록 조회
	 * @return
	 */
	public List<OfficeSuppliesVO> selectOfficeSuppliesList();
	
	// 0518 문수정 ---------------------------------------- 
	/**
	 * 의료 비품 등록
	 * @return
	 */
	public int insertOfficeSupplies(OfficeSuppliesVO officeSupplies);
	
	// 0520 문수정 ---------------------------------------- 
	/**
	 * 의료 비품 상세보기
	 * @param suffliesKey
	 * @return
	 */
	public OfficeSuppliesVO selectOfficeSupplies(String suffliesKey);
	
	// 0520 문수정 ---------------------------------------- 
    /**
     * 의료 비품 삭제
     * @param suffliesKey 비품 번호
     * @return 삭제 성공 여부 (boolean)
     */
    public boolean deleteOfficeSupplies(String suffliesKey);
    
    // 0522 문수정 ---------------------------------------- 
    /**
     * 의료 비품 신청(등록) 
     * @param officeSuppliesOrderRecod
     * @return
     */
    public int insertOfficeSuppliesOrderRecod(OfficeSuppliesOrderRecodVO officeSuppliesOrderRecod);
    
    // 0523 문수정 ---------------------------------------- 
    /**
     * 의료 비품 신청하면서 기존 수량 증가해야해서 만든 update
     * @param officeSuppliesOrderRecod
     * @return
     */
    public int updateOfficeSuppliesOrderRecod(OfficeSuppliesOrderRecodVO officeSuppliesOrderRecod);
    
	// 0523 문수정 ---------------------------------------- 
	/**
	 * 의료 비품 요청 내역 목록 조회
	 * @return
	 */
	public List<OfficeSuppliesOrderRecodVO> selectOfficeSuppliesOrderRecordList();
}
    
    