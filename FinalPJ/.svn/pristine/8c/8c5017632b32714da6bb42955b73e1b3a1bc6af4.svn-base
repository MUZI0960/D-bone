package kr.or.ddit.radiology.cotroller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.or.ddit.medicalChart.service.MedicalChartService;
import kr.or.ddit.radiology.service.RadiologyService;
import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.CommonCodeVO;
import kr.or.ddit.vo.MedicalChartVO;
import kr.or.ddit.vo.PrescriptionVO;
import kr.or.ddit.vo.RadiologyVO;
import kr.or.ddit.vo.WaitingHistoryVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/radiology")
public class RadiologyPageController {
	@Inject
	private RadiologyService radiologyService;
	

	
	@Inject
	private MedicalChartService medicalChartService;
	
	@GetMapping(value = "getWaitingList",produces = MediaType.APPLICATION_JSON_UTF8_VALUE )
	@ResponseBody
	public List<WaitingHistoryVO>  getWaitingList(){
		List<WaitingHistoryVO> waitingList = radiologyService.retrieveWaitingList();
		return waitingList;
	}
	
	@GetMapping(value = "getradiologyData", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public RadiologyVO getradiologyData(@RequestParam("orderKey") String orderKey) {
		RadiologyVO radiology = radiologyService.retrieveRadiology(orderKey);
		if( radiology == null) { // 오더키로 조회한 자료가 없으면
			radiology = new RadiologyVO(); // 비어있는 radiologyVO생성해서 넘기기
		}
		return radiology;
	}
	@GetMapping(value = "getBodyPartList",produces = MediaType.APPLICATION_JSON_UTF8_VALUE )
	@ResponseBody
	public List<CommonCodeVO> getBodyPartList(){
		List<CommonCodeVO> bodyList = medicalChartService.retrieveBodyPartList();
		return bodyList;
	}
	
	//-------------------------------------------------------------------------------------------
	
	// 영상 자료 조회(DB 데이터에서 파일 list 불러오기)
	/**
	 * 파라미터 = 파일 그룹번호
	 * @param attGroupNo
	 * @return List<AttachVO> 파일 리스트
	 */
	@GetMapping(value = "radiologyDataView",  produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public List<AttachVO> radiologyDataView(@RequestParam("attGroupNo") String attGroupNo) {
		int attNo = Integer.parseInt(attGroupNo);
		List<AttachVO> fileList = radiologyService.viewData(attNo);
		return fileList;
	}
	


	
	/**
	 * 파일 업로드 - Xray / MRI
	 * @param multiFiles
	 * @param multipart 파일들..
	 * @return
	 */
	@PostMapping(value = "UploadData", produces = "text/plain")
	@ResponseBody
	public String UploadData(MultipartHttpServletRequest req) {
		
		int cnt = 0;
		cnt = radiologyService.createxrayData(req);
		
		String result = "";
		
		if(cnt > 0) {
			result = "success"; // 파일업로드 성공한다면 환자의 대기상태를 해당 진료실로 보내기.
			
		}else {
			result = "fail";
		}
		
		return result;
	}
}
