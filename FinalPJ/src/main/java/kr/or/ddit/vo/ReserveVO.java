package kr.or.ddit.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReserveVO {
	private String scheduleKey;
	private String patientKey;
	private Integer wardBedKey;
	private String appointmentDate;
	private String appintmentCharger;
}
