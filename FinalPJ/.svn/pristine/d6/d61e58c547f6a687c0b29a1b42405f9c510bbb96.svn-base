 package kr.or.ddit.medicalChart.service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.ddit.medicalChart.dao.MedicalChartDAO;
import kr.or.ddit.pay.dao.PayDAO;
import kr.or.ddit.radiology.dao.RadiologyDAO;
import kr.or.ddit.vo.CommonCodeVO;
import kr.or.ddit.vo.DiagnosisVO;
import kr.or.ddit.vo.DiseaseVO;
import kr.or.ddit.vo.GroupOrderPrescritionVO;
import kr.or.ddit.vo.GroupOrderVO;
import kr.or.ddit.vo.MedicalChartVO;
import kr.or.ddit.vo.MedicalEquipmentVO;
import kr.or.ddit.vo.OrderHistoryVO;
import kr.or.ddit.vo.PayDetailVO;
import kr.or.ddit.vo.PrescriptionVO;
import kr.or.ddit.vo.RadiologyVO;
import kr.or.ddit.vo.SurgeryKindVO;
import kr.or.ddit.vo.WaitingHistoryVO;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MedicalChartServiceImpl implements MedicalChartService {
	// dao 객체
	@Inject
	private MedicalChartDAO medicalChartDAO;
	@Inject
	private RadiologyDAO radiologyDAO;
	@Inject
	private PayDAO payDAO;
	
	
	//230503 이혜연------------------------------------------
	@Override
	public List<SurgeryKindVO> retrieveSurgeryKindList() {
		return medicalChartDAO.selectSurgeryKindList();
	}

	//230504 이혜연------------------------------------------
	@Override
	public List<DiseaseVO> retrieveDiseaseAllList() {
		return medicalChartDAO.selectDiseaseAllList();
	}

	//230506 이혜연------------------------------------------
	@Override
	public List<MedicalChartVO> retrieveMedicalChartList(String patientKey) {
		// 영상 오더 있는지 체크하기
		List<MedicalChartVO> preChartList = medicalChartDAO.selectMedicalChartList(patientKey);
		String radCheck = "";
		String receiptdone = ""; // 수행 완료체크
		
		//과거 수행내용을 조회해서.. 이번 진료차트인지 상태 체크...
		for (MedicalChartVO preChart : preChartList) {
			int radOrderCnt = 0;
			int radDoneCnt = 0;
			// 해당 차트의 접수키를 확인해서 접수가수행완료인지 체크...
			receiptdone = medicalChartDAO.selectReceiptstatus(preChart.getReceiptKey());
			log.info("접수상태 확인  = {}", receiptdone);
			if(receiptdone != null) {
				preChart.setReceiptStatus(receiptdone);
			}
			List<OrderHistoryVO> orderList =  preChart.getOrderHistoryList();
			if(orderList!= null || orderList.size() > 0) {
				for (OrderHistoryVO order : orderList) {
					if(order!=null) {
						if(order.getOrderKey() != null) {
							if(order.getOrderKind() != null) {
 								log.info("오더 종류 확인 : {}",order.getOrderKind() );
								if(order.getOrderKind().equals("O004") || order.getOrderKind().equals("O003")) {
									RadiologyVO rad = order.getRadiology(); // 영상촬영 오더객체 확인
									if(rad.getAttGroupNo() != null) {
										// 파일그룹번호가 있다면
										radCheck = "촬영오더 수행완료";
										radDoneCnt ++;
									}else {// 파일 그룹번호가 없으면
										radCheck = "촬영오더 수행필요";
										radOrderCnt ++;
									}
								}else {
  									radCheck = "촬영오더 없음";
								}
							}else {
								radCheck = "촬영오더 없음";
							}
						}else {
							radCheck = "촬영오더 없음";
						}
					}else {
						radCheck = "촬영오더 없음";
					}
					if(radOrderCnt > 0) radCheck = "촬영오더 수행필요";
					if(radDoneCnt > 0) radCheck = "촬영오더 수행완료";
					order.setRadOrderCheck(radCheck);
				}// for끝
			}else {
				radCheck = "촬영오더 없음";
			}
			if(radOrderCnt > 0) radCheck = "촬영오더 수행필요";
			if(radDoneCnt > 0) radCheck = "촬영오더 수행완료";
			preChart.setRadOrderCheck(radCheck);
		}
		log.info("서비스 반환 확인= {}", preChartList);
		return preChartList;
	}
	
	//230507 이혜연------------------------------------------
	@Override
	public List<MedicalEquipmentVO> retrieveMedicalEquipmentList() {
		return medicalChartDAO.selectMedicalEquipmentList();
	}

	@Override
	public List<CommonCodeVO> retrieveBodyPartList() {
		return medicalChartDAO.selectBodyPartList();
	}

	//230510 이혜연------------------------------------------
	@Override
	public List<WaitingHistoryVO> retrieveWaitingList(String officeKey) {
		// 진료 대기환자중 영상촬영 자료기 있는지 확인하기.
		List<WaitingHistoryVO> waitingList = medicalChartDAO.selectWaitingList(officeKey);
		for (WaitingHistoryVO waiting : waitingList) {
			String receiptKey = waiting.getReceiptKey(); 
			List<RadiologyVO> radList  = radiologyDAO.selectRadData(receiptKey);
			if(radList !=null || radList.size() >0) {
				String waitingStatusName ="";
				for (RadiologyVO rad : radList) {
//					log.info("받은 데이터 확인 rad : {}", rad);
					if(rad.getAttGroupNo() !=null) {
						waitingStatusName = "영상결과대기";
						waiting.setWaitingStatusName(waitingStatusName);
					}
				}
			}
		}
		return waitingList;
	}

	@Override // 차트번호 생성
	public String createChartNo() {
		String newChartNo = medicalChartDAO.createChartNo();
		return newChartNo;
	}
	
	public int insertMchartdata(Map<String, Object> inputMap) {// 차트 작성
		ObjectMapper mapper = new ObjectMapper();
		DiagnosisVO diagnosis = mapper.convertValue(inputMap.get("diagnosis"), DiagnosisVO.class);

		int cnt = 0;
		// reDisChart = 재진료환자인지 체크
		String reDisChart = (String) inputMap.get("reDisChart");
		// 차트 정보
		MedicalChartVO mChartVO = mapper.convertValue(inputMap.get("mChartVO"), MedicalChartVO.class);
		mChartVO.setChartCont(mChartVO.getChartCont().replace("\r\n", "<br>"));
		
		List<Map<String, String>> prescripList = (List<Map<String, String>>) inputMap.get("prescription");
		List<Map<String, String>> orderlist =  (List<Map<String, String>>) inputMap.get("orderHistory");
		
		List<PrescriptionVO> prescriptionList = mapper.convertValue(prescripList,mapper.getTypeFactory().defaultInstance().constructCollectionType(List.class,  PrescriptionVO.class));
		List<OrderHistoryVO> orderHistoryList = mapper.convertValue(orderlist,mapper.getTypeFactory().defaultInstance().constructCollectionType(List.class,  OrderHistoryVO.class));
		
		// 재진료시 삭제시킬 약품 목록
		List<Map<String, String>> delPrescriptionList = mChartVO.getDelChartPrescriptionList();
		List<Map<String, String>> delOrderList = mChartVO.getDelChartOrderList();
		
		RadiologyVO radiology = null;
		String chartNo = "";
		String location = "";
		log.info("재진료 확인 mChartVO = {}", mChartVO);
		if(reDisChart.equals("재진료")) {
			chartNo = mChartVO.getChartKey(); // 차트번호는 기존 차트번호로 셋팅
			cnt += medicalChartDAO.updateMChart(mChartVO); // 재진료시 변경된 차트 내용 저장
		}else {
			mChartVO.setChartKey(null); // 우선 프론트 단에서 넘어온 신규차트키는 null로 초기화
			cnt += medicalChartDAO.insertMChart(mChartVO); 
			chartNo = mChartVO.getChartKey();
		}  
		// 수납 상세 내역 객체
		PayDetailVO payDetail = new PayDetailVO();
		payDetail.setChartKey(chartNo);
		// 진단 등록 - 재진료 환자라면 update // 아니라먄 
		if(StringUtils.isNotBlank(diagnosis.getDiseaseKey())) {
			diagnosis.setChartKey(chartNo);
			if(reDisChart.equals("재진료")) {
				log.info("재진료 등록");
				// 재진료시 기존 진단 내역이 없으면 새로 등록한다.
				DiagnosisVO ckDis = medicalChartDAO.selectDiagnosis(chartNo);
				if(ckDis != null) {// 변경된 진단내역 update
					cnt += medicalChartDAO.updateDiagnosis(diagnosis);
				}else {// 기존에 등록된 내용 없으면 신규 등록
					log.info("기존에 등록된 내용 없으면  진단내역 신규 등록");
					cnt += medicalChartDAO.insertDiagnosis(diagnosis);
					// 재진료시 해당 차트키로 인한 진료수납내역이 없으면 새로 등록한다.
					PayDetailVO checkPayDetail = payDAO.selectPayDetailDiagnosis(chartNo);
					if(checkPayDetail == null) { 
						payDetail.setPayKind("PK01");
						cnt += payDAO.insertPayDetailForDiagnosis(payDetail);
					}
				}
			}else {// 신규진료 등록
				cnt += medicalChartDAO.insertDiagnosis(diagnosis);
				// 수납내역에 insert payKind = PK01(진찰료)- 차트키에 의한 접수키
				payDetail.setPayKind("PK01");
				cnt += payDAO.insertPayDetailForDiagnosis(payDetail);
			}
		}
		
		// 처방 리스트
		// 신규진료일경우, 최종진료일 경우 둘다 체크해서 비용 산정한다.
		int prescriptionCost = 0;
		int newPrescritionCost = 0; // 재진료시 재산정
		if(prescriptionList.size() > 0 || prescriptionList != null) {
			for (PrescriptionVO prescript : prescriptionList) {
				prescript.setChartKey(chartNo); // 해당 차트번호 셋팅..
				// 재진료인데 처방 키가 있으면 해당 비용 재산정
				if(reDisChart.equals("재진료")) {
					// 변동사항있는지 update...? // 삭제할 리스트가 있다면 delete...
					if(prescript.getPrescriptionKey() != null) { // 처방번호가 있으면 update
						cnt += medicalChartDAO.updatePrescription(prescript);
						// 삭제시킬 목록이 있는 경우
						if(delPrescriptionList !=null || delPrescriptionList.size() > 0) {
							for (Map<String, String> map : delPrescriptionList) {
								String delPrescripts = map.get("prescriptionKey");
								// 해당 처방 내역에서 찾아서 비용을 빼고 수납 내역update?insert
								cnt += medicalChartDAO.deletePrescription(delPrescripts);
							}
						}
						// 삭제시킨 이후에 남아있는 처방 리스트의 비용 산정
						newPrescritionCost += prescript.getPrescriptionCost();
					}else {// 처방번호가 없으면 추가 - 신규 추가하는 처방 내역 비용 추가
						cnt += medicalChartDAO.insertPrescription(prescript);
						newPrescritionCost += prescript.getPrescriptionCost();
					}
				}else {// 재진료가 아니라면 처방 비용 모두 산정하기
					prescriptionCost += prescript.getPrescriptionCost();
					cnt += medicalChartDAO.insertPrescription(prescript);
				}
			}
		}
		//----------수납 처리
		if(reDisChart.equals("재진료")) { // - 처방 내역이 있는경우
//			재진료시 수납내역에 처방 기록이 있다면 update
			PayDetailVO prescriptionPayDetail = payDAO.selectPayDetailPrescrition(chartNo);
			if(prescriptionPayDetail != null) { // 재산정한 비용 넣어주고 update
				prescriptionPayDetail.setPayCost(newPrescritionCost);
				cnt += payDAO.updatePrescritionPayDetail(prescriptionPayDetail);
			}else {
				if(prescriptionList.size() > 0 ) {
					// 차트번호에 의한 처방 수납내역이 없으면 신규 등록
					payDetail.setPayKind("PK03");
					payDetail.setPrescritionCost(newPrescritionCost);
					cnt += payDAO.insertPayDetailForPrescription(payDetail);
				}
			}
		}else {// 재진료가 아니라면 - 처방 내역이 있는경우
			if(prescriptionList.size() > 0) {
				payDetail.setPayKind("PK03");
				payDetail.setPrescritionCost(prescriptionCost);
				cnt += payDAO.insertPayDetailForPrescription(payDetail);
			}
		}
		
		
		int reOrdercntXray = 0;
		int reOrdercntMRI = 0;
		
		int countO001 = 0; // 물리치료 오더 확인
		int countO002 = 0; // 도수치료 오더 확인
		int countO003 = 0; // xray오더 확인
		int countO004 = 0; // MRI오더 확인
		int countO00S = 0; // 수술오더 확인
		
		if(orderHistoryList.size() == 0 || orderHistoryList ==null) {
			// 오더가 없다면 장소 수납실
			location = "L008"; 
		}else {
			// 오더가 있다면
			for (OrderHistoryVO order : orderHistoryList) {
				order.setChartKey(chartNo);
				String orderKind = order.getOrderKind();
				log.info("오더 종류 확인 : {}", orderKind);
				log.info("오더 확인 : {}", order);
					if(reDisChart.equals("재진료")) {// 재진환자인경우
						if(StringUtils.isNotBlank(order.getOrderKey())) {// 재진료 환자인데 기존 오더키가 있는경우 isnotblank
							if(orderKind.equals("O003")){
								log.info("엑스레이 오더 있으면 건너뛰기");
								reOrdercntXray++; continue;
							}else if (orderKind.equals("O004")) {
								reOrdercntMRI ++; continue;
							}else {
								// 엑스레이나 mri가 아니면 update 한다.
								cnt += medicalChartDAO.updateOrderHistory(order);
								// 삭제시킬 오더리스트가 있으면 삭제한다.
								if(delOrderList.size() > 0 || delOrderList != null) {
									for (Map<String, String> map : delOrderList) {
										String delOrders = map.get("orderKey");
										cnt += medicalChartDAO.deleteOrderHistory(delOrders);
									}
								}
							}
						}else {// 재진료환자인데 orderkey가 없으면 오더 신규 등록
							if(orderKind.equals("O003")){ // 영상학과 오더라면 continue
								continue;
							}else if (orderKind.equals("O004")) {
								continue;
							}else if(orderKind.equals("O001")) {
								countO001 ++;
							}else if(orderKind.equals("O002")) {
								countO002++;
							}
							cnt += medicalChartDAO.insertOrderHistory(order); 
							if(orderKind.startsWith("S")) { // 오더 내역이 수술로 시작하면 입원예약에 insert
								cnt += medicalChartDAO.insertWaitingHospitalzation(chartNo);
								countO00S ++; // 수술 오더 증가
							}
						}
					}else {// 재진환자가 아닌경우 - 오더 신규등록
						cnt += medicalChartDAO.insertOrderHistory(order); 
						if(orderKind.equals("O003")) {
							countO003 ++; // xray 오더수 증가
						}else if (orderKind.equals("O004")) {
							countO004 ++; // 신규진료 MRI오더 있는경우
						}
							
						if(orderKind.startsWith("S")) { // 오더 내역이 수술로 시작하면 입원예약에 insert
							cnt += medicalChartDAO.insertWaitingHospitalzation(chartNo);
							countO00S ++; // 수술 오더 증가
						}
					}// else 끝
					
					if(orderKind.equals("O001")) {
						countO001 ++; // 물리치료 오더있는경우 증가
					}else if (orderKind.equals("O002")) {
						countO002 ++; // 물리치료 오더있는경우 증가
					}
			}
		}// 오더 확인 끝
		if(reDisChart.equals("신규진료")) {
			log.info("신규진료시");
			if(countO001 > 0) { // 물리치료가 1이상인경우
				if(countO003 > 0 || countO004 > 0) {
					log.info("물리치료 오더 있고 신규진료인데  영상학과 있다면");
					location = "L005"; // 영상학과실 오더가 있다면 장소 영상학과실
				}else {// 영상학과 외 다른 오더가 있다면 장소
					log.info("영상학과 없도 다른 오더랑 있는경우");
					location = "L004";
				}
			}else if (countO002 > 0) { // 물리치료 오더가 없고 도수치료가 있다면
				if(countO003 > 0 || countO004 > 0) {
					log.info("도수 오더 있고 신규진료인데  영상학과 있다면");
					location = "L005"; // 영상학과실 오더가 있다면 장소 영상학과실
				}else {// 영상학과 외 다른 오더가 있다면 장소
					log.info("영상학과 없도 다른 오더랑 있는경우");
					location = "L006";
				}
			}else if (countO00S > 0) {// 물리치료/도수치료 없고 수술오더시..
				if(countO003 > 0 || countO004 > 0) {
					log.info("수술 오더 있고 신규진료인데  영상학과 있다면");
					location = "L005"; // 영상학과실 오더가 있다면 장소 영상학과실
				}else {// 영상학과 외 다른 오더가 있다면 장소
					log.info("영상학과 없고 수술오더");
					location = "L008";
				}
			}else if (countO003 > 0 || countO004 > 0) {
				log.info("영상학과만 있는경우");
				location = "L005";
			}
		}else {// 재진료인경우
			log.info("재진료시");
			if(countO001 > 0) { // 재진료인데 물리치료 오더가 있으면
				log.info("재진료인데 물리치료 오더가 있으면");
				location = "L004";
			}else if (countO002>0) { // 물리치료 없고 도수치료 있으면
				log.info("물리치료 없고 도수치료 있으면");
				location = "L006";
			}else if (countO00S > 0) { // 수술 예약 있다면
				log.info("물리치료 없고 도수치료 없고 수술");
				location = "L008";
			}else {// 그 외 다른 오더 없으면 수납실로
				location = "L008";
			}
		}
			
		cnt = updateWaitingHistory(chartNo, location);
		
		return cnt;
	}
	
	// 대기상태 히스토리 변경
	public int updateWaitingHistory(String chartNo,  String location) {
		String receiptKey =  medicalChartDAO.selectReceipKey(chartNo); // 접수번호 찾기
		WaitingHistoryVO waiting = new WaitingHistoryVO();
		waiting.setReceiptKey(receiptKey); // 접수키/장소
		int cnt = 0;

		waiting.setWaitingLocation(location); // 장소변경
		cnt += medicalChartDAO.updateWaitingStatus(waiting);
		
		log.info(" 대기상태 변경 장소 : {}", location);
		
		return cnt;
	}

	@Override
	public int createGroupOrder(GroupOrderVO groupOder) {
//		그룹오더 먼저 생성하고
		// 약품리스트
		int cnt = 0;
		int res = 0;
		boolean newCheck = false;
		
		if(groupOder != null) {
			String cont = groupOder.getGroupOrderContent(); // 그룹오더 설명
			cont.replace("\r\n", "<br>"); // 스페이스 치환
			groupOder.setGroupOrderContent(cont);
			ArrayList<GroupOrderPrescritionVO> groupPrescritionList = (ArrayList<GroupOrderPrescritionVO>) groupOder.getGroupOrderPrescritionList();
			log.info("서비스에서 받은 그룹오더처방 리스트 = {}", groupPrescritionList);
			log.info("서비스에서 받은 그룹오더 = {}", groupOder);
			
			List<Map<String, String>> delList =  groupOder.getDelPrescriptList();
			log.info("서비스에서 받은 삭제 약품리스트 = {}", delList);
			
			if(groupOder.getGroupOrderKey() == null) {// 신규등록
				newCheck = true;
				cnt = medicalChartDAO.insertGroupOrder(groupOder); // 그룹오더 번호 생성
				// 신규 처방 리스트 등록
				
			}else {
				log.info("서비스에서 받은 수정 그룹오더 = {}", groupOder);
				cnt = medicalChartDAO.updateGroupOrder(groupOder);
			}
			// 신규번호던 기존번호던 생성됨....
			if(groupPrescritionList != null || groupPrescritionList.size() > 0) {
				for (GroupOrderPrescritionVO groupPrescript : groupPrescritionList) {
					groupPrescript.setGroupOrderKey(groupOder.getGroupOrderKey());
					log.info("신규 그룹오더인지?: {}", newCheck);
					if(newCheck == true) { // 신규생성이면 insert
						res += medicalChartDAO.insertGroupOrderPrescript(groupPrescript);
					}else {// 수정이면 update
						if(groupPrescript.getGoPrescriptkey() != null) { //기존의 키값있는경우 update
							res += medicalChartDAO.updateGroupOrderPrescript(groupPrescript);
							if(delList !=null || delList.size() > 0) { // 삭제하려는약품번호가 있는경우
								for (Map<String, String> map : delList) {
									String delPrescripts =	map.get("goPrescriptkey");
									res += medicalChartDAO.deleteGroupOrderPrescript(delPrescripts);
								}
							}
						}else {// 기존의 약품 키값이 없으면 insert
							res += medicalChartDAO.insertGroupOrderPrescript(groupPrescript);
						}
						log.info("수정확인 횟수 {}: ",res );
					}
				}
			}
		}
		log.info("성공 횟수 : {}",res );
		return res;
	}

	@Override
	public int updateGroupOrder(GroupOrderVO groupOder) {
		return medicalChartDAO.updateGroupOrder(groupOder);
	}

	@Override
	public int deleteGroupOrder(int groupOrderKey) {
		int cnt = 0;
		if(groupOrderKey >= 0) {
			cnt += medicalChartDAO.deleteGroupOrderPrescriptTotal(groupOrderKey);
			cnt += medicalChartDAO.deleteGroupOrder(groupOrderKey);
			log.info("삭제 확인 : {}", cnt);
		}
		return cnt;
	}

	@Override
	public List<GroupOrderVO> getGroupOrderList(String empKey) {
		return medicalChartDAO.getGroupOrderList(empKey);
	}

	@Override
	public MedicalChartVO retrieveMedicalChartByOrderKey(String orderKey) {
		return medicalChartDAO.selectMedicalChartByOrderKey(orderKey);
	}
	
	
}
