package kr.or.ddit.vo;

import java.io.Serializable;
import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;
@Data
@EqualsAndHashCode(of = "diseaseKey")
@ToString(exclude = "diseaseNmEn")
public class DiseaseVO implements Serializable{
	private String diseaseKey; // 상병코드
	private String diseaseNmKr; // 상병코드 한글
	private String diseaseNmEn; // 상병코드 영문
	
	// 자식테이블 - 진단내역테이블
	private List<DiagnosisVO> diagonsisList;
}
