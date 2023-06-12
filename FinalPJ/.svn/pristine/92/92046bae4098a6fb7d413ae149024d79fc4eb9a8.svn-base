<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

        <script src='${cPath }/resources/js/dist/index.global.js'></script>
        <script src='${cPath }/resources/js/dist/ko.global.js'></script>

        <style>
            .fc-icon-chevron-right:before {
                content: "";
            }

            .fc-icon-chevron-left:before {
                content: "";
            }


            #calendar-container {
                position: relative;
                z-index: 1;
            }

            #calendar {
                max-width: 1100px;
                margin: 20px auto;
            }


            .customModal { 
                position: fixed;
                width: 100%;
                height: 100%;
                left: 0px;
                top: 0px;
                background-color: rgba(0, 0, 0, 0.274);
                z-index: 315;
                display: none;
            }

            .modalCont {
                width: 30%;
                height: 280px;
                /* 수평 가운데 정렬 */
                margin-top: 15%;
                margin-left: 36%;
                border-radius: 10px;
                background-color: rgb(255, 255, 255);
                color: rgb(9, 9, 8);
            }

            .modalSubmit {
                margin-left: 230px;
            }

            .modalInput {
                width: 250px;
                height: 40px;
                font-size: 15px;
                border: 0;
                border-radius: 15px;
                outline: none;
                padding-left: 10px;
                background-color: rgb(233, 233, 233);
            }

            .calendarCenter {
                margin: 0 auto;
            }

            /* IE */
            select::-ms-expand {
                display: none;
            }

            .select {
                width: 150px;
                height: 35px;
                background: url('https://freepikpsd.com/media/2019/10/down-arrow-icon-png-7-Transparent-Images.png') calc(100% - 5px) center no-repeat;
                background-size: 20px;
                padding: 5px 30px 5px 10px;
                border-radius: 4px;
                outline: 0 none;
            }

            .select option {
                background: black;
                color: #fff;
                padding: 3px 0;
            }

            /* 유림 테마 */

            .item-header {
                color: gray;
            }

            .table {
                text-align: center;
                vertical-align: middle;
                font-size: 9px;
            }

            .table thead {
                background-color: #405189c7;
                color: white;
            }

            .fc .fc-daygrid-day-number {
                height: 20px;
            }

            .modalTop {
                display: flex;
                padding: 15px;
            }

            .modalTop>button {
                margin-left: auto;
            }

            .modalBody {
                height: 50%;
                padding-left: 15px;
                padding-right: 15px;
            }

            .modalFoot {
                display: flex;
                padding: 15px;
            }

            .modalFoot>button {
                margin-left: auto;
            }

            .fc-daygrid-event-harness>a {
                background-color: #f7b84b;
            }


            .fc-daygrid-event-harness>a:hover {
                color: white;
                background-color: #f69c00;
            }

            .fc-event {
                background-color: #f7b84b;
                font-size: 1px;
            }
            .cursor:hover{
                cursor: pointer;
            }
        </style>

        <script>
            let calendar = null;
            $(function () {
                const Calendar = FullCalendar.Calendar; // 캘린더 api 생성하기

                const calendarEl = document.getElementById('calendar'); // body에 캘린더 넣을 부분 태그선택

                calendar = new Calendar(calendarEl, {
                    selectable: true,
                    selectHelper: true,
                    select: function (res) {
                        reservationInfo = res;
                        if (reservationData == null) {
                            Swal.fire({
                                icon: 'error',
                                title: "선택된 환자가 없습니다."
                            });
                            return;
                        }

                        let year = res.start.getFullYear();
                        let month = res.start.getMonth() + 1;
                        let day = res.start.getDate();

                        let spans = modal.find(".patientInfoSpan");
                        spans.eq(0).html(reservationData.patientName);
                        spans.eq(1).html(`\${year}년 \${month}월 \${day}일`);

                        if (res.view.type == "dayGridMonth") {
                            // 시간 선택 안함
                            spans.eq(2).empty().append($('<input type="time">'))
                        } else {
                            // 시간 선택 함
                            let startHour = res.start.getHours();
                            let startMinute = res.start.getMinutes();

                            let endHour = res.end.getHours();
                            let endMinute = res.end.getMinutes();

                            if (startMinute == 0) {
                                startMinute = "00"
                            }
                            if (endMinute == 0) {
                                endMinute = "00"
                            }
                            spans.eq(2).html(`\${startHour}:\${startMinute} - \${endHour}:\${endMinute}`);
                        }
                        spans.eq(3).html(reservationData.empName);
                        spans.eq(4).html(reservationData.surgeryName);
                        modal.show();
                    },
                    headerToolbar: {
                        left: 'prev,next today',
                        center: 'title',
                        right: 'dayGridMonth,timeGridWeek,timeGridDay'
                    },
                    events: '${cPath}/reservation/surgeryInfoList',  // url 서블릿 주소 써주면 됨!
                    editable: true, // 편집가능

                    locale: 'ko', // 한국어
                    eventDrop: function (info) {    // 드래그해서 위치 지정하면 날짜 수정
                        let data = {
                            "surgeryInfoKey": info.event.id
                            , "surgeryStartDate": info.event.start
                            , "surgeryEndDate": info.event.end
                        }
                        console.log("드래그앤 드랍 이벤트 발생 보낼 데이터 : ", data);
                        $.ajax({
                            url: "${cPath}/reservation/surgeryInfo"
                            , method: "PUT"
                            , data: JSON.stringify(data)
                            , contentType: "application/json"
                            , dataType: "text"
                            , beforeSend: function (xhr) {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                            }
                            , success: (resp) => {
                                console.log("업데이트 결과:", resp);
                            }
                        });
                    },
                    // 일정 클릭하면 상세보기 모달로 보여주기
                    eventClick: function (info) {
                        console.log("상세보기", info.event);
                        console.log("ID", info.event.id);

                        let year = info.event.start.getFullYear();
                        let month = info.event.start.getMonth() + 1;
                        let day = info.event.start.getDate();

                        let startHour = info.event.start.getHours();
                        let startMinute = info.event.start.getMinutes();

                        let endHour = info.event.end.getHours();
                        let endMinute = info.event.end.getMinutes();

                        if (startMinute == 0) {
                            startMinute = "00"
                        }
                        if (endMinute == 0) {
                            endMinute = "00"
                        }

                        let date = `\${year}년 \${month}월 \${day}일`;
                        let time = `\${startHour}:\${startMinute} - \${endHour}:\${endMinute}`

                        let spans = detailModal.find(".surgeryInfoSpan");

                        $.ajax({
                            url: "${cPath}/reservation/surgeryInfo"
                            , method: "GET"
                            , data: { "surgeryInfoKey": info.event.id }
                            , dataType: "json"
                            , success: (resp) => {
                                console.log(spans);
                                spans.eq(0).html(resp.patientKey);
                                spans.eq(1).html(resp.patientName);
                                spans.eq(2).html(date);
                                spans.eq(3).html(time);
                                spans.eq(5).html(resp.empName);
                                spans.eq(4).html(resp.surgeryKindName);
                                spans.eq(6).html(resp.surgeryManagerName);
                            }
                        });
                        detailModal.show();
                    }

                });
                calendar.render();
            });


        </script>

        <div class="grid-stack"> <!-- 그리드스택 공간 -->

            <div class="grid-stack-item" gs-x="0" gs-y="0" gs-w="2" gs-h="3"> <!-- grid-stack-item을 적어야 적용됨 -->
                <div class="grid-stack-item-content">
                    <div class="item-header">
                        <h5>입원 대기 목록</h5>
                        <hr>
                    </div>
                    <div class="item-body">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>코드</th>
                                    <th>환자명</th>
                                    <th>희망등급</th>
                                    <th>배정</th>
                                </tr>
                            </thead>
                            <tbody id="waitingPatientList">
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div class="grid-stack-item" gs-x="2" gs-y="" gs-w="2" gs-h="3"> <!-- grid-stack-item을 적어야 적용됨 -->
                <div class="grid-stack-item-content">
                    <div class="item-header">
                        <h5>수술 예약 대기 목록</h5>
                        <hr>
                    </div>
                    <div class="item-body">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>코드</th>
                                    <th>환자명</th>
                                    <th>예약</th>
                                </tr>
                            </thead>
                            <tbody id="waitingSurgeryList">
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>



            <div class="grid-stack-item" gs-x="4" gs-y="0" gs-w="4" gs-h="5">
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

            <div class="grid-stack-item" gs-x="8" gs-y="0" gs-w="4" gs-h="5" gs-no-resize="true" gs-no-move="true"
                gs-locked="true"> <!-- grid-stack-item을 적어야 적용됨 -->
                <div class="grid-stack-item-content">
                    <div class="item-header">
                        <h5>수술 일정</h5>
                        <hr>
                    </div>
                    <div class="item-body" id='calendar'>
                    </div>
                </div>
            </div>

            <div class="grid-stack-item" gs-x="0" gs-y="6" gs-w="4" gs-h="2">
                <div class="grid-stack-item-content">
                    <div class="item-header">
                        <h5>SMS</h5>
                        <hr>
                    </div>
                    <div class="item-body">
                    	<div style="width: 50%;">
		                    <ul class="nav nav-tabs mb-3" role="tablist"  >
		                        <li class="nav-item">
		                            <a class="nav-link active" data-bs-toggle="tab" href="#roundsRecord" role="tab"
		                                aria-selected="false">
		                                전송</a>
		                        </li>
		                        <li class="nav-item">
		                            <a class="nav-link" data-bs-toggle="tab" href="#roundsHistory" role="tab"
		                                aria-selected="false">
		                                수정</a>
		                        </li>
		                    </ul>
                    	</div>
                    	<div style="float: right;">
                    		<div style="">
			                    	<input style=" height:120px; width: 255px; border:1px solid #CCCCCC; border-radius:5px;" 
			                    		type="text"  >
		                    </div>
		                    <div style="float: right;">
			                    <input type="button" value="수신자" style="margin-top: 10px;"
	                                class="btn btn-primary btn-sm">
			                    <input type="button" value="전송" style="margin-top: 10px;"
	                                class="btn btn-primary btn-sm">
                            </div>
                    	</div>
	                     <div class="tab-content  text-muted"  style="width: 50%;">
	                        <div class="tab-pane active" id="roundsRecord" role="tabpanel">
	                            <table class="table table-bordered">
	                                <thead>
	                                    <tr>
	                                        <th style="width: 20%;">번호</th>
	                                        <th style="width: 80%;">제목</th>
	                                    </tr>
	                                </thead>
	                                <tbody class="roundsMedicineListBody">
										<tr>
											<td>1</td><td>김의사 휴진 안내</td>
										</tr>
										<tr>
											<td>2</td><td>병원 내 마스크 착용 안내</td>
										</tr>
										<tr>
											<td>3</td><td>병원 휴가 안내</td>
										</tr>
	                                </tbody>
	                            </table>
	                        </div>
	
	                        <div class="tab-pane" id="roundsHistory" role="tabpanel">
	                            <table class="table table-bordered">
	                                <thead>
	                                    <tr>
	                                        <th style="width: 20%;">번호</th>
	                                        <th style="width: 80%;">제목</th>
	                                    </tr>
	                                </thead>
	                                <tbody class="roundsMedicineListBody">
										<tr>
											<td>1</td><td>김의사 휴진 안내 수정</td>
										</tr>
										<tr>
											<td>2</td><td>병원 내 마스크 착용 안내</td>
										</tr>
										<tr>
											<td>3</td><td>병원 휴가 안내</td>
										</tr>
	                                </tbody>
	                            </table>
	                        </div>
	                        
	                    </div>
	                    <input type="button" value="저장" style="float: right; display: none;"
                                class="btn btn-primary">
                   
                    </div>
                </div>
            </div>



            <!-- 모달 ------------------------------------------------------------------------------------------------------------------------------->

            <!-- 날짜를 클릭하면 나오는 모달 -->
            <div id="modal" class="customModal">
                <div id="modalCont" class="modalCont">
                    <div class="modalTop">
                        <h4>수술 예약</h4>
                        <button type="button" class="btn-close" aria-label="Close" onclick="modalClose()"></button>
                    </div>
                    <div class="modalBody">
                    	<table class="table table-bordered" >
                    		<tbody>
                    			<tr>
                    				<td style="width: 20%;">환자명</td>
                    				<td class="patientInfoSpan" style="width: 30%;"></td>
                    				<td style="width: 20%;">날짜</td>
                    				<td class="patientInfoSpan" style="width: 30%;"></td>
                    			</tr>
                    			<tr>
                    				<td>시간</td>
                    				<td class="patientInfoSpan"></td>
                    				<td>집도의</td>
                    				<td class="patientInfoSpan"></td>
                    			</tr>
                    			<tr>
                    				<td >수술명</td>
                    				<td  colspan="3" class="patientInfoSpan"></td>
                    			</tr>
                        </table>
                    </div>
                    <div class="modalFoot">
                        <button id="modalSubmit" class="modalSubmit btn btn-primary btn-sm" onclick="bookSave()"  style="margin-top: 10px;">등록</button>
                    </div>
                </div>
            </div>

            <!-- 일정을 클릭하면 나오는 모달 -->
            <div id="detailModal" class="customModal">
                <div id="detailModalCont" class="modalCont">
                    <div class="modalTop">
                        <h4>예약 정보</h4>
                        <button type="button" class="btn-close" aria-label="Close"
                            onclick="detailModalClose()"></button>
                    </div>
                    <div class="modalBody">
                    <table class="table table-bordered" >
                   		<tbody>
                   			<tr>
                   				<td style="width: 20%;">환자코드</td>
                   				<td class="surgeryInfoSpan" style="width: 30%;"></td>
                   				<td style="width: 20%;">환자명</td>
                   				<td class="surgeryInfoSpan" style="width: 30%;"></td>
                   			</tr>
                   			<tr>
                   				<td>날짜</td>
                   				<td class="surgeryInfoSpan"></td>
                   				<td>시간</td>
                   				<td class="surgeryInfoSpan"></td>
                   			</tr>
                   			<tr>
                   				<td>수술명</td>
                   				<td colspan="3" class="surgeryInfoSpan"></td>
                   			</tr>
                   			<tr>
                   				<td>집도의</td>
                   				<td class="surgeryInfoSpan"></td>
                   				<td>담당자</td>
                   				<td class="surgeryInfoSpan"></td>
                   			</tr>
                   		</tbody>
                   	</table>
                    </div>
                    <div class="modalFoot">
                        <button id="modalSubmit" class="modalSubmit btn btn-primary btn-sm"
                            onclick="detailModalClose()" style="margin-top: 20px;">닫기</button>
                    </div>
                </div>
            </div>

            <script>

                const modal = $('#modal');
                const modalClose = () => {
                    modal.hide();
                }
                const detailModal = $('#detailModal');
                const detailModalClose = () => {
                    detailModal.hide();
                }

                // 등급 정보
                if (!localStorage.getItem('gradeList')) {
                    getGradeList();
                }

                // 등급 리스트 불러오기
                function getGradeList() {
                    $.ajax({
                        url: "${cPath}/reservation/gradeList",
                        method: "get",
                        dataType: "json",
                        success: (resp) => {
                            localStorage.setItem('gradeList', JSON.stringify(resp));
                        }
                    })
                }

                // 입원 대기 환자 목록 tbody selected
                let waitingPatientList = $('#waitingPatientList');

                // 희망 등급 변동시 호출 메서드
                waitingPatientList.on('change', '.graddSelect', function () {
                    console.log("바꼈슈");
                    let selectedGrade = $(this).find('option:selected').val();
                    let patientInfo = $(this).parents('tr').data("patientInfo")
                    console.log("Data", patientInfo);
                    let data = {
                        waitingKey: patientInfo.waitingKey
                        , wardGrade: selectedGrade
                    }
                    $.ajax({
                        url: "${cPath}/reservation/wardGrade",
                        method: "PUT",
                        data: JSON.stringify(data),
                        contentType: "application/json",
                        dataType: "text",
                        beforeSend: function (xhr) {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                        },
                        success: (resp) => {
                            console.log(resp);
                        }
                    })
                });

                let selectedPatientInfo = null;

                // 배치 버튼 눌렀을 때 호출되는 메서드
                waitingPatientList.on('click', '.assignBtn', function () {
                    console.log("배치버튼 눌렀슈! 해당 환자 정보 저장해유~");
                    selectedPatientInfo = $(this).parents('tr').data("patientInfo")
                })


                // 대기 환자 목록 불러오기
                function getWaitingPatientList() {
                    let gradeList = JSON.parse(localStorage.getItem('gradeList'));

                    $.ajax({
                        url: "${cPath}/reservation/waitingPatientList",
                        method: "get",
                        dataType: "json",
                        success: (resp) => {
                            waitingPatientList.empty();
                            if (resp.length == 0) {
                                waitingPatientList.append(
                                    $('<tr>').append(
                                        $('<td colspan="4">').html("입원 대기 환자가 없습니다.")
                                    )
                                );
                                return;
                            }
                            $.each(resp, function (i, patient) {
                                let patientWardGrade = patient.wardGrade;
                                let options = [];
                                let stOption = $('<option>').html("선택").val("");
                                options.push(stOption);

                                $.each(gradeList, function (i, grade) {
                                    let option = $('<option>').val(grade.code).html(grade.codeName);
                                    if (patientWardGrade == grade.code) {
                                        option.attr("selected", "selected");
                                    }

                                    options.push(option);
                                });
                                let select = $('<select>').append(options).addClass('form-select-sm').addClass("graddSelect");
                                let button = $('<button>').text("배정").addClass("btn btn-outline-primary btn-sm").addClass("assignBtn");
                                let tr = $('<tr>').append(
                                    $('<td>').html(patient.patientKey)
                                    , $('<td>').html(patient.patientName).attr({
                                        "data-bs-toggle": "modal"
                                        , "data-bs-target": "#patientViewModal"
                                    })
                                    , $('<td>').html(select)
                                    , $('<td>').html(button)
                                ).addClass("patientTr").data("patientInfo", patient);
                                waitingPatientList.append(tr);
                            });
                        }
                    });
                }
                getWaitingPatientList();


                // 병동 상태 넣을 tbody selected
                let wardStatus = $('#wardStatus');

                // 호실 넣을 span 부분 selected
                let wardStatusSpans = wardStatus.find('span');

                // 비어있는 침상 선택시 발생 메서드 
                let wardStatusTables = wardStatus.find('table').on('click', '.usableWard', function () {
                    console.log("클릭이벤트 확인~")
                    let selectedBedInfo = $(this).data("wardInfo");
                    if (selectedPatientInfo == null) {
                        // 환자 선택 없이 선택 경우에는 그냥 return
                        return;
                    }

                    let data = {
                        patientKey: selectedPatientInfo.patientKey
                        , wardBedKey: selectedBedInfo.wardBedKey
                        , waitingKey: selectedPatientInfo.waitingKey
                    }

                    // 배정 버튼을 누르고 나서 + 버튼 누르면 배정하는 것이므로 ajax 실행 
                    $.ajax({
                        url: "${cPath}/reservation/hospitalizationRecord"
                        , method: "POST"
                        , data: JSON.stringify(data)
                        , contentType: "application/json"
                        , beforeSend: function (xhr) {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                        }
                        , success: () => {
                            getWardStatus();
                            getWaitingPatientList();
                        }
                        , error: () => {
                            Swal.fire({
                                icon: 'error',
                                title: 'Oops...',
                                text: 'Something went wrong!',
                                footer: '<a href="">Why do I have this issue?</a>'
                            })
                        }
                    })

                    // 선택 정보 초기화
                    selectedPatientInfo = null;
                    console.log("초기화 되는지 체킁", selectedPatientInfo);
                });

                // 병동 상태 불러오기
                function getWardStatus() {
                    $.ajax({
                        url: "${cPath}/reservation/wardBedStatus",
                        method: "get",
                        dataType: "json",
                        success: (resp) => {
                            console.log("원본데이터", resp);

                            let groupedData = resp.reduce((acc, obj) => {
                                const key = obj.wardKey;
                                if (!acc[key]) {
                                    acc[key] = [];
                                }
                                acc[key].push(obj);
                                return acc;
                            }, {});

                            console.log("가공데이터", groupedData);

                            let index = 0;
                            $.each(groupedData, function (i, ward) {
                                wardStatusSpans.eq(index).text(`\${i}호 (\${ward[0].wardGrade})`);

                                let theadTr = $('<tr>');
                                let tbodyTr = $('<tr>');
                                $.each(ward, function (j, bed) {
                                    let th = $('<th>').html(`\${j+1}번 침상`);
                                    let td = $('<td>');
                                    td.data("wardInfo", bed);
                                    if (bed.patientName == null) {
                                        td.html("+").addClass("usableWard cursor");
                                    } else {
                                        td.html(`\${bed.patientName} [ ~\${bed.expectedCheckOutDate} ]`);
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

                let reservationData = null;
                let waitingSurgeryList = $('#waitingSurgeryList').on('click', '.bookBtn', function (event) {
                    reservationData = $(this).parents('.patientTr').data("patientInfo");
                });

                // 수술 예약 대기 목록 가져오기
                function getWaitingSurgeryList() {
                    console.log("수술 예약 대기 가져오기");
                    waitingSurgeryList.empty();
                    $.ajax({
                        url: "${cPath}/reservation/waitingSurgeryList"
                        , method: "GET"
                        , dataType: "json"
                        , success: (resp) => {
                            if (resp.length == 0) {
                                waitingSurgeryList.append(
                                    $('<tr>').append(
                                        $('<td colspan="3">').html("수술 예약 대기 환자가 없습니다.")
                                    )
                                );
                                return;
                            }
                            $.each(resp, function (idx, patient) {
                                let tr = $('<tr>').append(
                                    $('<td>').html(patient.patientKey)
                                    , $('<td>').html(patient.patientName).attr({
                                        "data-bs-toggle": "modal"
                                        , "data-bs-target": "#patientViewModal"
                                    }).addClass("cursor")
                                    , $('<td>').append(
                                        $('<input type="button">').addClass("btn btn-outline-primary btn-sm bookBtn").val("예약")
                                    )
                                ).addClass("patientTr").data("patientInfo", patient);
                                waitingSurgeryList.append(tr);
                            });
                        }
                    })
                }
                getWaitingSurgeryList();




                let reservationInfo = null;

                // 수술 일정 insert
                function bookSave() {
                    let hospitalizeRecordKey = reservationData.hospitalizeRecordKey;
                    console.log("reservationInfo", reservationInfo);

                    let data = {
                        "hospitalizeRecordKey": hospitalizeRecordKey
                        , "surgeryStartDate": reservationInfo.start
                        , "surgeryEndDate": reservationInfo.end
                        , "surgeryManager": `${authEmp.empKey}`
                    }

                    console.log("데이터 확인", data);
                    $.ajax({
                        url: "${cPath}/reservation/surgeryInfo"
                        , method: "POST"
                        , data: JSON.stringify(data)
                        , contentType: "application/json"
                        , dataType: "text"
                        , beforeSend: function (xhr) {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                        }
                        , success: (resp) => {
                            if (resp == "success") {
                                // 성공
                                reservationInfo = null;
                                modalClose();
                                getWaitingSurgeryList();
                                calendar.refetchEvents();

                            } else {
                                // 실패 
                                Swal.fire({
                                    icon: 'error',
                                    title: '오류'
                                });
                            }
                        }
                    });
                }




                // 모달창에서 일정 수정하기
                const modify = () => {
                    let scheduleId = $("#scheduleKey").val();
                    let bedNum = $("#bedNum").val();
                    let charger = $("#charger").val();
                    let sendData = {}
                    sendData = {
                        "scheduleKey": scheduleId, "wardBedKey": bedNum, "appintmentCharger": charger
                    }
                    $.ajax({
                        url: "${cPath}/scheduleUpdate",
                        type: "post",
                        data: JSON.stringify(sendData),
                        contentType: "application/json",
                        beforeSend: function (xhr) {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                        },
                        success: function (res) {
                            calendar.refetchEvents();
                            calendar.render();
                            detailModal.hide();
                        },
                        error: function (request, status, error) {
                            alert("상태코드:" + request.status + "\n" + "에러내용:" + request.responseText + "\n" + "error:" + error);
                        }
                    })
                }



                // 모달창에서 삭제 눌렀을 때 아직 안만듦
                const deleteEvent = (id) => {
                    $.ajax({
                        url: "",
                        type: "post",
                        data: {
                            id: id
                        },
                        success: function (res) {
                            alert("성공 삭제")
                        },
                        error: function (request, status, error) {
                            alert("상태코드:" + request.status + "\n" + "에러내용:" + request.responseText + "\n" + "error:" + error);
                        }
                    })
                }

                const createOption = () => {
                    // 오더목록에 이름이 있는 환자 가져오기
                    $.ajax({
                        url: "",
                        type: "get",
                        dataType: "json",
                        success: function (res) {

                        },
                        error: function (request, status, error) {
                            alert("상태코드:" + request.status + "\n" + "에러내용:" + request.responseText + "\n" + "error:" + error);
                        }
                    })
                }
            </script>


            <script>
                // 그리드스택 기본설정
                var grid = GridStack.init({});

            </script>