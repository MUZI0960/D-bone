<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

			<style>
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
					background: #a8d9fb;
					color: #222;
				}

				.tab-content {
					display: none;
					padding: 15px;
				}

				.tab-content.current {
					display: inherit;
				}

				.datatr:hover {
					background-color: #d0d0d0;
				}

				.grid1,
				.grid2 {
					padding: 10px;
					margin: 0px;
					border: 1px solid black;
					background-color: white;
					border-radius: 30px;
				}

				.grid-stack {
					height: 100hv;
				}

				#orderRequest,
				#orderBtn {
					float: right;
				}

				#noticeBoardSubmitBtn {
					margin: 10px;
					float: right;
				}
				.form-control {
					font-size: small;
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
					<!-- 공지사항 게시판 위치 -->

					<div class="grid-stack-item" gs-x="0" gs-y="2" gs-w="6" gs-h="5">
						<div class="grid-stack-item-content">
							<div id="noticeBoardDiv">
								<div style="display: flex;" id="productHeader">
									<h5 id="productH4" style="float: left; margin-right: 2%;">약품 목록</h5> 
								</div>
								<hr>
									<input type="text" id="inputId" style="width: 65%; float: left; height: 32px; flex-direction: row-reverse; " 
										class="form-control input-sm" placeholder="의약품번호 / 의약품명 검색">
									<br><br>
								<table class="table table-bordered">
									<thead>
										<tr>
											<th style="width: 9%">의약품번호</th>
											<th style="width: 48%">의약품명</th>
											<th style="width: 7%">수량</th>
											<th style="width: 7%">단위</th>
											<th style="width: 15%">회사명</th>
											<th style="width: 7%">경로</th>
											<th style="width: 7%">가격</th>
										</tr>
									</thead>
									<tbody id="listBody">
										<!-- 약품 리스트 들어오는 위치 -->
									</tbody>
								</table>
							</div>
						</div>
					</div>




					<div class="grid-stack-item" gs-x="6" gs-y="0" gs-w="6" gs-h="2">
						<div class="grid-stack-item-content" >
							<!--<span style="font-size: 2em; font-weight:bolder; text-align: center;"  >약품 주문하기</span>-->
							<div  style="display:flex;">
								<h5 id="productH4" style="margin-right: 73%;">약품 주문하기</h5>
								<button type="button" class="btn btn-primary btn-sm" id="orderRequest" style="margin-right: 2px;">주문 요청</button>
								<button type="button" class="btn btn-outline-primary btn-sm" id="orderBtn" style="" onclick="emptyBtn()">비우기</button>
							</div>
							<hr>
								<table class="table table-bordered" id="requestTable">
								<thead>
									<tr>
										<th>의약품번호</th>
										<th>의약품명</th>
										<th>제조업체</th>
										<th>수량</th>
									</tr>
								</thead>
								<tbody id="orderBody">
									<!-- 약품목록에서 클릭하면 약품리스트 들어오는 위치 -->
								</tbody>
							</table>
						</div>

					</div>



					<div class="grid-stack-item" gs-x="6" gs-y="3" gs-w="6" gs-h="3">
						<div class="grid-stack-item-content">
							<!--<span style="font-size: 2em; font-weight:bolder; text-align: center;"  >약품 주문하기</span>-->
							<h5 id="productH4">요청 내역</h5>
							<hr>
							<table class="table table-bordered">
								<thead>
									<tr>
										<th>주문번호</th>
										<th>의약품키</th>
										<th>수량</th>
										<th>가격</th>
										<th>요청자</th>
										<th>주문 날짜</th>
									</tr>
								</thead>
								<tbody id="orderListBody">
									<!-- 공지사항 리스트 들어오는 위치 -->
								</tbody>
							</table>
						</div>

					</div>

				</div>

			</body>




			<script>

				// 드래그 앤 드랍 용 ----------------------------------------------------------------------
				var grid = GridStack.init({});
				$("tbody:not(.disable)").on("click", ".datatr", function (event) {
					$(this).siblings(".datatr").removeClass("active");
					$(this).toggleClass("active");
				});
				//------------------------------------------------------------------------------------ 




				// 의약품 리스트 조회용 --------------------------------------------------------------------
				let tmpPList = [];	// 약품 주문을 할 때 동일한 의약품이 주문되지 않도록 빈 배열을 생성해 비교
				const productList = () => {		// 서버로부터 비동기 요청으로 데이터를 받기 위한 함수
					let listBody = $("#listBody").on('click', '.datatr', function () {
						// listBody는 동적으로 생성된 리스트에 on click을 주어 주문하기 목록으로 데이터를 이동시키기 위해 생성
						let data = $(this).data("source");	// 클릭한 대상에 저장되어 있는 데이터를 변수에 담아주기
						if (tmpPList.includes(data)) {	// 데이터가 존재하는지 만들어둔 빈 배열에 새로 클릭한 의약품이 들어있는지 비고하기
							console.log("똑같은tr");	// 동일한 데이터라면 콘솔에 출력해주고 더 클릭할 수 없도록 return시킨다
							return;
						} else {
							tmpPList.push(data);	// 새로 주문하는 약품이라면 임시배열에 담아준다
						}
						fn_order(tmpPList);	// 우측 약품 주문하기 화면에 클릭한 데이터를 옮겨주기 위한 함수
					});
					$.getJSON("${cPath}/product/list").done(function (resp) {	// getJSON을 통해 비동기 요청으로 데이터를 받는다
						let productList = resp	// 컨트롤러로부터 받은 데이터를 변수에 담아준다

						let producttrTags = [];	// tbody에 데이터를 넣어주기 위한 빈 배열을 생성한다
						if (productList.length > 0) {	// 배열에 값이 존재한다면
							productList.sort(function (a, b) {	// 정렬을 시작한다
								if (a.medicineKey <= b.medicineKey) return 1;	// 정렬은 의약품번호를 통해 정렬해준다
								return -1
							});

							$.each(productList, function (idx, product) {
								
								let medicineRemindertr;
								if(product.medicineReminder < 300){
									medicineRemindertr = $("<td>").attr({
										"style": " color: #E06469;"
										, "value" : product.medicineReminder
									}).text(product.medicineReminder);
								}else{
									medicineRemindertr = $("<td>").attr({
										"value" : product.medicineReminder
									}).text(product.medicineReminder);
								}
								
								// 컨트롤러로부터 받은 데이터를 tbody에 동적으로 생성하기 위해 반복문을 돌려 만들어준다
								let trs = $("<tr>").addClass("medicineTrtags").append(	// 약품 검색을 위해 tr태그에 클래스를 추가해준다.
									$("<td>").addClass("dataValue1").html(product.medicineKey)
										// 해당 td태그 안에 있는 값으로 검색할 수 있도록 클래스를 추가해준다
									, $("<td>").addClass("dataValue2").html(product.medicineName)
									, medicineRemindertr
									, $("<td>").html(product.medicineEa)
									, $("<td>").html(product.medicineCompanyName)
									, $("<td>").html(product.medicineRoute)
									, $("<td>").html(product.medicineCost)
								).addClass("datatr").data("source", product);
								// 약품에 대한 데이터를 다른 곳에서도 사용할 수 있도록 data에 키값을 설정하여 담아준다
								producttrTags.push(trs);	// 동적으로 생성된 tr, td태그들을 빈 배열에 저장해준다
							});
						};
						listBody.empty();	// 기존의 데이터가 있다면 초기화해준다
						listBody.append(producttrTags);	// 마지막으로 생성된 태그들을 tbody에 뿌려준다

					});

				}
				productList(); // 화면이 띄워지면 리스트를 생성하는 함수가 바로 실행되도록 호출해준다


				// 약품목록 검색하기--------------------------------------------------
				const inputId = $("#inputId")	// 검색창 input태그를 셀렉한다
				inputId.on("keyup", function () {	// onKeyup을 통해 사용자로부터 입력 받은 키워드를 확인한다
					let inputValue = inputId.val().toUpperCase();	// 입력받은 키워드를 모두 대문자로 바꿔준다
					let medicineTrtags = $(".medicineTrtags");	// 동적으로 생성된 의약품 하나에 해당하는 tr태그의 클래스를 셀렉한다

					$.each(medicineTrtags, function (i, v) {	// tr태그들로 반복문을 돌려 키워드와 일치하는 의약품을 검색한다

						// 아래 두가지 클래스 조건으로 검색할 수 있도록 동적으로 생성된 리스트의 값을 변수에 담아준다
						let dataValue1 = $(this).find(".dataValue1").html();	
						let dataValue2 = $(this).find(".dataValue2").html();
						if (dataValue1.toUpperCase().indexOf(inputValue) > -1) {
							// 변수에 있는 값을 대문자로 바꿔주고 검색한 키워드와 일치한다면
							$(this).show();	// 해당 데이터를 보여주고 return시킨다
							return;
						} else {
							$(this).hide();	// 일치하는 데이터가 없다면 감춰준다
						}

						if (dataValue2.toUpperCase().indexOf(inputValue) > -1) {
							$(this).show();
						} else {
							$(this).hide();
						}
					})
				});
				// --------------------------------------------------------------

				let orderBody = $("#orderBody");
				// 주문 요청 버튼
				const fn_order = (productList) =>  {		// 약품목록에서 의약품번호를 클릭했을 때 약품주문하기 목록에 추가가되는 버튼
					let pl = `<input type='text' name='num'/>`;
					/*
					let deleteButton = $("<button>").text('삭제').on("click", function () {
						orderBody.empty();
					});
					*/
					let tmpPl = productList[productList.length-1];
					let trs = $("<tr>").append(
						$("<td>").html(tmpPl.medicineKey),
						$("<td>").html(tmpPl.medicineName)
						, $("<td>").html(tmpPl.medicineCompanyName)
						, $("<td>").html(pl)
					).addClass("datatr").data("source", tmpPl);

					orderBody.append(trs);
				}

				const emptyBtn = ()  => {
					orderBody.empty();
					tmpPList = [];
				}



				// 주문하기 눌렀을때
				let requestTable = $('#requestTable');
				let orderRequest = $('#orderRequest');
				orderRequest.on('click', function () {	// 약품 주문하기 - 주문 요청 클릭
					let trTags = requestTable.find(".datatr");
					let pmList = [];
					$.each(trTags, function (idx, tr) {
						pmList.push({
							"medicineKey": $(tr).data("source").medicineKey,
							"orderQuantity": $('input[name=num]').eq(idx).val(),
							"orderCharger": `${authEmp.empName}`,
							"orderCost": ($('input[name=num]').eq(idx).val() * $(tr).data("source").medicineCost)
						})
					});
					console.log("너왜안가ㅠ : ",pmList);
					$.ajax({
						type: "post",
						url: "${cPath}/order/orderList",
						contentType: 'application/json; charset=UTF-8',
						data: JSON.stringify(pmList),
						dataType: "text",
						beforeSend: function (xhr) {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
							xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
						},
						success: function (rslt) {
							orderBody.empty();
							orderList();
						}
					})
				});



				// 오더목록 조회
				const orderList = () => {
					$.getJSON("${cPath}/order/list").done(function (resp) {
						let orderList = resp
						let orderListBody = $("#orderListBody")

						let ordertrTags = [];
						if (orderList.length > 0) {
							//정렬			orderList.sort(function (a, b) {
							// 					//console.log(a,b)
							// 					if (a.boardDate <= b.boardDate) return 1;
							// 					return -1
							// 				});

							$.each(orderList, function (idx, order) {
								console.log("오더에있는 값 품명을 찾아야함 : ", order);
								let trs = $("<tr>").append(
									$("<td>").html(order.orderRequestNo),
									$("<td>").html(order.medicineKey),
									$("<td>").html(order.orderQuantity),
									$("<td>").html(order.orderCost.toLocaleString() + '원'),
									$("<td>").html(order.orderCharger),
									$("<td>").html(order.orderDate.substring(0, 10))
								)
								ordertrTags.push(trs);
							});
						};
						orderListBody.empty();
						orderListBody.append(ordertrTags);

					});
				}
				orderList();

			</script>