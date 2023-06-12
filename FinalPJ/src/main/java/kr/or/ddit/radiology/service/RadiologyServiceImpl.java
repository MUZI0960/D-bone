package kr.or.ddit.radiology.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.or.ddit.attach.service.AttachFileGroupService;
import kr.or.ddit.medicalChart.dao.MedicalChartDAO;
import kr.or.ddit.pay.dao.PayDAO;
import kr.or.ddit.radiology.dao.RadiologyDAO;
import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.AttatchFileGroupVO;
import kr.or.ddit.vo.MedicalChartVO;
import kr.or.ddit.vo.OrderHistoryVO;
import kr.or.ddit.vo.PayDetailVO;
import kr.or.ddit.vo.RadiologyVO;
import kr.or.ddit.vo.WaitingHistoryVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class RadiologyServiceImpl implements RadiologyService {
	
	@Inject
	private RadiologyDAO radiologyDAO;
	@Inject
	private MedicalChartDAO medicalChartDAO;
	@Inject
	private PayDAO payDAO;
	
	@Inject
	private AttachFileGroupService attachFileGroupService;

	@Override
	public List<WaitingHistoryVO> retrieveWaitingList() {
		List<WaitingHistoryVO> list = radiologyDAO.selectWaitingList();
		Map<String, String> xrayOrder = new HashMap<String, String>();
		Map<String, String> MRIOrder = new HashMap<String, String>();
		
		if(list != null) {
			for (WaitingHistoryVO waiting : list) {
				List<Map<String, String>> orderKindList = new ArrayList<Map<String,String>>();
				List<MedicalChartVO> mchartList = waiting.getReceipt().getMChartList();
				if(mchartList.size() > 0 || mchartList !=null) {
					for (MedicalChartVO mChart : mchartList) {
						List<OrderHistoryVO> orderList =  mChart.getOrderHistoryList();
						if(orderList.size() > 0 || orderList !=null) {
							for (OrderHistoryVO order : orderList) {
								if(order.getOrderKind().equals("O003")) {
									xrayOrder.put("orderKind", "xRay");
									orderKindList.add(xrayOrder);
								}else if(order.getOrderKind().equals("O004")) {
									MRIOrder.put("orderKind", "MRI");
									orderKindList.add(MRIOrder);
								}else { continue; }								
							}
						}
					}
				}
				waiting.setRadOrder(orderKindList);
			}
		}
		return list;
	}

	@Override
	public RadiologyVO retrieveRadiology(String orderKey) {
		return radiologyDAO.selectRadiology(orderKey);
	}
	
	//-------------파일 조회
	@Override
	public List<AttachVO> viewData(int attGroupNo) {
		AttatchFileGroupVO fileGroup = attachFileGroupService.selectFileList(attGroupNo);
		List<AttachVO> fileList = fileGroup.getAttFileList();
		return fileList;
	}
	
	// 파일타입
	@Value("#{appInfo.xRayFolder}")
	private File saveXrayFolder;
	@Value("#{appInfo.MRIFolder}")
	private File saveMRIFolder;
	
	// URL경로
	@Value("#{appInfo.xRayURL}")
	private String XrayfolderURL;
	@Value("#{appInfo.MRIURL}")
	private String MRIfolderURL; 
	
	
	private String targetURL = "";
	private File targetSaveFolder = null;	
	
	//----xray파일 업로드
	@Override
	public int createxrayData(MultipartHttpServletRequest req) {
		String xRayradCont = req.getParameter("xRayradCont").replace("\r\n", "<br>");
		String MRIradCont = req.getParameter("MRIradCont").replace("\r\n", "<br>");
		String xRayorderKey = req.getParameter("xRayorderKey");
		String MRIorderKey = req.getParameter("MRIorderKey");
		String xRayOrderKind = req.getParameter("xRayOrderKind");
		String MRIorderKind = req.getParameter("MRIorderKind");
		String radEmp = req.getParameter("radEmp");
		String receiptKey = req.getParameter("receiptKey");
		
		RadiologyVO xRayradiology = new RadiologyVO();
		RadiologyVO MRIradiology = new RadiologyVO();
		List<RadiologyVO> radList = new ArrayList<RadiologyVO>();
		List<MultipartFile> xrayMulti = req.getFiles("xrayFile");
		List<MultipartFile> MRIMulti = req.getFiles("MRIFile");
		
		if(StringUtils.isNotBlank(xRayorderKey)) {// 엑스레이 오더시
			xRayradiology.setOrderKey(xRayorderKey);
			xRayradiology.setRadCont(xRayradCont);
			xRayradiology.setRadEmp(radEmp);
			xRayradiology.setOrderKind(xRayOrderKind);
			xRayradiology.setAddFiles(xrayMulti, XrayfolderURL);
			radList.add(xRayradiology);
		}
		if (StringUtils.isNotBlank(MRIorderKey)) {// MRI 오더시
			MRIradiology.setOrderKey(MRIorderKey);
			MRIradiology.setRadCont(MRIradCont);
			MRIradiology.setRadEmp(radEmp);
			MRIradiology.setOrderKind(MRIorderKind);
			MRIradiology.setAddFiles(MRIMulti, MRIfolderURL);
			radList.add(MRIradiology);
		}
		// rad 2건...
		int cnt = 0;
		String payKind = "";
		PayDetailVO payDetail = new PayDetailVO();
		payDetail.setReceiptKey(receiptKey);
		if(radList.size() > 0 || radList !=null) {
			for (RadiologyVO radiology : radList) {
				String orderKind = radiology.getOrderKind();
				if(radiology.getOrderKind().equals("O003")) {
					targetSaveFolder = saveXrayFolder;
					payKind = "PK08";
					payDetail.setPayKind(payKind);
				}else if(radiology.getOrderKind().equals("O004")) {
					targetSaveFolder = saveMRIFolder;
					payKind = "PK09";
					payDetail.setPayKind(payKind);
				}
				AttatchFileGroupVO atchFileGroup = radiology.getAddFileGroup();
				Optional.ofNullable(atchFileGroup)
						.ifPresent((afg)->{
							attachFileGroupService.insertAttachFileGroup(atchFileGroup, targetSaveFolder);
							radiology.setAttGroupNo(afg.getAttGroupNo());
						});
				cnt = radiologyDAO.insertXrayRadiology(radiology);
				// 수납내역에 추가하기
				cnt = payDAO.insertRadiologyPayDetail(payDetail);
			}
		}
		
		int res = 0;
		// 현재 대기상태를 Y로 변경
		if(cnt > 0) { // 등록 성공일때 환자의 대기상태를 해당 진료실로 보낸다. - 접수키, 장소키 확인
			res += radiologyDAO.updateWaitingStatus(receiptKey);
		}
		return res;
	}

	@Override
	public List<MedicalChartVO> retrievePreChartList(String patientKey) {
		return radiologyDAO.selectPreChartList(patientKey);
	}
}
