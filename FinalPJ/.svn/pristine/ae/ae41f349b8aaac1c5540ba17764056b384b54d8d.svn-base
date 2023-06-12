package kr.or.ddit.vo;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Data
@EqualsAndHashCode(of = "radRecode")
@ToString
public class RadiologyVO {
	private String radRecode; // 촬영기록물
	private String orderKey; // 오더 번호
	private Integer attGroupNo; // 파일 그룹번호
	private String radCont; // 의료진 코멘트
	
	private String orderKind;
	
	private LocalDate radRecordDate; // 촬영날짜
	private String radEmp; // 담당 의료진 RAD_EMP
	private String empName; // 진료차트 담당자이름..;
	private String radEmpName; // 촬영담당자 이름
	private AttatchFileGroupVO attachFileGroup;
	
	/*
	private MultipartFile[] files;
	public void setFiles(MultipartFile[] files) {
		if(files == null || files.length == 0) return;
		this.files = files;
		this.attachFileGroup = new AttatchFileGroupVO();
		attachFileGroup.setAttFileList(
				Arrays.stream(files)
				.filter((mf)->!mf.isEmpty())
				.map((mf)->new AttachVO(mf))
				.collect(Collectors.toList())
				);
	}*/
	private List<MultipartFile> addFiles; // 추가하려는 파일들
	
	public void setAddFiles(List<MultipartFile> addFiles, String targetURL) {
		this.addFiles = addFiles;
		log.info("addFiles = {}", addFiles);
		if(addFiles == null || addFiles.size() == 0) return;
		this.addFiles = addFiles; // 리스트로 받음...
		this.addFileGroup = new AttatchFileGroupVO();// 새로운 파일 그룹 생성
		List<AttachVO> attList = new ArrayList<AttachVO>(); // 파일 리스트 생성
		for (MultipartFile file : addFiles) {
			if(! file.isEmpty()) {
				log.info("file = ", file);
				AttachVO att = new AttachVO(file, targetURL);
				attList.add(att);
			}
		}
		addFileGroup.setAttFileList(attList);
	}
	private AttatchFileGroupVO addFileGroup; // 업로드하는
	private AttatchFileGroupVO delFileGroup;
	
	private OrderHistoryVO orderHistory;
}
