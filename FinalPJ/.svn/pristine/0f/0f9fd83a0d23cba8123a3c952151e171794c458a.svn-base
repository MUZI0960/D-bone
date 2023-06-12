package kr.or.ddit.vo;

import java.time.LocalDate;


import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Data
@EqualsAndHashCode(of = "nurseChartKey")
@ToString
public class NurseChartVO {

	private String nurseChartKey;
	private String hospitalizeRecordKey;
	private String nurseChartWriter;
	
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private LocalDate nurseChartDate;
	
	private String nurseChartContent;
	
	private String empName;

}
