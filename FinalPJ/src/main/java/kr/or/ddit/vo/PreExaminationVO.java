package kr.or.ddit.vo;

import java.time.LocalDate;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Data
@EqualsAndHashCode(of = "preExaminationKey")
@ToString
public class PreExaminationVO {

	private String preExaminationKey;
	private String hospitalizeRecordKey;
	private String bloodTest;
	private String ecg;
	private String urinalysis;
	private String pulmonaryTest;
	private String preExaminationNote;

	private String status; // 최종 결과

	public String getStatus() {
		if (bloodTest.equals("1") && ecg.equals("1") && urinalysis.equals("1") && pulmonaryTest.equals("1")) {
			this.status = "1";
		} else {
			this.status = "0";
		}
		return status;
	}

	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private LocalDate preExaminationDate;

}
