<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <style>
        .modal-head,
        .modal-body {
            padding: 50px;
        }

        .modal-body label {
            color: #3C486B;
            font-size: 1.2em;
        }
    </style>

    <!-- 환자 상세보기 모달  -->
    <div class="modal fade modal-lg" id="patientViewModal" tabindex="-1" aria-labelledby="exampleModalgrid1Label"
        aria-modal="true">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <h3 id="exampleModalgrid1Label2">환자 상세 정보</h3>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>

                <div class="modal-body">
                    <div class="patientDetailBody">
                        <div class="patientPart">
                            <hr>
                            <h5>환자 정보</h5>
                            <hr>
                            <form id="patientInfoForm">
                                <div style="padding: 30px;">
                                    <div class="row g-3">
                                        <div class="col-xxl-6">
                                            <div>
                                                <label for="patientKey" class="form-label">환자 코드</label>
                                                <input type="text" readonly class="form-control" name="patientKey"
                                                    id="getpatientKey" style="border: none;">
                                            </div>
                                        </div>
                                        <div class="col-xxl-6">
                                            <div>
                                                <label for="patientName" class="form-label">이름</label>
                                                <input type="text" readonly class="form-control" name="patientName"
                                                    style="border: none;">
                                            </div>
                                        </div>
                                        <div class="col-xxl-6">
                                            <div>
                                                <label for="patientAge" class="form-label">나이</label>
                                                <input type="text" readonly class="form-control" name="patientAge"
                                                    style="border: none;">
                                            </div>
                                        </div>
                                        <div class="col-xxl-6">
                                            <label for="patientSex" class="form-label">성별</label>
                                            <input type="text" readonly class="form-control" name="patientSex"
                                                style="border: none;">
                                        </div>
                                        <div class="col-xxl-6">
                                            <div>
                                                <label for="patientRegno" class="form-label">주민등록번호</label>
                                                <input type="text" readonly class="form-control" name="patientRegno"
                                                    oninput="autoHyphen1(this)" style="border: none;" maxlength="14">
                                            </div>
                                        </div>
                                        <div class="col-xxl-6">
                                            <div>
                                                <label for="patientPn" class="form-label">연락처</label>
                                                <input type="text" readonly class="form-control" name="patientPn"
                                                    oninput="autoHyphen2(this)" style="border: none;" maxlength="13">
                                            </div>
                                        </div>
                                        <div class="col-xxl-6">
                                            <label for="patientAddress" class="form-label">주소</label>
                                            <button type="button" class="btn btn-outline-primary btn-sm"
                                                name="addressAPI" onclick="getAddressByAPI(this)"
                                                style="display: none; float: right;">주소 검색</button>
                                            <input type="text" readonly class="form-control" name="patientAddress"
                                                style="border: none;">
                                            <input type="text" readonly class="form-control" name="patientAddressDetail"
                                                style="border: none;">
                                        </div>
                                        <div class="col-xxl-6">
                                            <div>
                                                <label for="patientTypeName" class="form-label">환자
                                                    유형</label>
                                                <select name="patientType" disabled class="form-select">
                                                    <option value="PK02">일반환자</option>
                                                    <option value="PK03">관심환자</option>
                                                    <option value="PK01">VIP</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-xxl-6">
                                            <div>
                                                <label for="patientSignificant" class="form-label">
                                                    특이사항</label>
                                                <input type="text" readonly class="form-control"
                                                    name="patientSignificant" style="border: none;">
                                            </div>
                                        </div>
                                        <div class="col-lg-12">
                                            <div class="hstack gap-2 justify-content-end">
                                                <button type="button" class="btn btn-primary"
                                                    id="updatePatientButton">환자정보수정</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <hr>

                        <div class="guardianPart">
                            <h5>보호자 정보</h5>
                            <hr>
                            <form id="guardianInfoForm">
                                <div style="padding: 30px;">
                                    <div class="row g-3">
                                        <input type="hidden" name="guardianKey">
                                        <div class="col-xxl-12">
                                            <div>
                                                <label for="guardianName" class="form-label">이름</label>
                                                <input type="text" readonly class="form-control" name="guardianName"
                                                    style="border: none;">
                                            </div>
                                        </div>
                                        <div class="col-xxl-6">
                                            <div>
                                                <label for="guardianPN" class="form-label">연락처</label>
                                                <input type="text" readonly class="form-control" name="guardianPN"
                                                    oninput="autoHyphen2(this)" style="border: none;">
                                            </div>
                                        </div>
                                        <div class="col-xxl-6">
                                            <div>
                                                <label for="guardianRelationName" class="form-label">관계</label>
                                                <select name="guardianRelation" disabled class="form-select">
                                                    <option value="">선택</option>
                                                    <option value="F001">부</option>
                                                    <option value="F002">모</option>
                                                    <option value="F003">형제</option>
                                                    <option value="F004">조부모</option>
                                                    <option value="F005">그외</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-lg-12">
                                            <div class="hstack gap-2 justify-content-end">
                                                <button type="button" class="btn btn-primary"
                                                    id="updateGuardianButton">보호자정보수정</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <hr>

                        <div class="preDiagnosis">
                            <h5>예진표</h5>
                            <hr>
                            <form id="preDiagnosisInfoForm">
                                <div style="padding: 30px;">
                                    <div class="row g-3">
                                        <input type="hidden" name="preDiagnosisKey">
                                        <div class="col-xxl-6">
                                            <div>
                                                <label for="preDiagnosisExperience" class="form-label">수술경험</label>
                                                <input type="text" readonly class="form-control"
                                                    name="preDiagnosisExperience" style="border: none;">
                                            </div>
                                        </div>
                                        <div class="col-xxl-6">
                                            <div>
                                                <label for="preDiagnosisDisease" class="form-label">치료중인
                                                    질환</label>
                                                <input type="text" readonly class="form-control"
                                                    name="preDiagnosisDisease" style="border: none;">
                                            </div>
                                        </div>
                                        <div class="col-xxl-6">
                                            <div>
                                                <label for="preDiagnosisAllergy" class="form-label">특이체질/알러지</label>
                                                <input type="text" readonly class="form-control"
                                                    name="preDiagnosisAllergy" style="border: none;">
                                            </div>
                                        </div>
                                        <div class="col-xxl-6">
                                            <div>
                                                <label for="preDiagnosisPregnancy" class="form-label">임신여부</label>
                                                <select name="preDiagnosisPregnancy" disabled class="form-select">
                                                    <option value="Y">예</option>
                                                    <option value="N">아니오</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-xxl-6">
                                            <div>
                                                <label for="preDiagnosisChoice" class="form-label">병원선택이유</label>
                                                <input type="text" readonly class="form-control"
                                                    name="preDiagnosisChoice" style="border: none;">
                                            </div>
                                        </div>
                                        <div class="col-lg-12">
                                            <div class="hstack gap-2 justify-content-end">
                                                <button type="button" class="btn btn-primary"
                                                    id="updatePreDiagnosisButton">예진표수정</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>


            </div>
        </div>
    </div>
    <!-- 환자 상세보기 모달-->

    <script>

        // 환자 상세보기에서 환자 정보 부분 selected
        let patientPart = $('.patientPart');

        // 환자 상세보기에서 보호자 정보 부분 selected
        let guardianPart = $('.guardianPart');

        // 환자 상세보기에서 예진표 부분 selected
        let preDiagnosisPart = $('.preDiagnosis');

        // 환자 상세보기 모달 열리면 실행되는 이벤트 : 선택된 환자의 키값으로 정보 조회 
        let patientViewModal = $("#patientViewModal").on('show.bs.modal', function (evnet) {

            // event.target의 부모에서 patientKey를 꺼냄 
            let patientKey = $(event.target).parents('.patientTr').data("patientInfo").patientKey;

            // 해당 patientKey로 환자의 상세정보(개인정보, 예진표, 보호자)를 비동기로 요청
            $.ajax({
                url: "${cPath}/patient/patientDetail"
                , method: "GET"
                , data: { patientKey: patientKey }
                , dataType: "json"
                , success: (resp) => {
                    // 응답데이터를 selectedPatientInfo에 저장
                    let selectedPatientInfo = resp;

                    // 상세정보가 보여질 모달의 input들을 select
                    // 환자 개인정보 들어갈 input
                    let patientInputs = patientPart.find('input[name]');
                    // 보호자 정보 들어갈 input
                    let guardianInputs = guardianPart.find('input[name]');
                    // 예진표 정보 들어갈 input
                    let preDiagnosisInputs = preDiagnosisPart.find('input[name]');

                    // 환자 input 개수만큼 반복하여 input의 name 속성 값과 ajax로 가져온 
                    $.each(patientInputs, (idx, input) => {
                        $(input).val(selectedPatientInfo[$(input).attr('name')]);
                    })
                    $.each(guardianInputs, (idx, input) => {
                        $(input).val(selectedPatientInfo['guardian'][$(input).attr('name')]);
                    })
                    $.each(preDiagnosisInputs, (idx, input) => {
                        $(input).val(selectedPatientInfo['preDiagnosis'][$(input).attr('name')]);
                    })

                    patientPart.find('select').val(selectedPatientInfo.patientType);
                    guardianPart.find('select').val(selectedPatientInfo.guardian.guardianRelation);
                    preDiagnosisPart.find('select').val(selectedPatientInfo.preDiagnosis.preDiagnosisPregnancy);
                }
            });
        });

        // 바꿀 수 있는 것 : 이름, 연락처, 주소, 환자 유형, 환자 특이사항
        let updatable = ["patientName", "patientPn", "patientAddress", "patientAddressDetail", "patientSignificant"];

        // 수정 요청인지 아닌지
        let isPatientUpdating = false;
        let isGuardianUpdating = false;
        let isPreDiagnosisUpdating = false;

        // 환자정보 수정 버튼 눌렀을때 이벤트 -------------------------------------------------------------------------------------------
        let updatePatientButton = $('#updatePatientButton').on('click', () => {
            if (!isPatientUpdating) {
                // 수정요청이 아니면 
                $.each(updatable, (idx, target) => {
                    patientPart.find(`input[name=\${target}]`).prop("readonly", false).css("border", "1px solid #ced4da");
                });
                patientPart.find(`select[name=patientType]`).prop("disabled", false);
                patientPart.find(`button[name=addressAPI]`).css("display", "block");
                $("#updatePatientButton").text("저장");
                isPatientUpdating = true;
            } else {
                patientInfoForm.trigger("submit");
            }
        });

        // 보호자정보 수정 버튼 눌렀을 때 이벤트 ---------------------------------------------------------------------------------------------
        let updateGuardianButton = $('#updateGuardianButton').on('click', function () {
            if (!isGuardianUpdating) {
                // 수정요청이 아니면
                guardianPart.find('input[name]').prop("readonly", false).css("border", "1px solid #ced4da");
                guardianPart.find('select[name]').prop("disabled", false);
                $(this).text("저장");
                isGuardianUpdating = true;
            } else {
                guardianInfoForm.trigger("submit");
            }
        });

        // 예진표 수정 버튼 눌렀을 때 이벤트 ---------------------------------------------------------------------------------------------
        let updatePreDiagnosisButton = $('#updatePreDiagnosisButton').on('click', function () {
            if (!isPreDiagnosisUpdating) {
                // 수정요청이 아니면
                preDiagnosisPart.find('input[name]').prop("readonly", false).css("border", "1px solid #ced4da");
                preDiagnosisPart.find('select[name]').prop("disabled", false);
                $(this).text("저장");
                isPreDiagnosisUpdating = true;
            } else {
                preDiagnosisInfoForm.trigger("submit");
            }
        });

        // 환자 정보 업데이트 
        let patientInfoForm = $('#patientInfoForm').on('submit', function (event) {
            event.preventDefault();

            let formData = $(this).serializeArray();
            let vo = {};
            $.each(formData, function (index, field) {
                vo[field.name] = field.value;
            });

            $.ajax({
                url: "${cPath}/patient/patientUpdate.do"
                , method: "POST"
                , contentType: 'application/json; charset=UTF-8'
                , data: JSON.stringify(vo)
                , dataType: "text"
                , beforeSend: function (xhr) {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                }
                , success: (resp) => {
                    console.log("환자 정보 수정 업데이트 실행!")
                    if (resp == "success") {
                        $.each(updatable, (idx, target) => {
                            patientPart.find(`input[name=\${target}]`).prop("readonly", true).css("border", "none").val(vo[target]);
                        });
                        patientPart.find(`select[name=patientType]`).prop("disabled", true);
                        patientPart.find(`button[name=addressAPI]`).css("display", "none");
                        $("#updatePatientButton").text("환자정보수정");
                        isPatientUpdating = false;
                    }
                }
            });
            return false;
        });

        // 보호자 정보 업데이트 
        let guardianInfoForm = $('#guardianInfoForm').on('submit', function (event) {
            event.preventDefault();

            let formData = $(this).serializeArray();
            let vo = {};
            $.each(formData, function (index, field) {
                vo[field.name] = field.value;
            });

            $.ajax({
                url: "${cPath}/guardian/guardianUpdate.do"
                , method: "POST"
                , contentType: 'application/json; charset=UTF-8'
                , data: JSON.stringify(vo)
                , dataType: "text"
                , beforeSend: function (xhr) {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                }
                , success: (resp) => {
                    if (resp == "success") {
                        $.each(guardianPart.find('input[name]'), function (idx, target) {
                            $(target).prop("readonly", true).css("border", "none").val(vo[$(target).attr('name')]);
                        });
                        guardianPart.find('select[name]').prop("disabled", true);
                        updateGuardianButton.text("보호자정보수정");
                        isGuardianUpdating = false;
                    }
                }
            });
            return false;
        });

        // 예진표 정보 업데이트
        let preDiagnosisInfoForm = $('#preDiagnosisInfoForm').on('submit', function (event) {
            event.preventDefault();

            let formData = $(this).serializeArray();
            let vo = {};
            $.each(formData, function (index, field) {
                vo[field.name] = field.value;
            });

            $.ajax({
                url: "${cPath}/preDiagnosis/preDiagnosisUpdate.do"
                , method: "POST"
                , contentType: 'application/json; charset=UTF-8'
                , data: JSON.stringify(vo)
                , dataType: "text"
                , beforeSend: function (xhr) {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                }
                , success: (resp) => {
                    if (resp == "success") {
                        $.each(preDiagnosisPart.find('input[name]'), function (idx, target) {
                            $(target).prop("readonly", true).css("border", "none").val(vo[$(target).attr('name')]);
                        });
                        preDiagnosisPart.find('select[name]').prop("disabled", true);
                        updatePreDiagnosisButton.text("예진표수정");
                        isPreDiagnosisUpdating = false;
                    }
                }
            })

            return false;
        })

        // 환자 상세 정보 모달창 닫혔을 때 초기화
        patientViewModal[0].addEventListener('hidden.bs.modal', function (event) {
            $.each(updatable, (idx, target) => {
                patientPart.find(`input[name=\${target}]`).prop("readonly", true).css("border", "none");
            });
            patientPart.find(`select[name=patientType]`).prop("disabled", true);
            patientPart.find(`button[name=addressAPI]`).css("display", "none");
            $("#updatePatientButton").text("환자정보수정");
            isPatientUpdating = false;

            $.each(guardianPart.find('input[name]'), function (idx, target) {
                $(target).prop("readonly", true).css("border", "none");
            });
            guardianPart.find('select[name]').prop("disabled", true);
            updateGuardianButton.text("보호자정보수정");
            isGuardianUpdating = false;

            $.each(preDiagnosisPart.find('input[name]'), function (idx, target) {
                $(target).prop("readonly", true).css("border", "none");
            });
            preDiagnosisPart.find('select[name]').prop("disabled", true);
            updatePreDiagnosisButton.text("예진표수정");
            isPreDiagnosisUpdating = false;

        });
        // 주소 API ----------------------------------------------------------------------------------------------------------------
        function getAddressByAPI(target) {
            let form = $(target).parents('form');
            new daum.Postcode(
                {
                    oncomplete: function (data) {
                        // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                        // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                        var addr = ''; // 주소 변수
                        var extraAddr = ''; // 참고항목 변수

                        //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                        if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                            addr = data.roadAddress;
                        } else { // 사용자가 지번 주소를 선택했을 경우(J)
                            addr = data.jibunAddress;
                        }

                        // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                        if (data.userSelectedType === 'R') {
                            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                            if (data.bname !== ''
                                && /[동|로|가]$/g.test(data.bname)) {
                                extraAddr += data.bname;
                            }
                            // 건물명이 있고, 공동주택일 경우 추가한다.
                            if (data.buildingName !== ''
                                && data.apartment === 'Y') {
                                extraAddr += (extraAddr !== '' ? ', '
                                    + data.buildingName : data.buildingName);
                            }
                        }

                        // 우편번호와 주소 정보를 해당 필드에 넣는다.
                        form.find('input[name="patientAddress"]').val(addr);
                        // 커서를 상세주소 필드로 이동한다.
                        form.find('input[name="patientAddressDetail"]')[0].focus()

                    }
                    // width: '100%',
                    // height: '100%',
                    // maxSuggestItems: 5
                }).open();
        }

        // 자동 하이픈
        const autoHyphen1 = (target) => {
            target.value = target.value
                .replace(/[^0-9]/g, '')
                .replace(/^(\d{0,6})(\d{0,7})$/g, "$1-$2").replace(/(\-{1,2})$/g, "");
        }
        const autoHyphen2 = (target) => {
            target.value = target.value
                .replace(/[^0-9]/g, '')
                .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
        }

    </script>