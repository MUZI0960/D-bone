package kr.or.ddit.noticeBoard.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.noticeBoard.dao.NoticeBoardDAO;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.NoticeBoardVO;
import kr.or.ddit.vo.Pagination;
import kr.or.ddit.vo.PayVO;
import kr.or.ddit.vo.ReceiptionVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class NoticeBoardServiceImpl implements NoticeBoardService {

	@Inject
	private NoticeBoardDAO noticeDAO;
	
	@Override
	public void noticeBoardList(Pagination<NoticeBoardVO> pagination) {
		int totalRecord = noticeDAO.selectTotalRecord(pagination);
		pagination.setTotalRecord(totalRecord);
		
		List<NoticeBoardVO> list = noticeDAO.noticeBoardList(pagination);
		pagination.setDataList(list);
	}

	@Override
	public int noticeBoardInsert(NoticeBoardVO notice) {
		return noticeDAO.noticeBoardInsert(notice);
	}

	@Override
	public NoticeBoardVO noticeBoardDetail(int boardKey, EmpVO loginEmp) {
		NoticeBoardVO notice = noticeDAO.noticeBoardDetail(boardKey);
		if(! loginEmp.getEmpKey().equals(notice.getBoardWriter())) {
			// 로그인한 사람이 작성자와 같지 않다면 조회수 +1
			noticeDAO.updateNoticeBoardHit(boardKey);
		}
		return notice;
	}

	@Override
	public int noticeBoardModify(NoticeBoardVO noticeBoard) {
		String boardCont = noticeBoard.getBoardContent();
		log.info("내용 확인={}", boardCont);
		boardCont.replace("\n", "");
		int rowcnt = noticeDAO.noticeBoardUpdate(noticeBoard);
		return rowcnt;
	}

	@Override
	public int noticeBoardRemove(int boardKey) {
		return noticeDAO.noticeBoardDelete(boardKey);
		
	}

	/**
	 * 월별 방문자 통계를 위한 데이터
	 */
	@Override
	public List<ReceiptionVO> chartMonthVisitData() {
		return noticeDAO.chartMonthVisitData();
	}

	/**
	 * 월별 매출액 통계 위한 데이터
	 */
	@Override
	public List<PayVO> chartMonthPayData() {
		return noticeDAO.chartMonthPayData();
	}

}
