package kr.or.ddit.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Data
@EqualsAndHashCode(of="rpKey")
@ToString
public class RoundsPrescriptionVO {

	private Integer rpKey; // 시퀀스 
	private String roundsRecordKey; // 회진 기록 코드 
	private Integer rpDay; // 일투 
	private Integer rpTotal;
	private Integer rpCost;
	
	private String medicineKey;
	private String medicineName;
	private String medicineEa;
	private String medicineRoute;
}
