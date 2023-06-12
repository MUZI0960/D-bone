package kr.or.ddit.vo;

import java.time.LocalDate;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Data
@EqualsAndHashCode(of = {"wardKey", "wardBedKey"})
@ToString
public class WardBedVO {
	
	private int wardKey; // 병실 번호 
	private int wardBedKey; // 침상번호 
	private String wardBedStatus; // 침상 상태
	private String wardGrade; // 병실 등급 
	private String patientName; // 이용중인 환자명
	private String patientKey;
	private String hospitalizeRecordKey;
	
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private LocalDate expectedCheckOutDate; // 예상 퇴원 날
	
	
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private LocalDate checkInDate; // 입원일 
	
	private Integer wardIngDate; // 입원일
	
	private int wardPrice; // 병실 가격 
	
}
