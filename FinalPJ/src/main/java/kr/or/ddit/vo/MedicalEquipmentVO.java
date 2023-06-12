package kr.or.ddit.vo;

import java.io.Serializable;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "equipmentKey")
public class MedicalEquipmentVO implements Serializable{
	private Integer equipmentKey;
	private String equipmentName;
	private Integer buyerKey;
	private String equipmentLocation;
	private String equipmentModel;	
	private String equipmentStatus;
	
	// 자식테이블 - 장비상태 기록
	private EquipmentStatusRecordVO eqStatusRecVO;
	
	// 자식테이블 - 물리치료 장비
	private PtEquipmentVO ptEquipmentVO;
	
	// 지연 추가 ------------------------
	private String ptEquipmentCode;
	private String ptEquipmentStatus;
	//--------------------------------
	
	// 부모테이블 - 거래처 테이블
	private BuyerVO buyerVO;

	
}
