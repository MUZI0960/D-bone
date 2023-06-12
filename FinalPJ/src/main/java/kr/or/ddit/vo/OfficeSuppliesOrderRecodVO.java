package kr.or.ddit.vo;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Data
@EqualsAndHashCode(of = "recordKey")
@ToString
public class OfficeSuppliesOrderRecodVO {
	@NotNull
	private Integer recordKey; // 기록번호
	@NotNull
	private Integer suffliesKey; // 비품번호
	private Integer orderCount;  // 주문 수량
	@Size(max = 20)
	private String suppliesEa; // 단위
	private Integer suppliesPrice;  // 금액
	@Size(max = 30)
	private String orderRequester; // 발주 요청자
	private String orderDate;  // 발주 날짜
	
	private Integer suffliesReminder; // 남은개수 OfficeSuppliesVO.
	
	private String suffliesName; // OfficeSuppliesVO 비품명
	
	private OfficeSuppliesVO officeSupplies; // 1:n has many 관계
	
}
