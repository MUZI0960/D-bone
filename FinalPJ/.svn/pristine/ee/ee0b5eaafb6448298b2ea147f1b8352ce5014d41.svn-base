package kr.or.ddit.noticeBoard.service;

import java.util.List;

import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.NoticeBoardVO;
import kr.or.ddit.vo.Pagination;
import kr.or.ddit.vo.PayVO;
import kr.or.ddit.vo.ReceiptionVO;

public interface NoticeBoardService {
	
	/**
	 * 공지 게시판 리스트 조회
	 */
	public void noticeBoardList(Pagination<NoticeBoardVO> pagination);
	
	/**
	 * 공지 게시판 게시물 작성
	 * @param notice
	 * @return TODO
	 */
	public int noticeBoardInsert(NoticeBoardVO notice);
	
	/**
	 * 공지 게시판 게시물 상세조회
	 * @param boardKey
	 * @param loginEmp TODO
	 * @return
	 */
	public NoticeBoardVO noticeBoardDetail(int boardKey, EmpVO loginEmp);
	
	/**
	 * 공지 게시판 게시물 수정
	 * @param noticeBoard
	 * @return TODO
	 */
	public int noticeBoardModify(NoticeBoardVO noticeBoard);
	
	/**
	 * 공지 게시판 게시물 삭제
	 * @param boardKey
	 * @return TODO
	 */
	public int noticeBoardRemove(int boardKey);
	
	public List<ReceiptionVO> chartMonthVisitData();
	
	public List<PayVO> chartMonthPayData();
	
	
}
