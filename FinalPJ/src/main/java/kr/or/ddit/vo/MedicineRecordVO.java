package kr.or.ddit.vo;

import java.time.LocalDate;
import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Data
@EqualsAndHashCode(of= "medicineRecordKey")
@ToString
public class MedicineRecordVO {
	private String medicineRecordKey;
	private String hospitalizeRecordKey;
	private String medicineRecordContent;
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm", timezone = "Asia/Seoul")
	private LocalDateTime medicineRecordDate;
	private String medicineRecordWriter;
	private String medicineRecordWriterName;
	private String medicineKey;
	private String medicineName;

}
