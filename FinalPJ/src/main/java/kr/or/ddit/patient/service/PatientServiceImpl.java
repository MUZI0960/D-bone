package kr.or.ddit.patient.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.guardian.dao.GuardianDAO;
import kr.or.ddit.patient.dao.PatientDAO;
import kr.or.ddit.preDiagnosis.dao.PreDiagnosisDAO;
import kr.or.ddit.vo.PatientVO;
import kr.or.ddit.vo.PayVO;
import kr.or.ddit.vo.ReceiptionVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j @Service
public class PatientServiceImpl implements PatientService {

    @Autowired
    private PatientDAO patientDAO;

    @Inject
    private PreDiagnosisDAO diagnosisDAO;

    @Inject
    private GuardianDAO guardianDAO;

    // 0503 문수정-------------------------------------------------------

    /**
     * 환자 목록 조회
     */
    @Override
    public List<PatientVO> retrievePatientList() {
        return patientDAO.selectPatientList();

    }

    // 0504 문수정-------------------------------------------------------

    /**
     * 환자 상세 조회
     */
    @Override
    public PatientVO retrievePatient(String patientKey) {

        return patientDAO.selectPatient(patientKey);
    }

    // 0503 문수정-------------------------------------------------------

    /**
     * 신규 환자 등록 환자 insert 후 보호자, 예진표 insert도 같이
     */
    @Transactional
    @Override
    public int createPatient(PatientVO patient) {
        patientDAO.insertPatient(patient);
        diagnosisDAO.insertPreDiagnosis(patient.getPatientKey());
        return guardianDAO.insertGuardian(patient.getPatientKey());

    }

    // 0504 문수정-------------------------------------------------------

    /**
     * 환자 정보 수정
     */
    @Override
    public int modifyPatient(PatientVO patient) {
        return patientDAO.updatePatient(patient);
    }

    // 정민-------------------------------------------------------

    /**
     * 접수 완료 후에 진료대기환자 조회하기
     *
     * @return
     */
    @Override
    public List<ReceiptionVO> selectReceipMember() {
        return patientDAO.selectReceipMember();
    }

    // 유림
    @Override
    public PatientVO retrievePatientDetail(String patientKey) {
        return patientDAO.selectPatientDetail(patientKey);
    }

    // 정민-------------------------------------------------------

    /**
     * 수납을 하기 위해 대기중인 환자 목록 조회하기
     */
    @Override
    public List<PatientVO> selectPayWaiting() {
        return patientDAO.selectPayWaiting();
    }

    // 정민 쿼리-------------------------------------------------------

    /**
     * 수납이 완료된 환자들 진료확인서를 출력하기 위해 만든 쿼리
     */
    @Override
    public List<PatientVO> completePayment() {
        return patientDAO.completePayment();
    }


    // 정민 쿼리-------------------------------------------------------

    /**
     * 환자 진료끝난 후에 진료차트 POI로 출력하기
     */
    @Override
    public PatientVO selectMedicalCertificate(String patientKey) {
        return patientDAO.selectMedicalCertificate(patientKey);
    }

    // 정민 쿼리-------------------------------------------------------

    /**
     * 진료차트가 null 이 아닌 진료확인서를 출력하기 위해 뽑는 환자 리스트
     */
    @Override
    public List<PatientVO> selectJinRyoChartList() {
        return patientDAO.selectJinRyoChartList();
    }


    /**
     * 월별 방문자수 구하기
     * @return [1~6월]
     */
    @Override
    public List selectPatientStatistics() {
        List<PatientVO> patientVO = patientDAO.selectStatisticsList();

        List dateList = new ArrayList<>();
        int jan = 0;
        int feb = 0;
        int march = 0;
        int april = 0;
        int may = 0;
        int june = 0;

        for (PatientVO date : patientVO) {
        	if(date.getPay().getPayDate() != null) {
        		String payDate = date.getPay().getPayDate();
        		log.info("date 확인해보자@@@@@@@@@@@ : {}", date);
        		log.info("payDate 확인해보자@@@@@@@@@@@ : {}", payDate);
        		switch (payDate) {
        		case "01":
        			jan += 1;
        			break;
        		case "02":
        			feb += 1;
        			break;
        		case "03":
        			march += 1;
        			break;
        		case "04":
        			april += 1;
        			break;
        		case "05":
        			may += 1;
        			break;
        		case "06":
        			june += 1;
        			break;
        		}
        		for (int i : new int[]{jan, feb, march, april, may, june}) {
        			dateList.add(i);
        		}
        	} 
        }
        return dateList;

    }

    /**
     * 월별 매출액 뽑기
     * @return
     */
    @Override
    public List selectSales() {
        List<PatientVO> patientVO = patientDAO.selectStatisticsList();

        List dateList = new ArrayList<>();
        int jan = 0;
        int feb = 0;
        int march = 0;
        int april = 0;
        int may = 0;
        int june = 0;

        for (PatientVO date : patientVO) {
        	if(date.getPay().getPayDate() != null) {
        		String payDate = date.getPay().getPayDate();
        		log.info("date 확인해보자@@@@@@@@@@@ : {}", date);
        		log.info("payDate 확인해보자@@@@@@@@@@@ : {}", payDate);
            switch (payDate) {
                case "01":
                    jan += date.getPay().getPayTotalCost();
                    break;
                case "02":
                    feb += date.getPay().getPayTotalCost();
                    break;
                case "03":
                    march += date.getPay().getPayTotalCost();
                    break;
                case "04":
                    april += date.getPay().getPayTotalCost();
                    break;
                case "05":
                    may += date.getPay().getPayTotalCost();
                    break;
                case "06":
                    june += date.getPay().getPayTotalCost();
                    break;
            }
            for (int i : new int[]{jan, feb, march, april, may, june}) {
    			dateList.add(i);
    		}
    	} 
    }
    return dateList;
    }

	@Override
	public List<PayVO> selectPayWaitingList() {
		return patientDAO.selectPayWaitingList();
	}

}
