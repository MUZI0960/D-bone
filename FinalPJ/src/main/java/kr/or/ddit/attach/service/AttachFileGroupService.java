package kr.or.ddit.attach.service;

import java.io.File;

import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.AttatchFileGroupVO;

public interface AttachFileGroupService {
	/**
	 * 파일 그룹 등록
	 * @param fileGroup
	 * @return
	 */
	public int insertAttachFileGroup(AttatchFileGroupVO fileGroup, File saveFolder);
	
	/**
	 * 파일 1개 조회
	 * @param fileGroupNo
	 * @return
	 */
	public AttachVO selectAttachFile(int fileGroupNo);


	/**
	 * 파일 리스트 조회 => 이거 사용함..
	 * @param fileGroupNo
	 * @return
	 */
	public AttatchFileGroupVO selectFileList(int fileGroupNo);

	
	/**
	 * 파일 수정(프로필)
	 * @param attFileGroup
	 * @param saveFolder TODO
	 * @return
	 */
	public int updateAttachFileGroupForEmpProfil(AttatchFileGroupVO attFileGroup, File saveFolder);
	
	
	/**
	 * 파일 삭제(프로필)
	 * @param fileGroupNo
	 * @param saveFolder TODO
	 * @return
	 */
	public int deleteAttachFile(int fileGroupNo, File saveFolder);
}
