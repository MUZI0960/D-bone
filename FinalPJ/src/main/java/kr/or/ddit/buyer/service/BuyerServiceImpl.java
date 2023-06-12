package kr.or.ddit.buyer.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.buyer.dao.BuyerDAO;
import kr.or.ddit.vo.BuyerVO;
import kr.or.ddit.vo.OfficeSuppliesOrderRecodVO;
import kr.or.ddit.vo.OfficeSuppliesVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BuyerServiceImpl implements BuyerService {

	@Autowired
	private BuyerDAO buyerDAO;
	
	// 0515 문수정 -----------------------------------------------
	/**
	 * 거래처 목록 조회
	 */
	@Override
	public List<BuyerVO> retrieveBuyerList() {
		return buyerDAO.selectBuyerList();
	}
	
	// 0515 문수정 -----------------------------------------------
	/**
	 * 거래처 상세 조회
	 */
	@Override
	public BuyerVO retrieveBuyer(String buyerKey) {
		return buyerDAO.selectBuyer(buyerKey);
	}

	// 0516 문수정 -----------------------------------------------
	/**
	 * 거래처 신규 등록
	 */
	@Override
	public int createBuyer(BuyerVO buyer) {
		return buyerDAO.insertBuyer(buyer);
	}

	// 0517 문수정 -----------------------------------------------
	/**
	 * 거래처 수정
	 */
	@Override
	public int modifyBuyer(BuyerVO buyer) {
		return buyerDAO.updateBuyer(buyer);
	}

	// 0517 문수정 -----------------------------------------------
	/**
	 * 의료 비품 목록 조회
	 */
	@Override
	public List<OfficeSuppliesVO> retrieveOfficeSuppliesList() {
		return buyerDAO.selectOfficeSuppliesList();
	}

	// 0518 문수정 -----------------------------------------------
	/**
	 * 의료 비품 등록
	 */
	@Override
	public int createOfficeSupplies(OfficeSuppliesVO officeSupplies) {
		return buyerDAO.insertOfficeSupplies(officeSupplies);
	}

	// 0520 문수정 -----------------------------------------------
	/**
	 * 의료 비품 상세 조회
	 */
	@Override
	public OfficeSuppliesVO retrieveOfficeSupplies(String suffliesKey) {
		return buyerDAO.selectOfficeSupplies(suffliesKey);
	}

	// 0520 문수정 -----------------------------------------------
	/**
	 * 의료 비품 삭제
	 */
	@Override
	public boolean deleteOfficeSupplies(String suffliesKey) {
		return buyerDAO.deleteOfficeSupplies(suffliesKey);
	}

	// 0522 문수정 -----------------------------------------------
	/**
	 * 의료 비품 신청(등록)
	 */
	@Override
	@Transactional
	public int createOfficeSuppliesOrderRecod(OfficeSuppliesOrderRecodVO officeSuppliesOrderRecod) {
		 log.info("체크: {}",officeSuppliesOrderRecod);
		 buyerDAO.insertOfficeSuppliesOrderRecod(officeSuppliesOrderRecod);
		 buyerDAO.updateOfficeSuppliesOrderRecod(officeSuppliesOrderRecod);
		 return 1;
	}

	// 0523 문수정 -----------------------------------------------
	/**
	 * 의료 비품 요청 목록 조회
	 */
	@Override
	public List<OfficeSuppliesOrderRecodVO> retrieveOfficeSuppliesOrderRecodList() {
		return buyerDAO.selectOfficeSuppliesOrderRecordList();
	}
	

}
