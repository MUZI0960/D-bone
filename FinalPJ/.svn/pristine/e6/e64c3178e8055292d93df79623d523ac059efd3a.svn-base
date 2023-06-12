package kr.or.ddit.buyer.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.buyer.service.BuyerService;
import kr.or.ddit.vo.BuyerVO;
import kr.or.ddit.vo.OfficeSuppliesOrderRecodVO;
import kr.or.ddit.vo.OfficeSuppliesVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/buyer")
public class BuyerController {

	@Inject
	private BuyerService buyerservice;
	
	// 0515 문수정 --------------------------------------------------------------------
	/**
	 * 거래처 목록 조회 컨트롤러
	 * @return
	 */
	@GetMapping(value = "/buyerList.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public List<BuyerVO> buyerList(){
		List<BuyerVO> buyerList = new ArrayList<BuyerVO>();
		buyerList = buyerservice.retrieveBuyerList();
		return buyerList;
	}
	
	
	// 0515 문수정 --------------------------------------------------------------------
	/**
	 * 거래처 상세 조회 
	 * @param buyerKey
	 * @return
	 */
	@GetMapping("/buyerView.do")
	@ResponseBody
	public BuyerVO buyerView(@RequestParam("what") String buyerKey) {
		BuyerVO buyer = buyerservice.retrieveBuyer(buyerKey);
		return buyer;
	}
	
	// 0516 문수정 --------------------------------------------------------------------
	/**
	 * 신규 거래처 등록
	 * @param buyer
	 * @return
	 */
	@PostMapping(value = "/buyerInsert.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String insertBuyer(@RequestBody BuyerVO buyer) {
		buyerservice.createBuyer(buyer);
		return "success";
	}
	
	// 0517 문수정 --------------------------------------------------------------------
	/**
	 * 거래처 수정 컨트롤러
	 * @param buyer
	 * @return
	 */
	@PostMapping(value = "/buyerUpdate.do", produces = "text/plain7;charset=utf-8")
	@ResponseBody
	public String updateBuyer(@RequestBody BuyerVO buyer) {
		buyerservice.modifyBuyer(buyer);
		return "success";
	}
	
	// 0517 문수정 ----------------------------------------------------------------------
	/**
	 * 의료 비품 목록 조회 컨트롤러
	 * @return
	 */
	@GetMapping(value = "/officeSuppliesList.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public List<OfficeSuppliesVO> officeSuppliesList(){
		List<OfficeSuppliesVO> officeSuppliesList = buyerservice.retrieveOfficeSuppliesList();
//		log.info("받아온 비품 리스트 = {}", officeSuppliesList);
		return officeSuppliesList;
	}
	
	// 0518 문수정 ----------------------------------------------------------------------
	/**
	 * 의료 비품 추가 컨트롤러
	 * @param officeSupplies
	 * @return
	 */
	@PostMapping(value = "/officeSuppliesInsert.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String insertOfficeSupplies(@RequestBody OfficeSuppliesVO officeSupplies) {
		buyerservice.createOfficeSupplies(officeSupplies);
		return "success";
	}
	
	// 0520 문수정 ----------------------------------------------------------------------
	/**
	 * 의료 비품 상세 보기
	 * @param suffliesKey
	 * @return
	 */
	@GetMapping("/officeSuppliesView.do")
	@ResponseBody
	public OfficeSuppliesVO officeSuppliesView(@RequestParam("what") String suffliesKey) {
		OfficeSuppliesVO officeSupplies = buyerservice.retrieveOfficeSupplies(suffliesKey);
		return officeSupplies;
	}
	
	// 0520 문수정 ----------------------------------------------------------------------
	/**
	 * 의료 비품 삭제
	 * @param suffliesKey
	 * @return
	 */
	@PostMapping("/officeSuppliesDelete.do")
	@ResponseBody
	public String officeSuppliesDelete(@RequestParam("what") String suffliesKey) {
	    buyerservice.deleteOfficeSupplies(suffliesKey);
	    return "success";
	}
	
	// 0522 문수정 ----------------------------------------------------------------------
	/**
	 * 의료 비품 신청(등록) 
	 * @param officeSuppliesOrderRecod
	 * @return
	 */
	@PostMapping(value = "/officeSuppliesOrderRecodInsert.do" , produces = "application/json;charset=utf-8")
	@ResponseBody
	public String insertOfficeSuppliesOrderRecod(@RequestBody OfficeSuppliesOrderRecodVO officeSuppliesOrderRecod) {
		log.info("officeSuppliesOrderRecod 어떤 값이 넘어왔는지 확인!!!!!!!!!! : {}", officeSuppliesOrderRecod);
		buyerservice.createOfficeSuppliesOrderRecod(officeSuppliesOrderRecod);
		return "success";
	}
	
	// 0523 문수정 ----------------------------------------------------------------------
	/**
	 * 의료 비품 요청 목록 조회 컨트롤러
	 * @return
	 */
	@GetMapping(value = "/officeSuppliesOrderRecordList.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public List<OfficeSuppliesOrderRecodVO> officeSuppliesOrderRecordList(){
		List<OfficeSuppliesOrderRecodVO> officeSuppliesOrderRecordList = buyerservice.retrieveOfficeSuppliesOrderRecodList();
		return officeSuppliesOrderRecordList;
	}
	
}
