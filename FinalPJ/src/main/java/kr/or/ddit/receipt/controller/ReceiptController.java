package kr.or.ddit.receipt.controller;

import kr.or.ddit.pay.service.PayService;
import kr.or.ddit.receipt.service.ReceiptService;
import kr.or.ddit.vo.PayDetailVO;
import kr.or.ddit.vo.PayVO;
import kr.or.ddit.vo.ReceiptionVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

import javax.inject.Inject;

@Slf4j
@Controller
@RequestMapping(value = { "/insert", "/receipt" })
public class ReceiptController {
	@Inject
	private ReceiptService service;

	@Inject
	private PayService payService;

	@PostMapping(value = "insertWaiting", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public int insert(@RequestBody ReceiptionVO vo) {
		log.info("vo잘 넘어왔는가!!!!!!!!!!!!!!!!!!!!!! {}", vo);
		return service.insertWaiting(vo);
	}

	@GetMapping(value = "payDetailList", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<PayDetailVO> getPayDetailList(@RequestParam String payKey) {
		return payService.retrievePayDetailList(payKey);
	}

	@PutMapping(value = "payStatus", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.TEXT_PLAIN_VALUE)
	@ResponseBody
	public String updatePayStatus(@RequestBody PayVO vo) {
		int result = payService.modifyPayStatus(vo);

		int expected = vo.getReceiptKey() != null ? 2 : 1;

		return result == expected ? "success" : "fail";

	}
}
