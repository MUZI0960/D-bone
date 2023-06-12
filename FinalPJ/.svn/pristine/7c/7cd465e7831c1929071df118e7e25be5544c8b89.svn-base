package kr.or.ddit.vo;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Data
@EqualsAndHashCode(of = "waitingKey")
@ToString
public class WaitingHistoryVO implements Serializable{

	private Integer waitingKey;			// 대기상태번호(시퀀스)
	private String receiptKey;			// 접수테이블의 접수번호
	private String waitingChangeTime;	// 변동시간(sysdate)
	private String waitingLocation;		// 병과번호(접수테이블의 진료실번호와 같음)
	private String waitingStatus;		// 접수상태(공통코드 ex: L001
	
	private String waitingLocationName; // C1 CODE 대기장소
	private String waitingStatusName;	// C2 대기 상태
	private String officeKeyName;		// C3 진료실
	private String ReceiptStatusName;	// C4 접수 상태
	
	private ReceiptionVO receipt; // 부모테이블 - 접수테이블
	private List<Map<String, String>> radOrder ;
}
