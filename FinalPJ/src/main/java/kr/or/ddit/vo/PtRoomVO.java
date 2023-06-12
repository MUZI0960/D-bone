package kr.or.ddit.vo;

import java.io.Serializable;
import java.time.LocalDateTime;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "ptBedKey")
public class PtRoomVO implements Serializable{
	
	private Integer ptBedKey;
	private String ptBedStatus;
	private LocalDateTime ptBedStatusTime;
	private String orderKey;
	
	private Integer ptEquipmentKey;
}
