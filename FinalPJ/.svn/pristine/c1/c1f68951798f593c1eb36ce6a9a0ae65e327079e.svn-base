package kr.or.ddit.emp.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.or.ddit.attach.service.AttachFileGroupService;
import kr.or.ddit.emp.dao.EmpDAO;
import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.AttatchFileGroupVO;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.Pagination;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class EmpServiceImpl implements EmpService {
	@Inject
	private EmpDAO dao;

	@Inject
	private PasswordEncoder encoder;

	@Inject
	private AttachFileGroupService attachFileGroupService;

	// 파일타입
	@Value("#{appInfo.empFolder}")
	private File empImageFolder;
	// URL경로
	@Value("#{appInfo.empURL}")
	private String empImageURL;

	/**
	 * 사원 등록하기 + 입력받은 비밀번호 암호화하기
	 * 
	 * @return
	 */
	@Override
	public int insertEmp(MultipartHttpServletRequest req, MultipartFile empImageFile) {
		String empId = req.getParameter("empId");
		String empPass = req.getParameter("empPass");
		String encrytPass = encryptBoard(empPass);
		String empName = req.getParameter("empName");
		String empJob = req.getParameter("empJob");
		Integer empRegno1 = Integer.parseInt(req.getParameter("empRegno1"));
		Integer empRegno2 = Integer.parseInt(req.getParameter("empRegno2"));
		String empPhone = req.getParameter("empPhone");
		String empAddr = req.getParameter("empAddr");
		String empAddrDetail = req.getParameter("empAddrDetail");
		String empRetireDate = req.getParameter("empRetireDate");
		String empRetireCheck = req.getParameter("empRetireCheck");
		Integer empLicenseNo = 0;
		if (StringUtils.isNotBlank(req.getParameter("empLicenseNo"))) {
			empLicenseNo = Integer.parseInt(req.getParameter("empLicenseNo"));
		}

//    	MultipartFile imageFile = req.getFile("filename");
//    	log.info("받은 데이터 확인imageFile ={}", imageFile);

		log.info("받은 데이터 확인empId ={}", empId);
		log.info("받은 데이터 확인empName ={}", empName);

		EmpVO empVO = new EmpVO();
		empVO.setEmpId(empId);
		empVO.setEmpPass(encrytPass);
		empVO.setEmpName(empName);
		empVO.setEmpJob(empJob);
		empVO.setEmpRegno1(empRegno1);
		empVO.setEmpRegno2(empRegno2);
		empVO.setEmpPhone(empPhone);
		empVO.setEmpAddr(empAddr);
		empVO.setEmpAddrDetail(empAddrDetail);
		empVO.setEmpRetireDate(empRetireDate);
		empVO.setEmpRetireCheck(empRetireCheck);
		empVO.setEmpLicenseNo(empLicenseNo);
		if (empImageFile != null) {
			empVO.setImageFile(empImageFile, empImageURL); // 넣어서 파일 그룹번호 생성
			AttatchFileGroupVO atchFileGroup = empVO.getAddFileGroup();
			Optional.ofNullable(atchFileGroup).ifPresent((afg) -> {
				attachFileGroupService.insertAttachFileGroup(atchFileGroup, empImageFolder);
				log.info("생성 emp 데이터 확인atchFileGroup ={}", atchFileGroup);
				empVO.setEmpFileGroupNo(afg.getAttGroupNo());
			});
		}

		log.info("생성 emp 데이터 확인empVO ={}", empVO);

		return dao.insertEmp(empVO);
	}
	/*
	 * private int getAmericanAge(String birthDate) { // 생년월일로 나이 구하기 LocalDate now
	 * = LocalDate.now(); LocalDate parsedBirthDate = LocalDate.parse(birthDate,
	 * DateTimeFormatter.ofPattern("yyyyMMdd"));
	 * 
	 * int americanAge = now.minusYears(parsedBirthDate.getYear()).getYear(); // (1)
	 * 
	 * // (2) // 생일이 지났는지 여부를 판단하기 위해 (1)을 입력받은 생년월일의 연도에 더한다. // 연도가 같아짐으로 생년월일만
	 * 판단할 수 있다! if (parsedBirthDate.plusYears(americanAge).isAfter(now)) {
	 * americanAge = americanAge -1; }
	 * 
	 * return americanAge; } private String getFrontDigits(String birthday) { //
	 * 생년월일을 주민등록번호 앞자리로 바꿔주기 SimpleDateFormat format = new
	 * SimpleDateFormat("yyyy-MM-dd"); try { Date date = format.parse(birthday);
	 * 
	 * int year = date.getYear() % 100; // 연도의 뒤 2자리 int month = date.getMonth() +
	 * 1; // 월 int day = date.getDate(); // 일
	 * 
	 * String monthString = String.format("%02d", month); // 월을 2자리로 포맷팅 String
	 * dayString = String.format("%02d", day); // 일을 2자리로 포맷팅
	 * 
	 * return String.format("%02d%02d%02d", year, month, day); } catch (Exception e)
	 * { e.printStackTrace(); } return null; }
	 */

	private String encryptBoard(String  pass) {
		// 입력받은 평문 비번을 암호화.

		String encoded = encoder.encode(pass);
		return encoded;
	}

	/*
	 * // 사원목록 조회
	 * 
	 * @Override public void empList(Pagination<EmpVO> pagination) { int totalRecord
	 * = dao.selectTotalRecord(pagination); pagination.setTotalRecord(totalRecord);
	 * List<EmpVO> dataList = dao.empList(pagination);
	 * pagination.setDataList(dataList);
	 * 
	 * }
	 */
	@Override
	public List<EmpVO> selectempList() {
		return dao.selectempList();
	}

	@Override
	public EmpVO selectEmp(String empKey) {
		return dao.selectEmp(empKey);
	}

	@Override
	public int updateEmp(MultipartHttpServletRequest req, MultipartFile empImageFile) {
		String empKey = req.getParameter("empKey");
		String empId = req.getParameter("empId");
		String empPhone = req.getParameter("empPhone");
		String empAddr = req.getParameter("empAddr");
		String empAddrDetail = req.getParameter("empAddrDetail");
		String empFileGroupNo = req.getParameter("empFileGroupNo");

		if (empFileGroupNo.length() == 0)
			empFileGroupNo = null;
		EmpVO empVO = new EmpVO();
		empVO.setEmpKey(empKey);
		empVO.setEmpId(empId);
		empVO.setEmpPhone(empPhone);
		empVO.setEmpAddr(empAddr);
		if (empAddrDetail != null) {
			empVO.setEmpAddrDetail(empAddrDetail);
		}else {
			empVO.setEmpAddrDetail(null);
		}
		log.info("수정하려는 empVO = {}", empVO);
		if (empImageFile.getSize() > 0) {
			
			empVO.setImageFile(empImageFile, empImageURL); // 파일 셋팅
			AttatchFileGroupVO atchFileGroup = empVO.getAddFileGroup();
			if (empFileGroupNo != null) {// 파일그룹번호가 있음 => 기존 파일 삭제하고..? 그룹 수정
				atchFileGroup.setAttGroupNo(Integer.parseInt(empFileGroupNo));
				Optional.ofNullable(atchFileGroup)// 파일 그룹번호 생성
						.ifPresent((afg) -> {
							attachFileGroupService.updateAttachFileGroupForEmpProfil(atchFileGroup, empImageFolder);
							log.info("update emp 데이터 확인atchFileGroup ={}", atchFileGroup);
							empVO.setEmpFileGroupNo(afg.getAttGroupNo());
						});
			} else {// 신규 등록
				Optional.ofNullable(atchFileGroup)// 파일 그룹번호 생성
						.ifPresent((afg) -> {
							attachFileGroupService.insertAttachFileGroup(atchFileGroup, empImageFolder);
							log.info("생성 emp 데이터 확인atchFileGroup ={}", atchFileGroup);
							empVO.setEmpFileGroupNo(afg.getAttGroupNo());
						});
			}
		} else {
			// 업로드 사진이 없다면 파일 번호 유지
			if(empFileGroupNo != null) empVO.setEmpFileGroupNo(Integer.parseInt(empFileGroupNo));
		}
		
		log.info("수정 emp 데이터 확인empVO ={}", empVO);
		return dao.updateEmp(empVO);
	}

	@Override
	public EmpVO retrieveEmpSecurity(String empId) {
		return dao.selectEmpSecurity(empId);
	}

	// 직원 프로필 사진 조회
	@Override
	public List<AttachVO> viewData(int attGroupNo) {
		AttatchFileGroupVO fileGroup = attachFileGroupService.selectFileList(attGroupNo);
		List<AttachVO> fileList = fileGroup.getAttFileList();
		return fileList;
	}

}
