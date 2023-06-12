<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
			<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
				<script src="${cPath }/resources/js/ckeditor/ckeditor.js"></script>

				<style type="text/css">
					#noticeBoardBtn {
						float: right;
						margin: 10px;
					}

					#noticeBoardSubmitBtn {
						margin: 10px;
						/* float: right; */
					}
					.boardModalBtns{
						display: flex;
						justify-content: flex-end;
					}
					#noticeBoardTB {
						text-align: center;

					}

					.page-item {
						text-align: center;
					}

					.table {
						text-align: center;
						vertical-align: middle;
						font-size: 11px;
					}

					.table thead {
						background-color: #405189c7;
						color: white;
					}

					#goSubmitBtn,
					#noticeBoardDelBtn {
						float: right;
						margin-left: 2px;
					}

					#boardView {
						font-size: 12px;
						border: 1px solid lightgray;
						text-align: left;
						padding: 100px;
						border-left: none;
						border-right: none;
					}

					#boardView th {
						width: 25%;
						text-align: center;
						background-color: #f2f2f2;
					}

					#myChart {
						width: 300px;
					}
					.chartSize{
						width: 550px;
					}
				</style>

				<div class="grid-stack">
					<!-- 공지사항 게시판 위치 -->
					<div class="grid-stack-item item" gs-x="0" gs-y="0" gs-w="8" gs-h="5">
						<div class="grid-stack-item-content" id="noticeBoardDivGrid">
							<h5 id="boardNoticeTitle" style="float: left;">공지사항</h5>
							<br>
							<hr>
							<div class="item-body">
								<security:authorize access="hasAnyRole('ADMIN', 'MASTER')">
									<button type="button" id="noticeBoardBtn" class="btn btn-outline-primary btn-sm"
										data-bs-toggle="modal" data-bs-target="#insertNoticeBoard">
										게시글 작성
									</button>
								</security:authorize><br>
								<div id="noticeBoardDivList">
									<table id="noticeBoardTB" class="table table-bordered">
										<thead class="table">
											<tr>
												<th style="width: 10%;">게시물번호</th>
												<th style="width: 50%;">제목</th>
												<th style="width: 10%;">작성자</th>
												<th style="width: 5%;">조회수</th>
												<th style="width: 15%;">작성일</th>
											</tr>
										</thead>
										<tbody id="listBody">
											<!-- 공지사항 리스트 들어오는 위치 -->
										</tbody>
										<tfoot>

											<tr>
												<td colspan="5">
													<!--페이징 처리-->
													<nav aria-label="...">
														<ul id="pagingArea" style="display: inline-flex;"
															class="pagination pagination-sm">
														</ul>
													</nav>
												</td>
											</tr>
										</tfoot>
									</table>
								</div>
								<div id="noticeDetailpoint"></div>
							</div>
						</div>
					</div>

					<!-- 통계  -->
					<div class="grid-stack-item item" gs-x="8" gs-y="0" gs-w="4" gs-h="5">
						<div class="grid-stack-item-content">
						<h5 id="boardNoticeTitle" style="float: left;">통계</h5>
							<br>
							<hr>
							<div class="chartSize" id="canvasDiv">
								<!-- <canvas id="myChart"></canvas> -->
							</div>

							<div style="text-align: center; margin-top: 20px;">
								<input class="btn btn-outline-primary btn-sm"  id="monthVisitBtn" type="button" value="월별 방문자 통계" onclick="fn_monthVisitChart()" />
								<input class="btn btn-outline-primary btn-sm" id="monthPayBtn" type="button" value="월별 매출액 통계" onclick="fn_monthPayChart()" />
<!-- 								<input class="btn btn-outline-primary btn-sm" id="monthAgeBtn" type="button" value="연령별 통계" onclick="f_chart3()" disabled /> -->
							</div>
						</div>
					</div>

					<!----------------------------------------------- noticeInsert 용 모달창 ----------------------------------------------------->
					<!-- Grids in modals -->
					<div class="modal fade" id="insertNoticeBoard" tabindex="-1"
						aria-labelledby="insertNoticeBoardLabel" aria-modal="true">
						<div class="modal-dialog modal-lg">
							<div class="modal-content">
								<div class="card">
									<div class="card-header" id="noticeCardHeader">
										<button style="float: right;" type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
										<h3>공지사항 작성</h3>
									</div>
									<div class="card-body">
										<form id="noticeBoardForm" method="post"
											action="${pageContext.request.contextPath}/noticeBoardInsert.do"
											enctype="multipart/form-data">
											<div class="form-floating mb-3">
												<div class="form-floating">
													<input type="text" name="boardTitle" class="form-control"
														id="floatingTitle" placeholder="글제목을 입력하세요">
													<label for="floatingTitle">글제목</label>
												</div>
											</div>
											<!-- 로그인 한 직원의 name 들어가야 한다. -->
											<div class="form-floating mb-3">
												<div class="form-floating">
													<input type="text" name="boardWriter" class="form-control"
														id="floatingWriter" placeholder="작성자를 입력하세요" readonly
														value="${authEmp.empName}">
													<label for="floatingWriter">작성자</label>
												</div>
											</div>
											<h5>글내용</h5>
											<input type="text" name="boardContent" id="boardContent">
											<div class="boardModalBtns">
												<input id="noticeBoardSubmitBtn" type="submit" value="작성하기"
													class="btn btn-primary btn-sm">
												<input id="preInputCommentBtn" type="button" class="btn btn-outline-primary callBtn btn-sm" onclick="fn_preInputBoard();" value="자동입력" style="margin:10px;">	
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!------------------------------------------------------------------------------------------------------------------------->
					<!----------------------------------------------- noticeUpdate 용 모달창 ----------------------------------------------------->
					<!-- Grids in modals -->
					<div class="modal fade" id="updateNoticeBoard" tabindex="-1"
						aria-labelledby="updateNoticeBoardLabel" aria-modal="true">
						<div class="modal-dialog modal-lg">
							<div class="modal-content">
								<div class="card">
									<div class="card-header" id="noticeCardHeader">
										<button style="float: right;" type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
										<h3>공지사항 수정</h3>
									</div>
									<div class="card-body">
										<form id="noticeBoardModForm" method="post"
											action="${pageContext.request.contextPath}/noticeBoardInsert.do"
											enctype="multipart/form-data">
											<input type="hidden">
											<div class="form-floating mb-3">
												<div class="form-floating">
													<input type="text" name="boardTitle" class="form-control"
														id="modTitle" placeholder="글제목을 입력하세요">
													<label for="floatingTitle">글제목</label>
												</div>
											</div>
											<!-- 로그인 한 직원의 name 들어가야 한다. -->
											<div class="form-floating mb-3">
												<div class="form-floating">
													<input type="text" name="boardWriter" class="form-control"
														id="modWriter" placeholder="작성자를 입력하세요" readonly>
													<label for="floatingWriter">작성자</label>
												</div>
											</div>
											<h5>글내용</h5>
											<!-- <input type="text" name="boardContent" id="boardModContent"><br> -->
											<div id="boardModContent"></div>
											<div style="display: flex; justify-content: flex-end;">
												<input id="noticeBoardModSubmitBtn" type="submit" value="수정하기" class="btn btn-primary btn-sm"  style="margin: 10px;">
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!------------------------------------------------------------------------------------------------------------------------->


				</div> <!-- 그리드 스택 끝-->


				<form name="noticeSearchForm" method="post">
					<security:csrfInput />
					<input type="hidden" name="page">
				</form>

				
				<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
				<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
				<script>
					// CKEDITOR 사용하려면 넣어야 함. ----------------------------------------------------------
					CKEDITOR.replace('boardContent', {
						uploadUrl: `${cPath}/upload/noticeBoard?${_csrf.parameterName}=${_csrf.token}`
						, clipboard_handleImages: false
					});
					CKEDITOR.replace('boardModContent', {
						uploadUrl: `${cPath}/upload/noticeBoard?${_csrf.parameterName}=${_csrf.token}`
						, clipboard_handleImages: false
					});

					//------------------------------------------------------------------------------------


					// GridStack -------------------------------------------------------------------------
					var grid = GridStack.init({});
					//------------------------------------------------------------------------------------ 

					$("tbody:not(.disable)").on("click", ".datatr", function (event) {
						$(this).siblings(".datatr").removeClass("active");
						$(this).toggleClass("active");
					});


					// 통계------------------------------------------------------------------------------------
					
					let myChart;
					const fn_monthVisitChart = () => {
					console.log("test");

					if ($("#payChart").length) {
								$("#payChart").remove();
					}
					if ($("#myChart").length) {
						$("#myChart").remove();
					}

					$("monthPayBtn").attr("disabled", false);
					let monthlabelData = [];
					let monthChartData = [];

					$.getJSON("${cPath}/chartMonthVisitData.do").done(function (resp) {
						monthData = resp;
						console.log("monthData", monthData);

						$.each(monthData, function (idx, data) {
							monthlabelData.push(data.monthData);
							monthChartData.push(data.receiptKey);
						});
						createChart();
						
						function createChart() {
							if ($("#payChart").length) {
								$("#payChart").remove();
								if (myChart) {
									myChart.destroy();
								}
							}
						}
						
							$("#canvasDiv").append(
									$("<canvas id='myChart'>")
								);
						
					let ctCtx = document.querySelector('#myChart');

					const data = {
						labels: monthlabelData,
						datasets: [
							{
								label: "접수건수",
								data: monthChartData,
								backgroundColor: 'rgba(255, 205, 86, 0.2)',
								borderColor: 'rgb(255, 205, 86)',
								borderWidth: 1
							}
						]
					};

					const options = {
							responsive: true,
							scales: {
							y: {
									beginAtZero: true,
									// max: 180
							},
							x: {
									barPercentage: 0.1, // 바의 너비를 전체 너비
									// categoryPercentage: 0.1, // 바 사이의 간격
									barThickness : 20
								}
						}
					};

					// 라인 그래프 생성
					myChart = new Chart(ctCtx, {
						type: 'bar',
						data: data,
						options: options
					});
				});	
				
				}
				fn_monthVisitChart();


					// 월별 매출액 통계	
					let payChart;
					const fn_monthPayChart = () => {
						
						console.log("페이차트");

						if ($("#payChart").length) {
							$("#payChart").remove();
						}
						if ($("#myChart").length) {
								$("#myChart").remove();
					}

						let monthlabelData = [];
						let monthPayAvgData = [];
						let monthPaySumData = [];

						$.getJSON("${cPath}/chartMonthPayData.do").done(function (resp) {
							console.log("paydata",resp);
							let payData = resp;
							
							$.each(payData, function (idx, data) {
								monthlabelData.push(data.payMonth);
								monthPayAvgData.push(data.avgCost);
								monthPaySumData.push(data.sumCost);
							});
							createChart();
						

						console.log("monthlabelData",monthlabelData);
						console.log("monthPayAvgData",monthPayAvgData);
						console.log("monthPaySumData",monthPaySumData);
						
						function createChart() {
							if ($("#myChart").length) {
								$("#myChart").remove();
								if (payChart) {
									payChart.destroy();
								}
							}
						}
							$("#canvasDiv").append(
								$("<canvas id='payChart'>")
							);
							
						let payCtx = document.querySelector('#payChart');
							
						const data = {
								labels: monthlabelData,
								datasets: [
									{
										label: "매출합",
// 										yAxisID: 'y-axis-1',
										data: monthPaySumData,
										backgroundColor: 'rgba(255, 205, 86, 0.2)',
										borderColor: 'rgb(255, 205, 86)',
										borderWidth: 1,				
										type: 'bar'
									}
									,{
										label: "매출평균",
										data: monthPayAvgData,
// 										yAxisID: 'y-axis-2',
										borderColor: 'rgb(54, 162, 235)',
										backgroundColor: 'rgb(54, 162, 235)',
										type: 'line'
									},	
								]
							};

							const options = {
									responsive: true,
							};

							// 라인 그래프 생성
							payChart = new Chart(payCtx, {
								type: 'line',
								data: data,
								options: options
							});
						});	
					}
					
					// 통계 끝 ------------------------------------------------------------------------------------


					// 게시물 상세 조회용 ----------------------------------------------------------------------
					const noticeBoardDiv = $("#noticeBoardDiv");
					const noticeBoardDivGrid = $("#noticeBoardDivGrid");
					let noticeBoardFormDiv = $('#noticeBoardFormDiv').hide();
					let boardTitle = $('[name=boardTitle]');
					let boardWriter = $('[name=boardWriter]');
					let noticeBoardDivList = $('#noticeBoardDivList');
					let boardNoticeTitle = $('#boardNoticeTitle'); let noticeHit = $('#noticeHit');
					let noticeDetailpoint = $('#noticeDetailpoint');
					let noticeBoardBtn = $('#noticeBoardBtn');
					let noticeDetail = null;

					// 게시글 상세보기
					const fn_noticeDetail = (boardKey) => {
						$.getJSON("${cPath}/noticeBoardDetail.do", { 'boardKey': boardKey }).done(function (resp) {
							let notice = resp;
							let date = notice.boardDate.substring(0, 10);
							boardNoticeTitle.html("게시글 보기")
							noticeBoardDivList.hide();
							noticeBoardBtn.hide();
							let makeDetail = `<div id='noticeBoardFormDiv'><table class='table' id='boardView'><tbody><tr><th>글제목</th><td>\${notice.boardTitle}</td></tr><tr><th>작성일</th><td>\${date}</td></tr><tr><th>작성자</th><td>\${notice.empName}</td></tr><tr><th>조회수</th><td>\${notice.boardHit}</td></tr>
							<div id='boardDetailCont'><tr><td colspan='2'>\${notice.boardContent ?? "" }</td></tr></div></tbody></table>
							<input type="button" class='btn btn-primary btn-sm' value="목록으로" onclick='noticeListreload();'>
							<security:authorize access="hasAnyRole('ADMIN', 'MASTER')">
							<input type="button" class='btn btn-outline-danger btn-sm' data-boardKey='\${boardKey}' id='noticeBoardDelBtn' value="삭제">
							<input type="button" class='btn btn-outline-primary btn-sm' data-bs-toggle='modal' data-bs-target='#updateNoticeBoard' id='goSubmitBtn' data-boardKey='\${boardKey}' value="수정"></security:authorize></div>`;
							noticeDetail = notice;
							noticeDetailpoint.empty().append(makeDetail);
						}) // getJSON 끝
					} // fn_noticeDetail 끝
					//------------------------------------------------------------------------------------ 


					// 상세보기에서 목록 다시 불러오기 ------------------------------------------------------------
					const noticeListreload = () => {
						boardNoticeTitle.html("공지사항");
						let noticeDetailCard = $("#noticeDetailCard");
						// noticeDetailCard.remove();
						noticeBoardFormDiv.empty();
						noticeBoardBtn.show();
						noticeList();
						noticeBoardDivList.show();
					}

					//------------------------------------------------------------------------------------ 


					// 게시물 리스트 조회용 --------------------------------------------------------------------
					const noticeList = () => {
						boardNoticeTitle.html("공지사항")
						noticeDetailpoint.empty();
						const listBody = $("#listBody");
						const pagingArea = $("#pagingArea");

						let fn_makeTr = function (notice) {
							let trs = $(`<tr style='cursor:pointer;' onclick='fn_noticeDetail(\${notice.boardKey})'>`).append(
								$("<td>").html(notice.boardKey),
								$("<td>").html(notice.boardTitle),
								$("<td>").html(notice.empName),
								$("<td>").html(notice.boardHit),
								$("<td>").html(notice.boardDate)
							);
							return trs;
						};

						let noticeSearchForm = $("[name=noticeSearchForm]").on("submit", function (event) {
							event.preventDefault();

							let data = $(this).serialize();
							$.ajax({
								url: "${cPath}/noticeBoardList.do",
								data: data,
								dataType: "json",
								method: "post"

							}).done(function (resp, textStatus, jqXHR) {
								listBody.empty();
								pagingArea.empty();

								let trTags = [];
								if (resp.dataList.length > 0) {


									$.each(resp.dataList, function (idx, notice) {
										trTags.push(fn_makeTr(notice));
									});
									pagingArea.html(resp.pagingHTML);
								} else {
									trTags.push(
										$("<tr>").html(
											$("<td colspan='5'>").html("게시글이 없습니다.")
										)
									);
									pagingArea.html(resp.pagingHTML);
								}
								listBody.append(trTags);
							}).fail(function (jqXHR, status, error) {
								console.log(`상태코드 : ${status}, 에러메시지 : ${error}`);
							});
							return false;
						}).submit();

						// fn_paging 함수를 전역으로 선언
						window.fn_paging = function (page, event) {
							noticeSearchForm.find("[name=page]").val(page);
							noticeSearchForm.submit();
							noticeSearchForm.find("[name=page]").val("");
							return false;
						};
					};

					noticeList();

					//------------------------------------------------------------------------------------ 

					// 게시물 Insert용 ----------------------------------------------------------------------
					let noticeInsertBtn = $("#noticeInsertBtn");
					let noticeBoardForm = $("#noticeBoardForm");

					noticeBoardForm.on("submit", function (event) {
						event.preventDefault();
						let boardTitle = $("input[name=boardTitle]").val();

						let noticeData = {
							boardTitle: $("input[name=boardTitle]").val(),
							boardWriter: '${authEmp.empKey}',
							boardContent: CKEDITOR.instances.boardContent.getData()
						};
						console.log("check:", noticeData);

						if(boardTitle.length==0){
							Swal.fire({
										icon: 'error',
										title: '제목을 입력하세요.',
										})
							return;			
						}

						$.ajax({
							method: "post",
							url: "/FinalPJ/noticeBoardInsert.do",
							data: JSON.stringify(noticeData),
							contentType: 'application/json; charset=utf-8',
							dataType: "text",
							beforeSend: function (xhr) {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
								xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
							},
							success: function (resp) {
								if (resp == 'success') {
									Swal.fire('등록 성공!', '공지사항 게시글을 등록했습니다!', 'success');
									$('#insertNoticeBoard').modal('hide');
									noticeBoardForm[0].reset();
									noticeList();
								} else {
									Swal.fire('등록 실패!', '공지사항 게시글 등록에 실패했습니다!', 'error');
								}

							},
							error: function (request, status, error) {
								console.log("code: " + request.status)
								console.log("message: " + request.responseText)
								console.log("error: " + error);
							}
						});
						return false;
					});



					//------------------------------------------------------------------------------------ 	


					// 게시물 수정 ---------------------------------------------------------------------------

					$("#modTitle").val("");
					$("#modWriter").val("");
					CKEDITOR.instances.boardModContent.setData("");

					let goSubmitBtn = $(document).on('click', '#goSubmitBtn', function () {
						let boardKey = $(this).data('boardkey');
						boardTitle.val(noticeDetail.boardTitle);
						boardWriter.val(noticeDetail.empName);

						CKEDITOR.instances.boardModContent.setData(noticeDetail.boardContent ?? "");
					});

					let noticeBoardModForm = $("#noticeBoardModForm").on("submit", function (event) {
						event.preventDefault();
						let noticeModData = {
							boardKey: noticeDetail.boardKey,
							boardTitle: $('#modTitle').val(),
							boardWriter: '${authEmp.empKey}',
							boardContent: CKEDITOR.instances.boardModContent.getData()

						};

						console.log("check:", noticeModData);

						$.ajax({
							method: "post",
							url: "/FinalPJ/noticeBoardUpdate.do",
							data: JSON.stringify(noticeModData),
							contentType: 'application/json; charset=utf-8',
							dataType: "text",
							beforeSend: function (xhr) {
								xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
							},
							success: function (resp) {
								if (resp == 'success') {
									Swal.fire('수정 성공!', '공지사항 게시글을 수정했습니다!', 'success');
									fn_noticeDetail(noticeModData.boardKey);
									$('#updateNoticeBoard').modal('hide');
									$("#modTitle").val("");
									$("#modWriter").val("");
									CKEDITOR.instances.boardModContent.setData("");
								} else {
									Swal.fire('수정 실패!', '공지사항 게시글 수정에 실패했습니다!', 'error');
								}
							},
							error: function (request, status, error) {
								console.log("code: " + request.status);
								console.log("message: " + request.responseText);
								console.log("error: " + error);
							}
						});

						return false;

					})

					//------------------------------------------------------------------------------------ 	

					// 게시물 삭제 ---------------------------------------------------------------------------

					let noticeBoardDelForm = $("#noticeBoardDelForm");
					let noticeBoardDelBtn = $(document).on('click', '#noticeBoardDelBtn', function () {
						let delBoardKey = $(this).data('boardkey')
						console.log("delBoardKey=", delBoardKey);
						$.ajax({
							method: "get",
							url: "/FinalPJ/noticeBoardDelete.do",
							data: { "delBoardKey": delBoardKey },
							dataType: "text",
							beforeSend: function (xhr) {
								xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
							},
							success: function (resp) {
								if (resp == 'success') {
									Swal.fire('삭제 성공!', '공지사항 게시글을 삭제했습니다!', 'success');
									noticeListreload();
								} else {
									Swal.fire('삭제 실패!', '공지사항 게시글 삭제에 실패했습니다!', 'error');
								}
							},
							error: function (request, status, error) {
								console.log("code: " + request.status);
								console.log("message: " + request.responseText);
								console.log("error: " + error);
							}
						});
					});
					
					// 자동입력 버튼 -----------------------------------------------------------------------
					const fn_preInputBoard = () => {
						$("#floatingTitle").val("3진료실 여름 휴가 안내문");
						CKEDITOR.instances.boardContent.setData("여름 휴가 안내문입니다. 원내 부착하고 안내 바랍니다.")
					}
					
					// 모달 닫으면 데이터 지우기
					$(".modal").on('hide.bs.modal', function (event) {
					  console.log("모달 닫았다.");
					  $("input[name='boardTitle']").val("");
					  CKEDITOR.instances.boardContent.setData("");
					});
					
//------------------------------------------------------------------------------------ 	
				</script>