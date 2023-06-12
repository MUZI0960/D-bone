package kr.or.ddit.vo;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Data
@EqualsAndHashCode(of = "chartKey")
@ToString
public class MedicalChartVO implements Serializable{
	private String chartKey; // 차트번호
	private String receiptKey; // 접수번호
	private String patientKey; // 환자번호
	private String empKey; // 의사번호
	
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private LocalDate chartDate; // 작성날짜
	private String chartCont; // 내용
	
	// 부모테이블 - 진단내역테이블
	private DiagnosisVO dianosis;
	
	// 자식-처방내역테이블
	private List<PrescriptionVO> prescriptList;
	
	// 자식-오더내역테이블
	private List<OrderHistoryVO> orderHistoryList;
	
	// 자식테이블 - 오더내역테이블
	private List<OrderHistoryVO> orderHistoryVO;
	
	// 지연추가 -------------------------------------
	private String bodyName;
	private String equipmentName;
	private String ptEquipmentCode;
	private String equipmentStatus;
	private String ptEquipmentStatus;
	
	private String orderKey;
	private Integer equipmentKey;
	private Integer ptEquipmentKey;
	

	
	
	private String patientName;
	// -------------------------------------------
	private String radOrderCheck;	
	
	private String receiptStatus; // 해당차트가 수행 완료된 상태인지 체크
	// 촬영오더 후 재진료시 삭제되는 약품목록이있다면...
	private List<Map<String, String>> delChartPrescriptionList;
	private List<Map<String, String>> delChartOrderList;
	
	
	// 유림 추가
	private String diseaseName; // 진단명 
	private String orderName; // 수술명 
	private String empName; // 의사명 
	
	
}
