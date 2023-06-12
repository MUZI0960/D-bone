package kr.or.ddit.vo;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Data
@EqualsAndHashCode(of = "receiptKey")
@ToString
public class ReceiptionVO implements Serializable{
	
	private String receiptKey; // 접수번호
	private String patientKey; // 환자번호
	private String officeKey; // 진료실 번호
	
	@DateTimeFormat(iso = ISO.DATE_TIME)
	private LocalDateTime receiptDate; // 접수 날짜
	private String receiptReason; // 증상
	private String receiptStatus; // 대기상태 - 진행중, 수납완료 등


	// 진료대기환자 조회를 위한 변수!!
	private String patientName;
	private String patientRegno1;

	// 부모테이블
//	진료실 테이블, 환자 테이블
	private String empKey;
	private String status; 
	
	private PatientVO patient;
	
	
//	자식테이블 - 진료차트 테이블
	private List<MedicalChartVO> MChartList;
	
	
//	자식테이블 - 대기상태히스토리 테이블 (김지연 추가)
	private List<WaitingHistoryVO> WaitingList;
	
	
//  자식테이블 - 진료실 DOCTOR_OFFICE (김지연 추가)
	private String drOfficeStatus;

// 주치의 이름 위해 추가 (김지연)
	private String empName;
	
	private String mtRecordCode;
	private String mtRecordDate;
	private String monthData;
}
