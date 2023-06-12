package kr.or.ddit.commons.controller;

import java.security.Principal;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.emp.service.EmpService;
import kr.or.ddit.vo.EmpVO;

/**
 * 각 과의 메인페이지 url 매핑
 * @author dlgpd
 *
 */
@Controller
@RequestMapping("/main")
public class MainPageController {
	
	@Inject
	private EmpService service;
	
	/**
	 * 접수/수납페이지
	 * @return
	 */
	@GetMapping("/receiptPayPage.do")
	public String receiptPayPage(Principal principal, HttpSession session) {
		EmpVO emp = service.retrieveEmpSecurity(principal.getName());
		session.setAttribute("authEmp", emp);
		return "MainPage/receiptPayPage";
	}
	
	/**
	 * 예약페이지
	 * @return
	 */
	@GetMapping("/reservationPage.do")
	public String reservationPage(Principal principal, HttpSession session) {
		EmpVO emp = service.retrieveEmpSecurity(principal.getName());
		session.setAttribute("authEmp", emp);
		return "MainPage/reservationPage";
	}
	
	
	/**
	 * 진료차트페이지
	 * @return
	 */
	@GetMapping("/chartPage.do")
	public String chartPage(Principal principal, HttpSession session) {
		EmpVO emp = service.retrieveEmpSecurity(principal.getName());
		session.setAttribute("authEmp", emp);
		return "MainPage/medicalChartPage";
	}
	
	/**
	 * 입원/병동페이지
	 * @return
	 */
	@GetMapping("/wardPage.do")
	public String wardPage(Principal principal, HttpSession session) {
		EmpVO emp = service.retrieveEmpSecurity(principal.getName());
		session.setAttribute("authEmp", emp);
		return "MainPage/wardPage";
	}
	
	/**
	 * 발주(비품,장비)페이지
	 * @return
	 */
	@GetMapping("/productPage.do")
	public String productPage(Principal principal, HttpSession session) {
		EmpVO emp = service.retrieveEmpSecurity(principal.getName());
		session.setAttribute("authEmp", emp);
		return "MainPage/productPage";
	}
	/**
	 * 약품 발주페이지
	 * @return
	 */
	@GetMapping("/medicine")
	public String medicinePage(Principal principal, HttpSession session) {
		EmpVO emp = service.retrieveEmpSecurity(principal.getName());
		session.setAttribute("authEmp", emp);
		return "MainPage/medicinePage";
	}
	
	/**
	 * 수술/검사페이지
	 * @return
	 */
	@GetMapping("/surgeryPage.do")
	public String surgeryPage(Principal principal, HttpSession session) {
		EmpVO emp = service.retrieveEmpSecurity(principal.getName());
		session.setAttribute("authEmp", emp);
		return "MainPage/surgeryPage";
	}
	
	/**
	 * 물리/도수치료 페이지
	 * @return
	 */
	@GetMapping("/therapyPage.do")
	public String therapyPage(Principal principal, HttpSession session) {
		EmpVO emp = service.retrieveEmpSecurity(principal.getName());
		session.setAttribute("authEmp", emp);
		return "MainPage/therapyPage";
	}
	
	@GetMapping("/mTherapyPage.do")
	public String mTherapyPage(Principal principal, HttpSession session) {
		EmpVO emp = service.retrieveEmpSecurity(principal.getName());
		session.setAttribute("authEmp", emp);
		return "MainPage/mTherapyPage";
	}
	
	/**
	 * 영상학과 페이지
	 * @return
	 */
	@GetMapping("/radiologyPage.do")
	public String radiologyPage(Principal principal, HttpSession session) {
		EmpVO emp = service.retrieveEmpSecurity(principal.getName());
		session.setAttribute("authEmp", emp);
		return "MainPage/radiologyPage";
	}
	
	/**
	 * 서류발급 페이지
	 * @return
	 */
	@GetMapping("/documentPage.do")
	public String documentPage(Principal principal, HttpSession session) {
		EmpVO emp = service.retrieveEmpSecurity(principal.getName());
		session.setAttribute("authEmp", emp);
		return "MainPage/documentPage";
	}
	
	/**
	 * 인사/일정 페이지
	 * @return
	 */
	@GetMapping("/empPage.do")
	public String empPage(Principal principal, HttpSession session) {
		EmpVO emp = service.retrieveEmpSecurity(principal.getName());
		session.setAttribute("authEmp", emp);
		return "MainPage/empPage";
	} 
	
	/**
	 * 공지사항 페이지
	 * @return
	 */
	@GetMapping("/noticeBoardPage.do")
	public String noticeBoardPage(Principal principal, HttpSession session) {
		EmpVO emp = service.retrieveEmpSecurity(principal.getName());
		session.setAttribute("authEmp", emp);
		return "MainPage/noticeBoardPage";
	}
	
	
	/**
	 * 통계/실적 페이지
	 * @return
	 */
	@GetMapping("/statisticsPage.do")
	public String statisticsPage(Principal principal, HttpSession session) {
		EmpVO emp = service.retrieveEmpSecurity(principal.getName());
		session.setAttribute("authEmp", emp);
		return "MainPage/statisticsPage";
	}
	
	
	/**
	 * 사원 마이페이지
	 * webapp > tobar.jsp
	 * @return 사원 상세보기 할 수 있는 페이지 myPage.jsp
	 */
	@GetMapping("/myPage")
	public String myPage(Principal principal, HttpSession session) {
		EmpVO emp = service.retrieveEmpSecurity(principal.getName());
		session.setAttribute("authEmp", emp);
		return "MyPage/myPage";
	}
	
	
}
