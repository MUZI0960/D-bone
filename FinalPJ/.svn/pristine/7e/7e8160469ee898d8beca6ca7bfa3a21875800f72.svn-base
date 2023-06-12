package kr.or.ddit.product.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import lombok.extern.slf4j.Slf4j;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

import kr.or.ddit.product.service.ProductManagementService;
import kr.or.ddit.vo.ProductManagementVO;

@Slf4j
@RestController
@RequestMapping("/product")
public class ProductManagementController {
	@Inject
	private ProductManagementService service;

	@GetMapping(value = "/list")
	public List<ProductManagementVO> list() {
		List<ProductManagementVO> productList = service.productList();
		return productList;
	}

	/**
	 * productPage.do 페이지에서 PDF저장 버튼 클릭하면 약품 요청내역 삭제하기
	 * @param param 주문번호
	 * @return
	 */
	@PostMapping(value = "/ProductManagementController/deleteTmpOrderNo")
	public int deleteTmpOrderNo(@RequestBody List<String> param) {
		int cnt = service.deleteOrder(param);
		return cnt;
	}

	/**
	 * productPage.do 페이지에서 PDF저장 버튼 클릭하면 비품 요청내역 삭제하기
	 * @param param 번호
	 * @return
	 */
	@PostMapping(value = "/ProductManagementController/deleteTmpRecordKey")
	public int deleteTmpRecordKey(@RequestBody List<String> param) {
		int cnt = service.suppliesOrderRecord(param);
		return cnt;
	}

}
