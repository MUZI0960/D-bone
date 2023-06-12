<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <style>
        .item-header {
            color: gray;
        }

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

        .nurseChartSubTitle,
        .roundsRecordSubTitle {
            display: flex;
            justify-content: space-between;
        }

        .nurseChartContent {
            border: 1px solid #e5e5f2;
            padding: 10px;
            height: 100px;
        }

        .wardInfoBody {
            padding-top: 10px;
        }

        .cursor:hover {
            cursor: pointer;
        }
    </style>

    <div class="grid-stack"> <!-- 그리드스택 공간 -->

        <div class="grid-stack-item" gs-x="0" gs-y="0" gs-w="2" gs-h="2"> <!-- grid-stack-item을 적어야 적용됨 -->
            <div class="grid-stack-item-content">
                <div class="item-header">
                    <h5>입원 환자 목록</h5>
                    <hr>
                </div>
                <div class="item-body">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th style="width : 27%">코드</th>
                                <th style="width : 23%">환자명</th>
                                <th style="width : 18%">나이</th>
                                <th style="width : 18%">성별</th>
                                <th style="width : 18%">호실</th>
                            </tr>
                        </thead>
                        <tbody id="hospitalizePatientList">
                        </tbody>
                    </table>
                </div>
            </div>
        </div>



        <div class="grid-stack-item" gs-x="0" gs-y="2" gs-w="2" gs-h="3"> <!-- grid-stack-item을 적어야 적용됨 -->
            <div class="grid-stack-item-content">
                <div class="item-header">
                    <h5>진료 차트</h5>
                    <hr>
                </div>
                <div class="item-body">
                    <table id="medicalChartBody" class="table table-bordered">
                        <tr>
                            <th style="width : 30%">환자코드</th>
                            <td></td>
                        </tr>
                        <tr>
                            <th style="width : 30%">환자명</th>
                            <td></td>
                        </tr>
                        <tr>
                            <th style="width : 30%">생년월일</th>
                            <td></td>
                        </tr>
                        <tr>
                            <th style="width : 30%">담당의</th>
                            <td></td>
                        </tr>
                        <tr>
                            <th style="width : 30%">진료기록</th>
                            <td></td>
                        </tr>
                        <tr>
                            <th style="width : 30%">진단명</th>
                            <td></td>
                        </tr>
                        <tr>
                            <th style="width : 30%">수술명</th>
                            <td></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>

        <div class="grid-stack-item" gs-x="2" gs-y="0" gs-w="3" gs-h="3"> <!-- grid-stack-item을 적어야 적용됨 -->
            <div class="grid-stack-item-content">
                <div class="item-header">
                    <h5>입원 기록 일지</h5>
                    <hr>
                </div>
                <div class="item-body">
                    <ul class="nav nav-tabs mb-3" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" data-bs-toggle="tab" href="#nurseChartRecordTb" role="tab"
                                aria-selected="false">간호기록</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-bs-toggle="tab" href="#dietRecordTb" role="tab"
                                aria-selected="false">식이</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-bs-toggle="tab" href="#vitalRecordTb" role="tab"
                                aria-selected="false">바이탈</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-bs-toggle="tab" href="#ioRecordTb" role="tab"
                                aria-selected="false">IO</a>
                        </li>
                    </ul>

                    <div class="tab-content  text-muted">
                        <div class="tab-pane active" id="nurseChartRecordTb" role="tabpanel">
                            <table class="table table-bordered">
                                <thead>
                                    <th style="width : 25%">기록코드</th>
                                    <th style="width : 50%">작성일</th>
                                    <th style="width : 25%">작성자</th>
                                </thead>
                                <tbody class="nurseChartRecord">

                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="tab-content  text-muted">
                        <div class="tab-pane" id="dietRecordTb" role="tabpanel">
                            <table class="table table-bordered">
                                <thead>
                                    <th style="width : 25%">기록코드</th>
                                    <th style="width : 15%">식대</th>
                                    <th style="width : 20%">식이종류</th>
                                    <th style="width : 15%">섭취량</th>
                                    <th style="width : 25%">작성일</th>
                                </thead>
                                <tbody class="dietRecord">

                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="tab-content  text-muted">
                        <div class="tab-pane" id="vitalRecordTb" role="tabpanel">
                            <table class="table table-bordered">
                                <thead>
                                    <th style="width : 18%">기록코드</th>
                                    <th style="width : 15%">최고BP</th>
                                    <th style="width : 15%">최저BP</th>
                                    <th style="width : 10%">PR</th>
                                    <th style="width : 10%">RR</th>
                                    <th style="width : 12%">BT</th>
                                    <th style="width : 22%">측정일</th>
                                </thead>
                                <tbody class="vitalRecord">

                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="tab-content  text-muted">
                        <div class="tab-pane" id="ioRecordTb" role="tabpanel">
                            <table class="table table-bordered">
                                <thead>
                                    <th style="width : 20%">기록코드</th>
                                    <th style="width : 20%">섭취량</th>
                                    <th style="width : 20%">배출량</th>
                                    <th style="width : 20%">총량</th>
                                    <th style="width : 25%">작성일</th>
                                </thead>
                                <tbody class="ioRecord">

                                </tbody>
                            </table>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <div class="grid-stack-item" gs-x="2" gs-y="3" gs-w="3" gs-h="2"> <!-- grid-stack-item을 적어야 적용됨 -->
            <div class="grid-stack-item-content">
                <div class="item-header">
                    <h5>입원 기록</h5>
                    <hr>
                </div>
                <div class="item-body">
                    <ul class="nav nav-tabs mb-3" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" data-bs-toggle="tab" href="#nurseChartTb" role="tab"
                                aria-selected="false">
                                간호기록</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-bs-toggle="tab" href="#dietTb" role="tab" aria-selected="false">
                                식이</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-bs-toggle="tab" href="#vitalTb" role="tab" aria-selected="false">
                                바이탈
                            </a>
                        </li>
                        <a class="nav-link" data-bs-toggle="tab" href="#ioTb" role="tab" aria-selected="false">
                            IO
                        </a></li>
                    </ul>

                    <div class="tab-content  text-muted">
                        <div class="tab-pane active" id="nurseChartTb" role="tabpanel">
                            <form class="nurseChartForm">
                                <input type="hidden" name="hospitalizeRecordKey" />
                                <input type="hidden" name="nurseChartWriter" value="${authEmp.empKey}" />
                                <textarea class="form-control" id="nurseChartContent" rows="3"
                                    name="nurseChartContent"></textarea>
                                <input class="btn btn-primary formBtn" type="submit" value="입력"
                                    style="margin-top: 10px;">
                            </form>
                        </div>

                        <div class="tab-pane" id="dietTb" role="tabpanel">
                            <form class="dietForm">
                                <input type="hidden" name="hospitalizeRecordKey" />
                                <input type="hidden" name="dietWriter" value="${authEmp.empKey}" />
                                <table class="table table-bordered">
                                    <tr>
                                        <th style="width: 30%;">식사시간</th>
                                        <td><select name="dietMeals" class="form-select form-select-sm">
                                                <option value="">선택</option>
                                                <option value="DT01">아침</option>
                                                <option value="DT02">점심</option>
                                                <option value="DT03">저녁</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th style="width: 30%;">식이종류</th>
                                        <td>
                                            <select name="dietKind" class="form-select form-select-sm">
                                                <option value="">선택</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th style="width: 30%;">섭취량</th>
                                        <td>
                                            <div class="input-group input-group-sm">
                                                <input name="dietIntake" type="number" class="form-control"
                                                    aria-label="Dollar amount (with dot and two decimal places)">
                                                <span class="input-group-text">%</span>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                                <input class="btn btn-primary formBtn" type="submit" value="입력">
                            </form>
                        </div>

                        <div class="tab-pane" id="vitalTb" role="tabpanel">
                            <form class="vitalForm">
                                <input type="hidden" name="hospitalizeRecordKey" />
                                <input type="hidden" name="vitalWriter" value="${authEmp.empKey}" />
                                <table class="table table-bordered">
                                    <tr>
                                        <th style="width: 30%;">최고혈압</th>
                                        <td>
                                            <div class="input-group input-group-sm">
                                                <input name="hyperBP" type="number" class="form-control"
                                                    aria-label="Dollar amount (with dot and two decimal places)">
                                                <span class="input-group-text">mmHg</span>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th style="width: 30%;">최저혈압</th>
                                        <td>
                                            <div class="input-group input-group-sm">
                                                <input name="hypoBP" type="number" class="form-control"
                                                    aria-label="Dollar amount (with dot and two decimal places)">
                                                <span class="input-group-text">mmHg</span>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th style="width: 30%;">맥박</th>
                                        <td>
                                            <div class="input-group input-group-sm">
                                                <input name="pulse" type="number" class="form-control"
                                                    aria-label="Dollar amount (with dot and two decimal places)">
                                                <span class="input-group-text">회/분</span>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th style="width: 30%;">분당호흡</th>
                                        <td>
                                            <div class="input-group input-group-sm">
                                                <input name="respiration" type="number" class="form-control"
                                                    aria-label="Dollar amount (with dot and two decimal places)">
                                                <span class="input-group-text">회/분</span>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th style="width: 30%;">체온</th>
                                        <td>
                                            <div class="input-group input-group-sm">
                                                <input name="temperature" type="number" class="form-control"
                                                    aria-label="Dollar amount (with dot and two decimal places)"
                                                    step="0.1">
                                                <span class="input-group-text">°C</span>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                                <input type="submit" value="입력" class="btn btn-primary formBtn">
                            </form>
                        </div>

                        <div class="tab-pane" id="ioTb" role="tabpanel">
                            <form class="ioForm">
                                <input type="hidden" name="hospitalizeRecordKey" />
                                <input type="hidden" name="ioWriter" value="${authEmp.empKey}" />
                                <table class="table table-bordered">
                                    <tr>
                                        <th style="width: 30%;">섭취량</th>
                                        <td>
                                            <div class="input-group input-group-sm">
                                                <input name="ioIntake" type="number" class="form-control"
                                                    aria-label="Dollar amount (with dot and two decimal places)">
                                                <span class="input-group-text">ml</span>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th style="width: 30%;">배출량</th>
                                        <td>
                                            <div class="input-group input-group-sm">
                                                <input name="ioOutput" type="number" class="form-control"
                                                    aria-label="Dollar amount (with dot and two decimal places)">
                                                <span class="input-group-text">ml</span>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                                <input type="submit" value="입력" class="btn btn-primary formBtn">
                            </form>
                        </div>

                    </div>
                </div>
            </div>
        </div>



        <div class="grid-stack-item" gs-x="5" gs-y="0" gs-w="3" gs-h="3">
            <div class="grid-stack-item-content">
                <div class="item-header">
                    <h5>회진</h5>
                    <hr>
                </div>
                <div class="item-body">
                    <ul class="nav nav-tabs mb-3" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" data-bs-toggle="tab" href="#roundsRecord" role="tab"
                                aria-selected="false">
                                Today</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-bs-toggle="tab" href="#roundsHistory" role="tab"
                                aria-selected="false">
                                히스토리</a>
                        </li>
                    </ul>
                    <div class="tab-content  text-muted">
                        <div class="tab-pane active" id="roundsRecord" role="tabpanel">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th style="width: 20%;">약품코드</th>
                                        <th>약품명</th>
                                        <th style="width: 15%;">일투</th>
                                        <th style="width: 12%;">단위</th>
                                        <th style="width: 12%;">투여</th>
                                        <th style="width: 10%;">삭제</th>
                                    </tr>
                                </thead>
                                <tbody class="roundsMedicineListBody">

                                </tbody>
                                <tfoot></tfoot>
                            </table>
                            <input type="button" value="저장" style="float: right; display: none;"
                                class="btn btn-primary">
                        </div>

                        <div class="tab-pane" id="roundsHistory" role="tabpanel">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th style="width : 25%">기록코드</th>
                                        <th style="width : 50%">작성일</th>
                                        <th style="width : 25%">작성자</th>
                                    </tr>
                                </thead>
                                <tbody class="roundsHistoryListBody">
                                </tbody>
                            </table>
                        </div>
                    </div>

                </div>
            </div>
        </div>


        <div class="grid-stack-item" gs-x="5" gs-y="3" gs-w="3" gs-h="2">
            <div class="grid-stack-item-content">
                <div class="item-header">
                    <h5>약물 투여 기록</h5>
                    <hr>
                </div>
                <div class="item-body">
                    <ul class="nav nav-tabs mb-3" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" data-bs-toggle="tab" href="#medicineRecord" role="tab"
                                aria-selected="false">
                                투여</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-bs-toggle="tab" href="#medicineRecordHistory" role="tab"
                                aria-selected="false">
                                히스토리</a>
                        </li>
                    </ul>
                    <div class="tab-content  text-muted">
                        <div class="tab-pane active" id="medicineRecord" role="tabpanel">
                            <form class="medicineRecordForm">
                                <input type="hidden" name="hospitalizeRecordKey" />
                                <input type="hidden" name="medicineRecordWriter" value="${authEmp.empKey}" />
                                <table class="table table-bordered inputMedicineTable">
                                    <tr>
                                        <th rowspan="2" style="width: 30%;">약품명</th>
                                    </tr>
                                    <tr>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th style="width: 30%;">비고</th>
                                        <td>
                                            <input name="medicineRecordContent" type="text" class="form-control">
                                        </td>
                                    </tr>
                                </table>
                                <input type="submit" value="입력" class="btn btn-primary formBtn">
                            </form>
                        </div>

                        <div class="tab-pane" id="medicineRecordHistory" role="tabpanel">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th style="width : 20%">기록코드</th>
                                        <th>약품명</th>
                                        <th style="width : 20%">작성일</th>
                                        <th style="width : 15%">작성자</th>
                                    </tr>
                                </thead>
                                <tbody class="medicineRecordListBody">
                                </tbody>
                            </table>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <div class="grid-stack-item" gs-x="8" gs-y="0" gs-w="4" gs-h="5">
            <div class="grid-stack-item-content">
                <div class="item-header">
                    <h5>병동 배치 상황</h5>
                    <hr>
                </div>
                <div class="item-body" id="wardStatus">

                    <span></span>
                    <table class="table table-bordered">
                        <thead>

                        </thead>
                        <tbody>

                        </tbody>
                    </table>
                    <br>

                    <span></span>
                    <table class="table table-bordered">
                        <thead>

                        </thead>
                        <tbody>

                        </tbody>
                    </table>
                    <br>

                    <span></span>
                    <table class="table table-bordered">
                        <thead>

                        </thead>
                        <tbody>

                        </tbody>
                    </table>
                    <br>

                    <span></span>
                    <table class="table table-bordered">
                        <thead>

                        </thead>
                        <tbody>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!-- 입원 정보 모달 -->
    <div class="modal fade" id="wardInfoModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="patientName">
                    </div>
                    <hr>
                    <div class="wardInfoBody">
                        <table class="table table-bordered">
                            <tr>
                                <th style="width: 30%;">입원일</th>
                                <td></td>
                            </tr>
                            <tr>
                                <th style="width: 30%;">입원일수</th>
                                <td></td>
                            </tr>
                            <tr>
                                <th style="width: 30%;">예상퇴원일</th>
                                <td></td>
                            </tr>
                        </table>
                    </div>

                </div>
                <div class="modal-footer" style="display: flex;">
                    <input type="button" value="퇴원처리" class="btn btn-outline-danger formBtn" id="checkOutBtn">
                    <button type="button" class="btn btn-primary" data-bs-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
    </div>

    <!-- 간호기록 모달 -->
    <div class="modal fade" id="nurseChartModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="exampleModalLabel">간호기록</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="nurseChartTitle"></div>
                    <hr>
                    <div class="nurseChartSubTitle">

                    </div>
                    <div class="nurseChartContent">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-bs-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
    </div>

    <!-- 회진 기록 모달 -->
    <div class="modal fade" id="roundsRecordModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="exampleModalLabel">회진 히스토리</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">

                    <div class="roundsRecordTitle"></div>
                    <hr>
                    <div class="roundsRecordSubTitle">

                    </div>
                    <div class="roundsRecordContent">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>약품코드</th>
                                    <th>약품명</th>
                                    <th style="width: 15%;">일투</th>
                                    <th style="width: 13%;">단위</th>
                                    <th style="width: 13%;">투여</th>
                                </tr>
                            </thead>
                            <tbody class="roundsRecordMedicineListBody">

                            </tbody>
                        </table>

                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-bs-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
    </div>

    <!-- 의약품 모달 -->
    <div class="modal fade" id="medicineModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">의약품 목록</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" style="display: block;">
                    <div>
                        <input type="text" class="form-control" id="searhMedicineInput" placeholder="의약품코드/의약품명으로 검색">
                    </div>
                    <div id="medicineTableDiv" style="height: 500px; overflow-y: auto; margin-top: 10px;">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th style="width: 25%;">의약품코드</th>
                                    <th style="width: 50%;">의약품명</th>
                                    <th style="width: 25%;">투여</th>
                                </tr>
                            </thead>
                            <tbody class="wardMedicineListBody">

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        // 그리드스택 기본설정
        var grid = GridStack.init({});

        // 선택한 환자 정보 
        let selectedPatientInfo = null;

        // 진료기록차트 나올 부분 selected
        let medicalChartBody = $('#medicalChartBody');

        // 진료기록 td selected
        let medicalTdTags = medicalChartBody.find("td");

        // 식이 종류 들어갈 select tag
        let dietKindSelect = $('select[name="dietKind"]');

        // 로컬로지에서 식이 종류 잇는지 체크
        if (localStorage.getItem("dietKindList") == null) {
            console.log("식이 종류 업성");
            getDietKindList();
        }

        // 로컬로지에 약품 목록 저장하기 
        if (localStorage.getItem("wardMedicineList") == null) {
            getWardMedicineList();
        }

        function getWardMedicineList() {
            $.ajax({
                url: "${cPath}/ward/medicineList"
                , method: "GET"
                , dataType: "json"
                , success: (resp) => {
                    localStorage.setItem("wardMedicineList", JSON.stringify(resp));
                }
            })
        }


        // 입원 환자 목록 selected && tr onclick 이벤트
        let hospitalizePatientList = $('#hospitalizePatientList').on('click', '.patient', function () {
            $(this).css("background-color", "#d0d0d0");
            $(this).siblings().css("background-color", "white");

            selectedPatientInfo = $(this).data('patientInfo');
            $('input[name="hospitalizeRecordKey"]').val(selectedPatientInfo.hospitalizeRecordKey);

            // 진료 차트 가져오기 
            getMedicalChart();

            // 간호 기록 리스트 가져오기 
            getNurseChartList();

            // 식이 기록 리스트 가져오기 
            getDietList();

            // 바이탈 기록 리스트 가져오기 
            getVitalList();

            // IO 기록 리스트 가져오기 
            getIOList();

            // 오늘 회진 기록 가져오기 
            getTodayRoundsRecord();

            // 회진 기록 리스트 가져오기 
            getRoundsRecordList();

            // 투약 기록 리스트 가져오기
            getMedicineRecordList();

            // 초기화 
            setMedicineRecord();
            setHospitalizeRecord();
            setRoundsMedicineKeyList();
        })


        // 식이 종류 목록 ajax
        function getDietKindList() {
            $.ajax({
                url: "${cPath}/ward/dietKindList"
                , method: "GET"
                , dataType: "json"
                , success: (resp) => {
                    localStorage.setItem("dietKindList", JSON.stringify(resp));
                }
            });
        }

        // 식이 종류 옵션 만들기
        function createDietKindOption() {
            console.log("식이 종류 만들게~")
            let dietKindList = JSON.parse(localStorage.getItem("dietKindList"));

            $.each(dietKindList, (idx, dietKind) => {
                dietKindSelect.append(
                    $('<option>').val(dietKind.code).html(dietKind.codeName)
                )
            });
        }
        createDietKindOption();

        // 입원 환자 목록 ajax 
        function getHospitalizePatinetList() {
            $.ajax({
                url: "${cPath}/ward/hospitalizePatientList"
                , method: "GET"
                , dataType: "json"
                , success: (resp) => {
                    hospitalizePatientList.empty();
                    $.each(resp, (index, value) => {
                        let patientInfo = value.patient;

                        let td = $('<td>');
                        // if (patientInfo.patientTypeName == "VIP") {
                        //     td = $('<td>').css("color", "red");
                        // }
                        // else if (patientInfo.patientTypeName == "관심환자") {
                        //     td = $('<td>').css("color", "green");
                        // }
                        let tr = $('<tr>').append(
                            $('<td>').html(patientInfo.patientKey),
                            td.html(patientInfo.patientName).attr({
                                "data-bs-toggle": "modal"
                                , "data-bs-target": "#patientViewModal"
                            }).addClass("cursor"),
                            $('<td>').html(patientInfo.patientAge),
                            $('<td>').html(patientInfo.patientSex),
                            $('<td>').html(value.wardKey)
                        ).addClass("patient patientTr").data("patientInfo", value);
                        hospitalizePatientList.append(tr);
                    })
                }
            });
        }
        getHospitalizePatinetList();

        // 진료 차트 가져오기
        function getMedicalChart() {
            $.ajax({
                url: "${cPath}/ward/medicalChart"
                , method: "GET"
                , data: { orderKey: selectedPatientInfo['orderKey'] }
                , dataType: "json"
                , contentType: "application/json"
                , success: (resp) => {
                    let data = [];
                    data.push(selectedPatientInfo.patient.patientKey);
                    data.push(selectedPatientInfo.patient.patientName);
                    data.push(selectedPatientInfo.patient.patientRegno1);
                    data.push(resp.empName);
                    data.push(resp.chartCont);
                    data.push(resp.diseaseName);
                    data.push(resp.orderName);

                    $.each(medicalTdTags, (idx, td) => {
                        $(td).html(data[idx]);
                    });
                }
            });
        }

        // 간호기록 Form submit 이벤트 핸들러 
        let nurseChartForm = $('.nurseChartForm').on('submit', function () {
            event.preventDefault();

            let message = null;

            let formData = $(this).serializeArray();
            let vo = {};
            $.each(formData, function (index, field) {
                vo[field.name] = field.value;
                if (field.value == '') {
                    message = "모든 항목을 채워주세요.";
                }
            });

            if (selectedPatientInfo == null) {
                message = "선택된 환자가 없습니다."
            }

            if (message != null) {


                return;
            }

            $.ajax({
                url: "${cPath}/ward/nurseChart"
                , method: "POST"
                , data: JSON.stringify(vo)
                , contentType: "application/json"
                , dataType: "text"
                , beforeSend: function (xhr) {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                }
                , success: (resp) => {
                    if (resp == 'success') {
                        // 성공
                        $(this).find('textarea').val('');
                        getNurseChartList();
                    } else {
                        // 실패 
                        Swal.fire({
                            icon: 'error',
                            title: '오류'
                        });
                    }
                }
            });
            return false;
        });

        // 식이 기록 Form submit 이벤트
        let dietForm = $('.dietForm').on('submit', function () {
            event.preventDefault();

            let message = null;
            let formData = $(this).serializeArray();
            let vo = {};
            $.each(formData, function (index, field) {
                vo[field.name] = field.value;
                if (field.value == '') {
                    message = "모든 항목을 채워주세요.";
                }
            });

            if (selectedPatientInfo == null) {
                message = "선택된 환자가 없습니다."
            }

            if (message != null) {
                Swal.fire({
                    icon: 'error',
                    title: message
                });
                return;
            }

            $.ajax({
                url: "${cPath}/ward/diet"
                , method: "POST"
                , data: JSON.stringify(vo)
                , contentType: "application/json"
                , dataType: "text"
                , beforeSend: function (xhr) {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                }
                , success: (resp) => {
                    if (resp == 'success') {
                        // 성공
                        getDietList();
                        $(this).find('table').find('input[name]').val('');
                        $(this).find('table').find('select').val('');
                    } else {
                        // 실패 
                        Swal.fire({
                            icon: 'error',
                            title: '오류'
                        });
                    }
                }
            });
            return false;
        })

        // 바이탈 Form submit 이벤트 
        let vitalForm = $('.vitalForm').on('submit', function (event) {
            event.preventDefault();

            let message = null;
            let formData = $(this).serializeArray();
            let vo = {};
            $.each(formData, function (index, field) {
                vo[field.name] = field.value;
                if (field.value == '') {
                    message = "모든 항목을 채워주세요.";
                }
            });

            if (selectedPatientInfo == null) {
                message = "선택된 환자가 없습니다."
            }

            if (message != null) {
                Swal.fire({
                    icon: 'error',
                    title: message
                });
                return;
            }

            $.ajax({
                url: "${cPath}/ward/vital"
                , method: "POST"
                , data: JSON.stringify(vo)
                , contentType: "application/json"
                , dataType: "text"
                , beforeSend: function (xhr) {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                }
                , success: (resp) => {
                    if (resp == 'success') {
                        // 성공
                        getVitalList();
                        $(this).find('table').find('input[name]').val('');
                    } else {
                        // 실패 
                        Swal.fire({
                            icon: 'error',
                            title: '오류'
                        });
                    }
                }
            });
            return false;
        });

        // IO Form submit 이벤트
        let ioForm = $('.ioForm').on('submit', function (event) {
            event.preventDefault();

            let message = null;
            let formData = $(this).serializeArray();
            let vo = {};
            $.each(formData, function (index, field) {
                vo[field.name] = field.value;
                if (field.value == '') {
                    message = "모든 항목을 채워주세요.";
                }
            });

            if (selectedPatientInfo == null) {
                message = "선택된 환자가 없습니다."
            }

            if (message != null) {
                Swal.fire({
                    icon: 'error',
                    title: message
                });
                return;
            }

            $.ajax({
                url: "${cPath}/ward/io"
                , method: "POST"
                , data: JSON.stringify(vo)
                , contentType: "application/json"
                , dataType: "text"
                , beforeSend: function (xhr) {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                }
                , success: (resp) => {
                    if (resp == 'success') {
                        // 성공
                        getIOList();
                        $(this).find('table').find('input[name]').val('');
                    } else {
                        // 실패 
                        Swal.fire({
                            icon: 'error',
                            title: '오류'
                        });
                    }
                }
            });

            return false;
        })

        function setHospitalizeRecord() {
            nurseChartForm.find('textarea').val('');
            dietForm.find('table').find('input[name]').val('');
            dietForm.find('table').find('select').val('');
            vitalForm.find('table').find('input[name]').val('');
            ioForm.find('table').find('input[name]').val('');
        }



        // 병동 상태 넣을 tbody selected
        let wardStatus = $('#wardStatus');

        // 호실 넣을 span 부분 selected
        let wardStatusSpans = wardStatus.find('span');

        let patientNameDiv = $('.patientName');
        let wardInfoBodyDiv = $('.wardInfoBody');
        let wardInfoTable = wardInfoBodyDiv.find('table');
        let wardInfoTableTd = wardInfoTable.find('td');

        let checkOutTargetPatientKey = '';
        let checkOutTargetHospitalizeRecordKey = '';

        // 병동 상태 테이블 selected
        // 입원 정보 모달 열릴때 이벤트
        let wardStatusTables = wardStatus.find('table').on('click', '.wardInfoTd', function (event) {
            patientNameDiv.empty();
            let data = $(this).data("wardInfo")
            console.log("데이터 체킁", data);
            patientNameDiv.append($("<h5>").html(`\${data.patientName} 환자`));
            wardInfoTableTd.eq(0).html(data.checkInDate);
            wardInfoTableTd.eq(1).html(data.wardIngDate);
            wardInfoTableTd.eq(2).html(data.expectedCheckOutDate);
            checkOutTargetPatientKey = data.patientKey;
            checkOutTargetHospitalizeRecordKey = data.hospitalizeRecordKey;
        });

        // 병동 상태 불러오기
        function getWardStatus() {
            $.ajax({
                url: "${cPath}/reservation/wardBedStatus",
                method: "get",
                dataType: "json",
                success: (resp) => {
                    let groupedData = resp.reduce((acc, obj) => {
                        const key = obj.wardKey;
                        if (!acc[key]) {
                            acc[key] = [];
                        }
                        acc[key].push(obj);
                        return acc;
                    }, {});

                    let index = 0;
                    $.each(groupedData, function (i, ward) {
                        wardStatusSpans.eq(index).text(`\${i}호 (\${ward[0].wardGrade})`);

                        let theadTr = $('<tr>');
                        let tbodyTr = $('<tr>');
                        $.each(ward, function (j, bed) {
                            let th = $('<th>').html(`\${j+1}번 침상`);
                            let td = $('<td>');
                            td.data("wardInfo", bed);
                            if (bed.patientName != null) {
                                td.html(`\${bed.patientName}`).attr({
                                    "data-bs-toggle": "modal"
                                    , "data-bs-target": "#wardInfoModal"
                                }).addClass("wardInfoTd cursor");
                            }
                            theadTr.append(th);
                            tbodyTr.append(td);
                        });
                        wardStatusTables.eq(index).find("thead").empty().append(theadTr);
                        wardStatusTables.eq(index).find("tbody").empty().append(tbodyTr);
                        index++;
                    });
                }
            });
        }
        getWardStatus();


        // 간호 차트 기록 모달 selected 
        let nurseChartModal = $('#nurseChartModal');

        let nurseChartTitlePart = nurseChartModal.find('.nurseChartTitle');
        let nurseChartSubTitlePart = nurseChartModal.find('.nurseChartSubTitle');
        let nurseChartContentPart = nurseChartModal.find('.nurseChartContent');

        // 간호 차트 기록 모달 열렸을 때 --> tr 클릭했을 때
        let nurseChartRecord = $('.nurseChartRecord').on('click', '.nurseChartTr', function () {

            // 초기화
            nurseChartTitlePart.empty();
            nurseChartSubTitlePart.empty();
            nurseChartContentPart.empty();

            // 선택한 간호 데이터 확보
            let nurseChartInfo = $(this).data("nurseChartInfo");
            let nurseChartKey = nurseChartInfo.nurseChartKey;
            let nurseChartDate = nurseChartInfo.nurseChartDate;
            let nurseChartContent = nurseChartInfo.nurseChartContent;
            let empName = nurseChartInfo.empName;

            nurseChartTitlePart.append(
                $('<h5>').html(nurseChartKey)
            );
            nurseChartSubTitlePart.append(
                $('<p>').html(`작성자 : \${empName}`)
                , $('<p>').html(`작성일 : \${nurseChartDate}`)
            )
            nurseChartContentPart.append(
                $('<sapn>').html(nurseChartContent)
            )

        });

        // 간호기록 목록 불러오기 
        function getNurseChartList() {
            let hospitalizeRecordKey = selectedPatientInfo.hospitalizeRecordKey
            nurseChartRecord.empty();
            $.ajax({
                url: "${cPath}/ward/nurseCharList"
                , method: "GET"
                , dataType: "json"
                , data: { "hospitalizeRecordKey": hospitalizeRecordKey }
                , success: (resp) => {
                    $.each(resp, function (idx, nurseChart) {
                        let tr = $('<tr>').append(
                            $('<td>').html(nurseChart.nurseChartKey)
                            , $('<td>').html(nurseChart.nurseChartDate)
                            , $('<td>').html(nurseChart.empName)
                        ).addClass("nurseChartTr").data("nurseChartInfo", nurseChart).attr({
                            "data-bs-toggle": "modal"
                            , "data-bs-target": "#nurseChartModal"
                        });
                        nurseChartRecord.append(tr);
                    });
                }
            });
        }

        let dietRecord = $('.dietRecord');
        // 식이 기록 불러오기
        function getDietList() {
            let hospitalizeRecordKey = selectedPatientInfo.hospitalizeRecordKey
            dietRecord.empty();
            $.ajax({
                url: "${cPath}/ward/dietList"
                , method: "GET"
                , dataType: "json"
                , data: { "hospitalizeRecordKey": hospitalizeRecordKey }
                , success: (resp) => {
                    $.each(resp, function (idx, diet) {
                        let tr = $('<tr>').append(
                            $('<td>').html(diet.dietKey)
                            , $('<td>').html(diet.dietMealsName)
                            , $('<td>').html(diet.dietKindName)
                            , $('<td>').html(diet.dietIntake)
                            , $('<td>').html(diet.dietTime)
                        )
                        dietRecord.append(tr);
                    });

                }
            });
        }

        let vitalRecord = $('.vitalRecord');
        // 바이탈 기록 불러오기
        function getVitalList() {
            let hospitalizeRecordKey = selectedPatientInfo.hospitalizeRecordKey
            vitalRecord.empty();
            $.ajax({
                url: "${cPath}/ward/vitalList"
                , method: "GET"
                , dataType: "json"
                , data: { "hospitalizeRecordKey": hospitalizeRecordKey }
                , success: (resp) => {
                    $.each(resp, function (idx, vital) {

                        let hyperBPTd = $('<td>').html(vital.hyperBP);
                        if (vital.hyperBP > 120) {
                            hyperBPTd.css("color", "red");
                        }

                        let hypoBPTd = $('<td>').html(vital.hypoBP);
                        if (vital.hypoBP < 80) {
                            hypoBPTd.css("color", "red");
                        }

                        let pulseTd = $('<td>').html(vital.pulse);
                        if (vital.pulse > 100 || vital.pulse < 60) {
                            pulseTd.css("color", "red");
                        }

                        let respirationTd = $('<td>').html(vital.respiration);
                        if (vital.respiration > 20 || vital.respiration < 12) {
                            respirationTd.css("color", "red");
                        }

                        let temperatureTd = $('<td>').html(vital.temperature);
                        if (vital.temperature >= 37 || vital.temperature <= 35) {
                            temperatureTd.css("color", "red");
                        }

                        let tr = $('<tr>').append(
                            $('<td>').html(vital.vitalKey)
                            , hyperBPTd
                            , hypoBPTd
                            , pulseTd
                            , respirationTd
                            , temperatureTd
                            , $('<td>').html(vital.vitalDate)
                        )
                        vitalRecord.append(tr);
                    });

                }
            });
        }

        let ioRecord = $('.ioRecord');
        // IO 기록 불러오기
        function getIOList() {
            let hospitalizeRecordKey = selectedPatientInfo.hospitalizeRecordKey
            ioRecord.empty();

            $.ajax({
                url: "${cPath}/ward/ioList"
                , method: "GET"
                , dataType: "json"
                , data: { "hospitalizeRecordKey": hospitalizeRecordKey }
                , success: (resp) => {
                    $.each(resp, function (idx, io) {

                        let totalIO = io.ioIntake - io.ioOutput;
                        let totalIOTd = $('<td>').html(totalIO);
                        if (totalIO < 0) {
                            totalIOTd.css("color", "red");
                        }

                        let tr = $('<tr>').append(
                            $('<td>').html(io.ioKey)
                            , $('<td>').html(io.ioIntake)
                            , $('<td>').html(io.ioOutput)
                            , totalIOTd
                            , $('<td>').html(io.ioDate)
                        )
                        ioRecord.append(tr);
                    });

                }
            });

        }

        let roundsMedicineKeyList = [];
        let roundsRecordDiv = $('#roundsRecord');
        let roundsRecordTable = roundsRecordDiv.find('table');

        // 회진 처방된 의약품 하나 지우기 
        let roundsMedicineListBody = $('.roundsMedicineListBody').on('click', '.deleteMedicine', function () {

            let data = roundsMedicineListBody.data("roundsMedicineKeyList").indexOf($(this).parents('.roundsMedicineTr').data("medicineInfo").medicineKey)
            roundsMedicineListBody.data("roundsMedicineKeyList").splice(data, 1);
            $(this).parents('.roundsMedicineTr').remove();

        }).data("roundsMedicineKeyList", roundsMedicineKeyList);

        function setRoundsMedicineKeyList() {
            roundsMedicineKeyList = [];
            roundsMedicineListBody.data("roundsMedicineKeyList", roundsMedicineKeyList);
        }

        let medicineRecordForm = $('.medicineRecordForm').on('submit', function (event) {
            event.preventDefault();

            let message = null;

            let formData = $(this).serializeArray();
            let commonVO = {};
            $.each(formData, function (index, field) {
                commonVO[field.name] = field.value;
            });


            if (selectedMedicineList.length == 0) {
                message = "선택한 약품이 없습니다."
            }

            if (selectedPatientInfo == null) {
                message = "선택된 환자가 없습니다."
            }


            if (message != null) {
                Swal.fire({
                    icon: 'error',
                    title: message
                });
                return;
            }

            let voList = [];
            $.each(selectedMedicineList, function (idx, medicineKey) {
                let vo = {
                    "hospitalizeRecordKey": commonVO.hospitalizeRecordKey
                    , "medicineRecordContent": commonVO.medicineRecordContent
                    , "medicineRecordWriter": commonVO.medicineRecordWriter
                    , "medicineKey": medicineKey
                };
                voList.push(vo);
            });

            $.ajax({
                url: "${cPath}/ward/medicineRecord"
                , method: "POST"
                , data: JSON.stringify(voList)
                , contentType: "application/json"
                , dataType: "text"
                , beforeSend: function (xhr) {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                }
                , success: (resp) => {
                    if (resp = "succeess") {
                        setMedicineRecord();
                        isSavedRounds = true;
                        getMedicineRecordList();
                    } else {
                        Swal.fire({
                            icon: 'error',
                            title: '오류'
                        });
                    }
                }
            });




            return false;
        });

        let inputMedicineTable = $('.inputMedicineTable');
        let medicineRecordContentInput = inputMedicineTable.find('input[name="medicineRecordContent"]');
        let inputMedicineTrs = inputMedicineTable.find('tr');
        let isFirst = true;
        let selectedMedicineList = [];
        let isSavedRounds = false;
        // 회진 처방 목록에서 하나 클릭시 이벤트 
        roundsMedicineListBody.on('click', 'tr', function () {
            if (!isSavedRounds) {
                return;
            }
            let data = $(this).data("medicineInfo");

            let isDuplication = false;
            $.each(selectedMedicineList, function (idx, key) {
                if (key == data.medicineKey) {
                    isDuplication = true;
                    return;
                }
            });

            if (isDuplication) {
                return;
            }
            let number = 2;
            if (isFirst) {
                isFirst = false;
                inputMedicineTrs.eq(1).find('td').text(data.medicineName).css("text-align", "left");
            } else {
                number = inputMedicineTrs.eq(0).find('th').attr("rowspan");
                number++;
                let tr = $('<tr>').append($("<td>").text(data.medicineName)).css("text-align", "left");
                inputMedicineTrs.eq(1).after(tr);

            }
            inputMedicineTrs.eq(0).find('th').attr("rowspan", number);
            selectedMedicineList.push(data.medicineKey);
        });

        // 약물 투여 기록 초기화 메서드 
        function setMedicineRecord() {
            isSavedRounds = false;
            let number = inputMedicineTrs.length;
            isFirst = true;
            selectedMedicineList = [];
            inputMedicineTrs.eq(1).find('td').text("");
            inputMedicineTrs.eq(0).find('th').attr("rowspan", "2");
            let target = inputMedicineTrs.eq(number - 1);
            inputMedicineTrs.eq(1).nextAll().remove();
            inputMedicineTable.append(target);
            medicineRecordContentInput.val('');
        }


        // 회진 기록 저장하기 onclick 이벤트
        let roundsRecordSaveBtn = roundsRecordDiv.find('input[type="button"]').on('click', function () {

            let hospitalizeRecordKey = selectedPatientInfo.hospitalizeRecordKey;
            let roundsRecordWriter = `${authEmp.empKey}`;
            let roundsPrescriptionList = [];

            let message = null;

            let trs = roundsMedicineListBody.find('tr');
            $.each(trs, function (idx, tr) {
                let rpDay = $(tr).find('input').val();
                if (rpDay == '') {
                    message = "일투를 입력하세요."
                }
                let medicineKey = $(tr).data("medicineInfo").medicineKey;

                let vo = {
                    "medicineKey": medicineKey
                    , "rpDay": rpDay
                }
                roundsPrescriptionList.push(vo);
            });

            if (message != null) {
                Swal.fire({
                    icon: 'error',
                    title: message
                });
                return;
            }

            let data = {
                "hospitalizeRecordKey": hospitalizeRecordKey
                , "roundsRecordWriter": roundsRecordWriter
                , "roundsPrescriptionList": roundsPrescriptionList
            }

            $.ajax({
                url: "${cPath}/ward/roundsRecord"
                , method: "POST"
                , data: JSON.stringify(data)
                , contentType: "application/json"
                , dataType: "text"
                , beforeSend: function (xhr) {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                }
                , success: (resp) => {
                    if (resp = "success") {
                        getTodayRoundsRecord();
                        getRoundsRecordList();
                        isSavedRounds = true;
                    } else {
                        Swal.fire({
                            icon: 'error',
                            title: '오류'
                        });
                    }
                }
            })

        });


        let roundsMedicineTfoot = roundsRecordTable.find('tfoot');
        let deleteTh = roundsRecordTable.find("thead").find("th:last-child").css("display", "none");


        // 오늘 회진 처방 내역 가져오기 
        function getTodayRoundsRecord() {
            let hospitalizeRecordKey = selectedPatientInfo.hospitalizeRecordKey

            // 초기화 
            roundsMedicineListBody.empty();
            roundsMedicineTfoot.empty();
            roundsRecordSaveBtn.css("display", "none");
            deleteTh.css("display", "none");


            $.ajax({
                url: "${cPath}/ward/roundsRecord"
                , method: "GET"
                , data: { "hospitalizeRecordKey": hospitalizeRecordKey }
                , dataType: "json"
                , success: (resp) => {
                    if (resp.roundsPrescriptionList == null) {
                        // 오늘 회진 기록 미완 
                        roundsMedicineTfoot.append(
                            $('<tr>').append(
                                $('<td colspan=6>').html("+").addClass("addMedicine").attr({
                                    "data-bs-toggle": "modal"
                                    , "data-bs-target": "#medicineModal"
                                })
                            )
                        );
                        deleteTh.attr("style", "width:12%; display:'';")
                        roundsRecordSaveBtn.css("display", "block");
                    } else {
                        isSavedRounds = true;
                        $.each(resp.roundsPrescriptionList, function (idx, roundsPrescription) {
                            let tr = $('<tr>').append(
                                $('<td>').html(roundsPrescription.medicineKey)
                                , $('<td>').html(roundsPrescription.medicineName)
                                , $('<td>').html(roundsPrescription.rpDay)
                                , $('<td>').html(roundsPrescription.medicineEa)
                                , $('<td>').html(roundsPrescription.medicineRoute)
                            ).data("medicineInfo", roundsPrescription);
                            roundsMedicineListBody.append(tr);
                        })

                    }
                }
            })
        }



        // 회진 모달 파트 셀렉팅
        let roundsRecordTitlePart = $('.roundsRecordTitle');
        let roundsRecordSubTitlePart = $('.roundsRecordSubTitle');
        let roundsRecordContentPart = $('.roundsRecordContent');

        // 회진 처방 내역 들어갈 tbody
        let roundsRecordMedicineListBody = $('.roundsRecordMedicineListBody');

        // 회진 모달 열렸을 때 이벤트
        let roundsHistoryListBody = $('.roundsHistoryListBody').on('click', '.roundsRecordTr', function () {

            roundsRecordTitlePart.empty();
            roundsRecordSubTitlePart.empty();
            roundsRecordMedicineListBody.empty();

            // 선택한 데이터 확보 
            let data = $(this).data("roundsRecordInfo");

            let roundsRecordKey = data.roundsRecordKey
            let writerName = data.writerName;
            let roundsRecordDate = data.roundsRecordDate;
            let roundsPrescriptionList = data.roundsPrescriptionList;

            roundsRecordTitlePart.append(
                $('<h5>').html(roundsRecordKey)
            );

            roundsRecordSubTitlePart.append(
                $('<p>').html(`작성자 : \${writerName}`)
                , $('<p>').html(`작성일 : \${roundsRecordDate}`)
            );

            $.each(roundsPrescriptionList, function (idx, roundsPrescription) {
                let tr = $('<tr>').append(
                    $('<td>').html(roundsPrescription.medicineKey)
                    , $('<td>').html(roundsPrescription.medicineName)
                    , $('<td>').html(roundsPrescription.rpDay)
                    , $('<td>').html(roundsPrescription.medicineEa)
                    , $('<td>').html(roundsPrescription.medicineRoute)
                );
                roundsRecordMedicineListBody.append(tr);

            });
        });

        function getRoundsRecordList() {
            let hospitalizeRecordKey = selectedPatientInfo.hospitalizeRecordKey;

            roundsHistoryListBody.empty();
            $.ajax({
                url: "${cPath}/ward/roundsRecordList"
                , method: "GET"
                , data: { "hospitalizeRecordKey": hospitalizeRecordKey }
                , dataType: "json"
                , success: (resp) => {
                    $.each(resp, function (idx, roundsRecord) {
                        let tr = $('<tr>').append(
                            $('<td>').html(roundsRecord.roundsRecordKey)
                            , $('<td>').html(roundsRecord.roundsRecordDate)
                            , $('<td>').html(roundsRecord.writerName)
                        ).attr({
                            "data-bs-toggle": "modal"
                            , "data-bs-target": "#roundsRecordModal"
                        }).addClass("roundsRecordTr").data("roundsRecordInfo", roundsRecord);
                        roundsHistoryListBody.append(tr);
                    })
                }
            })



        }

        let medicineModal = $('#medicineModal').on("show.bs.modal", function () {
            mkMedicineList();
        });

        let wardMedicineListBody = $('.wardMedicineListBody').on('click', '.medicneTr', function (event) {

            let data = $(this).data("medicineInfo");

            let isDuplication = false;

            $.each(roundsMedicineListBody.data("roundsMedicineKeyList"), function (idx, key) {
                if (key == data.medicineKey) {
                    isDuplication = true;
                    return;
                }
            });

            if (isDuplication) {
                Swal.fire({
                    icon: 'error',
                    title: "이미 처방한 의약품입니다."
                });
                return;
            }

            roundsMedicineListBody.append(
                $('<tr>').append(
                    `<td>\${data.medicineKey}</td>
                        <td>\${data.medicineName}</td>
                        <td><input class="form-control input-sm"/></td>
                        <td>\${data.medicineEa}</td>
                        <td>\${data.medicineRoute}</td>
                        <td class="deleteMedicine"><i class="bx bx-minus-circle fs-22 dels"></i></td>`
                ).addClass("roundsMedicineTr").data("medicineInfo", data)
            );
            medicineModal.modal('hide');

            roundsMedicineListBody.data("roundsMedicineKeyList").push(data.medicineKey);
        });



        // localStorage에서 medicineList 가져와서 table 구성
        function mkMedicineList(dataList) {
            if (dataList == null) {
                dataList = JSON.parse(localStorage.getItem("wardMedicineList"));
            }
            let trTags = [];
            $.each(dataList, function (idx, medicine) {
                let tr =
                    $('<tr>').append(
                        $('<td>').html(medicine.medicineKey)
                        , $('<td>').html(medicine.medicineName)
                        , $('<td>').html(medicine.medicineRoute)
                    ).addClass('medicneTr').data('medicineInfo', medicine);
                trTags.push(tr);
            });
            wardMedicineListBody.empty().append(trTags);
        }

        // search input tag selected
        let searhMedicineInput = $('#searhMedicineInput');

        const regExp = /^[0-9]+$/;
        //keyup 이벤트에서 검색 함수 호출
        searhMedicineInput.on('keyup', function () {
            let searchData = $(this).val();
            searchMedicine(searchData);
        });

        function searchMedicine(searchData) {
            // 검색창 초기화
            if (searchData.length == 0 || searchData == null) {
                mkMedicineList();
                return;
            }

            let result = [];
            let data = JSON.parse(localStorage.getItem("wardMedicineList"));
            $.each(data, function (idx, medicine) {
                let target;
                if (regExp.test(searchData)) {
                    //숫자로만 검색 --> 의약품코드 검색
                    target = medicine.medicineKey;
                } else {
                    // 그외 --> 의약품명 검색
                    target = medicine.medicineName;
                }
                if (target == null) {
                    console.log("널 왜나왕!", idx, medicine);
                }

                if (target.indexOf(searchData) != -1) {
                    result.push(medicine);
                }
            });
            mkMedicineList(result);
        }

        let medicineRecordListBody = $('.medicineRecordListBody');

        function getMedicineRecordList() {
            let hospitalizeRecordKey = selectedPatientInfo.hospitalizeRecordKey;
            medicineRecordListBody.empty();
            $.ajax({
                url: "${cPath}/ward/medicineRecordList"
                , method: "GET"
                , dataType: "json"
                , data: { "hospitalizeRecordKey": hospitalizeRecordKey }
                , success: (resp) => {
                    $.each(resp, function (idx, medicineRecord) {
                        let tr = $('<tr>').append(
                            $('<td>').html(medicineRecord.medicineRecordKey)
                            , $('<td>').html(medicineRecord.medicineName)
                            , $('<td>').html(medicineRecord.medicineRecordDate)
                            , $('<td>').html(medicineRecord.medicineRecordWriterName)
                        )
                        medicineRecordListBody.append(tr);
                    });
                }
            });
        }

        let wardInfoModal = $('#wardInfoModal');
        let checkOutBtn = $('#checkOutBtn').on('click', function () {

            console.log('퇴원처리 시작점');

            console.log("환자코드 : ", checkOutTargetPatientKey);
            console.log("입원코드 : ", checkOutTargetHospitalizeRecordKey);
            let vo = {

                "patientKey": checkOutTargetPatientKey
                , "hospitalizeRecordKey": checkOutTargetHospitalizeRecordKey
            }

            $.ajax({
                url: "${cPath}/ward/checkOut"
                , method: "PUT"
                , data: JSON.stringify(vo)
                , contentType: "application/json"
                , dataType: "text"
                , beforeSend: function (xhr) {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                }
                , success: (resp) => {
                    if (resp == "success") {
                        getWardStatus();
                        getHospitalizePatinetList();
                        $.each(medicalTdTags, (idx, td) => {
                            $(td).html("");
                        });
                        nurseChartRecord.empty();
                        dietRecord.empty();
                        vitalRecord.empty();
                        ioRecord.empty();

                        roundsMedicineListBody.empty();
                        roundsMedicineTfoot.empty();
                        roundsRecordSaveBtn.css("display", "none");
                        deleteTh.css("display", "none");

                        roundsHistoryListBody.empty();
                        medicineRecordListBody.empty();
                        wardInfoModal.modal('hide');
                    } else {
                        Swal.fire({
                            icon: 'error',
                            title: '오류'
                        });
                    }
                }

            });
        })




    </script>