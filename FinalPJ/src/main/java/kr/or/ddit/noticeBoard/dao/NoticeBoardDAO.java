package kr.or.ddit.noticeBoard.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.NoticeBoardVO;
import kr.or.ddit.vo.Pagination;
import kr.or.ddit.vo.PayVO;
import kr.or.ddit.vo.ReceiptionVO;

@Mapper
public interface NoticeBoardDAO {
	
	/**
	 * 공지사항 게시판 게시물 리스트 조회
	 * @return
	 */
	public List<NoticeBoardVO> noticeBoardList(Pagination<NoticeBoardVO> pagination);
	
	
	/**
	 * 페이징 처리 위한 TotalRecord 조회용
	 * @param pagination
	 * @return int
	 */
	public int selectTotalRecord(Pagination<NoticeBoardVO> pagination);
	
	
	/**
	 * 공지사항 게시판 게시물 작성
	 * @param noticeBoard
	 * @return int
	 */
	public int noticeBoardInsert(NoticeBoardVO noticeBoard);
	
	/**
	 * 공지사항 게시물 상세 조회
	 * @param boardKey
	 * @return NoticeBoardVO
	 */
	public NoticeBoardVO noticeBoardDetail(int boardKey);
	
	/**
	 * 공지사항 게시물 수정
	 * @param noticeBoard
	 * @return
	 */
	public int noticeBoardUpdate(NoticeBoardVO noticeBoard);
	
	
	/**
	 * 공지사항 게시물 삭제
	 * @param boardKey
	 * @return 
	 */
	public int noticeBoardDelete(int boardKey);

	/**
	 * 공지사항 조회수
	 * @param boardKey
	 * @return
	 */
	public int updateNoticeBoardHit(int boardKey);
	
	
	
	/**
	 * 월별 방문자 통계
	 * @return List<ReceiptionVO>
	 */
	public List<ReceiptionVO> chartMonthVisitData();
	
	
	/**
	 * 월별 매출액 통계
	 * @return
	 */
	public List<PayVO> chartMonthPayData();
	
}
