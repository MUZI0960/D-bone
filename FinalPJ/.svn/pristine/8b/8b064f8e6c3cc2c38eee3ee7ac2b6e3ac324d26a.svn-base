package kr.or.ddit.therapy.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.therapy.dao.TherapyDAO;
import kr.or.ddit.vo.EquipmentStatusRecordVO;
import kr.or.ddit.vo.MedicalChartVO;
import kr.or.ddit.vo.MedicalEquipmentVO;
import kr.or.ddit.vo.OrderHistoryVO;
import kr.or.ddit.vo.PayDetailVO;
import kr.or.ddit.vo.PtEquipmentVO;
import kr.or.ddit.vo.PtRecordVO;
import kr.or.ddit.vo.PtRoomVO;
import kr.or.ddit.vo.ReceiptionVO;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class TherapyServiceImpl implements TherapyService {

	@Inject
	private TherapyDAO therapyDAO;
	
	@Override
	public List<ReceiptionVO> ptWaitingPatientList() {
		List<ReceiptionVO> list = therapyDAO.ptWaitingPatientList();
		return list;
	}

	@Override
	public List<MedicalEquipmentVO> ptEquipmentList() {
		List<MedicalEquipmentVO> list = therapyDAO.ptEquipmentList();
		return list;
	}

	@Override
	public MedicalEquipmentVO ptEquipmentDetail(int equipmentKey) {
		return therapyDAO.ptEquipmentDetail(equipmentKey);
	}

	@Override
	public List<EquipmentStatusRecordVO> ptEquipmentStatusList(int equipmentKey) {
		List<EquipmentStatusRecordVO> list = therapyDAO.ptEquipmentStatusList(equipmentKey);
		return list;
	}
	
	@Override
	public void ptEquipmentStatusInsert(EquipmentStatusRecordVO eqStatusRecVO) {
		int rowcnt = therapyDAO.ptEquipmentStatusInsert(eqStatusRecVO);
	}

	@Override
	public List<MedicalChartVO> ptEquipmentSelectList(String patientKey) {
		List<MedicalChartVO> list = therapyDAO.ptEquipmentSelectList(patientKey);
		return list;
	}

	@Override
	public List<PtRoomVO> ptRoomStatusSelect() {
		return therapyDAO.ptRoomStatusSelect();
	}

	@Override
	public void ptRoomStatusUpdate(PtRoomVO ptRoomVO) {
		int rowcnt = therapyDAO.ptRoomStatusUpdate(ptRoomVO);
		
		
	}

	@Override
	public void ptEuipmentStatusUpdate(PtEquipmentVO ptEquipmentVO) {	
		int rowcnt = therapyDAO.ptEuipmentStatusUpdate(ptEquipmentVO);
	}

	
	// 치료기록지 생성될 때가 치료 시작 시점이므로 대기 히스토리를 치료중으로 변경해준다.
	@Override
	public int ptRecordInsert(PtRecordVO prRecordVO, String receiptKey) {
		int rowcnt = therapyDAO.ptRecordInsert(prRecordVO);
		
		int res = 0;
		if(rowcnt>0) {
			res += therapyDAO.ptHistoryUpdate(receiptKey);
			log.info("대기 변경이 되었는지 확인 res = {} ", res);
		}
		return res;
	}
	
	
	// 침대 상태 리스트
	@Override
	public List<PtRoomVO> ptRoomSelectList() {
		List<PtRoomVO> list = therapyDAO.ptRoomSelectList();	
		
		return list;
	}

	@Override
	public List<PtRecordVO> nowPtBedStatusList() {
		return therapyDAO.nowPtBedStatusList();
	}

	@Override
	public PtRecordVO actingDetail(String orderKey) {
		return therapyDAO.actingDetail(orderKey);
	}

	
	// 코멘트 추가후 물리치료 기록지 업데이트 시, 환자 대기상태를 업데이트 해줘야 한다. 
	// 해당 환자의 오더 히스토리 가져와서 도수 있으면 도수치료실 대기중으로, 도수 오더가 없다면 수납실 대기중으로 대기상태 업데이트
	// 치료 종료하면서 수납 상세 내역을 추가해서 수납 데이터 만들어야한다.
	@Override
	public int actingCommentUpdate(PtRecordVO ptRecordVO, String receiptKey) {
		int rowcnt = therapyDAO.actingCommentUpdate(ptRecordVO); 	// 코멘트 추가로 액팅 업데이트 (치료 종료되는 end point)
		
		List<OrderHistoryVO> orderList = therapyDAO.orderKindSelectList(receiptKey);	// 해당 환자가 접수시 처방받은 오더목록 조회
		
		int res = 0;
		int pay = 0;
		for(OrderHistoryVO order : orderList) {
			String orderKind = order.getOrderKind();	// 오더종류
			log.info("orderKind : {} ", orderKind);
			if(orderKind.equals("O002")) {				// 오더종류 중 도수치료가 있다면
				res += therapyDAO.waitingLocationUpdateToMT(receiptKey);	// 도수치료 대기중으로 대기 히스토리 업데이트
				log.info("O002 있을 때 : {}", res);
				break;
			}else if(!orderKind.equals("O002")){		// 도수치료가 없다면
				res += therapyDAO.waitingLocationUpdateToRE(receiptKey);	// 수납실 대기중으로 히스토리 업데이트
				log.info("O002 없을 때 : {}", res);
			}
		}
		
		if(res>0) {	// 대기 히스토리 업데이트 되었다면
			PayDetailVO payDetail = new PayDetailVO();
			payDetail.setReceiptKey(receiptKey);
			pay += therapyDAO.ptPayDetailInsert(payDetail);		// 해당 접수키로 수납상세내역 추가 
		}
		
		return pay;
	}

	@Override
	public ReceiptionVO patientChartDetail(String orderKey) {
		return therapyDAO.patientChartDetail(orderKey);
	}

	@Override
	public PtRecordVO ptBedStatusDetail(String orderKey) {
		return therapyDAO.ptBedStatusDetail(orderKey);
	}

	@Override
	public List<MedicalEquipmentVO> ptEqStatusList() {
		return therapyDAO.ptEqStatusList();
	}

	@Override
	public List<PtEquipmentVO> nowPtEqStatusDetail(int equipmentKey) {
		return therapyDAO.nowPtEqStatusDetail(equipmentKey);
	}

	
	@Override
	public void ptEqDetailStatusUpdate(PtEquipmentVO ptEquipmentVO) {
		therapyDAO.ptEqDetailStatusUpdate(ptEquipmentVO);
	}

	@Override
	public void eqDetailStatusUpdate(MedicalEquipmentVO medicalEquipmentVO) {
		therapyDAO.eqDetailStatusUpdate(medicalEquipmentVO);
	}

	



}
