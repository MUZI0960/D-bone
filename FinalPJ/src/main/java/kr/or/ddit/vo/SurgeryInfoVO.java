package kr.or.ddit.vo;

import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Data
@EqualsAndHashCode(of = "surgeryInfoKey")
@ToString
public class SurgeryInfoVO {
	private Integer surgeryInfoKey;
	private String hospitalizeRecordKey;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm", timezone = "GMT+9")
	private LocalDateTime surgeryStartDate;

	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm", timezone = "GMT+9")
	private LocalDateTime surgeryEndDate;

	private String surgeryRuntime;
	private String surgeryContent;
	private String surgeryManager;

	// --
	private String patientKey;
	private String patientName;
	private String empName; // 담당의 이름
	private String surgeryKindName; // 수술명 
	private String surgeryManagerName; // 예약 담당자 이름 
}
