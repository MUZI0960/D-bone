package kr.or.ddit.poi.controller;

import java.io.FileInputStream;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.patient.service.PatientService;
import kr.or.ddit.poi.service.PoiCostInsertService;
import kr.or.ddit.vo.PatientVO;
import kr.or.ddit.vo.PayDetailVO;
import kr.or.ddit.vo.PayVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/poi")
public class PoiController {

	@Inject
	private PatientService service;

	@Inject
	private PoiCostInsertService pservice;

	@GetMapping("/sample")
	public void sample(HttpServletRequest request, HttpServletResponse response, @RequestParam String poiPatientKey)
			throws Exception {

		log.info("POI를 위한 환자키~~~~~~~~~~~~~~~~ {} ", poiPatientKey);
		PatientVO psmc = service.selectMedicalCertificate(poiPatientKey);

		log.info("psmc 서비스 실행 후 : {}", psmc);

		String filename = ""; // 내가 저장할 파일의 이름
		String formPath = request.getServletContext().getRealPath("/resources/ajm/excel/medicalcheck.xlsx"); // 양식파일
																												// 넣어두기

		log.info("파일경로 {}", formPath);
		InputStream fis = new FileInputStream(formPath);
		XSSFWorkbook form_wb = new XSSFWorkbook(fis);
		XSSFSheet form_sheet = form_wb.getSheetAt(0);

		// 양식에 넣어줄 데이터
		String chartNo = psmc.getChart().getChartKey(); // 차트번호
		String name = psmc.getPatientName(); // 이름
		String gender = psmc.getPatientSex();
		String birth = String.valueOf(psmc.getPatientRegno1());
		String phone = psmc.getPatientPn();
		String add = psmc.getPAddress();
		String use = "병가";
		String code = psmc.getDisease().getDiseaseNmKr();
		String text = psmc.getDisease().getDiseaseNmKr() == null ? " " : psmc.getDisease().getDiseaseNmKr();
		Date nowDate = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy년 MM월 dd일");
		String strNowDate = simpleDateFormat.format(nowDate);

//        CellStyle cellStyle = form_wb.createCellStyle();
//        cellStyle.setAlignment(HorizontalAlignment.CENTER);

		// 엑셀 폼에 넣기 (로우와 셀 주의!!!)
		form_sheet.getRow(1).getCell(1).setCellValue(chartNo); // 차트번호
		form_sheet.getRow(2).getCell(2).setCellValue(name); // 엑셀 3행 C열
		form_sheet.getRow(2).getCell(5).setCellValue(gender); // 2행 C열
		form_sheet.getRow(3).getCell(2).setCellValue(birth);
		form_sheet.getRow(3).getCell(5).setCellValue(phone);
		form_sheet.getRow(4).getCell(2).setCellValue(add);
		form_sheet.getRow(5).getCell(1).setCellValue(use);
		form_sheet.getRow(7).getCell(1).setCellValue(code);
		form_sheet.getRow(8).getCell(1).setCellValue(text);
		form_sheet.getRow(10).getCell(0).setCellValue(strNowDate);

		// form_sheet.getRow(10).createCell(0).setCellStyle();

		// 파일 이름, 형식, 헤더 설정
		filename = "medicalcheck.xlsx"; // 파일 저장할 때 이름
		response.setContentType("ms-vnd/excel;charset=EUC-KR");
		response.setHeader("Content-Disposition", "attachment; filename=" + filename);
		form_wb.write(response.getOutputStream());
		form_wb.close();
	}

	/**
	 * POI발급 버튼을 누르면 수납내역에 서류발급에 대한 금액이 추가되도록 하기
	 * 
	 * @param receiptKey
	 * @return
	 */
	@PostMapping(value = "/poicontrollerinsertPay", produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String insertPay(@RequestParam String receiptKey) {
		log.info("접수키가 잘 오는지 확인해보자!!!!!!!!!!!!!!!!!!!! {}", receiptKey);
		int insertDocPay = pservice.insertDocPay(receiptKey);
		return "성공 " + insertDocPay + "개";
	}

	/**
	 * 수납이 완료된 후에 수납 내역 출력할 POI
	 * 
	 * @throws Exception
	 */
	@GetMapping("/medicalbill")
	public void medicalbill(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("payKey") int payKey) throws Exception {
		log.info("param 확인하기~~~~~~~~~~~~~~~~ {} ", payKey);

		PayVO payInfo = pservice.selectReceipt(payKey);
		log.info("쿼리문에 파람값 넣고 확인 receipt : {}", payInfo);

		String filename = "";
		String formPath = request.getServletContext().getRealPath("/resources/ajm/excel/medicalbillreceipt.xlsx"); // 양식파일
																													// 넣어두기

		log.info("파일경로 {}", formPath);
		InputStream fis = new FileInputStream(formPath);
		XSSFWorkbook form_wb = new XSSFWorkbook(fis);
		XSSFSheet form_sheet = form_wb.getSheetAt(0);

		// 양식에 넣어줄 데이터
		// 변수 선언하기
		String patientKey = "";
		String patientName = "";
		Integer patientBirth = 0;

		// 처방 행위료
		Integer pk03Moment = 0;
		// 주사 행위
		Integer pk04Moment = 0;

		Integer pk01 = 0; // 진찰 13,3
		Integer pk02 = 0; // 입원 14,3
		Integer pk03 = 0; // 처방 17,3
		Integer pk04 = 0; // 주사 19,3
		Integer pk05 = 0; // 처치 수술 20,3
		Integer pk06 = 0; // 검사료 21,3
		Integer pk07 = 0; // 물리치료 22,3
		Integer pk08 = 0; // xray 23,3
		Integer pk09 = 0; // MRI 24,3
		Integer pk10 = 0; // 22, 6
		Integer pk11 = 0; // 진료확인서 17,10에 합쳐서 출력하기
		Integer pk12 = 0; // 식대 15,3

		Integer totalOne = 0; // 30, 3

		Integer pp1 = 0; // 13,4
		Integer pp2 = 0; // 14, 4
		Integer pp3 = 0; // 17, 4
		Integer pp4 = 0; // 19, 4
		Integer pp5 = 0; // 20, 4
		Integer pp6 = 0; // 21, 4
		Integer pp7 = 0; // 22, 4
		Integer pp8 = 0; // 23, 4
		Integer pp9 = 0; // 24, 4
		Integer pp10 = 0;//
		Integer pp11 = 0;//
		Integer pp12 = 0;// 15, 4

		if (payInfo != null) {
			PatientVO patient = payInfo.getPatient();
			patientKey = patient.getPatientKey();
			patientName = patient.getPatientName();
			patientBirth = patient.getPatientRegno1();

			List<PayDetailVO> payDetailList = payInfo.getPayDetailList();
			for (PayDetailVO payDetail : payDetailList) {
				log.info("건수 {}", payDetail.toString());
				String payKind = payDetail.getPayKind();
				switch (payKind) {

				case "PK01":
					if (payDetail.getPayCostPatient() > 0) {
						pk01 += payDetail.getPayCostPatient();
						pp1 += payDetail.getPayCostAgency();
					}
					break;

				case "PK02":
					if (payDetail.getPayCostPatient() > 0) {
						pk02 += payDetail.getPayCostPatient();
						pp2 += payDetail.getPayCostAgency();
					}
					break;

				case "PK03":
					if (payDetail.getPayCostPatient() > 0) {
						pk03 += payDetail.getPayCostPatient();
						pp3 += payDetail.getPayCostAgency();
						pk03Moment = 5000;
					}
					break;

				case "PK04":
					if (payDetail.getPayCostPatient() > 0) {
						pk04 += payDetail.getPayCostPatient();
						pp4 += payDetail.getPayCostAgency();
						pk04Moment = 5000;
					}
					break;

				case "PK05":
					if (payDetail.getPayCostPatient() > 0) {
						pk05 += payDetail.getPayCostPatient();
						pp5 += payDetail.getPayCostAgency();
					}
					break;

				case "PK06":
					if (payDetail.getPayCostPatient() > 0) {
						pk06 += payDetail.getPayCostPatient();
						pp6 += payDetail.getPayCostAgency();
					}
					break;

				case "PK07":
					if (payDetail.getPayCostPatient() > 0) {
						pk07 += payDetail.getPayCostPatient();
						pp7 += payDetail.getPayCostAgency();
					}
					break;

				case "PK08":
					if (payDetail.getPayCostPatient() > 0) {
						pk08 += payDetail.getPayCostPatient();
						pp8 += payDetail.getPayCostAgency();
					}
					break;

				case "PK09":
					if (payDetail.getPayCostPatient() > 0) {
						pk09 += payDetail.getPayCostPatient();
						pp9 += payDetail.getPayCostAgency();
					}
					break;
				case "PK10":
					if (payDetail.getPayCostPatient() > 0) {
						pk10 += payDetail.getPayCostPatient();
						pp10 += payDetail.getPayCostAgency();
					}
					break;
				case "PK11":
					if (payDetail.getPayCostPatient() > 0) {
						pk11 += payDetail.getPayCostPatient();
						pp11 += payDetail.getPayCostAgency();
					}
					break;
				case "PK12":
					if (payDetail.getPayCostPatient() > 0) {
						pk12 += payDetail.getPayCostPatient();
						pp12 += payDetail.getPayCostAgency();
					}
					break;
				}
			}
		}

		log.info("patientKey환자키 변수에 넣은 후 확인 : {}", patientKey);

		form_sheet.getRow(7).getCell(2).setCellValue(patientKey);

		form_sheet.getRow(13).getCell(3).setCellValue(pk01); // 진찰료
		form_sheet.getRow(13).getCell(4).setCellValue(pp1);

		form_sheet.getRow(14).getCell(3).setCellValue(pk02); // 입원료
		form_sheet.getRow(14).getCell(4).setCellValue(pp2);

		form_sheet.getRow(17).getCell(3).setCellValue(pk03); // 처방
		form_sheet.getRow(17).getCell(4).setCellValue(pp3);
		form_sheet.getRow(16).getCell(3).setCellValue(pk03Moment);

		form_sheet.getRow(19).getCell(3).setCellValue(pk04); // 주사
		form_sheet.getRow(19).getCell(4).setCellValue(pp4);
		form_sheet.getRow(18).getCell(3).setCellValue(pk04Moment);

		form_sheet.getRow(20).getCell(3).setCellValue(pk05); // 수술
		form_sheet.getRow(20).getCell(4).setCellValue(pp5);

		form_sheet.getRow(21).getCell(3).setCellValue(pk06); // 검사료
		form_sheet.getRow(21).getCell(4).setCellValue(pp6);

		form_sheet.getRow(22).getCell(3).setCellValue(pk07); // 물리치료
		form_sheet.getRow(22).getCell(4).setCellValue(pp7);

		form_sheet.getRow(23).getCell(3).setCellValue(pk08); // xray
		form_sheet.getRow(23).getCell(4).setCellValue(pp8);

		form_sheet.getRow(24).getCell(3).setCellValue(pk09); // MRI
		form_sheet.getRow(24).getCell(4).setCellValue(pp9);

		form_sheet.getRow(22).getCell(6).setCellValue(pk10); // 도수
		form_sheet.getRow(10).getCell(4).setCellValue(pp10);

		form_sheet.getRow(15).getCell(3).setCellValue(pk12); // 식대
		form_sheet.getRow(15).getCell(3).setCellValue(pk12); // 식대

		Integer total1 = pk01 + pk02 + pk03 + pk04 + pk05 + pk06 + pk07 + pk08 + pk09 + pk12 + pk03Moment
				+ pk04Moment;

		Integer total2 = pp1 + pp2 + pp3 + pp4 + pp5 + pp6 + pp7 + pp8 + pp9 + pp11 + pp12;

		// 1번 총액
		form_sheet.getRow(31).getCell(3).setCellValue("① " + total1);

		// 2번 총액
		form_sheet.getRow(31).getCell(4).setCellValue("② " + total2);

		// 4번 총액
		form_sheet.getRow(31).getCell(6).setCellValue("④ " + pk10);

		form_sheet.getRow(12).getCell(10).setCellValue(total1 + total2 + pk10); // 총액 
		
		form_sheet.getRow(14).getCell(10).setCellValue(total1 + pk10); // 환자 총액 
		
		form_sheet.getRow(17).getCell(10).setCellValue(total1 + pk10); // 환자 총액 

		// 파일 이름, 형식, 헤더 설정
		filename = "medicalbillreceipt.xlsx"; // 파일 저장할 때 이름
		response.setContentType("ms-vnd/excel;charset=EUC-KR");
		response.setHeader("Content-Disposition", "attachment; filename=" + filename);
		form_wb.write(response.getOutputStream());
		form_wb.close();
	}

}
