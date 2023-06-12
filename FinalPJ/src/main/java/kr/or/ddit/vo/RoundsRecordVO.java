package kr.or.ddit.vo;

import java.time.LocalDate;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Data
@EqualsAndHashCode(of="roundsRecordKey")
@ToString
public class RoundsRecordVO {
	
	private String roundsRecordKey; // 시퀀스 
	private String hospitalizeRecordKey; // 입원 기록 코드 
	private String roundsRecordWriter; // 작성자 
	
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private LocalDate roundsRecordDate; // 작성일 
	private String roundsDoctor; 
	private String writerName; // 작성자 이름 
	
	private List<RoundsPrescriptionVO> roundsPrescriptionList;

}
