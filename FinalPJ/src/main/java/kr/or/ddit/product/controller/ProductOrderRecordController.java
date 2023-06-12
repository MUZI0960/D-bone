package kr.or.ddit.product.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.or.ddit.product.service.ProductOrderRecordService;
import kr.or.ddit.vo.ProductOrderRecordVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/order")
public class ProductOrderRecordController {
	@Inject
	private ProductOrderRecordService service;

	@GetMapping(value = "/list")
	public List<ProductOrderRecordVO> list() {
		List<ProductOrderRecordVO> list = service.porList();
		return list;
	}

	@PostMapping(value = "/orderList", produces = "application/json;charset=utf-8")
	@ResponseBody
	public List<ProductOrderRecordVO> vo(@RequestBody List<ProductOrderRecordVO> vo) {
		for (ProductOrderRecordVO productOrderRecordVO : vo) {
			log.info("vo가 어떤게 넘겨오냐!!! {}", productOrderRecordVO);
		}
		service.insertPor(vo);
		return vo;

	}
}
