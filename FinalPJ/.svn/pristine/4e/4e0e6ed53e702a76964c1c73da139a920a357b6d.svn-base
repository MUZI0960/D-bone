package kr.or.ddit.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Data
@ToString
@EqualsAndHashCode(of = "payDetailKey")
public class PayDetailVO {
	private String payDetailKey;
	private Integer payKey;
	private String payKind;
	private Integer payCost; // 원 금액
	private Integer payCostPatient; // 환자 부담액 
	private Integer payCostAgency; // 공단 부담액 
	
	public Integer getPayCostAgency() {
		payCostAgency = payCost - payCostPatient;
		return payCostAgency;
	}

	private String payKindName;
	// 진료 내역 추가
	private String	chartKey;
	
	private String receiptKey;
	
	// 처방 비용
	private int prescritionCost;
	
	private PayVO pay;
	
	
}
