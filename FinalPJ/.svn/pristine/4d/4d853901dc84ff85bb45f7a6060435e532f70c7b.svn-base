package kr.or.ddit.mTherapy.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mTherapy.dao.MTherapyDAO;
import kr.or.ddit.vo.MtRecordVO;
import kr.or.ddit.vo.PayDetailVO;
import kr.or.ddit.vo.ReceiptionVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MTherapyServiceImpl implements MTherapyService {

	@Inject
	private MTherapyDAO mTherapyDAO;
	
	
	@Override
	public List<ReceiptionVO> mtWaitingPatientList() {
		return mTherapyDAO.mtWaitingPatientList();
	}


	@Override
	public ReceiptionVO patientChartDetail(String orderKey) {
		return mTherapyDAO.patientChartDetail(orderKey);
	}

	// 기록지 생성과 함께 대기상태 치료중으로 업데이트한다.
	@Override
	public int mtRecordInsert(MtRecordVO mtRecordVO, String receiptKey) {
		int cnt = mTherapyDAO.mtRecordInsert(mtRecordVO);
		
		int res = 0;
		if(cnt>0) {
			res += mTherapyDAO.mtHistoryUpdate(receiptKey);
			log.info("대기 변경이 되었는지 확인 res = {} ", res);
		}
		return res;
	}


	@Override
	public void mtRecordAssessUpdate(MtRecordVO mtRecordVO) {
		int cnt = mTherapyDAO.mtRecordAssessUpdate(mtRecordVO);
	}


	@Override
	public ReceiptionVO mtStartPatientInfoDetail(String orderKey) {
		return mTherapyDAO.mtStartPatientInfoDetail(orderKey);
	}


	@Override
	public void mtAssessmentUpdate(MtRecordVO mtRecordVO) {
		int cnt = mTherapyDAO.mtAssessmentUpdate(mtRecordVO);
	}


	@Override
	public void mtPlanUpdate(MtRecordVO mtRecordVO) {
		int cnt = mTherapyDAO.mtPlanUpdate(mtRecordVO);
		
	}

	// 코멘트 업데이트 되면 치료가 종료되었다는 뜻이므로 수납 대기로 상태 변경 해준다.
	// 수납 내역도 추가해줘야한다.
	@Override
	public int mtCommentUpdate(MtRecordVO mtRecordVO, String receiptKey) {
		int cnt = mTherapyDAO.mtCommentUpdate(mtRecordVO);
		
		int pay = 0;
		int res = 0;
		if(cnt > 0) {
			res += mTherapyDAO.waitingLocationUpdateToRE(receiptKey);
			if(res>0) {
				log.info("수납 상세 확인");
				PayDetailVO payDetail = new PayDetailVO();
				payDetail.setReceiptKey(receiptKey);
				pay += mTherapyDAO.mtPayDetailInsert(payDetail);
			}
		}
		
		return pay;
		
	}


	@Override
	public List<MtRecordVO> mtChartDataList(String patientKey) {
		return mTherapyDAO.mtChartDataList(patientKey);
	}


	@Override
	public List<MtRecordVO> mtRecHistoryList(String patientKey) {
		return mTherapyDAO.mtRecHistoryList(patientKey);
	}

	
}
