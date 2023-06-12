package kr.or.ddit.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of="hospitalizeRecordKey")
public class HospitalizeRecordVO {
	
	private String hospitalizeRecordKey;
	private String patientKey;
	private Integer wardBedKey;
	private String orderKey;
	private String hospitalizeDoctorKey;
	private String doctorName;
	private String checkInDate;
	private String checkOutDate;
	private String barcode;
	private String status;
	private String expectedCheckOutDate;
	
	private PatientVO patient; // 입원 환자 정보(부모)
	private Integer wardKey; // 호실 번호 

}
