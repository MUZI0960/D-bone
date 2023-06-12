package kr.or.ddit.vo;

import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Data
@ToString
@EqualsAndHashCode(of = "payKey")
public class PayVO {
	private Integer payKey;
	private String receiptKey;
	private String hospitalizeRecordKey;
	private Integer payCheck;
	private String payDate;
	private Integer payTotalCost;
	
	private List<PayDetailVO> payDetailList;
	private PatientVO patient;
	private ReceiptionVO receiption;
	
	// 통계위해 추가
	private Integer sumCost;
	private Integer avgCost;
	
	private Integer payMonth;
}
