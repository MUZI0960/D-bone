package kr.or.ddit.vo;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import lombok.Data;

@Data
public class PreDiagnosisVO {
	@NotNull @Min(0) 
   private Integer preDiagnosisKey;
	private String preDiagnosisExperience;
	private String preDiagnosisDisease;
	private String preDiagnosisAllergy;
	private String preDiagnosisPregnancy;
	private String preDiagnosisChoice;
	private String preDiagnosisDate;
	@NotBlank@Size(max=50) 
	private String patientKey;
	
	private PatientVO patient;
}
