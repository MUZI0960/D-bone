package kr.or.ddit.vo;

import java.io.Serializable;
import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;
@Data
@EqualsAndHashCode(of = "orderKey")
@ToString
public class OrderHistoryVO implements Serializable{
	private String orderKey;
	private String chartKey;
	private String orderKind;
	private String bodyPartKey;
	private Integer equipmentKey;
	private String equipmentName;
	
	// 유림 추가
	private String orderName; // 오더 종류이름 
	
	private String radOrderCheck;
	
	private RadiologyVO radiology; //영상학과 자료 1 : 1관계
	
	// 김지연 추가 ----------------------------
	private List<PtRecordVO> ptRecordList;
	private Integer ptRecordKey;
	private MedicalChartVO medicalChartVO;
	// -------------------------------------
	
}
