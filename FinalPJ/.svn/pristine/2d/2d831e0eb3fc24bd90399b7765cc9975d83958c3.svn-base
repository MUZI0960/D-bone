<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
			<script src='${cPath }/resources/js/pdfmaker/html2canvas.js'></script>
			<script src='${cPath }/resources/js/pdfmaker/jspdf.min.js'></script>

			<style>
				.item-header {
					color: gray;
					font-size: small;
				}

				/* 마우스 지나갈때 색 */
				.buyyerTrtags:hover,
				.datatr:hover {
					background-color: #d0d0d0;
				}

				.myTable {
					width: 90%;
					border-collapse: collapse;
					font-size: 10px;
				}

				.myth,
				.mytd {
					width: 500px;
					height: 25px;
					border: 1px solid #7f7f7f;
				}

				.title,
				.headerRight,
				.headerLeft {
					background-color: #d4ebf8;
					height: 30px;
				}

				.headerRight {
					border-right: none;
				}

				.headerLeft {
					border-left: none;
				}

				.bigo {
					text-align: center;
					font-size: medium;
					font-weight: 900;
				}

				ul.tabs {
					margin: 0px;
					padding: 0px;
					list-style: none;
				}

				ul.tabs li {
					background: none;
					color: #222;
					display: inline-block;
					padding: 10px 15.48px;
					cursor: pointer;
				}

				ul.tabs li.current {
					border-radius: 5% 5% 0% 0%;
					color: gray;
				}

				.tab-content {
					display: none;
					padding: 15px;
				}

				.tab-content.current {
					display: inherit;
				}

				.grid-stack {
					height: 100hv;
				}

				#pdfDiv {
					margin-top: 20px;
					width: 110%
				}

				.modal-content {
					border-radius: 15px;
					font-size: 10px;
				}

				.grid-stack-item-content {
					padding: 15px;
				}

				.table {
					text-align: center;
					vertical-align: middle;
					font-size: 10px;
				}

				.table thead {
					background-color: #405189c7;
					color: white;
				}

				.modal-head,
				.modal-body {
					padding: 50px;
				}

				.modal-body label {
					color: #3C486B;
					font-size: 16px;
				}
			</style>
			<script>
				$(function () {
					$('ul.tabs li').click(function () {
						var tab_id = $(this).attr('data-tab');

						$('ul.tabs li').removeClass('current');
						$('.tab-content').removeClass('current');

						$(this).addClass('current');
						$("#" + tab_id).addClass('current');
					});

				});
			</script>
			</head>

			<body>
				<div class="grid-stack">

					<!-- 거래처 목록 시작(문수정) ---------------------------------------------------------------------------------------------------------------------------------------->
					<div class="grid-stack-item " gs-x="0" gs-y="0" gs-w="2" gs-h="5">
						<div class="grid-stack-item-content">
							<h5 class="item-header">거래처 목록</h5>
							<hr>
							<div class="card-body">
								<input style="margin-bottom: 20px; width: 80%; height: 32px;"
									class="searchInput form-control" type="text" id="inputId"
									placeholder="거래처 명/거래 상태로 검색" />
								<div id="buyerListDiv">
									<table class="table table-bordered ptTableForm">
										<thead class='table  table-striped'>
											<tr>
												<th style="width: 5%;">No</th>
												<th style="width: 50%">거래처 명</th>
												<!--<th style="width: 25%">담당자 명</th> -->
												<!--<th style="width: 25%">거래처 연락처</th> -->
												<th style="width: 45%">거래 상태</th>
											</tr>
										</thead>
										<tbody id="buyerListBody">
											<!-- 거래처 목록 들어오는 위치 -->
										</tbody>
									</table>
								</div>
							</div>
							<div>
								<button type="button" class="btn btn-light btn-sm"
									style="float: right; margin-top: 30px;" data-bs-toggle="modal"
									data-bs-target="#buyerinsertModalChang">거래처추가</button>
							</div>
						</div>
					</div>
					<!-- 거래처 목록 끄읕 ---------------------------------------------------------------------------------------------------------------------------------------->

					<!-- 비품 목록 시작(문수정) ---------------------------------------------------------------------------------------------------------------------------------------->
					<div class="grid-stack-item" gs-x="2" gs-y="0" gs-w="3" gs-h="5">
						<div class="grid-stack-item-content">
							<h5 class="item-header">비품 목록 / 신청</h5>
							<hr>
							<div class="card-body">
								<input style="margin-bottom: 20px; width: 80%; height: 32px;"
									class="searchInput2 form-control" type="text" id="inputId2"
									placeholder="비품명/거래처명으로 검색" />
								<div id="officeListDiv" style="height: 550px;">
									<table class="table table-bordered">
										<thead class="table  table-striped">
											<tr>
												<th style="width: 5%">No</th>
												<th style="width: 38%">비품명(상세)</th>
												<th style="width: 40%">거래처</th>
												<th style="width: 17%">수량</th>
											</tr>
										</thead>
										<tbody id="officeSuppliesListBody">
											<!-- 비품 리스트 들어오는 위치 -->
										</tbody>
									</table>
								</div>
							</div>
							<div>
								<button type="button" class="btn btn-light btn-sm"
									style="float: right; margin-top: 30px;" data-bs-toggle="modal"
									data-bs-target="#officeSuppliesInsertModal">비품 추가</button>
							</div>
						</div>
					</div>
					<!-- 비품 목록 끄읕 ----------------------------------------------------------------------------------------------------------------------------------------------->

					<!-- 요청 목록 내역 시작 ------------------------------------------------------------------------------------------------------------------------------------------>
					<div class="grid-stack-item" gs-x="5" gs-y="0" gs-w="3" gs-h="5">
						<div class="grid-stack-item-content">
							<h5 class="item-header">약품 요청 내역</h5>
							<hr>
							<div class="card-body">
								<div class="grid-stack-item-content ">
									<div id="ptWaitingListDiv" style="height: 250px;">
										<table class="table table-bordered">
											<thead class="table  table-striped">
												<tr>
													<th style="width: 23%;">주문번호</th>
													<!--
														<th style="width: 22%">의약품명</th>
														<th style="width: 14%">수량</th>
														<th style="width: 24%; text-align: center;">가격</th>
													-->
													<th style="width: 20%;">요청자</th>
													<th style="width: 57%;">요청 시간</th>
												</tr>
											</thead>
											<tbody id="orderListBody">
												<!-- 공지사항 리스트 들어오는 위치 -->
											</tbody>
										</table>
									</div>
								</div>
							</div>
							<br>
							<!-- 비품 요청 내역 목록 -->
							<h5 class="item-header">비품 요청 내역</h5>
							<hr>
							<div class="card-body">
								<div class="grid-stack-item-content ">
									<div id="officeSuppliesOrderRecodListDiv" style="height: 250px;">
										<table class="table table-bordered">
											<thead class="table  table-striped">
												<tr>
													<th style="width: 11%">No</th>
													<th style="width: 37%">비품 명</th>
													<th style="width: 14%">수량</th>
													<th style="width: 20%; text-align: center;">가격</th>
													<th style="width: 18%">요청자</th>
												</tr>
											</thead>
											<tbody id="supplieOrder">
												<!-- 비품 요청 내역 들어오는 위치 -->
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 요청 내역 끄읕 ------------------------------------------------------------------------------------------------------------------------------------------------->

					<!-- 발주서 pdf 시작(안정민) ---------------------------------------------------------------------------------------------------------------------------------------->
					<div class="grid-stack-item" gs-x="8" gs-y="0" gs-w="4" gs-h="5">
						<div class="grid-stack-item-content">
							<h5 class="item-header" id="productH4">발주서</h5>
							<hr>
							<div id="pdfDiv">
								<table class="myTable">
									<tr>
										<td class="headerRight myth" colspan="3">
											&nbsp;&nbsp;회사명&nbsp;&nbsp;:&nbsp;&nbsp;D-BONE 정형외과</td>
										<td class="headerLeft myth" colspan="2">
											<!-- 								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
											<!-- 								관리번호&nbsp;&nbsp;:&nbsp;&nbsp;발주 111-111 -->
										</td>
									</tr>
									<tr>
										<td class="headerRight myth" colspan="2">
											&nbsp;&nbsp;T E L&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;042-1234-5678</td>
										<td class="headerLeft myth" colspan="2">
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											담당자&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;원무과</td>
									</tr>
									<tr>
										<td class="headerRight myth" colspan="2">&nbsp;&nbsp;F A
											X&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;1234-5678</td>
										<td class="headerLeft myth" colspan="2">
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											작성일자&nbsp;&nbsp;:&nbsp;&nbsp;<span id="currentDate"></span></td>
									</tr>
									<tr>
										<td class="bigo myth" colspan=" 4">D - Bone 정형외과</td>
									</tr>
									<tr>
										<th class="title myth" class="fth" colspan="">&nbsp;&nbsp;약품키</th>
										<th class="title myth" colspan="">&nbsp;&nbsp;약품이름</th>
										<th class="title myth" colspan="">&nbsp;&nbsp;수량</th>
										<th class="title myth" colspan="">&nbsp;&nbsp;금액</th>
									</tr>
									<tbody id="orderBody">
										<tr>
											<td class="myth">&nbsp;</td>
											<td class="myth"></td>
											<td class="myth"></td>
											<td class="myth"></td>
										</tr>
										<tr>
											<td class="myth">&nbsp;</td>
											<td class="myth"></td>
											<td class="myth"></td>
											<td class="myth"></td>
										</tr>
										<tr>
											<td class="myth">&nbsp;</td>
											<td class="myth"></td>
											<td class="myth"></td>
											<td class="myth"></td>
										</tr>
										<tr>
											<td class="myth">&nbsp;</td>
											<td class="myth"></td>
											<td class="myth"></td>
											<td class="myth"></td>
										</tr>
										<tr>
											<td class="myth">&nbsp;</td>
											<td class="myth"></td>
											<td class="myth"></td>
											<td class="myth"></td>
										</tr>
										<tr>
											<td class="myth">&nbsp;</td>
											<td class="myth"></td>
											<td class="myth"></td>
											<td class="myth"></td>
										</tr>
										<tr>
											<td class="myth">&nbsp;</td>
											<td class="myth"></td>
											<td class="myth"></td>
											<td class="myth"></td>
										</tr>
										<tr>
											<td class="myth">&nbsp;</td>
											<td class="myth"></td>
											<td class="myth"></td>
											<td class="myth"></td>
										</tr>
										<tr>
											<td class="myth">&nbsp;</td>
											<td class="myth"></td>
											<td class="myth"></td>
											<td class="myth"></td>
										</tr>
										<tr>
											<td class="myth">&nbsp;</td>
											<td class="myth"></td>
											<td class="myth"></td>
											<td class="myth"></td>
										</tr>
										<tr>
											<td class="myth">&nbsp;</td>
											<td class="myth"></td>
											<td class="myth"></td>
											<td class="myth"></td>
										</tr>
										<tr>
											<td class="myth">&nbsp;</td>
											<td class="myth"></td>
											<td class="myth"></td>
											<td class="myth"></td>
										</tr>
										<tr>
											<td class="myth">&nbsp;</td>
											<td class="myth"></td>
											<td class="myth"></td>
											<td class="myth"></td>
										</tr>
										<tr>
											<td class="myth">&nbsp;</td>
											<td class="myth"></td>
											<td class="myth"></td>
											<td class="myth"></td>
										</tr>
										<tr>
											<td class="myth">&nbsp;</td>
											<td class="myth"></td>
											<td class="myth"></td>
											<td class="myth"></td>
										</tr>
										<tr>
											<th class="myth" colspan="3"> &nbsp;합계</th>
											<td class="myth" id="totalCost"></td>
										</tr>
									</tbody>
									<tfoot>
										<tr>
											<td class="myth" colspan="4" style="height: 50px;"> &nbsp;비고</td>
										</tr>
										<tr></tr>
										<tr></tr>
									</tfoot>
								</table>
							</div>
							<button type="button" style="float: right; margin-top:30px;margin-left: 10px;" id="savePdf"
								class="btn btn-light  btn-sm">PDF저장</button>
							<button type="button" onclick="emptyBtn()" style="float: right; margin-top:30px"
								class="btn btn-light  btn-sm">비우기</button>
						</div>
					</div>
				</div>
				<!-- 발주서 pdf 끄읕 ------------------------------------------------------------------------------------------------------------------------------------------------->

				<!-- 거래처 상세보기 모달창 시작(문수정) ----------------------------------------------------------------------------------------------------------------------------->
				<div class="modal fade modal-lg" id="buyerViewModalChang" tabindex="-1"
					aria-labelledby="exampleModalgrid1Label" aria-modal="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h4 class="modal-title" id="buyerViewLabel">거래처 상세 정보</h4>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<!-- 거래처 상세보기 폼 -->
								<form id="buyerViewForm">
									<hr>
									<input type="text" readonly="readonly" class="form-control" name="buyerNameView"
										id="buyerNameView" style="border: none; font-size: 15px;">
									<hr>
									<div class="row g-3">
										<!-- 거래처 번호 숨김 -->
										<input type="hidden" class="form-control" name="buyerKeyView"
											disabled="disabled" id="buyerKeyView">
										<!-- 										<div class="col-xxl-6"> -->
										<!-- 											<div> -->
										<!-- 												<label for="buyerNameView" class="form-label">거래처 명</label> -->
										<!-- 												<input type="text" readonly="readonly" class="form-control" -->
										<!-- 													name="buyerNameView" id="buyerNameView" style="border: none;"> -->
										<!-- 											</div> -->
										<!-- 										</div> -->
										<!--end col-->
										<div class="col-xxl-6">
											<div>
												<label for="buyerTelView" class="form-label">거래처 연락처</label> <input
													type="text" readonly="readonly" class="form-control"
													name="buyerTelView" id="buyerTelView" style="border: none;">
											</div>
										</div>
										<!--end col-->
										<div class="col-xxl-6">
											<div>
												<label for="buyerChargerView" class="form-label">거래처 담당자명</label>
												<input type="text" readonly="readonly" class="form-control"
													name="buyerChargerView" id="buyerChargerView" style="border: none;">
											</div>
										</div>
										<!--end col-->
										<div class="col-xxl-6">
											<div>
												<label for="buyerEmailView" class="form-label">거래처 이메일</label>
												<input type="text" class="form-control" readonly="readonly"
													name="buyerEmailView" id="buyerEmailView" style="border: none;">
											</div>
										</div>
										<!--end col-->
										<div class="col-xxl-6">
											<div>
												<label for="buyerAddressView" class="form-label">거래처 주소</label>
												<input type="text" class="form-control" readonly="readonly"
													name="buyerAddressView" id="buyerAddressView" style="border: none;">
											</div>
										</div>
										<!--end col-->
										<div class="col-xxl-6">
											<div>
												<label for="contractDateView" class="form-label">계약일</label>
												<input type="date" class="form-control" readonly="readonly"
													name="contractDateView" id="contractDateView" style="border: none;">
											</div>
										</div>
										<!--end col-->
										<div class="col-xxl-6">
											<div>
												<label for="contractEndDateView" class="form-label">계약 종료일</label>
												<input type="date" class="form-control" readonly="readonly"
													name="contractEndDateView" id="contractEndDateView"
													style="border: none;">
											</div>
										</div>
										<!--end col-->
										<div class="col-xxl-6">
											<div>
												<label for="buyerStatusView" class="form-label">거래 상태</label>
												<select class="form-select" name="buyerStatusView" id="buyerStatusView">
													<option value="BS01">거래중</option>
													<option value="BS02">거래종료</option>
													<option value="BS03">단종</option>
												</select>
											</div>
										</div>
										<!--end col-->

										<div class="col-lg-12">
											<div class="hstack gap-2 justify-content-end">
												<button type="button" class="btn btn-light btn-sm"
													data-bs-dismiss="modal">취소</button>
												<button type="button" class="btn btn-primary btn-sm"
													id="changeUpdateBuyerButton">수정</button>
												<button type="button" class="btn btn-primary btn-sm"
													id="changeUpdateSaveBuyerButton">저장</button>
											</div>
										</div>
										<!--end col-->
									</div>
									<!--end row-->
								</form>
							</div>
						</div>
					</div>
				</div>
				<!-- 거래처 상세보기 모달창 끄읕 ----------------------------------------------------------------------------------------------------------------------------->


				<!-- 비품 상세보기 모달창 시작(문수정) ----------------------------------------------------------------------------------------------------------------------------->
				<div class="modal fade modal-lg" id="officeSuppliesViewModalChang" tabindex="-1"
					aria-labelledby="exampleModalgrid1Label" aria-modal="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h3 class="modal-title" id="buyerViewLabel">비품 상세 정보</h3>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<!-- 비품 상세보기 폼 -->
								<form id="officeSuppliesViewForm">
									<hr>
									<input type="text" readonly="readonly" class="form-control" name="suffliesNameOSV"
										id="suffliesNameOSV" style="border: none; font-size: 15px;">
									<hr>
									<div class="row g-3">
										<!-- 거래처 번호 숨김 -->
										<input type="hidden" class="form-control" name="buyerKeyOSV" id="buyerKeyOSV">
										<div class="col-xxl-6">
											<div>
												<label for="suffliesKeyOSV" class="form-label">비품 번호</label>
												<input type="text" readonly="readonly" class="form-control"
													name="suffliesKeyOSV" id="suffliesKeyOSV" style="border: none;">
											</div>
										</div>
										<!--end col-->
										<div class="col-xxl-6">
											<div>
												<label for="buyerNameOSV" class="form-label">거래처 명</label>
												<input type="text" readonly="readonly" class="form-control"
													name="buyerNameOSV" id="buyerNameOSV" style="border: none;">
											</div>
										</div>
										<!--end col-->
										<div class="col-xxl-6">
											<div>
												<label for="suffliesStandardOSV" class="form-label">규격</label>
												<input type="text" readonly="readonly" class="form-control"
													name="suffliesStandardOSV" id="suffliesStandardOSV"
													style="border: none;">
											</div>
										</div>
										<!--end col-->
										<div class="col-xxl-6">
											<div>
												<label for="suffliesReminderOSV" class="form-label">수량</label>
												<input type="text" readonly="readonly" class="form-control"
													name="suffliesReminderOSV" id="suffliesReminderOSV"
													style="border: none;">
											</div>
										</div>
										<!--end col-->
										<div class="col-xxl-6">
											<div>
												<label for="locationKeyOSV" class="form-label">병과</label>
												<input type="text" readonly="readonly" class="form-control"
													name="locationKeyOSV" id="locationKeyOSV" style="border: none;">
											</div>
										</div>
										<!--end col-->

										<div class="col-lg-12">
											<div class="hstack gap-2 justify-content-end">
												<button type="button" class="btn btn-light btn-sm"
													data-bs-dismiss="modal" id="officeSuppliesDeleteButton">삭제</button>
											</div>
										</div>
										<!--end col-->
									</div>
									<!--end row-->
								</form>
							</div>
						</div>
					</div>
				</div>
				<!-- 거래처 상세보기 모달창 끄읕 ----------------------------------------------------------------------------------------------------------------------------->


				<!-- 거래처 신규등록 모달창 (문수정)----------------------------------------------------------------------------------------------------------------------------->
				<div class="modal fade modal-lg" id="buyerinsertModalChang" tabindex="-1"
					aria-labelledby="exampleModalgrid1Label" aria-modal="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="preDiagnosisLabel">신규 거래처 등록</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<!-- 폼 폼 -->
								<form id="buyerinsertForm">
									<div class="row g-3">
										<!-- 거래처 번호 숨김 -->
										<input type="hidden" class="form-control" name="buyerKey" disabled="disabled"
											id="buyerKey">
										<div class="col-xxl-6">
											<div>
												<label for="buyerName" class="form-label">거래처 명</label>
												<input type="text" class="form-control" name="buyerName" id="buyerName"
													style="border-top: none; border-left: none; border-right: none;">
											</div>
										</div>
										<!--end col-->
										<div class="col-xxl-6">
											<div>
												<label for="buyerTel" class="form-label">거래처 연락처</label> <input
													type="text" class="form-control" name="buyerTel" id="buyerTel"
													style="border-top: none; border-left: none; border-right: none;">
											</div>
										</div>
										<!--end col-->
										<div class="col-xxl-6">
											<div>
												<label for="buyerCharger" class="form-label">거래처 담당자명</label>
												<input type="text" class="form-control" name="buyerCharger"
													id="buyerCharger"
													style="border-top: none; border-left: none; border-right: none;">
											</div>
										</div>
										<!--end col-->
										<div class="col-xxl-6">
											<div>
												<label for="buyerEmail" class="form-label">거래처 이메일</label>
												<input type="text" class="form-control" name="buyerEmail"
													id="buyerEmail"
													style="border-top: none; border-left: none; border-right: none;">
											</div>
										</div>
										<!--end col-->
										<div class="col-xxl-12">
											<div>
												<label for="buyerAddress" class="form-label">거래처 주소</label>
												<input type="text" class="form-control" name="buyerAddress"
													id="buyerAddress"
													style="border-top: none; border-left: none; border-right: none;">
											</div>
										</div>
										<!--end col-->
										<div class="col-xxl-6">
											<div>
												<label for="contractDate" class="form-label">계약일</label>
												<input type="date" class="form-control" name="contractDate"
													id="contractDate" style="border: none;">
											</div>
										</div>
										<!--end col-->
										<div class="col-xxl-6">
											<div>
												<label for="contractEndDate" class="form-label">계약 종료일</label>
												<input type="date" class="form-control" name="contractEndDate"
													id="contractEndDate" style="border: none;">
											</div>
										</div>
										<!--end col-->
										<div class="col-xxl-6">
											<div>
												<label for="buyerStatus" class="form-label">거래 상태</label>
												<select class="form-select" name="buyerStatus" id="buyerStatus">
													<option value="BS01" selected="selected">거래중</option>
													<option value="BS02">거래종료</option>
													<option value="BS03">단종</option>
												</select>
											</div>
										</div>
										<!--end col-->

										<div class="col-lg-12">
											<div class="hstack gap-2 justify-content-end">
												<button type="button" class="btn btn-light btn-sm"
													data-bs-dismiss="modal">취소</button>
												<button type="submit" class="btn btn-primary btn-sm"
													id="buyerInsertButton" data-bs-dismiss="modal">저장</button>
											</div>
										</div>
										<!--end col-->
									</div>
									<!--end row-->
								</form>
							</div>
						</div>
					</div>
				</div>
				<!-- 거래처 신규등록 모달창 끄읕 ----------------------------------------------------------------------------------------------------------------------------->

				<!-- 비품 등록 모달창 (문수정)----------------------------------------------------------------------------------------------------------------------------->
				<div class="modal fade modal-lg" id="officeSuppliesInsertModal" tabindex="-1"
					aria-labelledby="exampleModalgrid1Label" aria-modal="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="preDiagnosisLabel">비품 등록</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<!-- 비품 등록 폼 -->
								<form id="officeSuppliesInsertForm">
									<div class="row g-3">
										<!-- 비품번호 숨김 -->
										<input type="hidden" class="form-control" name="suffliesKey" disabled="disabled"
											id="suffliesKey">
										<!-- 거래처번호 숨김 -->
										<input type="hidden" class="form-control" name="buyerKey" disabled="disabled"
											id="buyerKey">
										<div class="col-xxl-6">
											<div>
												<label for="suffliesName1" class="form-label">비품 명</label>
												<input type="text" class="form-control" name="suffliesName1"
													id="suffliesName1" value="TEST1"
													style="border-top: none; border-left: none; border-right: none;">
											</div>
										</div>
										<!--end col-->
										<div class="col-xxl-6">
											<div>
												<label for="suffliesStandard1" class="form-label">규격</label>
												<input type="text" class="form-control" name="suffliesStandard1"
													id="suffliesStandard1" value="EA"
													style="border-top: none; border-left: none; border-right: none;">
											</div>
										</div>
										<!--end col-->
										<div class="col-xxl-6">
											<div>
												<label for="suffliesReminder1" class="form-label">수량</label>
												<input type="text" class="form-control" name="suffliesReminder1"
													id="suffliesReminder1" placeholder="숫자만"
													style="border-top: none; border-left: none; border-right: none;">
											</div>
										</div>
										<div class="col-xxl-6">
										</div>
										<!--end col-->
										<div class="col-xxl-6">
											<div>
												<label for="buyerName1" class="form-label">거래처 명</label>
												<select class="form-select" name="buyerName1" id="buyerName1">
													<!-- 옵션들어오는곳 -->
												</select>
											</div>
										</div>
										<!--end col-->
										<div class="col-xxl-6">
											<div>
												<label for="locationKey1" class="form-label">병과 번호</label>
												<select class="form-select" name="locationKey1" id="locationKey1">
													<option value="L001">진료실1</option>
													<option value="L002">진료실2</option>
													<option value="L003">진료실3</option>
													<option value="L004">물리치료실</option>
													<option value="L005">영상촬영실</option>
													<option value="L006">도수치료실1</option>
													<option value="L007">도수치료실2</option>
													<option value="L008">수납실</option>
												</select>
											</div>
										</div>
										<!--end col-->
										<div class="col-lg-12">
											<div class="hstack gap-2 justify-content-end">
												<button type="button" class="btn btn-light btn-sm"
													data-bs-dismiss="modal">취소</button>
												<button type="submit" class="btn btn-primary btn-sm"
													id="officeSuppliesInsertButton" data-bs-dismiss="modal">저장</button>
											</div>
										</div>
										<!--end col-->
									</div>
									<!--end row-->
								</form>
							</div>
						</div>
					</div>
				</div>
				<!-- 비품 등록 모달창 끄읕 -------------------------------------------------------------------------------------------------------------------------------->

				<!-- 비품 신청 모달창 (문수정)----------------------------------------------------------------------------------------------------------------------------->
				<div class="modal fade modal-lg" id="officeSuppliesApply" tabindex="-1"
					aria-labelledby="exampleModalgrid1Label" aria-modal="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="preDiagnosisLabel">비품 신청</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<!-- 비품 신청 폼 -->
								<form id="officeSuppliesApplyForm">
									<hr>
									<input type="text" readonly="readonly" class="form-control" name="suffliesNameApply"
										id="suffliesNameApply" style="border: none; font-size: 15px;">
									<hr>
									<div class="row g-3">
										<!-- 비품번호 숨김 --><input type="hidden" class="form-control"
											name="suffliesKeyApply" disabled="disabled" id="suffliesKeyApply">
										<!-- 거래처번호 숨김 --><input type="hidden" class="form-control" name="buyerKeyApply"
											disabled="disabled" id="buyerKeyApply">
										<!-- 규격 숨김 --><input type="hidden" class="form-control"
											name="suffliesStandardApply" disabled="disabled" id="suffliesStandardApply">
										<!-- 병과번호 숨김 --><input type="hidden" class="form-control"
											name="locationKeyApply" disabled="disabled" id="locationKeyApply">
										<div class="col-xxl-6">
											<div>
												<label for="suffliesReminderApply" class="form-label">남은 수량</label>
												<input type="text" class="form-control" name="suffliesReminderApply"
													disabled="disabled" id="suffliesReminderApply"
													style="border: none;">
											</div>
										</div>
										<!--end col-->
										<div class="col-xxl-6">
											<div>
												<label for="orderRequesterApply" class="form-label">발주 요청자</label>
												<input type="text" class="form-control" name="orderRequesterApply"
													id="orderRequesterApply" placeholder="이름" value="${authEmp.empName}"
													style="border: none;">
											</div>
										</div>
										<!--end col-->
										<div class="col-xxl-6">
											<div>
												<label for="orderCountApply" class="form-label">신청 수량</label>
												<input type="text" class="form-control" name="orderCountApply"
													id="orderCountApply" placeholder="숫자만 입력" style="border: none;">
											</div>
										</div>
										<div class="col-xxl-6">
											<div>
												<label for="suppliesPriceApply" class="form-label">금액</label>
												<input readonly type="text" class="form-control"
													name="suppliesPriceApply" id="suppliesPriceApply"
													placeholder="숫자만 입력" style="border: none;">
											</div>
										</div>
										<!--end col-->
										<div class="col-lg-12">
											<div class="hstack gap-2 justify-content-end">
												<button type="button" class="btn btn-light btn-sm"
													data-bs-dismiss="modal">취소</button>
												<button type="submit" class="btn btn-primary btn-sm"
													id="officeSuppliesApplyButton" data-bs-dismiss="modal">저장</button>
											</div>
										</div>
										<!--end col-->
									</div>
									<!--end row-->
								</form>
							</div>
						</div>
					</div>
				</div>
				<!-- 비품 신청 모달창 끄읕 ----------------------------------------------------------------------------------------------------------------------------->
			</body>
			<script>

				// 비품 삭제 시작(문수정) ---------------------------------------------------------------------
				$("#officeSuppliesDeleteButton").on("click", function () {
					var suffliesKey = $("#suffliesKeyOSV").val();

					$.ajax({
						type: "POST",
						url: "${cPath}/buyer/officeSuppliesDelete.do",
						data: { what: suffliesKey },
						dataType: "text",
						beforeSend: function (xhr) {   //데이터를 전송하기 전에 헤더에 csrf값을 설정한다
							xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
						},
						success: function (response) {
							if (response == 'success') {
								f_osList();
							}
						},
						error: function (request, status, error) {
							console.log("code: " + request.status)
							console.log("message: " + request.responseText)
							console.log("error: " + error);
						}
					});
				});
				// 비품 삭제 끄읕(문수정) ---------------------------------------------------------------------

				// 비품 등록 시작 (문수정) -----------------------------------------------------------------------------------
				let officeSuppliesInsertForm = $("#officeSuppliesInsertForm");

				officeSuppliesInsertForm.on("submit", function (event) {
					event.preventDefault();

					let OfficeSuppliesVO = {
						suffliesName: $("input[name = suffliesName1]").val(),
						buyerKey: $("select[name = buyerName1]").val(),
						suffliesStandard: $("input[name = suffliesStandard1]").val(),
						suffliesReminder: $("input[name = suffliesReminder1]").val(),
						locationKey: $("select[name = locationKey1]").val()
					}

					$.ajax({
						type: "post"
						, url: "${cPath}/buyer/officeSuppliesInsert.do"
						, contentType: 'application/json; charset=UTF-8'
						, data: JSON.stringify(OfficeSuppliesVO)
						, dataType: "text"
						, beforeSend: function (xhr) {   //데이터를 전송하기 전에 헤더에 csrf값을 설정한다
							xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
						}, success: function (rslt) {
							if (rslt == 'success') {
								// 					location.reload();
								f_osList();
							}
						}, error: function (request, status, error) {
							console.log("code: " + request.status)
							console.log("message: " + request.responseText)
							console.log("error: " + error);
						}
					})
				})
				// 비품 등록 끄읕 (문수정) -----------------------------------------------------------------------------------

				//비품 거래처명 옵션 ----------------------------------------------------------------------------------
				let officeSuppliesInsertModal = $('#officeSuppliesInsertModal').on('show.bs.modal', function () {
					// select 요소
					let selectElement = $('#buyerName1');
					for (let i = 0; i < buyerList.length; i++) {
						let buyer = buyerList[i];
						let buyerName = buyer.buyerName;
						let buyerKey = buyer.buyerKey;
						// option 요소 생성 및 추가
						let optionElement = $('<option></option>').attr('value', buyerKey).text(buyerName);
						selectElement.append(optionElement);
					}
				});
				// ---------------------------
				let officeSuppliesApply = $('#officeSuppliesApply').on('show.bs.modal', function () {
					//let data = $(this).data("source");

					// select 요소
					let selectElement2 = $('#suffliesName2');
					for (let i = 0; i < officeSuppliesList.length; i++) {
						let officeSupplies = officeSuppliesList[i];
						let suffliesName = officeSupplies.suffliesName;
						// option 요소 생성 및 추가
						let optionElement2 = $('<option></option>').attr('value', suffliesName).text(suffliesName);
						selectElement2.append(optionElement2);
					}
				});
				//비품 거래처명 옵션 ----------------------------------------------------------------------------------

				// 거래처 수정 시작(문수정) ------------------------------------------------------------------------
				let changeUpdateSaveBuyerButton = $('#changeUpdateSaveBuyerButton').on('click', function () {
					alert('저장버튼 확인');
					let buyerVO = {
						buyerName: $("input[name = buyerNameView]").val()
						, buyerTel: $("input[name = buyerTelView]").val()
						, buyerCharger: $("input[name = buyerChargerView]").val()
						, buyerEmail: $("input[name = buyerEmailView]").val()
						, contractDate: $("input[name = contractDateView]").val()
						, buyerStatus: $("#buyerStatusView").val()
						, contractEndDate: $("input[name = contractEndDateView]").val()
						, buyerAddress: $("input[name = buyerAddressView]").val()
						, buyerKey: $("input[name = buyerKeyView]").val()
					}

					$.ajax({
						type: "post"
						, url: "${cPath}/buyer/buyerUpdate.do"
						, contentType: 'application/json; charset=UTF-8'
						, data: JSON.stringify(buyerVO)
						, dataType: "text"
						, beforeSend: function (xhr) {
							xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
						}, success: function (rslt) {
							if (rslt == 'success') {
								buyerViewModalChang.modal('hide');
								b_List();
							}
						}, error: function (request, status, error) {
							console.log("code: " + request.status)
							console.log("message: " + request.responseText)
							console.log("error: " + error);
						}
					}); // 에이젝스 끝
				}).hide();
				let changeUpdateBuyerButton = $("#changeUpdateBuyerButton").on('click', function () {
					console.log('changeUpdateBuyerButton 확인');
					buyerViewForm.find('input[name]').prop('readonly', false);
					$("#buyerViewLabel").text("거래처 수정");
					$("#buyerStatusView").prop("disabled", false);
					changeUpdateBuyerButton.hide();
					changeUpdateSaveBuyerButton.show();
				})
				// 거래처 수정 끄읕 --------------------------------------------------------------------------------

				// 거래처 등록 시작(문수정) ------------------------------------------------------------------------
				let buyerinsertForm = $("#buyerinsertForm");
				buyerinsertForm.on("submit", function (event) {
					event.preventDefault();

					let buyerVO = {
						buyerName: $("input[name = buyerName]").val()
						, buyerTel: $("input[name = buyerTel]").val()
						, buyerCharger: $("input[name = buyerCharger]").val()
						, buyerEmail: $("input[name = buyerEmail]").val()
						, contractDate: $("input[name = contractDate]").val()
						, buyerStatus: $("#buyerStatus").val()
						, contractEndDate: $("input[name = contractEndDate]").val()
						, buyerAddress: $("input[name = buyerAddress]").val()

					}
					alert(buyerVO.contractDate);

					$.ajax({
						type: "post"
						, url: "${cPath}/buyer/buyerInsert.do"
						, contentType: 'application/json; charset=UTF-8'
						, data: JSON.stringify(buyerVO)
						, dataType: "text"
						, beforeSend: function (xhr) {   //데이터를 전송하기 전에 헤더에 csrf값을 설정한다
							xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
						}, success: function (rslt) {
							if (rslt == 'success') {
								// 					location.href = location.href; // 다시 로딩
								// 					location.reload();
								b_List();
							}
						}, error: function (request, status, error) {
							console.log("code: " + request.status)
							console.log("message: " + request.responseText)
							console.log("error: " + error);
						}
					})

				})

				// 거래처 등록 끄읕 ------------------------------------------------------------------------

				// 비품 신청 시작(문수정) ---------------------------------------------------------------------

				// 비품 신청 창
				let officeSuppliesApplyForm = $("#officeSuppliesApplyForm");

				let buyerKeyApply = officeSuppliesApplyForm.find('input[name=buyerKeyApply]');
				let suffliesKeyApply = officeSuppliesApplyForm.find('input[name=suffliesKeyApply]');
				let suffliesNameApply = officeSuppliesApplyForm.find('input[name=suffliesNameApply]');
				let buyerNameApply = officeSuppliesApplyForm.find('input[name=buyerNameApply]');
				let suffliesStandardApply = officeSuppliesApplyForm.find('input[name=suffliesStandardApply]');
				let suffliesReminderApply = officeSuppliesApplyForm.find('input[name=suffliesReminderApply]');
				let suppliesPriceApply = officeSuppliesApplyForm.find('input[name=suppliesPriceApply]');
				let locationKeyApply = officeSuppliesApplyForm.find('input[name=locationKeyApply]');

				let suppCost = 0;

				$(document).on("click", "#addofficeSuppliesApply", function (event) {
					event.preventDefault();

					let key = $(this).data('key');

					$.ajax({
						type: "get"
						, url: "${cPath}/buyer/officeSuppliesView.do"
						, data: { what: key }
						, dataType: "json"
						, success: function (rslt) {
							console.log("금액이 필요하다 : ", rslt)
							buyerKeyApply.val(key);
							suffliesKeyApply.val(rslt.suffliesKey);
							suffliesNameApply.val(rslt.suffliesName);
							buyerNameApply.val(rslt.buyerName);
							suffliesStandardApply.val(rslt.suffliesStandard);
							suffliesReminderApply.val(rslt.suffliesReminder);
							suppliesPriceApply.val(rslt.suffliesCost);
							suppCost = rslt.suffliesCost;
							console.log("suppCost", suppCost)
						}
					})
				})



				// 저장 버튼 클릭시 
				officeSuppliesApplyForm.on("submit", function (event) {
					console.log("event", event.target);

					let formData = $(this).serializeArray();
					let vo = {};
					$.each(formData, function (index, field) {
						vo[field.name] = field.value;
					});
					console.log("vo", vo)


					event.preventDefault();

					let officeSuppliesOrderRecodVO = {
						suffliesKey: $("input[name = suffliesKeyApply]").val(),
						orderCount: $("input[name = orderCountApply]").val(),
						suffliesReminder: $("input[name = suffliesReminderApply]").val(),
						suppliesEa: $("input[name = suffliesStandardApply]").val(),
						suppliesPrice: vo.orderCountApply * vo.suppliesPriceApply,
						//suffliesCost: $("input[name = suppliesPriceApply]").val()*$("input[name = orderCountApply]").val(),
						orderRequester: $("input[name = orderRequesterApply]").val(),
					}
					console.log(officeSuppliesOrderRecodVO)

					$.ajax({
						type: "post"
						, url: "${cPath}/buyer/officeSuppliesOrderRecodInsert.do"
						, contentType: 'application/json; charset=UTF-8'
						, data: JSON.stringify(officeSuppliesOrderRecodVO)
						, dataType: "text"
						, beforeSend: function (xhr) {   //데이터를 전송하기 전에 헤더에 csrf값을 설정한다
							xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
						}, success: function (rslt) {
							if (rslt == 'success') {
								//location.reload();

								// 이거 왜 안됨.. --> 되게 수정했음 (정민))->어케했누..
								f_osList();
								f_osorList();
							}
						}, error: function (request, status, error) {
							console.log("code: " + request.status)
							console.log("message: " + request.responseText)
							console.log("error: " + error);
						}
					})
				})

				// 비품 신청 끄읕(문수정) ---------------------------------------------------------------------

				// 비품 상세보기 시작(문수정) ---------------------------------------------------------------------
				let officeSuppliesViewForm = $("#officeSuppliesViewForm");

				let buyerKeyOSV = officeSuppliesViewForm.find('input[name=buyerKeyOSV]');
				let suffliesKeyOSV = officeSuppliesViewForm.find('input[name=suffliesKeyOSV]');
				let suffliesNameOSV = officeSuppliesViewForm.find('input[name=suffliesNameOSV]');
				let buyerNameOSV = officeSuppliesViewForm.find('input[name=buyerNameOSV]');
				let suffliesStandardOSV = officeSuppliesViewForm.find('input[name=suffliesStandardOSV]');
				let suffliesReminderOSV = officeSuppliesViewForm.find('input[name=suffliesReminderOSV]');
				let locationKeyOSV = officeSuppliesViewForm.find('input[name=locationKeyOSV]');

				$(document).on("click", "#oId", function (event) {
					event.preventDefault();

					let key = $(this).data('key');

					$.ajax({
						type: "get"
						, url: "${cPath}/buyer/officeSuppliesView.do"
						, data: { what: key }
						, dataType: "json"
						, success: function (rslt) {
							buyerKeyOSV.val(key);
							suffliesKeyOSV.val(rslt.suffliesKey);
							suffliesNameOSV.val(rslt.suffliesName);
							buyerNameOSV.val(rslt.buyerName);
							suffliesStandardOSV.val(rslt.suffliesStandard);
							suffliesReminderOSV.val(rslt.suffliesReminder);
							var locationMap = {
								"L001": { text: "진료실1" },
								"L002": { text: "진료실2" },
								"L003": { text: "진료실3" },
								"L004": { text: "물치과" },
								"L005": { text: "영상과" },
								"L006": { text: "도수1" },
								"L007": { text: "도수2" },
								"L008": { text: "수납실" }
							};

							locationKeyOSV.val(locationMap[rslt.locationKey].text);
						}
					})
				})

				// 비품 상세보기 끄읕(문수정) ---------------------------------------------------------------------


				// 거래처 상세보기 시작(문수정) -------------------------------------------------------------------
				let buyerViewModalChang = $("#buyerViewModalChang").on('hide.bs.modal', function () {
					buyerViewForm.find('input[name]').prop('readonly', true);
					$("#buyerStatusView").prop("disabled", true);
					changeUpdateSaveBuyerButton.hide();
					changeUpdateBuyerButton.show();
					$('#buyerViewLabel').text("거래처 상세보기");
				});
				let buyerViewForm = $("#buyerViewForm");

				let buyerKeyView = buyerViewForm.find('input[name=buyerKeyView]');
				let buyerNameView = buyerViewForm.find('input[name=buyerNameView]');
				let buyerTelView = buyerViewForm.find('input[name=buyerTelView]');
				let buyerChargerView = buyerViewForm.find('input[name=buyerChargerView]');
				let buyerEmailView = buyerViewForm.find('input[name=buyerEmailView]');
				let contractDateView = buyerViewForm.find('input[name=contractDateView]');
				let buyerStatusView = buyerViewForm.find('input[name=buyerStatusView]');
				let contractEndDateView = buyerViewForm.find('input[name=contractEndDateView]');
				let buyerAddressView = buyerViewForm.find('input[name=buyerAddressView]');

				$(document).on("click", "#bId", function (event) {
					event.preventDefault();

					let key = $(this).data('key');

					$.ajax({
						type: "get"
						, url: "${cPath}/buyer/buyerView.do"
						, data: { what: key }
						, dataType: "json"
						, success: function (rslt) {
							buyerKeyView.val(key);
							buyerNameView.val(rslt.buyerName);
							buyerTelView.val(rslt.buyerTel);
							buyerChargerView.val(rslt.buyerCharger);
							buyerEmailView.val(rslt.buyerEmail);
							contractDateView.val(rslt.contractDate.substring(0, 10));
							buyerStatusView.val(rslt.buyerStatus);

							// 거래 상태를 select 박스로 변경
							let buyerStatusOptions = {
								BS01: '거래중',
								BS02: '거래종료',
								BS03: '단종'
							};
							let buyerStatusSelect = $('<select>').attr('name', 'buyerStatusView').attr('id', 'buyerStatusView').addClass('form-select').prop('disabled', true);
							for (const key in buyerStatusOptions) {
								let option = $('<option>').attr('value', key).text(buyerStatusOptions[key]);
								if (key === rslt.buyerStatus) {
									option.attr('selected', 'selected');
								}
								buyerStatusSelect.append(option);
							}
							$('#buyerStatusView').replaceWith(buyerStatusSelect);
							contractEndDateView.val(rslt.contractEndDate.substring(0, 10));
							buyerAddressView.val(rslt.buyerAddress);
						}
					})
				})

				// 거래처 상세보기 끄읕 -------------------------------------------------------------------

				// 비품 요청 목록 조회 시작(문수정)---------------------------------------------------------
				let supplieOrder = $("#supplieOrder");
				let officeSuppliesOrderRecodOrderList = [];
				let tmpRecordKey = []; // 임시로 저장하는 recordKey DB에 있는거 삭제하기 위해 키값 받아가기

				function f_osorList() {		// 비품 요청 내역 리스트 뽑아오는 AJAX ----- 정민
					$.ajax({
						type: "get"
						, url: "${cPath}/buyer/officeSuppliesOrderRecordList.do"
						, dataType: "json"
						, success: function (res) {
							//f_officeSuppliesOrderRecodOrderList(resp);
							console.log("비품 요청 내역 리스트 : ", res)

							supplieOrder.empty();

							let supplyArr = [];
							$.each(res, function (i, supply) {
								let trs = $("<tr>").append(
									$("<td>").html(supply.recordKey),
									$("<td>").html(supply.suffliesName),
									$("<td>").html(supply.orderCount),
									$("<td>").html(supply.suppliesPrice.toLocaleString() + "원"),
									$("<td>").html(supply.orderRequester)
								).on("click", function () {
									fn_supply(res, supply);
								});
								supplyArr.push(trs);
								supplieOrder.append(supplyArr);

							})

						}, error: function (request, status, error) {
							console.log("code: " + request.status)
							console.log("message: " + request.responseText)
							console.log("error: " + error);
						}
					})
				}
				f_osorList();

				let tmpSupplyOrderArr = [];	// PDF로 옮길 때 중복체크를 위해 만든 배열
				let supplyCost = 0;
				const fn_supply = (resList, supply) => {

					if (tmpSupplyOrderArr.includes(supply)) {
						return;
					}
					tmpSupplyOrderArr.push(supply);

					let tmp = tmpSupplyOrderArr[tmpSupplyOrderArr.length - 1];

					cost += supply.suppliesPrice;

					let tr = orderBodyTrs.eq(temp);
					let tds = tr.find("td");

					if (tds.eq(0).html() == '&nbsp;') {
						tds.eq(0).html(supply.recordKey)
						tds.eq(1).html(supply.suffliesName)
						tds.eq(2).html(supply.orderCount)
						tds.eq(3).html(supply.suppliesPrice)
						totalCost.html(cost.toLocaleString() + "원");
						temp++;
					} else if (tds.eq(0).html() == '') {
						tds.eq(0).html(supply.recordKey)
						tds.eq(1).html(supply.suffliesName)
						tds.eq(2).html(supply.orderCount)
						tds.eq(3).html(supplyCost)
						totalCost.html(cost.toLocaleString() + "원");
						temp++;
					} else {
						return;
					}

					if (!tmpRecordKey.includes(supply.recordKey)) {
						tmpRecordKey.push(supply.recordKey);
					}
				}

				// 비품 요청 목록 조회 끄읕(문수정) - 정민 수정함---------------------------------------------------------


				// 비품 리스트 시작(문수정)------------------------------------------------------------------------
				let officeSuppliesListBody = $("#officeSuppliesListBody");

				let officeSuppliesList = [];
				function f_osList() {	// 비품 목록 출력하는 ajax
					$.ajax({
						type: "get"
						, url: "${cPath}/buyer/officeSuppliesList.do"
						, dataType: "json"
						, success: function (resp) {
							//f_officeSuppliesList(resp);
							officeSuppliesList = resp;

							let officeSuppliesListtrTags = [];

							if (officeSuppliesList.length > 0) {
								for (let i = 0; i < officeSuppliesList.length; i++) {

									let officeSupplies = officeSuppliesList[i];

									// 거래처 key값 출력
									let getofficeSupplieskey = $("<td>").attr({
										"id": "getofficeSupplieskey"
										, "style": " text-align: center;"
										, "vlaue": officeSupplies.suffliesKey
									}).text(officeSupplies.suffliesKey);

									// 비품 명
									let aaTag = $("<a>").attr({
										"href": "#"
										, "data-bs-toggle": "modal"
										, "data-bs-target": "#officeSuppliesViewModalChang"
										, "id": "oId"
										, "data-key": officeSupplies.suffliesKey
									}).html(officeSupplies.suffliesName);

									//거래처 명
									let buyernametd = $("<td>").attr({
										"vlaue": officeSupplies.buyerName
									}).addClass('osordataValue2').text(officeSupplies.buyerName);

									// 수량
									let suffliesRemidndertd;
									if (officeSupplies.suffliesReminder < 30) {
										suffliesRemidndertd = $("<td>").attr({
											"style": " color: #E06469;"
											, "vlaue": officeSupplies.suffliesReminder
										}).addClass('osordataValue3').text(officeSupplies.suffliesReminder);
									} else {
										suffliesRemidndertd = $("<td>").attr({
											"vlaue": officeSupplies.suffliesReminder
										}).addClass('osordataValue3').text(officeSupplies.suffliesReminder);
									}
									// 목록
									let trss = $("<tr>").attr("id", "addofficeSuppliesApply").addClass("datatr").append(
										getofficeSupplieskey
										, $("<td>").addClass('osordataValue1').html(aaTag)
										, buyernametd
										, suffliesRemidndertd
									).data("source", officeSupplies)
										.attr("data-bs-toggle", "modal")
										.attr("data-bs-target", "#officeSuppliesApply")
										.attr("data-key", officeSupplies.suffliesKey);
									officeSuppliesListtrTags.push(trss);
								}
							}
							officeSuppliesListBody.append(officeSuppliesListtrTags);
						}, error: function (request, status, error) {
							console.log("code: " + request.status)
							console.log("message: " + request.responseText)
							console.log("error: " + error);
						}
					})
				}
				f_osList();
				// 비품 리스트 끄읕(문수정).. 정민 수정함------------------------------------------------------------------------

				// 거래처 목록 시작(문수정) -----------------------------------------------------------------------
				let buyerListBody = $("#buyerListBody");
				let buyerList = [];
				const f_buyerList = function (resp) {
					buyerList = resp;
					let buyertrTags = [];

					if (buyerList.length > 0) {
						for (let i = 0; i < buyerList.length; i++) {
							let buyer = buyerList[i];

							// 거래처 key값 출력
							let getbuyerkey = $("<td>").attr({
								"id": "getbuyerkey"
								, "style": " text-align: center;"
								, "vlaue": buyer.buyerKey
							}).text(buyer.buyerKey);

							let aTag = $("<a>").attr({
								"vlaue": buyer.buyerName
							}).html(buyer.buyerName);
							// 거래 상태
							const statusTextMap = {
								BS01: { text: "거래중", color: "#19A7CE" },
								BS02: { text: "거래종료", color: "#BC8F8F" },
								BS03: { text: "단종", color: "#BC8F8F" }
							};

							const status = statusTextMap[buyer.buyerStatus] || { text: "", color: "" };

							const buyerstatusInput = $("<span>").text(status.text).css({
								"text-align": "center",
								"display": "inline-block",
								"color": status.color,
								"width": "100%"
							});

							let trs = $("<tr>").addClass("buyyerTrtags").append(
								getbuyerkey
								, $("<td>").addClass("dataValue1").html(aTag)
								//, $("<td>").addClass("dataValue2").html(buyer.buyerCharger)
								//, $("<td>").addClass("dataValue3").html(buyer.buyerTel)
								, $("<td>").addClass("dataValue4").html(buyerstatusInput)
							).data("source", buyer).attr({
								"data-bs-toggle": "modal"
								, "data-bs-target": "#buyerViewModalChang"
								, "id": "bId"
								, "data-key": buyer.buyerKey
							});

							buyertrTags.push(trs);
						}
					}
					buyerListBody.empty().append(buyertrTags);
				}
				function b_List() {
					$.ajax({
						type: "get"
						, url: "${cPath}/buyer/buyerList.do"
						, dataType: "json"
						, success: function (resp) {
							f_buyerList(resp);
						}, error: function (request, status, error) {
							console.log("code: " + request.status)
							console.log("message: " + request.responseText)
							console.log("error: " + error);
						}
					})
				}
				b_List();
				// 거래처 목록 끄읕 -----------------------------------------------------------------------

				// 드래그 앤 드랍 용 ----------------------------------------------------------------------
				var grid = GridStack.init({});
				$("tbody:not(.disable)").on("click", ".datatr", function (event) {
					$(this).siblings(".datatr").removeClass("active");
					$(this).toggleClass("active");
				});
				//------------------------------------------------------------------------------------

				// 오더목록 조회(안정민)
				const orderList = ()  => {
					let orderListBody = $("#orderListBody")
					$.getJSON("${cPath}/order/list").done(function (resp) {
						let orderList = resp
						let ordertrTags = [];
						if (orderList.length > 0) {
							orderList.sort(function (a, b) {
								if (a.orderRequestNo <= b.orderRequestNo) return 1;
								return -1
							});
							let orderNo;	// while문에서 주문번호 확인하려고 만든 변수
							$.each(orderList, function (idx, order) {
								let tmp = order.orderDate;
								let year = tmp.substr(2, 2);
								let month = tmp.substr(5, 2);
								let day = tmp.substr(8, 2);
								let time = tmp.substr(11, 2);
								let mim = tmp.substr(14, 2);
								let sec = tmp.substr(17, 2);
								let orderDateTime = `\${year}년 \${month}월 \${day}일 \${time}시 \${mim}분 \${sec}초`;

								while (!(order.orderRequestNo == orderNo)) {
									let a = $("<a>").text(order.orderRequestNo);
									let trs = $("<tr>").append(
										$("<td>").html(a),
										$("<td>").html(order.orderCharger),
										$("<td>").html(orderDateTime)
									).on("click", function () {
										fn_order(resp, order);
									});
									ordertrTags.push(trs);
									orderNo = order.orderRequestNo;
									break;
								}



							});
						};
						orderListBody.empty();
						orderListBody.append(ordertrTags);
					});
				}
				orderList();

				let orderBody = $("#orderBody");
				let orderBodyTrs = orderBody.find("tr");
				let orderBodyTds = orderBodyTrs.find("td");
				let temp = 0;
				let totalCost = $('#totalCost');
				let cost = 0;
				let tmpOrder = [];	// 같은값 들어가면 클릭 못하게 임시로 만듦
				let respArr = [];


				// 유림 
				let selectedOrderKey = [];
				// 유림 
				let tmpOrderNo = [];	// PDF저장 누르면 DB에서 삭제하게 하려고 주문번호 임시로 저장하는 배열
				const fn_order = (resp, order) => {

					console.log("선택한 요청 내역", order);
					console.log("이건가 : ", order.orderRequestNo);

					if (!tmpOrderNo.includes(order.orderRequestNo)) {
						tmpOrderNo.push(order.orderRequestNo);
					}


					let groupedData = resp.reduce((acc, obj) => {
						const key = obj.orderRequestNo;
						if (!acc[key]) {
							acc[key] = [];
						}
						acc[key].push(obj);
						return acc;
					}, {});

					let isDuplication = false;

					$.each(selectedOrderKey, function (idx, key) {
						if (key == order.orderRequestNo) {
							isDuplication = true;
							return;
						}
					})

					console.log("중복체크 결과", isDuplication);
					if (!isDuplication) {

						selectedOrderKey.push(order.orderRequestNo);

						let targets = groupedData[order.orderRequestNo];
						console.log("추가해야할 대상", targets);

						$.each(targets, function (i, v) {
							console.log("v.orderRequestNo", v.orderRequestNo);
							cost += v.orderCost;
							let tr = orderBodyTrs.eq(temp);
							let tds = tr.find("td");

							if (tds.eq(0).html() == '&nbsp;') {
								tds.eq(0).html(v.medicineKey)
								tds.eq(1).html(v.medicineName)
								tds.eq(2).html(v.orderQuantity)
								tds.eq(3).html(v.orderCost)
								totalCost.html(cost.toLocaleString() + "원");
								temp++;
							} else if (tds.eq(0).html() == '') {
								tds.eq(0).html(v.medicineKey)
								tds.eq(1).html(v.medicineName)
								tds.eq(2).html(v.orderQuantity)
								tds.eq(3).html(v.orderCost)
								totalCost.html(cost.toLocaleString() + "원");
								temp++;
							} else {
								return;
							}

						})


					}

					console.log("저장을 완료한 후의 배열 상태 : ", tmpOrderNo);

				}


				// 발주서 날짜----------------------------------------------------------------------
				window.onload = function () {
					let currentDate = new Date();
					let day = String(currentDate.getDate()).padStart(2, '0');
					let month = String(currentDate.getMonth() + 1).padStart(2, '0'); //January is 0!
					let year = currentDate.getFullYear();

					currentDate = year + '-' + month + '-' + day;
					document.getElementById('currentDate').innerText = currentDate;
				}
				// --------------------------------------------------------------------------------------------

				// pdf 저장(안정민)------------------------------------------------------------------------------------
				$(document).ready(function () {
					$('#savePdf').click(function () { // pdf저장 button id

						html2canvas($('#pdfDiv')[0]).then(function (canvas) { //저장 영역 div id

							// 캔버스를 이미지로 변환
							var imgData = canvas.toDataURL('image/png');

							var imgWidth = 210; // 이미지 가로 길이(mm) / A4 기준 210mm
							var pageHeight = imgWidth * 1.414;  // 출력 페이지 세로 길이 계산 A4 기준
							var imgHeight = canvas.height * imgWidth / canvas.width;
							var heightLeft = imgHeight;
							var margin = 5; // 출력 페이지 여백설정
							var doc = new jsPDF('p', 'mm');
							var position = 0;

							// 첫 페이지 출력
							doc.addImage(imgData, 'PNG', margin, position + 10, imgWidth, imgHeight);
							heightLeft -= pageHeight;

							// 한 페이지 이상일 경우 루프 돌면서 출력
							while (heightLeft >= 20) {
								position = heightLeft - imgHeight;
								doc.addPage();
								doc.addImage(imgData, 'PNG', margin, position + 10, imgWidth, imgHeight);
								heightLeft -= pageHeight;
							}
							// 파일 저장
							doc.save('file-name.pdf');

							// PDF저장 끝 --------------------------------------------------------------------------------

							// 저장하면 DB에서 Delete시키기 시작
							deleteProduct();

							emptyBtn();	// PDF저장 했을 때도 동일한 작업 수행

						});
					});
				})



				// PDF버튼 클릭!!!! 하면 저장하면 DB에서 Delete시키기 함수
				const deleteProduct = () => {
					console.log("여기서도 잘 나오나? ", tmpOrderNo);
					console.log("여기서도 잘 나오나? ", tmpRecordKey);

					if (tmpOrderNo != null) {
						$.ajax({
							type: "post",
							url: "${cPath}/product/ProductManagementController/deleteTmpOrderNo",
							data: JSON.stringify(tmpOrderNo),
							contentType: "application/json",
							beforeSend: function (xhr) {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
								xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
							},
							success: (res) => {
								console.log("결과 확인!!! ", res)
								orderList();
								return;
							}
						})
					}
					if (tmpRecordKey != null) {
						$.ajax({
							type: "post",
							url: "${cPath}/product/ProductManagementController/deleteTmpRecordKey",
							data: JSON.stringify(tmpRecordKey),
							contentType: "application/json",
							beforeSend: function (xhr) {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
								xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
							},
							success: (res) => {
								console.log("오늘 해야할거 발주 페이지 완성하기")
								console.log("결과 확인!!! ", res)
								f_osorList();
								return;
							}
						})
					}

				}

				// 비우기 클릭시
				const emptyBtn = () => {
					var tds = $("#orderBody td");
					tds.empty();
					temp = 0;
					cost = 0;
					selectedOrderKey = [];
					tmpOfficeSuppliesOrderRecod = [];
					tmpOrderNo = []; // 주문번호 임시로 저장하는 배열
					tmpRecordKey = [];
					tmpSupplyOrderArr = [];
				}

				// 거래처 검색하기(문수정)--------------------------------------------------
				const inputId = $("#inputId");
				inputId.on("keyup", function () {
					let inputValue = inputId.val().toUpperCase();
					let buyyerTrtags = $(".buyyerTrtags");

					$.each(buyyerTrtags, function (i, v) {
						let dataValue1 = $(this).find(".dataValue1").html();
						//           let dataValue2 = $(this).find(".dataValue2").html();
						//           let dataValue3 = $(this).find(".dataValue3").html();
						let dataValue4 = $(this).find(".dataValue4").html();
						if (dataValue1.toUpperCase().indexOf(inputValue) > -1) {
							$(this).show();
							return;
						} else {
							$(this).hide();
						}
						if (dataValue4.toUpperCase().indexOf(inputValue) > -1) {
							$(this).show();
							return;
						} else {
							$(this).hide();
						}

					})
				})
				// ------------------------------------------------------------------------
				// 비품 검색하기 (문수정)--------------------------------------------------
				const inputId2 = $("#inputId2");
				inputId2.on("keyup", function () {
					let inputValue2 = inputId2.val().toUpperCase();
					let osorTrtags = $(".datatr");

					$.each(osorTrtags, function (i, v) {
						let osordataValue1 = $(this).find(".osordataValue1").html();
						let osordataValue2 = $(this).find(".osordataValue2").html();
						let osordataValue3 = $(this).find(".osordataValue3").html();
						if (osordataValue1.toUpperCase().indexOf(inputValue2) > -1) {
							$(this).show();
							return;
						} else {
							$(this).hide();
						}
						if (osordataValue2.toUpperCase().indexOf(inputValue2) > -1) {
							$(this).show();
							return;
						} else {
							$(this).hide();
						}

						if (osordataValue3.toUpperCase().indexOf(inputValue2) > -1) {
							$(this).show();
							return;
						} else {
							$(this).hide();
						}

					})
				})
				// -------------------------------------------------------------------------------------

				// scroll 생성(문수정) -----------------------------------------------------------------

				let buyerListDiv = document.querySelector('#buyerListDiv');
				new SimpleBar(buyerListDiv, { autoHide: true });

				let ptWaitingListDiv = document.querySelector('#ptWaitingListDiv');
				new SimpleBar(ptWaitingListDiv, { autoHide: true });

				let officeListDiv = document.querySelector('#officeListDiv');
				new SimpleBar(officeListDiv, { autoHide: true });

				let officeSuppliesOrderRecodListDiv = document.querySelector('#officeSuppliesOrderRecodListDiv');
				new SimpleBar(officeSuppliesOrderRecodListDiv, { autoHide: true });

// -----------------------------------------------------------------------------
			</script>