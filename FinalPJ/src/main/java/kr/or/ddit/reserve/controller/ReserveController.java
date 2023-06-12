package kr.or.ddit.reserve.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.or.ddit.reserve.service.ReserveService;
import kr.or.ddit.vo.ReserveVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class ReserveController {
	@Inject
	private ReserveService service;

	@GetMapping(value = "/reserveList", produces = "application/json;charset=utf-8")
	@ResponseBody
	public List getReserve() {
		List<ReserveVO> reserveVO = service.selectReserve();
		List list = new ArrayList<>();
		for (ReserveVO vo : reserveVO) {
			Map<String, String> map = new HashMap<>();
			map.put("id", vo.getScheduleKey() + "");
			map.put("title", vo.getPatientKey());
			map.put("bed", vo.getWardBedKey() + "");
			map.put("start", vo.getAppointmentDate());
			map.put("charger", vo.getAppintmentCharger());
			list.add(map);
		}
		return list;
	}

	@PostMapping(value = "/scheduleUpdate", produces = "application/json;charset=utf-8")
	@ResponseBody
	public void empUpdate(@RequestBody ReserveVO vo) {
		log.info("vo가 어떤게 넘겨오냐!!! {}", vo);
		service.modifyReserve(vo);	// 침대번호와 담당자만 변경할 수 있음
	}
}
