package kr.or.ddit.receipt.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.receipt.dao.ReceiptDAO;
import kr.or.ddit.vo.ReceiptionVO;
import kr.or.ddit.vo.WaitingHistoryVO;
import lombok.extern.slf4j.Slf4j;

@Service @Slf4j
public class ReceiptServiceImpl implements ReceiptService{
    @Inject
    private ReceiptDAO dao;

    @Override
    @Transactional
    public int insertWaiting(ReceiptionVO vo) {
        dao.insertWaiting(vo);
        WaitingHistoryVO waitingHistoryVO = new WaitingHistoryVO();
        // 대기상태 히스토리에 파라미터로 가져온 ReceiptionVO에서 값 꺼내와 넣어주기
        log.info("파라미터로 가져온 사무실키 {}",vo.getOfficeKey());
        waitingHistoryVO.setReceiptKey(vo.getReceiptKey());
        waitingHistoryVO.setWaitingLocation(vo.getOfficeKey());
        int cnt = dao.insertWaitingHistory(waitingHistoryVO);
        dao.insertPay(vo);	// 접수할 때 PAY테이블에 수납번호와 접수번호 insert하기
        return cnt;
    }

}

