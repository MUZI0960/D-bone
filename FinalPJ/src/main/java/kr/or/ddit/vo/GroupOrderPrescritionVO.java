package kr.or.ddit.vo;

import java.io.Serializable;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Data
@EqualsAndHashCode(of = "goPrescriptkey")
@ToString
public class GroupOrderPrescritionVO implements Serializable {
	private String goPrescriptkey; // 시퀀스번호
	private Integer groupOrderKey; // 그룹오더 번호
	private String goPrescriptionNo; //약품번호
	
	// 부모테이블 그룹오더 테이블
	GroupOrderVO groupOrder;
	
}
