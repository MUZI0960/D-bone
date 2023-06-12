package kr.or.ddit.vo;

import java.io.Serializable;

import lombok.Data;
import lombok.EqualsAndHashCode;
@Data
@EqualsAndHashCode(of = "surgeryKindKey")
public class SurgeryKindVO implements Serializable {
	private int rnum;
	
	private String surgeryKindKey; // 오더번호
	private String surgeryKindName; // 수술명칭
	private Integer surgeryKindPrice; // 비용
	private Integer surgeryHospitalizeAvg; // 평균입원일
}
