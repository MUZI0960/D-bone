<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

		<style type="text/css">
			.datatr:hover {
				background-color: #C1D3BA;
			}

			.datatr.active {
				background-color: #9AEDE3;
			}

			.grid-stack {
				height: 100hv;
			}

			#serchKeyWord {
				width: 150px;
				display: inline;
			}

			.rtBtn {
				float: right;
			}

			.pNum {
				width: 30px;
			}

			.nav-tabs .nav-link.active {
				background-color: #405189;
				color: white;
			}

			#medicineTBtitle {
				margin-bottom: 0;
			}

			#preDiagnosisInsertButton {
				background-color: #3C486B;
				color: white;
			}

			#prediagnosisViewbutton {
				background-color: #F1F6F9;
			}

			.form-control {
				font-size: small;
			}

			/*******************************************/
			/*                정민 CSS 시작              */
			input::placeholder {
				color: #d9d9d9;
			}

			.dust-class {
				/* input 박스 크기조절 */
				width: 97%;
				position: relative;
				margin-left: 8px;
				margin-top: 10px;
				margin-bottom: 5%;
			}

			.dust-class label {
				/* 태그 안에 라벨 넣기 */
				display: inline-block;
				position: absolute;
				top: -5px;
				left: 14px;
				padding: 5px;
				background: white;
				font-size: 10px;
				color: #888;
			}

			.dust-class label span {
				/* 별표 색 지정 */
				color: #da4841;
				vertical-align: -1px;
			}

			.dust-class input {
				/*라벨과 인풋 합치기*/
				width: 100%;
				border: 1px solid #dddddd !important;
				font-size: 12px;
				line-height: 1.45;
				letter-spacing: -0.04rem;
				border-radius: 8px;
				padding: 16px;
				margin-top: 12px;
			}

			fieldset {
				display: flex;
				justify-content: center;
				border: none;
				margin-top: 20px;
				margin-left: -35px;
			}

			/**************탭*************css*/
			#tabArea {
				position: relative;
				width: 100%;
				height: 100%;
				/*border: 3px solid rgb(32, 32, 238);*/
			}

			.tab {
				width: 100%;
				height: 100%;
				background-color: rgb(255, 255, 255);
				color: rgb(0, 0, 0);
				position: absolute;
			}

			.tabHead {
				font-size: 14px;
				margin-right: 50px;
				margin-left: 30px;
			}

			.jinryoInput {
				margin-left: 20px;
			}

			/*******************************************/
			/*                유림 CSS 시작              */
			.table {
				text-align: center;
				vertical-align: middle;
				font-size: 7px;
			}

			.table thead {
				background-color: #405189c7;
				color: white;
			}

			.searchPart {
				height: 30px;
				display: flex;
				justify-content: space-between;
				margin-bottom: 10px;
			}

			.searchPart>input {
				width: 60%;
			}
		</style>

		<div class="grid-stack">

			<!-- 환자 리스트 뜨는곳----------------------------------------------------------------------------------------->
			<div class="grid-stack-item" gs-x="0" gs-y="0" gs-w="3" gs-h="5">
				<div class="grid-stack-item-content">
					<div class="item-header">
						<h5>환자 목록</h5>
						<hr>
					</div>
					<div class="item-body">
						<div class="searchPart">
							<input type="text" id="patientSearchInput" class="form-control input-sm"
								placeholder="환자명/환자코드로 검색">
							<button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal"
								data-bs-target="#patientInsertModal">신환등록</button>
						</div>
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>환자번호</th>
									<th>환자이름</th>
									<th>생년월일</th>
									<th>상세정보</th>
								</tr>
							</thead>
							<tbody id="patientListBody" style="cursor: pointer;">

							</tbody>
						</table>
					</div>
				</div>
			</div>

			<!-- 접수 시작(정민) ---------------------------------------------------------------------------------------------------->
			<div class="grid-stack-item" gs-x="3" gs-y="0" gs-w="3" gs-h="3">
				<div class="grid-stack-item-content">
					<div class="item-header">
						<h5>접수</h5>
						<hr>
					</div>
					<div class="item-body">
						<div style="margin-top: 5%;" class="receiptPart">
							<div class="dust-class">
								<label for="itemname"><span>* </span>환자번호</label>
								<input type="text" class="receptId" id="jubsuPnum" readonly />
							</div>
							<div class="dust-class">
								<label for="itemname"><span>* </span>환자이름</label>
								<input type="text" class="receptName" id="jubsuPname" readonly />
							</div>
							<div class="dust-class">
								<label for="itemname"><span>* </span>내원이유/호소증상</label>
								<input type="text" class="receptReason" id="jubsuPPain" />
							</div>
							<fieldset>
								<label>
									<input class="jinryoInput" type="radio" name="office" value="L001" checked />
									<span style="font-size: 10px;">1. 진료실 마스터</span>
								</label>
								<label>
									<input class="jinryoInput" type="radio" name="office" value="L002" />
									<span style="font-size: 10px;">2. 진료실 박룡성</span>
								</label>
								<!-- 혜연 마스터 추가 -->
								<label>
									<input class="jinryoInput" type="radio" name="office" value="L003" />
									<span style="font-size: 10px;">3. 진료실 배희연</span>
								</label>
							</fieldset>
							<button onclick="fn_jubsu()" class="btn btn-primary"
								style="margin-left: 85%; margin-top:2%; font-size: 10px;">접수</button>
						</div>
					</div>
				</div>
			</div>

			<!-- 진료 대기목록(정민) ---------------------------------------------------------------------------------------------->

			<div class="grid-stack-item" gs-x="3" gs-y="3" gs-w="3" gs-h="2">
				<div class="grid-stack-item-content">
					<div class="item-header">
						<div style="display: flex; margin-bottom: -2%;">
							<h5 style="margin-right: 50%;">대기목록</h5>
							<a class="tabClass" href="#" onclick='fTab(this,0)'
								style="border-bottom: 2px solid red;  font-size: 10px; ">1.진료실</a>&nbsp;&nbsp;
							<a class="tabClass" href="#" onclick='fTab(this,1)'
								style="font-size: 10px;">2.진료실</a>&nbsp;&nbsp;
							<a class="tabClass" href="#" onclick='fTab(this,2)' style="font-size: 10px;">3.진료실</a>
						</div>
						<hr>
						<!-- <div style="float: left;"> -->
						<!-- </div> -->
					</div>
					<div id="tabArea">
						<div id="tab1" class='tab' style='z-index: 100;'>
							<table class="table table-bordered" style="text-align: center;">
								<thead>
									<tr>
										<th>환자번호</th>
										<th>환자이름</th>
										<th>생년월일</th>
										<th>대기진료실</th>
									</tr>
								</thead>
								<tbody id="firstOffice">
								</tbody>
							</table>
						</div>
						<div id="tab2" class='tab'>
							<table class="table table-bordered" style="text-align: center; ">
								<thead>
									<tr>
										<th>환자번호</th>
										<th>환자이름</th>
										<th>생년월일</th>
										<th>대기진료실</th>
									</tr>
								</thead>
								<tbody id="secondOffice">
								</tbody>
							</table>
						</div>
						<div id="tab3" class='tab'>
							<table class="table table-bordered" style="text-align: center;">
								<thead>
									<tr>
										<th>환자번호</th>
										<th>환자이름</th>
										<th>생년월일</th>
										<th>대기진료실</th>
									</tr>
								</thead>
								<tbody id="thirdOffice">
								</tbody>
							</table>
						</div>
					</div>

				</div>
			</div>


			<!-- 수납대기목록 -->
			<div class="grid-stack-item" gs-x="6" gs-y="0" gs-w="3" gs-h="3">
				<div class="grid-stack-item-content">
					<div class="">
						<h5>수납 대기 목록</h5>
						<hr />
					</div>
					<div class="" id="paywaitingDiv">
						<span></span>
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>수납번호</th>
									<th>환자번호</th>
									<th>이름</th>
									<th>주민등록번호</th>
									<th>진단서 발급</th>
								</tr>
							</thead>
							<tbody id="waitingPatientList"></tbody> <!-- 수납을 기다리는 환자 대기목록 -->
						</table>
					</div>
				</div>
			</div>

			<!-- 수납기록 -->
			<div class="grid-stack-item" gs-x="9" gs-y="3" gs-w="3" gs-h="5">
				<div class="grid-stack-item-content">
					<div class="">
						<!-- 수납이 완료된 환자 목록 보여주기 -->
						<h5>수납 상세</h5>
						<hr />
					</div>
					<div class="" id="sunabDetailTbody" style="height: 600px;"></div>
					<div>
						<button style="display: none; float: right;" id="payButton" type="button"
							class="btn btn-primary btn-sm">결제하기</button>
					</div>
				</div>
			</div>

			<!-- 수납기록 -->
			<div class="grid-stack-item" gs-x="6" gs-y="3" gs-w="3" gs-h="2">
				<div class="grid-stack-item-content">
					<div class="">
						<!-- 수납이 완료된 환자 목록 보여주기 -->
						<h5>수납 완료 목록</h5>
						<hr />
					</div>
					<div class="" id="">
						<span></span>
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>환자번호</th>
									<th>이름</th>
									<th>주민번호</th>
									<th>영수증 발급</th>
								</tr>
							</thead>
							<tbody id="completePayment"></tbody> <!-- 수납이 완료된 환자 보여주기 -->
						</table>
					</div>
				</div>
			</div>


		</div>


		<!-- 신규 환자 등록 모달-->
		<div class="modal fade" id="patientInsertModal" tabindex="-1" aria-labelledby="exampleModalgrid1Label"
			aria-modal="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalgridLabel">신규 환자 등록</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<form id="patientInsertForm">
							<div class="row g-3">
								<div class="col-xxl-12">
									<div>
										<label for="patientName" class="form-label">이름</label>
										<input type="text" class="form-control" name="patientName" required>
									</div>
								</div>
								<div class="col-xxl-12">
									<div>
										<label for="patientRegno" class="form-label">주민등록번호</label>
										<input type="text" oninput="autoHyphen1(this)" class="form-control"
											name="patientRegno" maxlength='14' required>
									</div>
								</div>
								<div class="col-xxl-12">
									<div>
										<label for="patientPn" class="form-label">연락처</label>
										<input type="text" oninput="autoHyphen2(this)" class="form-control"
											name="patientPn" maxlength='13' required>
									</div>
								</div>
								<div class="col-xxl-12">
									<label for="patientAddress" class="form-label">주소</label>
									<input type="button" onclick="getAddressByAPI(this)" value="주소 검색"
										style="float: right;" class="btn btn-outline-primary btn-sm">
									<input class="form-control" type="text" name="patientAddress"
										style="margin-bottom: 4px;" placeholder="주소" readonly>
									<input class="form-control" type="text" name="patientAddressDetail"
										placeholder="상세주소">
								</div>
								<div class="col-xxl-12">
									<div>
										<label for="patientType" class="form-label">환자 유형</label>
										<select name="patientType" class="form-select">
											<option value="PK02">일반환자</option>
											<option value="PK03">관심환자</option>
											<option value="PK01">VIP</option>
										</select>
									</div>
								</div>
								<div class="col-xxl-12">
									<div>
										<label for="patientSignificant" class="form-label">특이사항</label>
										<input type="text" class="form-control" name="patientSignificant">
									</div>
								</div>
								<div class="col-lg-12">
									<div class="hstack gap-2 justify-content-end">
										<input type="button" class="btn btn-outline-warning autocompleteBtn" value="자동완성"></button>
										<button type="submit" class="btn btn-primary">등록</button>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- 신규 환자 등록 모달-->



		<!-- 정민 발급 모달 -->
		<div class="modal fade" id="paperModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="exampleModalLabel">진료확인서 발급</h4>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div class="nurseChartContent">
							<table class="table table-bordered">
								<tbody>
									<tr>
										<td>이름</td>
										<td id="paperName">하하하</td>
									</tr>

									<tr>
										<td>성별</td>
										<td id="paberGender">M</td>
									</tr>
									<tr>
										<td>주민번호 앞자리</td>
										<td id="paperRegno">890101</td>
									</tr>
									<tr>
										<td>휴대폰 번호</td>
										<td id="paperPn">010-7777-8888</td>
									</tr>
									<tr>
										<td>주소</td>
										<td id="paperAdd">세종특별자치시 가름로 194 </td>
									</tr>
									<tr>
										<td>차트 번호</td>
										<td id="paperChartNo">C00122</td>
									</tr>
									<tr>
										<td>차트 내용</td>
										<td id="paperChartCont"></td>
									</tr>
									<tr>
										<td>진료 내용</td>
										<td id="paperDisease">폐렴알균성 관절염 및 다발관절염</td>
									</tr>
								</tbody>
							</table>

						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary btn-sm" data-bs-dismiss="modal">
							<a id="poiButton" href="" style="color: white;">발급</a>
						</button>
						<button type="button" class="btn btn-light btn-sm" data-bs-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 모달 ----------------------------------------------------------------------------------------------------------------------->

		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script>
			// 그리드스택 생성
			var grid = GridStack.init({});

			// 환자 키 저장할 전역변수 설정
			let patientCode;

			// 현재 환자 전체 목록 데이터
			let patientList = null;

			// 신규 환자 모달 selected
			let patientInsertModal = $("#patientInsertModal").on('hide.bs.modal', function(){
				patientInsertForm[0].reset();

			});

			// 환자 상세보기에서 body부분 selected
			let patientDetailBody = $('.patientDetailBody');

			// 환자 목록 들어갈 tBody selected
			let patientListBody = $('#patientListBody').on('click', '.patientTr', function (event) {
				let data = $(this).data("patientInfo");
				fillReceipt(data);
			});


			// 환자 검색 input tag selected
			let patientSearchInput = $('#patientSearchInput').on('keyup', function () {
				let searchData = this.value;
				let data = [];

				$.each(patientList, function (idx, patient) {
					if (patient.patientKey.indexOf(searchData) != -1 || (patient.patientName.indexOf(searchData) != -1)) {
						data.push(patient);
					}
					mkPatientList(data);
				});
			})

			// 환자 전체 데이터 가져오는 함수 -------------------------------------------------------------------------------------------
			function getPatientList() {
				$.ajax({
					url: "${cPath}/patient/patientList.do"
					, method: "GET"
					, dataType: "json"
					, success: (resp) => {
						console.log("환자 목록 데이터 체킁 : ", resp);
						patientList = resp;
						mkPatientList(resp);
					}
				});
			}
			getPatientList();

			// 특정 데이터로 환자 리스트 만드는 함수 -------------------------------------------------------------------------------------------
			function mkPatientList(data) {
				patientListBody.empty();
				$.each(data, (idx, patient) => {
					let tr = $('<tr>').append(
						$('<td>').html(patient.patientKey)
						, $('<td>').html(patient.patientName)
						, $('<td>').html(patient.patientRegno1)
						, $('<td>').append(
							$('<button>').text("보기").addClass('btn btn-outline-primary btn-sm patientDetailBtn').attr(
								{
									"data-bs-toggle": "modal"
									, "data-bs-target": "#patientViewModal"
								}
							)
						)
					).addClass("patientTr").data("patientInfo", patient);
					patientListBody.append(tr);
				});
			}

			// selected input tags 목록 선택해서 오른쪽 접수로 데이터 옮기기
			let receptId = $('.receptId');
			let receptReason = $('.receptReason');
			let receptName = $('.receptName');

			// 접수 body selected
			let receiptPart = $('.receiptPart');

			// 환자 번호, 이름, 내원이유 selected
			let jubsuPnum = $('#jubsuPnum');
			let jubsuPname = $('#jubsuPname');
			let jubsuPPain = $('#jubsuPPain');

			function fillReceipt(data) {
				jubsuPnum.val(data.patientKey);
				jubsuPname.val(data.patientName);
			}


			const fn_jubsu = () => {
				let receiptVO = {
					patientKey: jubsuPnum.val(),
					officeKey: $('input[name="office"]:checked').val(),//셀렉트
					receiptReason: jubsuPPain.val()
				}
				$.ajax({
					type: "post",
					url: "${pageContext.request.contextPath}/insert/insertWaiting",
					contentType: 'application/json',
					data: JSON.stringify(receiptVO),
					dataType: "text",
					beforeSend: function (xhr) {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
						xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
					},
					success: function (rslt) {
						firstOffice.empty();
						secondOffice.empty();
						thirdOffice.empty();
						receiptList1();
						jubsuPnum.val("")
						jubsuPPain.val("")
						jubsuPname.val("")
					}
				})
			}

			// 환자 등록 insert 시작-----------------------------------------------------------------------------------------------------
			let patientInsertForm = $("#patientInsertForm").on('submit', function (event) {
				event.preventDefault();

				let formData = $(this).serializeArray();
				let vo = {};
				$.each(formData, function (index, field) {
					vo[field.name] = field.value;
				});

				let arr = vo.patientRegno.split('-');
				vo.patientRegno1 = arr[0];
				vo.patientRegno2 = arr[1];

				let year = new Date().getFullYear();
				let patientYear;
				if (vo.patientRegno2.substring(0, 1) == '1' || vo.patientRegno2.substring(0, 1) == '2') {
					patientYear = 1900 + parseInt(vo.patientRegno1.substring(0, 2));
				} else {
					patientYear = 2000 + parseInt(vo.patientRegno1.substring(0, 2));
				}
				vo.patientAge = year - patientYear;
				if (vo.patientRegno2.substring(0, 1) == '1' || vo.patientRegno2.substring(0, 1) == '3') {
					vo.patientSex = 'M';
				} else {
					vo.patientSex = 'F';
				}

				$.ajax({
					url: "${cPath}/patient/patientInsert.do",
					type: "post",
					contentType: 'application/json; charset=UTF-8',
					data: JSON.stringify(vo),
					beforeSend: function (xhr) {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
						xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
					},
					dataType: "text",
					success: function (resp) {
						if (resp == 'success') {
							patientInsertModal.modal('hide');
							getPatientList();
						}
					}
				})
				return false;
			});



			// 정민 area ---------------------------------------------------------------------------------------
			// ------------------------------------------------------------------------------------------------
			// ------------------------------------------------------------------------------------------------

			const myTabArea = document.querySelector("#tabArea");
			//const myTabs = document.querySelectorAll(".tab")
			const myTabs = myTabArea.children;
			const tabs = document.querySelectorAll(".tabClass");

			const tabInit = () => {
				for (let i = 0; i < myTabs.length; i++) {
					myTabs[i].style.zIndex = "1";
					tabs[i].style.borderBottom = "";
				}
			}

			const fTab = (pThis, pIndex) => {
				tabInit();
				myTabs[pIndex].style.zIndex = "100";
				pThis.style.borderBottom = "2px solid red";
				if (pIndex == 0) {
					firstOffice.show();
					secondOffice.hide();
					thirdOffice.hide();
				}
				if (pIndex == 1) {
					firstOffice.hide();
					secondOffice.show();
					thirdOffice.hide();
				}
				if (pIndex == 2) {
					firstOffice.hide();
					secondOffice.hide();
					thirdOffice.show();
				}
			}


			// 접수목록 불러오기
			const firstOffice = $("#firstOffice");
			const secondOffice = $("#secondOffice");
			const thirdOffice = $("#thirdOffice");
			const receiptList1 = () => {		// 접수목록 불러오는 함수
				$.ajax({
					type: "get",
					url: "${cPath}/patient/retrieveMember",
					dataType: "json",
					success: function (res) {
						console.log("대기환자목록 : ", res)
						let waitingTags = [];
						$.each(res, function (i, v) {
							let trs = $("<tr>").attr('class', v.officeKey).append(
								$("<td>").html(v.patientKey),	// 환자번호
								$("<td>").html(v.patientName),	// 환자이름
								$("<td>").html(v.patientRegno1),	// 생년월일
								$("<td>").html(v.officeKey)	// officeKey
							)
							if (v.officeKey == 'L001') {
								firstOffice.append(trs);
							}
							if (v.officeKey == 'L002') {
								secondOffice.append(trs);
							}
							if (v.officeKey == 'L003') {
								thirdOffice.append(trs);
							}
						})
					},
					error: function (req, status, error) {
						console.log("code", req.status)
						console.log("message", request.responseText)
						console.log("상태", error)
					}
				});
			}
			receiptList1();


			// -------------------------------------------------------------------------------------------------------------
			// 수납을 기다리는 환자 대기목록 불러오기  waitingList()-------------------------정민-------------------------------------

			const poiButton = $('#poiButton');


			// 수납 대기목록 테이블 tbody 선택
			let waitingPatientList = $("#waitingPatientList");

			waitingPatientList.on('click', '.patientDetailBtn', function (event) {
				let data = $(this).parents('.paperTr').data("waitList");
				console.log("수납을 기다리는 환자 대기목록 data : ", data);
				payPaper(data.patient.patientKey);
				console.log("넘겨줄 환자키", data.patient.patientKey)
				console.log("접수키 : ", data.receiptKey);
				// a태그에 href추가하기
				poiButton.attr('href', '${cPath}/poi/sample?poiPatientKey=' + data.patient.patientKey);

				// POI발급 버튼을 누르면 수납내역에 서류발급에 대한 금액이 추가되도록 하기
				poiButton.on('click', function () {
					$.ajax({
						url: "${cPath}/poi/poicontrollerinsertPay",
						type: 'post',
						data: { 'receiptKey': data.receiptKey },
						dataType: 'text',
						beforeSend: function (xhr) {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
							xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
						},
						success: (res) => {
						},
						error: (error) => {
						}
					})
				})
			})

			// 수납 대기 목록 가져오는 함수 (유림)
			function getPayWaitingList() {

				waitingPatientList.empty();
				$.ajax({
					url: "${cPath}/patient/payWaitingList"
					, type: "GET"
					, dataType: "json"
					, success: (resp) => {
						console.log("수납대기목록 체킁", resp);
						$.each(resp, function (idx, data) {
							let tr = $('<tr>').on('click', function () { fn_wplClick(this, data); }).append(
								$('<td>').html(data.payKey)
								, $('<td>').html(data.patient.patientKey)
								, $('<td>').html(data.patient.patientName)
								, $('<td>').html(data.patient.patientRegno1)
								, $('<td>').append(
									$('<button>').text('발급').addClass('btn btn-outline-primary btn-sm patientDetailBtn')
										.attr(
											{
												"data-bs-toggle": "modal",
												"data-bs-target": "#paperModal"
											}
										)
								)
							).addClass('paperTr').data("waitList", data);
							waitingPatientList.append(tr);
						});

					}
				})
			} getPayWaitingList();

			// ----------------------------------------------------------------------정민------------------------------------------


			const templateModal = document.querySelector('#templateModal'); // 템플릿 모달 버튼 선택

			const sunabDetailTbody = $('#sunabDetailTbody');	// 수납 상세보기 tbody

			// 정민 - 수납 대기목록해서 환자를 클릭하면 결제하기 위해 상세보기 칸으로 이동 --------------시작----------------------------------------

			// 수납대기목록 환자 tr 누르면 상세보기로 옮겨지도록 만든 함수
			// 원 표시
			function priceToString(price) {
				return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
			}

			const fn_wplClick = (wThis, data) => {
				//templateModal.style.display = "block";	// 수납대기목록에서 환자를 선택하면 모달 버튼이 보이도록
				console.log("첫번째 파라미터", wThis)
				console.log('어떤것들이 들어있나 확인하기', data)
				payClose.css('display', 'block');
				payButton.css('display', 'block');

				let patient = data.patient;
				let payKey = data.payKey;
				console.log("상세 조회 할 pay key 값", payKey);

				// 수납 상세 내역 가져오기 
				$.ajax({
					url: "${cPath}/receipt/payDetailList"
					, method: "GET"
					, data: { "payKey": payKey }
					, dataType: "json"
					, success: (resp) => {
						console.log("상세 내역 조회 결과", resp);
						let createTable = `<table class="table table-bordered soonabtable"><thead><tr>
				 						<th>수납번호</th><th>환자번호</th><th>환자명</th></tr></thead>`;

						createTable += `<tbody>
												<tr>
													<td>\${data.payKey}</td>
													<td>\${patient.patientKey}</td>
													<td>\${patient.patientName}</td>
												</tr>
											</tbody>`;
						createTable += `</table>`;

						let totalCost = 0;
						$.each(resp, function (idx, payDetail) {
							totalCost += payDetail.payCostPatient;
						});

						let text = `<br><br> <h5>수납 상세 내역</h5>`
						let createDetailTb = `<table class="table table-bordered">`

						if (resp.length > 0) {
							$.each(resp, function (idx, payDetail) {
								createDetailTb += `<tr><th>\${payDetail.payKindName}</th><td>\${priceToString(payDetail.payCostPatient)}원</td></tr>`
							})
							createDetailTb += `<tr><td colspan='2'></td></td>`;
							createDetailTb += `<tr><th>총 결제 금액</th><td id='amountPayment'>\${priceToString(totalCost)}원</td></tr>`;
						} else {
							createDetailTb += `<tr><td colspan='2'>수납할 내역이 없습니다.</td></tr>`;
						}
						createDetailTb += `</table>`;
						sunabDetailTbody.empty().append(createTable, text, createDetailTb);	// 수납 대기 목록을 클릭하면 상세보기로 옮기기
						data.payTotalCost = totalCost;
						payButton.data("payInfo", data);
					}
				});
			}
			// ------------------------------------------------------------------------끝---------------------------------------




			// 정민 - 수납이 완료된 사람들 보여주는 리스트 ----------시작----------------------------------------------------------------
			const completePayment = $("#completePayment");	// 수납 완료된 사람들 테이블 선택
			const comletteList = () => {
				$.ajax({
					type: "get",
					url: "${cPath}/patient/completePayment",
					dataType: "json",
					success: function (cpList) {
						console.log("cpList : ", cpList);
						completePayment.empty();
						$.each(cpList, function (i, v) {
							let patient = v.patient;
							let payKey = v.payKey
							let tr = $("<tr>").append(
								$("<td>").html(patient.patientKey),
								$("<td>").html(patient.patientName),
								$("<td>").html(patient.patientRegno1),
								$("<td>").html(`<a href='${cPath}/poi/medicalbill?payKey=\${payKey}'>발급</a>`)
							);
							completePayment.append(tr);
						})
					}
				})
			}
			comletteList();
			// ----------------------------------------------끝--------------------------------------------------------------

			// 정민 -- 결제하기 버튼 클릭 이벤트--------------------시작-------------------------------------------------------------
			const payButton = $("#payButton").on('click', function () {
				let payInfo = payButton.data("payInfo");
				console.log("데이터 들어오나요", payInfo);


				$.ajax({
					url: "${cPath}/receipt/payStatus"
					, method: "PUT"
					, data: JSON.stringify(payInfo)
					, dataType: "text"
					, contentType: "application/json"
					, beforeSend: function (xhr) {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
						xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
					}
					, success: (resp) => {
						console.log("결제 완료 처리 다 됐낭?", resp);
						if(resp == "success"){
							getPayWaitingList();
							sunabDetailTbody.empty();
							payButton.css('display', 'none');
							comletteList();
						}
					}
				})


			});	// 결제하기 버튼 선택
			const payClose = $('#payClose');



			$(function () {
				let amountPayment = $('#sunabDetailTbody').find('#amountPayment').html();
			})

			// 환자 접수 상태 RS02로 업데이트 --> 환자가 외래진료 였을 때
			// pay 상태 결제 완료로 변동 

			// 발급 버튼 누르면 해당 환자의 POI발급 정보가 모달창에 보여지게 하기--------정민--------------시작----------------------------------------------------
			const paperName = $('#paperName');
			const paberGender = $('#paberGender');
			const paperRegno = $('#paperRegno');
			const paperPn = $('#paperPn');
			const paperAdd = $('#paperAdd');
			const paperChartNo = $('#paperChartNo');
			const paperChartCont = $('#paperChartCont');
			const paperDisease = $('#paperDisease');

			const payPaper = (patientKey) => {
				$.ajax({
					url: "${cPath}/patient/medicalCertificate",
					method: "get",
					data: { "patientKey": patientKey },
					dataType: "json",
					success: (res) => {
						console.log("POIIIIII", res);
						console.log("disease", res.disease == null);
						console.log("환자 한글이름 확인 : ", res.patientName);
						paperName.html(res.patientName);
						paberGender.html(res.patientSex);
						paperRegno.html(res.patientRegno1);
						paperPn.html(res.patientPn);
						paperAdd.html(res.paddress);
						paperChartNo.html(res.chart.chartKey);
						paperChartCont.html(res.chart.chartCont);
						if (!(res.disease == null)) {
							paperDisease.html(res.disease.diseaseNmKr);
						}
					}

				})
			}
	//---------------------------------------------------끝--------------------------------------------------------------------------------

			let autocompleteBtn = $('.autocompleteBtn').on('click', function(event){
				$('input[name=patientName]').val("안정민");
				$('input[name=patientRegno]').val("950314-1222222");
				$('input[name=patientPn]').val("010-5245-2365");
			});
		</script>