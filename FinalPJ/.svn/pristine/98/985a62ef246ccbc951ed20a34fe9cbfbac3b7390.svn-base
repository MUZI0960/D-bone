package kr.or.ddit.attach.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Optional;

import javax.inject.Inject;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Service;

import kr.or.ddit.attach.dao.AttachFileGroupDAO;
import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.AttatchFileGroupVO;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class AttachFileGroupServiceImpl implements AttachFileGroupService {
	@Inject
	private AttachFileGroupDAO attachFileGroupDAO;
	

	@Override
	public int insertAttachFileGroup(AttatchFileGroupVO fileGroup, File saveFolder) {
		log.info("fileGroup 데이터 확인 ={}", fileGroup);
		log.info("saveFolder 데이터 확인 ={}", saveFolder);
		int rowCnt = Optional.ofNullable(fileGroup.getAttFileList())
							.filter((afl)->!afl.isEmpty())
							.map((afl)-> attachFileGroupDAO.insertAttachFileGroup(fileGroup))
							.orElse(0);
		if(rowCnt>0) {
			processAttatchFileGroupBinary(fileGroup, saveFolder);
		}
		return rowCnt;
	}
	// 지정된 경로에 저장하는 process Method
	private void processAttatchFileGroupBinary(AttatchFileGroupVO fileGroup, File saveFolder) {
		fileGroup.getAttFileList().stream()
				.forEach((af)->{  
					try {
						af.saveTo(saveFolder);
					}catch (IOException e) { throw new RuntimeException(e); }
		});
	}
	

	@Override// 이거 사용안함..
	public AttachVO selectAttachFile(int fileGroupNo) {
		return attachFileGroupDAO.selectAttachFile(fileGroupNo);
	}

	@Override// 파일 리스트 조회할 때 사용
	public AttatchFileGroupVO selectFileList(int fileGroupNo) {
		return attachFileGroupDAO.selectFileList(fileGroupNo);
	}
	// 프로필 사진수정
	@Override
	public int updateAttachFileGroupForEmpProfil(AttatchFileGroupVO attFileGroup, File saveFolder) {
		log.info("fileGroup 데이터 확인 ={}", attFileGroup);
		// 이미 저장하려는 새로운 이름이 있음..
		AttachVO orignAtt = attachFileGroupDAO.selectAttachFile(attFileGroup.getAttGroupNo());
		
		log.info("saveFolder 데이터 확인 ={}", saveFolder);
		List<AttachVO> fileList = attFileGroup.getAttFileList();
		int cnt = 0;
		if(fileList != null | fileList.size() > 0) {// 파일 리스트가 있다면
			for (AttachVO attFile : fileList) {
				// 파일 그룹번호에 따른 내용 수정
				processDeleteOrignAttFile(orignAtt,saveFolder);// 기존 파일을 삭제하고
				attFile.setAttGroupNo(attFileGroup.getAttGroupNo());
				log.info("변경하려는 파일 확인={}",attFile );
				cnt = attachFileGroupDAO.updateAttachFileGroupForEmpProfil(attFile);
			}
			
		}
		if(cnt>0) {// DB에 수정하면 파일 저장
			processAttatchFileGroupBinary(attFileGroup, saveFolder);
		}
		return cnt;
	}
	// 기존 파일 삭제하는 프로세스
	private void processDeleteOrignAttFile(AttachVO attOrignFile, File saveFolder) {
		if(attOrignFile != null) {
			FileUtils.deleteQuietly(new File(saveFolder, attOrignFile.getSaveName()));
		}
	}
	@Override
	public int deleteAttachFile(int fileGroupNo, File saveFolder) {
		// 파일 그룹번호로 파일 정보 찾은 후 db 데이터 삭제
		AttachVO orignAtt = attachFileGroupDAO.selectAttachFile(fileGroupNo);
		int cnt = attachFileGroupDAO.deleteAttachFile(fileGroupNo);
		if(orignAtt != null) {
			processDeleteOrignAttFile(orignAtt,saveFolder);
		}
		// 폴더에서 원본 파일 삭제
		return cnt;
	}
	


}
