package kr.or.ddit.vo;

import java.io.Serializable;
import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;
@Data
@EqualsAndHashCode(of = "diagnosisKey")
public class DiagnosisVO implements Serializable{
	private String diagnosisKey; // 진단내역 번호
	private String chartKey; // 차트번호
	private String diseaseKey; // 상병코드
	
	// 부모테이블 has a 관계
	DiseaseVO diease; // 상병코드 종류 테이블
	
	// 자식테이블 has many관계 medicalChart
	private List<MedicalChartVO> MedicalChartList;
	
}
