package kr.or.ddit.vo;

import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Data
@EqualsAndHashCode(of = "vitalKey")
@ToString
public class VitalVO {
	
	private String vitalKey;
	private String hospitalizeRecordKey;
	private Integer hyperBP;
	private Integer hypoBP;
	private Integer pulse; 
	private Integer respiration;
	private double temperature;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm", timezone = "Asia/Seoul")
	private LocalDateTime vitalDate;
	private String vitalWriter;
	
	private String empName; // 작성자 이름
	

}
