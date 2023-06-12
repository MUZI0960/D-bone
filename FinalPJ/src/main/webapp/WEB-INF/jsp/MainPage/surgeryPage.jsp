<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <style>
            .table {
                text-align: center;
                vertical-align: middle;
                font-size: 1px;
                table-layout: fixed;
                word-break: break-all;
                height: auto;

            }

            .table thead {
                background-color: #405189c7;
                color: white;
            }

            .formBtn {
                float: right;
            }

            .item {
                border-radius: 10px;
            }

            .item-header h5 {
                color: gray;
            }

            .addMedicine:hover {
                cursor: pointer;
            }

            .medicneTr:hover {
                cursor: pointer;
            }

            .form-check {
                display: block;
                margin: 0 auto;
                text-align: center;
            }
        </style>
        <script type="text/javascript" src="${cPath }/resources/ajm/barcodejs/jquery-barcode.js"></script>

        <div class="grid-stack"> <!-- 그리드스택 공간 -->

            <div class="grid-stack-item item" gs-x="0" gs-y="0" gs-w="3" gs-h="3">
                <div class="grid-stack-item-content">
                    <h5>검사</h5>
                    <hr>
                    <div class="item-body">
                        <ul class="nav nav-tabs mb-3" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-bs-toggle="tab" href="#preExaminationTb" role="tab"
                                    aria-selected="false">검사대기</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-bs-toggle="tab" href="#preExaminationCompleteTb" role="tab"
                                    aria-selected="false">검사완료</a>
                            </li>
                        </ul>

                        <div class="tab-content  text-muted">
                            <div class="tab-pane active" id="preExaminationTb" role="tabpanel">
                                <table class="table table-bordered">
                                    <thead>
                                        <th>환자코드</th>
                                        <th>환자명</th>
                                        <th style="width : 15%">나이</th>
                                        <th style="width : 15%">성별</th>
                                        <th>검사</th>
                                    </thead>
                                    <tbody class="preExaminationListBody">

                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <div class="tab-content  text-muted">
                            <div class="tab-pane" id="preExaminationCompleteTb" role="tabpanel">
                                <table class="table table-bordered">
                                    <thead>
                                        <th>환자코드</th>
                                        <th>환자명</th>
                                        <th>검사결과</th>
                                        <th style="width: 30%;">비고</th>
                                    </thead>
                                    <tbody class="preExaminationCompleteListBody">

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="grid-stack-item item" gs-x="0" gs-y="3" gs-w="3" gs-h="2">
                <div class="grid-stack-item-content">
                    <h5>수술</h5>
                    <hr>
                    <div class="item-body">
                        <ul class="nav nav-tabs mb-3" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-bs-toggle="tab" href="#surgeryWaitingTb" role="tab"
                                    aria-selected="false">수술대기</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-bs-toggle="tab" href="#surgeryCompleteTb" role="tab"
                                    aria-selected="false">수술완료</a>
                            </li>
                        </ul>

                        <div class="tab-content  text-muted">
                            <div class="tab-pane active" id="surgeryWaitingTb" role="tabpanel">
                                <table class="table table-bordered">
                                    <thead>
                                        <th>환자코드</th>
                                        <th>환자명</th>
                                        <th>수술</th>
                                    </thead>
                                    <tbody class="surgeryWaitingBody">

                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <div class="tab-content  text-muted">
                            <div class="tab-pane" id="preExaminationCompleteTb" role="tabpanel">
                                <table class="table table-bordered">
                                    <thead>
                                        <th>환자코드</th>
                                        <th>환자명</th>
                                        <th>검사결과</th>
                                        <th style="width: 30%;">비고</th>
                                    </thead>
                                    <tbody class="preExaminationCompleteListBody">

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="grid-stack-item item" gs-x="3" gs-y="0" gs-w="3" gs-h="5">
                <div class="grid-stack-item-content">
                    <h5>차트 기록</h5>
                    <hr>
                    <div class="item-body">
                        <table class="table table-bordered medicalChartTb" style="margin-top: 40px;">
                            <tr>
                                <th style="width:25%; height: 50px;">차트번호</th>
                                <td></td>
                            </tr>
                            <tr>
                                <th style="width:25%; height: 50px;">환자번호</th>
                                <td></td>
                            </tr>
                            <tr>
                                <th style="width:25%; height: 50px;">환자명</th>
                                <td></td>
                            </tr>
                            <tr>
                                <th style="width:25%; height: 50px;">진단명</th>
                                <td></td>
                            </tr>
                            <tr>
                                <th style="width:25%; height: 50px;">수술명</th>
                                <td></td>
                            </tr>
                            <tr>
                                <th style="width:25%; height: 50px;">담당의</th>
                                <td></td>
                            </tr>
                            <tr>
                                <th style="width:25%; height: 100px;">의사소견</th>
                                <td></td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>

            <div class="grid-stack-item item" gs-x="6" gs-y="0" gs-w="3" gs-h="5">
                <div class="grid-stack-item-content">
                    <h5>검사 목록</h5>
                    <hr>
                    <div class="item-body">
                        <form class="preExaminationForm">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>검사번호</th>
                                        <th>환자번호</th>
                                        <th>환자명</th>
                                    </tr>
                                </thead>
                                <tbody class="preExaminationInfoBody">
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                </tbody>
                            </table>
                            <hr>
                            <h5>바코드</h5>
                            <div style="height: 150px; margin-top:30px;" id="bcTarget1"></div>
                            <hr>
                            <table class="table table-bordered radioTb">
                                <tr>
                                    <th>혈액</th>
                                    <td colspan="3">
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="bloodTest"
                                                id="bloodTestPass" value="1">
                                            <label class="form-check-label" for="bloodTestPass">적합</label>
                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                            <input class="form-check-input" type="radio" name="bloodTest"
                                                id="bloodTestNonPass" value="0">
                                            <label class="form-check-label" for="bloodTestNonPass">부적합</label>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>소변</th>
                                    <td colspan="3">
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="urinalysis"
                                                id="urinalysistPass" value="1">
                                            <label class="form-check-label" for="urinalysistPass">적합</label>
                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                            <input class="form-check-input" type="radio" name="urinalysis"
                                                id="urinalysisNonPass" value="0">
                                            <label class="form-check-label" for="urinalysisNonPass">부적합</label>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>폐기능</th>
                                    <td colspan="3">
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="pulmonaryTest"
                                                id="pulmonaryTestPass" value="1">
                                            <label class="form-check-label" for="pulmonaryTestPass">적합</label>
                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                            <input class="form-check-input" type="radio" name="pulmonaryTest"
                                                id="pulmonaryTestNonPass" value="0">
                                            <label class="form-check-label" for="pulmonaryTestNonPass">부적합</label>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>심전도</th>
                                    <td colspan="3">
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="ecg" id="ecgPass"
                                                value="1">
                                            <label class="form-check-label" for="ecgPass">적합</label>
                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                            <input class="form-check-input" type="radio" name="ecg" id="ecgNonPass"
                                                value="0">
                                            <label class="form-check-label" for="ecgNonPass">부적합</label>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>비고</th>
                                    <td colspan="3">
                                        <textarea name="preExaminationNote" class="form-control" cols="10"
                                            rows="2"></textarea>
                                    </td>
                                </tr>
                            </table>
                            <input type="submit" class="btn btn-primary" style="float: right;" value="검사등록">
                        </form>
                    </div>
                </div>
            </div>

            <div class="grid-stack-item item" gs-x="9" gs-y="0" gs-w="3" gs-h="5">
                <div class="grid-stack-item-content">
                    <h5>수술</h5>
                    <hr>
                    <div class="item-body" style="padding: 20px;">
                        <h6>환자 코드</h6>
                        <input type="text" class="form-control" name="chartCont"><br>
                        <h6>환자명</h6>
                        <input type="text" class="form-control" name="chartCont"><br>
                        <h6>집도의</h6>
                        <input type="text" class="form-control" name="chartCont"><br>
                        <h6>수술 날짜</h6>
                        <input type="text" class="form-control" name="chartCont"><br>
                        <h6>수술 경과 시간</h6>
                        <input type="text" class="form-control" name="chartCont"><br>
                        <h6>수술 코멘트</h6>
                        <textarea class="form-control" name="chartCont" cols="2" rows="5"></textarea>
                    </div>
                    <input type="submit" class="btn btn-primary" style="float: right;" value="저장">
                </div>
            </div>

        </div><!-- 그리드 스택 끝-->

        <!-- Modal -->
        <div class="modal fade" id="medicineModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">의약품 목록</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body" style="display: block;">
                        <div>
                            <input type="text" class="form-control" id="searhMedicineInput"
                                placeholder="의약품코드/의약품명으로 검색">
                        </div>
                        <br>
                        <div id="medicineTableDiv" style="height: 500px; overflow-y: auto;">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>의약품코드</th>
                                        <th>의약품명</th>
                                        <th>투여</th>
                                    </tr>
                                </thead>
                                <tbody class="medicineList">

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- ------------------------------- -->

        <script>
            // 그리드스택 기본설정
            var grid = GridStack.init({});


            // 현재 선택한 입원 기록키
            let selectedHospitalizeRecordKey = null;

            // 현재 생성된 검사 키
            let selectedPreExaminationKey = null;

            let preExaminationListBody = $('.preExaminationListBody').on('click', '.preExaminationStartBtn', function (event) {
                console.log("검사 생성 시작");
                $(this).attr("class", "btn btn-danger btn-sm").val("검사중").addClass("preExaminationDoingBtn");
                let patientInfo = $(this).parents(".patientTr").data("patientInfo");
                let hospitalizeRecordKey = patientInfo.hospitalizeRecordKey;
                selectedHospitalizeRecordKey = hospitalizeRecordKey;


                // 검사 키 생성 
                $.ajax({
                    url: "${cPath}/surgery/preExaminationKey"
                    , method: "GET"
                    , dataType: "text"
                    , success: (resp) => {
                        console.log("검사 키 생성 결과", resp);
                        getMedicalChart(hospitalizeRecordKey);
                        setPreExamination(resp, patientInfo);
                        selectedPreExaminationKey = resp;
                    }
                });
                // 바코드	환자코드 넣어주세요
                let num = Math.floor(Math.random() * 9999999999999) + 1;
                $("#bcTarget1").barcode(`\${num}`, "code128", { barWidth: 2, barHeight: 100 });
            });

            let medicalChartTb = $('.medicalChartTb');
            let medicalChartTdTags = medicalChartTb.find("td");

            // 차트 가져오기
            function getMedicalChart(hospitalizeRecordKey) {
                $.ajax({
                    url: "${cPath}/surgery/medicalChart"
                    , method: "GET"
                    , data: { "hospitalizeRecordKey": hospitalizeRecordKey }
                    , dataType: "json"
                    , success: (resp) => {
                        console.log("응답데이터 체킁", resp);
                        medicalChartTdTags.eq(0).html(resp.chartKey);
                        medicalChartTdTags.eq(1).html(resp.patientKey);
                        medicalChartTdTags.eq(2).html(resp.patientName);
                        medicalChartTdTags.eq(3).html(resp.diseaseName);
                        medicalChartTdTags.eq(4).html(resp.orderName);
                        medicalChartTdTags.eq(5).html(resp.empName);
                        medicalChartTdTags.eq(6).html(resp.chartCont);
                    }
                });
            }

            let preExaminationInfoBody = $('.preExaminationInfoBody');
            // 검사지 세팅
            function setPreExamination(preExaminationKey, patientInfo) {
                preExaminationInfoBody.empty();
                preExaminationInfoBody.append(
                    $('<tr>').append(
                        $('<td>').html(preExaminationKey)
                        , $('<td>').html(patientInfo.patientKey)
                        , $('<td>').html(patientInfo.patientName)
                    )
                );
            }


            // 검사 대기 목록 
            function getPreExaminationList() {
                console.log("검사 대기 목록 가져오기 실행");
                // 초기화
                preExaminationListBody.empty();
                $.ajax({
                    url: "${cPath}/surgery/preExaminationList"
                    , method: "GET"
                    , dataType: "json"
                    , success: (resp) => {
                        console.log("검사 대기 목록 환자 체킁", resp)
                        $.each(resp, function (idx, patient) {
                            let tr = $('<tr>').append(
                                $('<td>').html(patient.patientKey)
                                , $('<td>').html(patient.patientName).attr({
                                    "data-bs-toggle": "modal"
                                    , "data-bs-target": "#patientViewModal"
                                })
                                , $('<td>').html(patient.patientAge)
                                , $('<td>').html(patient.patientSex)
                                , $('<td>').append(
                                    $('<input>').attr("type", "button").addClass("btn btn-outline-primary btn-sm preExaminationStartBtn").val("검사실시")
                                )
                            ).addClass("patientTr").data("patientInfo", patient);
                            preExaminationListBody.append(tr);
                        });
                    }
                })
            }
            getPreExaminationList();

            let preExaminationCompleteListBody = $('.preExaminationCompleteListBody');
            // 검사 완료 목록 
            function getPreExaminationCompleteList() {
                console.log("검사 완료 목록 불러오깅");

                preExaminationCompleteListBody.empty();
                $.ajax({
                    url: "${cPath}/surgery/preExaminationCompleteList"
                    , method: "GET"
                    , dataType: "json"
                    , success: (resp) => {
                        $.each(resp, function (idx, patient) {
                            let td = $('<td>');
                            if (patient.status == 1) {
                                td.html("통과");
                            } else {
                                td.html("불통").css("color", "red");
                            }
                            let tr = $('<tr>').append(
                                $('<td>').html(patient.patientKey)
                                , $('<td>').html(patient.patientName)
                                , td
                                , $('<td>').html(patient.preExaminationNote)
                            );
                            preExaminationCompleteListBody.append(tr);
                        })
                    }
                })
            }
            getPreExaminationCompleteList();

            // 라디오 버튼 설정 
            let radioTb = $('.radioTb').on('change', 'input[type=radio]', function () {
                let selectedLabel = $($(this).prop("labels"));
                selectedLabel.css("color", "red")
                selectedLabel.siblings('label').css("color", "#212529");
            });

            // 검사 등록
            let preExaminationForm = $('.preExaminationForm').on('submit', function (event) {
                event.preventDefault();
                let message = null;

                let formData = $(this).serializeArray();
                let vo = {};
                $.each(formData, function (index, field) {
                    vo[field.name] = field.value;
                });
                vo.preExaminationKey = selectedPreExaminationKey;
                vo.hospitalizeRecordKey = selectedHospitalizeRecordKey;

                if (formData.length != 5) {
                    message = "모든 항목을 채워주세요.";
                }

                if (selectedHospitalizeRecordKey == null) {
                    message = "선택된 환자가 없습니다."
                }

                if (message != null) {
                    Swal.fire({
                        icon: 'error',
                        title: message
                    });
                    return;
                }
                console.log("보낼데이터 체킁", vo);

                console.log("검사 결과 insert 시작");
                $.ajax({
                    url: "${cPath}/surgery/preExamination"
                    , method: "POST"
                    , data: JSON.stringify(vo)
                    , contentType: "application/json"
                    , dataType: "text"
                    , beforeSend: function (xhr) {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                        xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                    }
                    , success: (resp) => {
                        if (resp == "success") {
                            // 차트 초기화
                            $.each(medicalChartTdTags, function (idx, td) {
                                $(td).html("");
                            });

                            // 검사 초기화
                            preExaminationInfoBody.empty().append(
                                `<tr><td></td><td></td><td></td></tr>`
                            );
                            $('.form-check-input').prop('checked', false);
                            $('.form-check-label').css("color", "#212529");
                            $('textarea[name]').val("");

                            // 전역 초기화
                            selectedPreExaminationKey = null;
                            selectedHospitalizeRecordKey = null;

                            // 검사대기, 검사완료 함수 호출
                            getPreExaminationList();
                            getPreExaminationCompleteList();

                        } else {
                            // 실패 
                            Swal.fire({
                                icon: 'error',
                                title: '오류'
                            });
                        }
                    }
                })


                return false;
            });


            // 수술 대기 목록
            let surgeryWaitingBody = $('.surgeryWaitingBody');
            function getSurgeryWaitingList() {
                console.log("수술 대기 목록 가져오기 시작!");
                $.ajax({
                    url: "${cPath}/surgery/surgeryWaitingList"
                    , method: "GET"
                    , dataType: "json"
                    , success: (resp) => {
                        console.log("응답데이터", resp);
                    }
                })
            }
        </script>