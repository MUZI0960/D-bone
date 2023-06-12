package kr.or.ddit.receipt.dao;

import kr.or.ddit.vo.ReceiptionVO;
import kr.or.ddit.vo.WaitingHistoryVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReceiptDAO {
    // 정민

    /**
     * 대기환자 목록 인서트하기!
     * @param vo
     */
    public int insertWaiting(ReceiptionVO vo);


    /**
     * 대기환자목록 insert할 때 WAITING_HISTORY도 같이 insert하기
     */
    public int insertWaitingHistory(WaitingHistoryVO vo);
    
    
    /**
     * 접수할 때 PAY테이블에 수납번호와 접수번호 insert하기
     * @return
     */
    public int insertPay(ReceiptionVO vo);


	public int updateReceiptStatus(String receiptKey);
}
