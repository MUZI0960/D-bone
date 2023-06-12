package kr.or.ddit.noticeBoard.controller;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.emp.service.EmpService;
import kr.or.ddit.noticeBoard.service.NoticeBoardService;
import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.NoticeBoardVO;
import kr.or.ddit.vo.Pagination;
import kr.or.ddit.vo.PayVO;
import kr.or.ddit.vo.ReceiptionVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping
@Slf4j
public class NoticeBoardController {

	@Inject
	private NoticeBoardService noticeService;
	@Inject
	private EmpService empService;
	
	@PostMapping(value = "/noticeBoardList.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Pagination<NoticeBoardVO> boardList(@RequestParam(value = "page", required = false, defaultValue = "1")int currentPage) {
		Pagination<NoticeBoardVO> pagination = new Pagination<NoticeBoardVO>();
		pagination.setCurrentPage(currentPage);
		noticeService.noticeBoardList(pagination);
		return pagination;
	}
	
	@PostMapping(value = "/noticeBoardInsert.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String insertNoticeBoard(@RequestBody NoticeBoardVO noticeBoard) {
		log.debug("insert 조회 : {}", noticeBoard);
		int cnt = noticeService.noticeBoardInsert(noticeBoard);
		
		String result = "";
		if(cnt > 0) {
			result = "success";
		}else {
			result = "fail";
		}
		return result;
	}
	
	@GetMapping(value = "/noticeBoardDetail.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public NoticeBoardVO noticeDetail(@RequestParam("boardKey") String boardKey, Principal principal) {
		String loginEmpId = principal.getName();// 로그인한 직원 정보 가져오기
		// 작성자가 아닌 직원이 본다면 조회수 +1
		EmpVO loginEmp = empService.retrieveEmpSecurity(loginEmpId);
		
		NoticeBoardVO noticeBoard = new NoticeBoardVO();
		noticeBoard = noticeService.noticeBoardDetail(Integer.parseInt(boardKey), loginEmp);
		
		return noticeBoard;
	}
	
	@PostMapping(value = "/noticeBoardUpdate.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String updateNoticeBoard(@RequestBody NoticeBoardVO noticeBoard) {
		log.debug("update 조회 : {}", noticeBoard );
		
		int cnt = noticeService.noticeBoardModify(noticeBoard);
		String result = "";
		if(cnt > 0) {
			result = "success";
		}else {
			result = "fail";
		}
		return result;
	}
	
	@GetMapping(value = "/noticeBoardDelete.do", produces = "text/plain; charset=UTF-8")
	@ResponseBody
	public String removeNoticeBoard(@RequestParam("delBoardKey") int boardKey) {
		log.debug("delete boardkey 조회 : {}", boardKey );
		int cnt = noticeService.noticeBoardRemove(boardKey);
		String result = "";
		if(cnt > 0) {
			result = "success";
		}else {
			result = "fail";
		}
		return result;
	}
	
	// URL경로
	@Value("#{appInfo.noticeBoradFolder}")
	private File noticeBoradFolder;
	@Value("#{appInfo.noticeBoradURL}")
	private String noticeBoradURL; 
	
	// 파일 저장
	   @PostMapping(value = "/upload/noticeBoard", produces = MediaType.APPLICATION_JSON_VALUE)
	    @ResponseBody
	    public Object handleFileUpload(@RequestParam("upload") MultipartFile uploadfile, HttpServletRequest req) {
			String name = "";
	        HashMap<String, Object> map = new HashMap<>();
	        try {
				AttachVO myfile = new AttachVO(uploadfile, noticeBoradURL);
				myfile.saveTo(noticeBoradFolder);
				name = myfile.getSaveName();
				map.put("uploaded", 1);
				map.put("url", req.getContextPath() + "/"+ noticeBoradURL + "/" + name);
				map.put("fileName", name);

	            return map;
	        } catch (Exception e) {
	            map.put("uploaded", 0);
	            map.put("error", "{'message': '" + e.getMessage() + "'}");
	            return map;
	        }     
	    }    
	    
	    @PostMapping("/image")
	    public void handleFileUpload(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload) {
	        log.info("image 확인={}", upload);
	    	OutputStream out = null;
	        PrintWriter printWriter = null;
	        response.setCharacterEncoding("utf-8");
	        response.setContentType("text/html;charset=utf-8");

	        try {
	            String callback = request.getParameter("CKEditorFuncNum");
	        	AttachVO myfile = new AttachVO(upload, noticeBoradURL);
				myfile.saveTo(noticeBoradFolder);

	            printWriter = response.getWriter();
	            printWriter.println("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction("
	                    + callback
	                    + ",'"
	                    + noticeBoradURL + "/" + upload.getName()
	                    + "','이미지를 업로드 하였습니다.'"
	                    + ")</script>");
	            printWriter.flush();            
	        }catch(Exception e){
	            e.printStackTrace();
	        } finally {
	            try {
	                if (out != null) {
	                    out.close();
	                }
	                if (printWriter != null) {
	                    printWriter.close();
	                }
	            } catch (IOException e) {
	                e.printStackTrace();
	            }
	        }
	    }
	
	    
	    @GetMapping(value = "/chartMonthVisitData.do", produces = "application/json;charset=UTF-8")
		@ResponseBody
	    public List<ReceiptionVO> chartMonthVisitData(){
	    	return noticeService.chartMonthVisitData();
	    }
	    
	    @GetMapping(value = "/chartMonthPayData.do", produces = "application/json;charset=UTF-8")
		@ResponseBody
	    public List<PayVO> chartMonthPayData(){
	    	return noticeService.chartMonthPayData();
	    }
	    
	    
}
