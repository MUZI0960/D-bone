package kr.or.ddit.vo;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Data
@EqualsAndHashCode(of = "groupOrderKey")
@ToString
public class GroupOrderVO implements Serializable{
	private Integer groupOrderKey;
	private String groupOrderName;
	private String empKey;
	private String groupOrderContent;
	private String diseaseKey;
	
	private List<Map<String, String>> delPrescriptList;
	// 자식테이블 - 그룹오더 처방 
	private List<GroupOrderPrescritionVO> groupOrderPrescritionList;
	// 1:1관계 질병 테이블			      
	private DiseaseVO disease;
}
