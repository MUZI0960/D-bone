package kr.or.ddit.vo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Data
@NoArgsConstructor
@AllArgsConstructor
public class EmpVO implements Serializable{
	@EqualsAndHashCode.Include
	private String empKey;
	private String empId;
	@ToString.Exclude
	private String empPass;
	private String empName;
	private Integer empAge;
	private String empJob;
	private String tempRegno;
	private Integer empRegno1;
	@ToString.Exclude
	private Integer empRegno2;
	private String empPhone;
	private String empAddr;
	private String empAddrDetail;
	private String empHireDate;
	private String empRetireDate;
	private String empRetireCheck;
	private Integer empFileGroupNo; // 파일그룹번호
	private Integer empLicenseNo;
	
	private MultipartFile imageFile;
	
	public void setImageFile(MultipartFile imageFile ,String targetURL) {
		this.imageFile = imageFile;
		log.info("이미지 파일 셋팅");
		log.info("imageFile 데이터 확인 ={}", imageFile);
		this.addFileGroup = new AttatchFileGroupVO();
		AttachVO attach = null;
		List<AttachVO> attList = new ArrayList<AttachVO>();
		if(imageFile == null) {
			return;
		}else {
			log.info("imageFile 데이터 확인 ={}", imageFile);
			log.info("targetURL 데이터 확인 ={}", targetURL);
			attach = new AttachVO(imageFile,targetURL );
			attList.add(attach);
		}
		addFileGroup.setAttFileList(attList);
		log.info("addFileGroup 데이터 확인 ={}", addFileGroup);
	}
	
	private AttatchFileGroupVO addFileGroup;
	
	private String empRole; 
	
	// 진료실 office
	private String code;
	private String codeName;
	private String officeKey;
	private String officeName;
	
	
	
}