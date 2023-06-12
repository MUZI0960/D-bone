package kr.or.ddit.vo;

import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Data
@ToString
@EqualsAndHashCode(of = "patientKey")
public class PatientVO {
	private String patientKey;
	private String patientName;
	private Integer patientAge;
	private String patientSex;
	private Integer patientRegno1;
	private Integer patientRegno2;
	private String patientRegno; // 주민등록번호
	private String patientPn;
	private String patientAddress;
	private String patientAddressDetail;
	private String pAddress;
	private String patientType;
	private String patientTypeName; // 유림 추가
	private String patientSignificant;

	private PreDiagnosisVO preDiagnosis; // 1:1 has a 관계

	private GuardianVO guardian; // 1:1 has a 관계
	
	private ReceiptionVO receiption; // 1:n has many관계 - 정민
	private PayVO pay; // 정민
	private PayDetailVO payDetail; // 정민
	private DiseaseVO disease; // 정민
	private MedicalChartVO chart; // 정민
	private int rn;
	
	private WaitingHistoryVO historyVO; // 정민 수납대기환자 뽑기 위함 1:1 has a
	
	private List<PayVO> payList; 
	private List<ReceiptionVO> receiptionList; 
	
	private String hospitalizeRecordKey; // 유림 
	private String status; // 유림 
	private String preExaminationNote; // 유림
	private String empName; // 유림 
	private String surgeryName; // 유림 
}
