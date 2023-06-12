package kr.or.ddit.vo;

import java.util.List;

import javax.validation.constraints.NotNull;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Data
@EqualsAndHashCode(of = "suffliesKey")
@ToString
public class OfficeSuppliesVO {
	@NotNull
	private String suffliesKey; // 비품번호
	private String suffliesName; // 비품명
	@NotNull
	private Integer buyerKey; // 거래처 번호
	private String buyerName; // 거래처 명
	private String suffliesStandard; // 규격
	private Integer suffliesReminder; // 남은 수량
	private String locationKey; // 병과번호
	private Integer suffliesCost; // 가격
	
	private BuyerVO buyer;
	
	private List<OfficeSuppliesOrderRecodVO> officeSuppliesOrderRecod; // 1:n has many 관계
}
