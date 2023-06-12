package kr.or.ddit.vo;

import java.time.LocalDate;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Data
@EqualsAndHashCode(of = "ioKey")
@ToString
public class IOVO {

	private String ioKey;
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private LocalDate ioDate;
	private String hospitalizeRecordKey;
	private Integer ioIntake;
	private Integer ioOutput;
	private String ioWriter;

}
