package kr.or.ddit.emp.controller;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.HttpServerErrorException.InternalServerError;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.or.ddit.emp.service.EmpService;
import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.Pagination;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class EmpController {
	@Inject
	private EmpService service;

	/**
	 * 원무과에서 회원 새로 추가하기
	 * @param paramVO	추가할 회원의 정보
	 * @return 추가 성공여부 OK = 1, FAIL = 0
	 * @throws Exception 
	 */
	@PostMapping(value = "/addEmp", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String addEmp(MultipartHttpServletRequest req, @RequestPart("filename") MultipartFile file, HttpServletResponse resp) throws Exception {

//		log.info("입력한 정보 잘 왔는지 확인 {}", paramVO);
		log.info("받은 데이터 확인filename ={}", file);
		
		int cnt = service.insertEmp(req, file);
//		log.info("성공 확인 cnt ={}", cnt);
		String result = "";
		if(cnt > 0) {
			result = "성공";
		}else {
			result = "실패";
		}
		return result;
	}



	/**
	 * 인사 일정 페이지에서 회원 리스트 페이징처리하여 출력하기
	 * @param currentPage
	 * @return
	 */
	/*
	@PostMapping(value = "/empList", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Pagination<EmpVO> empList(@RequestParam(value = "page", required = false, defaultValue = "1")int currentPage) {
		log.info("현재페이지파람 {}",currentPage);
		Pagination<EmpVO> pagination = new Pagination<EmpVO>();
		pagination.setScreenSize(5);	// 화면에 보여줄 회원 개수 설정하기 현재는 5개
		pagination.setCurrentPage(currentPage);	// 사용자가 누른 페이지 값 넘겨주기
		log.info("페이지네이션 : {}", pagination);
		service.empList(pagination);	// 위의 조건에 맞는 회원 리스트 뽑아오기
		return pagination;
	}
	*/
	@GetMapping("/empList")
	public List<EmpVO> empList(){
		return service.selectempList();
	}

	/**
	 * 마이페이지에서 로그인한 회원의 상세정보 보여주기
	 * @param empKey
	 * @return 해당 회원의 개인정보
	 */
	@GetMapping(value = "/detail", produces = "application/json;charset=utf-8")
	@ResponseBody
	public EmpVO empVO(@RequestParam String empKey) {
		log.info("어떤게오려나????",empKey);	// 현재 로그인한 회원의 empKey
		EmpVO selectEmp = service.selectEmp(empKey);	// empKey 넘겨줘서 상세정보 출력하기
		return selectEmp;
	}

	/**
	 * 마이페이지에서 개인정보 수정
	 * @param file TODO
	 * @param vo
	 *
	 */
//	MultipartHttpServletRequest req, @RequestPart("filename") MultipartFile file
	@PostMapping(value = "/empUpdate", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String empUpdate(MultipartHttpServletRequest req, @RequestPart("filename") MultipartFile file) {
//		log.info("vo가 어떤게 넘겨오냐!!! {}", vo);
		String result = "";
		
		int cnt = service.updateEmp(req, file);
		if(cnt > 0) {
			result = "success";
		}else {
			result = "fail";
		}
		return result;
	}
	
	@GetMapping(value = "empProfilView", produces = "application/json;charset=utf-8")
	public List<AttachVO> getEmpProfil(@RequestParam("attGroupNo") String empFileNo){
		int attNo = Integer.parseInt(empFileNo);
		log.info("받은 파일 번호 조회 : {}", attNo);
		List<AttachVO> fileList = service.viewData(attNo);
		return fileList;
	}

}