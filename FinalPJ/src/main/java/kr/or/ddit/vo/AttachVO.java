package kr.or.ddit.vo;

import java.io.File;
import java.io.IOException;
import java.io.Serializable;
import java.time.LocalDate;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Data
@EqualsAndHashCode(of = {"attGroupNo", "attNo"})
@NoArgsConstructor
public class AttachVO implements Serializable{
	private Integer attGroupNo; // 파일 그룹 넘버
	private Integer attNo; // 시퀀스
	private String attType; // 파일 타입
	private String orignName; // 원본 이름
	private String saveName; // 저장 이름
	private Long attSize; // 파일 크기
	private LocalDate attDate; // 업로드 날짜
	private String attPath; // 저장 경로
	
	@JsonIgnore
	private transient MultipartFile file;

	public AttachVO(MultipartFile file, String savePath) {
		super();
		this.file = file;
		attType = file.getContentType();
		orignName = file.getOriginalFilename();
		saveName = UUID.randomUUID().toString();
		attSize = file.getSize();
		attPath = savePath;
	}
	
	private File attachFile;
	
	public void saveTo(File saveFolder) throws IOException {
		if(file == null) return;
		file.transferTo(new File(saveFolder, saveName));
	}
}
