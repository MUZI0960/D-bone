package kr.or.ddit.vo;

import java.io.Serializable;
import java.util.List;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Data
@EqualsAndHashCode(of = "buyerKey")
@ToString
public class BuyerVO implements Serializable{
	@NotNull
	private Integer buyerKey;
	private String buyerName;
	private String buyerTel;
	private String buyerCharger;
	@Email
	private String buyerEmail;
	private String contractDate;
	private String buyerStatus;
	private String contractEndDate;
	private String buyerAddress;
	
	private List<OfficeSuppliesVO> officeSupplies; //1:1 has many 관계
}
