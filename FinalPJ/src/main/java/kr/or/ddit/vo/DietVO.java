package kr.or.ddit.vo;

import java.time.LocalDate;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Data
@EqualsAndHashCode(of = "dietKey")
@ToString
public class DietVO {
	private String dietKey;
	private String hospitalizeRecordKey;
	private String dietKind;
	private Integer dietIntake;
	private String dietMeals;
	private String dietWriter;
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private LocalDate dietTime;
	
	private String dietMealsName; // 식대 이름
	private String dietKindName; // 식이 종류 이름
	private String empName; // 작성자 이름 
	

}
