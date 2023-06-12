package kr.or.ddit.vo;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.temporal.ChronoField;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "ptRecordKey")
public class PtRecordVO implements Serializable{
	
	private Integer ptRecordKey;
	private Integer ptBedKey;
	private String orderKey;
	private Integer equipmentKey;
	private String ptRecordContent;
	private String empKey;
//	private String ptRecordDate;
//	private LocalTime ptRecordDate;
	private LocalDateTime ptRecordDate;
	
	// 치료타이머 위해 추가 (못 써먹었어요...)
//	public int getSeconds() {
//		return ptRecordDate.get(ChronoField.SECOND_OF_DAY);
//	}
//	
	private OrderHistoryVO orderHistoryVO;
	
	// nowPtBedStatusList 추가
	private String ptBedStatus;
	private String equipmentName;
	private String patientName;
	private Integer patientAge;
	private String patientSex;
	private String diseaseNmEn;
	private String empName;
	private String chartKey;
	private String patientKey;
	private String diseaseKey;
	
	private PtRoomVO ptRoomVO;
	private String receiptKey;
	private String ptName; 
	private String ptRecordCode;
	private Integer ptEquipmentKey;
	
	
}
