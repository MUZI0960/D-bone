package kr.or.ddit.attach.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.AttatchFileGroupVO;

/**
 * 첨부된 형태의 파일 데이터를 관리하기 위한 Persistence Layer
 *
 */
@Mapper
public interface AttachFileGroupDAO {
	
	/**
	 * 파일 그룹 등록
	 * @param fileGroup
	 * @return
	 */
	public int insertAttachFileGroup(AttatchFileGroupVO fileGroup);
	
	/**
	 * 파일 1개 조회
	 * @param fileGroupNo
	 * @return
	 */
	public AttachVO selectAttachFile(int fileGroupNo);


	/**
	 * 파일 리스트 조회
	 * @param fileGroupNo
	 * @return
	 */
	public AttatchFileGroupVO selectFileList(int fileGroupNo);
	
	/**
	 * 파일 수정(프로필)
	 * @param attFile
	 * @return
	 */
	public int updateAttachFileGroupForEmpProfil(AttachVO attFile);
	
	/**
	 * 파일 삭제
	 * @param fileGroupNo
	 * @return
	 */
	public int deleteAttachFile(int fileGroupNo);
	
	/**
	 * 파일 그룹번호 삭제
	 * @param fileGroupNo
	 * @return
	 */
	public int deleteAttachFileList(int fileGroupNo);
}
