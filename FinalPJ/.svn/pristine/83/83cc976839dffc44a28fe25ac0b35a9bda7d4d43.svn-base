<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<style>
.grid-stack{
		height: 100hv;
	}
/* 	.grid-stack-item{ */
/* 		border-radius: 1rem;  */
/* 	} */
	.card{
		margin: 0;
		--vz-card-inner-border-radius : 1rem;
		background-color : white;
	}
	.card-header{
		border-radius: 30px;
		background-color : #405189;
		color : white;
	}
	.rtBtn{
		float: right;
	}
	.nav-tabs .nav-link.active{
		background-color: #405189;
		color: white;
	}
	#mtStartTable, #mtAssessTable, #mtActingTable{
		text-align: center;
	}
	#mtStartDiv{
		display: flex;
    	justify-content: space-around;
	}
	#mtStartDiv > div{
		width: 45%;
	}
	.mtPatientInfoTable th{
		width: 60px;
		text-align: center;	
		vertical-align: middle;
/* 		line-height: 50px;	 */
	}
	.mtStartTable{
		height: 320px;
		vertical-align: middle;
		/* font-size: smaller; */
	}
	.mtStartBtn{
		height: 50px;
	}
	#mtDiagnosis{
		height: 80px;
    	/* padding: 20px; */
	}
	
	#bodyImgTd{
		height: 500px;
	}
	
	#anatomyImg{
	    height: 450px;
    	width: 300px;
    	text-align: center;
    	position: absolute; 
		margin: 0 30px;
	}
	#bodyCheck{
		/* width: 100%;
		height: 100%; */
		position : relative;
		object-fit: none;
/* 		z-index: 1; */
	}
	.mtTableForm{
		text-align: center;
		font-size: smaller;
		vertical-align: middle;
	}
	.mtTableForm > thead{
		background-color: #405189c7;
		color: white;
	  }
	#waitingTr{
		vertical-align: middle;
		text-align: center;
	}
</style>

<div class="grid-stack"> 
	
	<!-- 도수치료 대기환자목록 -->
	<div class="grid-stack-item" gs-x="0" gs-y="0" gs-w="3" gs-h="3">
		<div class="grid-stack-item-content">
			<div class="item-header">
			<h5>도수치료 대기환자 조회</h5>
			<hr>
		</div>
		<div class="item-body">
			<div id="ptWaitingListDiv" style="height: 300px;">
				<table class="table table-bordered mtTableForm">
					<thead class='table-striped'>
						<tr id="waitingTr">
							<th style="width: 12%">환자코드</th>
							<th style="width: 23%">환자명</th>
							<th style="width: 12%">상태</th>
							<th style="width: 15%">처방시간</th>
							<th style="width: 15%">호출하기</th>
						</tr>
					</thead>
					<tbody id="mtWaitingListBody">
							<!-- 대기환자 목록 들어오는 위치 -->
					</tbody>
				</table>
			</div>
		</div>
		</div>
	</div>
	
	<div class="grid-stack-item" gs-x="0" gs-y="5" gs-w="3" gs-h="2">
		<div class="grid-stack-item-content">
			<div class="item-header">
				<h5>환자 진료 차트</h5>
				<hr>
			</div> 
			<div class="item-body">
				<div id="patientChartDiv" style="height: 230px;">
					<table  class="table table-bordered" >
						<tr>
							<th style="width: 20%;">환자코드</th>
							<td id="chChartKey"><!-- 차트코드 들어올 자리 --></td>
							<th style="width: 20%;">담당의</th>
							<td id="chEmpName"><!-- 담당의 들어올 자리 --></td>
						</tr>
						<tr>
							<th>환자명</th>
							<td id="chPatientName"><!-- 환자명 들어올 자리 --></td>
							<th>주민번호</th>
							<td id="chPatientRegno"><!-- 환자주민번호 들어올 자리 --></td>
						</tr>
						<tr>
							<th  colspan=4">Dx.</th>
						</tr>
						<tr>
							<td colspan=4" id="chDx">
							<!-- 환자 진단명들 들어올 자리 -->
							</td>
						</tr>
						<tr>
							<th  colspan=4">Comment</th>
						</tr>
						<tr>
							<td colspan=4" id="chComment">
							<!-- 차트 기록 들어올 자리 -->
							</td>
						</tr>
					</table>				
				</div>
			</div>	
			
		</div>		
	</div>

	<div class="grid-stack-item" gs-x="3" gs-y="0" gs-w="6" gs-h="5" gs-no-resize="true" gs-no-move="true">
		<div class="grid-stack-item-content">
		
			<div class="item-header">
				<h5>도수치료 진행</h5>
				<hr>
			</div>
			
			<div class="item-body">
				<div id="mtStartDiv">
					<div id="mtInfoDiv">
						<table class="table table-bordered mtPatientInfoTable">
							<thead>
								<tr>
									<th>환자명</th>
									<td id="mtStartPatientName" style="vertical-align: middle;"></td>
								</tr>
								<tr>
									<th>진단명</th>
									<td id="mtDiagnosis" style="vertical-align: middle;"></td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td colspan="2" id="bodyImgTd">
										<img id="anatomyImg" src="${pageContext.request.contextPath}/resources/images/mt_muscle_anatomy.jpg">
										<canvas id="bodyCheck"></canvas>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					
					<div id="navDiv">
						<!-- <div style="display: flex; justify-content: space-between;">
							<p>기록번호 : <span id="mtRecodeCode"></span></p>
							<p>기록일자 : <span id="mtRecodeDate"></span></p>
						</div> -->
						<table style="margin: 10px; width: 100%;" >
							<tr>
								<td>기록번호 :</td>
								<td id="mtRecodeCode" style="width: 30%;"></td>
								<td>기록일자 :</td>
								<td id="mtRecodeDate" style="width: 35%;"></td>
							</tr>
						</table>
						<!-- Nav tabs -->
						<ul class="nav nav-tabs mb-3" role="tablist">
							<li class="nav-item">
								<a class="nav-link active" data-bs-toggle="tab" href="#planTb" role="tab" aria-selected="false">
									치료계획</a></li>
							<li class="nav-item">
								<a class="nav-link" data-bs-toggle="tab" href="#assessTb" role="tab" aria-selected="false">
									치료평가</a></li>
							<li class="nav-item">
								<a class="nav-link" data-bs-toggle="tab" href="#actingTb" role="tab" aria-selected="false">
									액팅</a></li>
						</ul>
						<!-- Tab panes -->
						<div class="tab-content  text-muted">
							<div class="tab-pane active" id="planTb" role="tabpanel">
								<form id="mtSOAPform" method="post">
									<table class="table table-bordered mtStartTable" id="mtStartTable">
										<tr>
											<th style="width: 25%;">Subject<br/>[주관적정보]</th>
											<td><input type="text" class="form-control" name="mtPlanS" id="subjectInput" placeholder="Subject 내용 입력"></td>
										</tr>
										<tr>
											<th>Object<br/>[객관적평가]</th>
											<td><input type="text" class="form-control" name="mtPlanO" id="objectInput" placeholder="Object 내용 입력"></td>
										</tr>
										<tr>
											<th>Assessment<br/>[측정및평가]</th>
											<td><input type="text" class="form-control" name="mtPlanA" id="assassInput" placeholder="Assessment 내용 입력"></td>
										</tr>
										<tr>
											<th>Plan<br/>[치료계획]</th>
											<td><input type="text" class="form-control" name="mtPlanP" id="planInput" placeholder="Plan 내용 입력"></td>
										</tr>
										<tr>
											<td class="mtStartBtn" colspan="2">
												<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> <!-- CSRF 토큰 추가 -->
												<input type="hidden" name="orderKey" value=""/>
												<input type="hidden" name="patientKey" value=""/>
												<input type="submit"  class="btn btn-outline-primary mtStartBtns" value="저장">
												<input id="preInputCommentBtn" type="button" class="btn btn-outline-primary callBtn btn-sm" onclick="fn_preInputSOAP();" value="자동입력" style="float: right;">
											</td>
										</tr>
									</table>
								</form>
							</div>
							
							<div class="tab-pane" id="assessTb" role="tabpanel"><!-- 평가 -->
								<form id="mtAssessform" method="post">
									<table class="table table-bordered mtStartTable" id="mtAssessTable">
										<tr>
											<th style="width: 25%;">
												관절가동범위<br/>[ROM]
											</th>	
											<td>
												<input type="range" class="form-range" name="mtRom" min="0" max="180" step="10" value="0" id="romRange">
  											</td>
											<td style="width: 15%;">
												<span class="assessVal" id="romValPtag">0</span>
											</td>
										</tr>
										<tr>
											<th>
											근력<br/>[MMT]
											</th>
											<td>
												<input type="range" class="form-range" name="mtMmt" min="0" max="100" step="10" value="0"  id="mmtRange">
  											</td>
											<td>
												<span class="assessVal" id="mmtValPtag">0</span>
											</td>
										</tr>
										<tr>
											<th>
											균형<br/>[BBS]
											</th>
											<td>
												<input type="range" class="form-range" name="mtBbs" min="0" max="56" value="0"  id="bbsRange">
 											</td>
											<td>
												<span class="assessVal" id="bbsValPtag">0</span>
											</td>
										</tr>
										<tr>
											<th>
												통증
											</th>
											<td>
												<input type="range" class="form-range" name="mtPain" min="0" max="100" step="10" value="0"  id="painRange">
  											</td>
											<td>
												<span class="assessVal" id="painValPtag">0</span>
											</td>
										</tr>
										<tr>
											<td class="mtStartBtn" colspan="3">
												<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> <!-- CSRF 토큰 추가 -->
												<input type="hidden" name="orderKey" value=""/>
												<input type="hidden" name="patientKey" value=""/>
												<input type="submit"  class="btn btn-outline-primary mtStartBtns" value="저장">
											</td>
										</tr>
									</table>
								</form>
							</div>
							
							<div class="tab-pane" id="actingTb" role="tabpanel">
								<form id="mtActingForm" method="post">
									<table class="table table-bordered mtStartTable" id="mtActingTable">
										<tr>
											<td colspan=4">
												<span style="font-weight:bold; font-size: 15px;">치료 코멘트 입력</span>
												<div class="form-floating">
													 <textarea class="form-control" name="mtRecordContent" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 150px"></textarea>
													 <label for="floatingTextarea2">Comments</label>
												</div>
											</td>
										</tr>
										<tr>

											<td class="mtStartBtn" colspan="4">
												<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> <!-- CSRF 토큰 추가 -->
												<input type="hidden" name="orderKey" value=""/>
												<input type="hidden" name="patientKey" value=""/>
												<input type="hidden" name="receiptKey" value=""/>
												<input id="actingBtn" type="submit" class="btn btn-outline-primary callBtn mtStartBtns" value="액팅하기">
												<input id="preInputCommentBtn" type="button" class="btn btn-outline-primary callBtn btn-sm" onclick="fn_preInputComment();" value="자동입력" style="float: right;">
											</td>
										</tr>
									</table>
								</form>
							</div>
							
						</div> <!-- tabs content 끝-->
					</div>
				</div>
			</div>	
		</div>
	</div>
	
	<div class="grid-stack-item" gs-x="9" gs-y="0" gs-w="3" gs-h="3">
		<div class="grid-stack-item-content">
			<div class="item-header">
				<H5>치료 히스토리</H5>
				<hr>
			</div>
			<div class="item-body">
				<div class="accordion" id="accordionPanelsStayOpenExample">
					<h5 id="chartHTag" style="text-align: center;">선택한 환자가 없습니다.</h5>
					<!-- 히스토리 리스트 들어오는 위치 -->
				</div>
			</div>
		</div>
	</div>
	
	<div class="grid-stack-item card" gs-x="9" gs-y="5" gs-w="3" gs-h="2" gs-no-resize="true" gs-no-move="true">
		<div class="grid-stack-item-content">
		
			<div class="item-header">
				<h5>환자 기능 그래프</h5>
				<hr>
			</div>
			<div class="item-body" id="canvasDiv">
					<h5 id="chartHTag" style="text-align: center;">선택한 환자가 없습니다.</h5>
					<canvas id="mtChart"></canvas>
			</div>
		</div>
	</div>
	
</div>



<script>


//GridStack ------------------------------------------------------------------------------------
var grid = GridStack.init({});
$("tbody:not(.disable)").on("click", ".datatr", function(event){
	$(this).siblings(".datatr").removeClass("active");
	$(this).toggleClass("active");
});
//---------------------------------------------------------------------------------------------- 

// 스크롤 만들기 -----------------------------------------------------------------------------------
let ptWaitingListDiv = document.querySelector('#ptWaitingListDiv');
new SimpleBar(ptWaitingListDiv, { autoHide: true });

let patientChartDiv = document.querySelector('#patientChartDiv');
new SimpleBar(patientChartDiv, { autoHide: true });
// ---------------------------------------------------------------------------------------------

// 슬라이더 값 가져오기 -------------------------------------------------------------------------------

$(function(){
	$("#romRange").on("change", function(){
		const romRangeVal = $("#romRange").val(); 
		$("#romValPtag").html(romRangeVal);
	})
	$("#mmtRange").on("change", function(){
		const mmtRangeVal = $("#mmtRange").val(); 
		$("#mmtValPtag").html(mmtRangeVal);
	})
	$("#bbsRange").on("change", function(){
		const bbsRangeVal = $("#bbsRange").val(); 
		$("#bbsValPtag").html(bbsRangeVal);
	})
	$("#painRange").on("change", function(){
		const painRangeVal = $("#painRange").val(); 
		$("#painValPtag").html(painRangeVal);
	})
	
	
})

// ---------------------------------------------------------------------------------------------


// 도수치료 환자대기목록 -------------------------------------------------------------------------------

const mtWaitingListBody = $("#mtWaitingListBody");

const mtWaitingList = () => {
  $.getJSON("${pageContext.request.contextPath}/mtWaitingPatientList.do").done(function(resp) {
    let waitingList = resp;

    console.log("대기환자 목록 : ",waitingList);

    let waitingTrTags = [];

    if (waitingList.length > 0) {
      $.each(waitingList, function(idx, waiting) {
    	  
    	let waitingStatusTd;
    	let ptIngSubmitBtn;
    	if (waiting.waitingList[0].waitingStatusName == "치료중") {
		      waitingStatusTd = $("<td style='color:#BD5108'>").html(waiting.waitingList[0].waitingStatusName);
		      ptIngSubmitBtn = $("<input style='background-color: #405189c7; color : white; border: white;' class='mtStartCallSubmit btn btn-primary btn-sm' type='submit' value='치료중'>")
		    } else {
		      waitingStatusTd = $("<td>").html(waiting.waitingList[0].waitingStatusName);
		      ptIngSubmitBtn = $("<input class='mtStartCallSubmit btn btn-outline-primary callBtn btn-sm' type='submit' value='호출'>");
		    }
    	 
        let trs = $("<tr class='patientTr'>").append(
          $("<td>").html(waiting.patientKey),
          $("<td id='mtWaitName'>").html(waiting.patient.patientName + " [" + waiting.patient.patientSex + "/" + waiting.patient.patientAge + "]")
          		.attr({"data-bs-toggle": "modal", "data-bs-target": "#patientViewModal", "onclick": "fn_medicalChart('" + waiting.mchartList[0].orderKey + "'); fn_chartMt('"+ waiting.patientKey +"'); fn_mtRecHistoryList('" + waiting.patientKey + "');"})
          		.css("cursor", "pointer")
			    .hover(
			        function() {
			            $(this).css("text-decoration", "underline");
			        },
			        function() {
			            $(this).css("text-decoration", "none");
			        }
			    ),
          waitingStatusTd,
          $("<td>").html(waiting.waitingList[0].waitingChangeTime),
          $("<td>").append(
            $("<form class='mtStartCallForm' action='${pageContext.request.contextPath}/mtRecordInsert.do' method='post'>").append(
              $("<input type='hidden' name='${_csrf.parameterName}' value='${_csrf.token}' />"),
              $("<input type='hidden' name='orderKey' value='" + waiting.mchartList[0].orderKey + "'>"),
              $("<input type='hidden' value='" + waiting.receiptKey + "' name='receiptKey'>"),
              $("<input type='hidden' value='" + waiting.patientKey + "' name='patientKey'>"),
              ptIngSubmitBtn
            )
          ),
        ).addClass("datatr").data("patientInfo", waiting);
        waitingTrTags.push(trs);
        
      });
    } else {
      waitingTrTags.push(
        $("<tr>").html($("<td colspan='5' style='text-align:center'>").html("현재 대기환자가 없습니다."))
      );
    }

    mtWaitingListBody.empty();
    mtWaitingListBody.append(waitingTrTags);
  });
  

}
mtWaitingList();

// ------------------------------------------------------------------------------------------------------------------------------------
let isEventExecuted = false;

mtWaitingListBody.on("submit", ".mtStartCallForm", function(event) {
  event.preventDefault();
  console.log("호출버튼 눌렀다");

// 치료중이라면 실행하지 않도록
if (isEventExecuted) {
	Swal.fire({
					icon: 'error',
					title: '이미 치료가 진행중입니다.',
					})
    return; // 이미 실행된 상태라면 더 이상 처리하지 않음
  }
  isEventExecuted = true;
  
  let orderKey = $(this).find(".mtStartCallSubmit").closest("form").find("[name='orderKey']").val();
//   let mtwriter = $(this).find(".mtStartCallSubmit").closest("form").find("[name='mtWriter']").val();
  let receiptKey = $(this).find(".mtStartCallSubmit").closest("form").find("[name='receiptKey']").val();
  let patientKey = $(this).find(".mtStartCallSubmit").closest("form").find("[name='patientKey']").val();
  console.log("orderKey 왔니 : ", orderKey);

  // patientKey 넣어줌.
  $("#mtSOAPform").find("[name=patientKey]").val(patientKey);
  $("#mtAssessform").find("[name=patientKey]").val(patientKey);
  $("#mtActingForm").find("[name=patientKey]").val(patientKey);

  console.log("mtWriter", '${authEmp.empKey}');

  let data = {
    orderKey: orderKey,
    mtWriter: "${authEmp.empKey}",
    receiptKey : receiptKey
  }

  $.ajax({
  	method : "POST",
  	url : "${pageContext.request.contextPath}/mtRecordInsert.do?receiptKey=" + receiptKey,
  	data : JSON.stringify(data),
  	contentType : 'application/json; charset=utf-8',
  	dataType : "text",
  	beforeSend: function (xhr) {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
  		xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
  	}, 
  	success : function(resp) {
  		console.log(resp);
  		mtWaitingListBody.empty();
  		mtWaitingList();
  		fn_callMtStart(orderKey);
  		$("#actingBtn").data("receiptkey",receiptKey);
		$("#accordionPanelsStayOpenExample").empty();
		fn_mtRecHistoryList(patientKey);
		// -------------------------- test
		fn_chartMt(patientKey);
		fn_medicalChart(orderKey);
  	},
  	error: function (request, status, error) {
  		console.log("code: " + request.status);
  		console.log("message: " + request.responseText);
  		console.log("error: " + error);
  		}
  });

  return false;
});


// ----------------------------------------------------------------------------------------------

//치료 진행에 환자 정보 불러오기 ----------------------------------------------------------------
const fn_callMtStart = (orderKey) =>{
	console.log("들어온 orderKey : ",orderKey);
	// 환자명, 진단명 가져오기
	$.getJSON("${pageContext.request.contextPath}/mtStartPatientInfoDetail.do?orderKey="+orderKey).done(function(resp){
		let detailInfo = resp
		console.log("detailInfo: ", detailInfo);

		$("#mtStartPatientName").html(detailInfo.patientName);
		$("#mtDiagnosis").html(detailInfo.mchartList[0].dianosis.diease.diseaseNmEn);
		$("#mtRecodeCode").html(detailInfo.mtRecordCode);
		$("#mtRecodeDate").html(detailInfo.mtRecordDate);
		
		let bodyPartKey = detailInfo.mchartList[0].orderHistoryList[0].bodyPartKey;
		console.log("bodyPartKey: ", bodyPartKey);
		$("#canvasDiv").empty();
		$("#canvasDiv").append(
			$("<canvas id='mtChart'>")
		)
		let orderKey = detailInfo.mchartList[0].orderKey;
		console.log("다시 들어간 orderKey : ",orderKey);
		
		// patientKey 가져와야해	
		let patientKey = detailInfo.patientKey;	
		fn_chartMt(patientKey);
		fn_bodyImageDraw(bodyPartKey);

		$("#mtSOAPform").find("[name=orderKey]").val(orderKey);
		$("#mtAssessform").find("[name=orderKey]").val(orderKey);
		$("#mtActingForm").find("[name=orderKey]").val(orderKey);

	});	
	
	
}

const fn_bodyImageDraw = (bodyPartKey) =>{

if(!$("#bodyCheck").length){
	$("#bodyImgTd").append(
		$("<canvas id='bodyCheck'>")
	)
}
const canvas = document.getElementById('bodyCheck');
const bodyImgTd = document.getElementById('bodyImgTd');

function resizeCanvas() {
  // 부모 요소의 크기를 가져옴
  const containerWidth = bodyImgTd.clientWidth;
  const containerHeight = bodyImgTd.clientHeight;

  // canvas의 크기를 부모 요소의 크기로 설정
  canvas.width = containerWidth;
  canvas.height = containerHeight;

  // canvas 다시 그리기
  var ctx = canvas.getContext('2d');
  ctx.clearRect(0, 0, canvas.width, canvas.height);
  ctx.beginPath();
  // 여기서부터 원을 그리는 코드 작성

  switch (bodyPartKey) {
		  case "B001":	// 어깨
			  ctx.arc(230, 90, 30, 0, 2*Math.PI);
			  break;
		  case "B002":	// 팔
			  ctx.arc(250, 150, 30, 0, 2*Math.PI);
			  break;
		  case "B003":	// 손목
			  ctx.arc(270, 190, 20, 0, 2*Math.PI);
			  break;
		  case "B004":	// 엄지
			  ctx.arc(300, 210, 20, 0, 2*Math.PI);
			  break;
		  case "B005":	// 손가락
			  ctx.arc(285, 220, 25, 0, 2*Math.PI);
			  break;
		  case "B006":	// 고관절
			  ctx.arc(220, 220, 35, 0, 2*Math.PI);
			  break;
		  case "B007":	// 무릎
			  ctx.arc(210, 330, 30, 0, 2*Math.PI);
			  break;
		  case "B008":	// 발목
			  ctx.arc(210, 400, 30, 0, 2*Math.PI);
			  break;
		  case "B009":	// cervical
			  ctx.arc(185, 75, 25, 0, 2*Math.PI);
			  break;
		  case "B010":	// thoracic
			  ctx.arc(185, 110, 30, 0, 2*Math.PI);
			  break;
		  case "B011":	// lumber
			  ctx.arc(185, 160, 30, 0, 2*Math.PI);
			  break;
		  case "B012":	// sacrum
			  ctx.arc(185, 200, 20, 0, 2*Math.PI);
			  break;
		  case "B013":
			  ctx.arc(185, 210, 20, 0, 2*Math.PI);
			  break;
		  default:
			  break;
	  }
	  	ctx.strokeStyle = '#FFD700';
		ctx.fillStyle = 'rgba(249, 242, 133, 0.63)';
		ctx.stroke();
		ctx.fill();
	}
	resizeCanvas();
	window.addEventListener('resize', resizeCanvas);
}
// fn_bodyImageDraw("B001");



// 도수치료기록지  평가 업데이트 ------------------------------------------------------------------
const mtAssessform = $("#mtAssessform")

mtAssessform.on("submit", function(event){
	event.preventDefault();
	
	let orderKey = mtAssessform.find("[name=orderKey]").val();
	console.log("ASSESSorderKey", orderKey);
	let mtName = $("#mtStartPatientName").text();
	if(mtName.length == 0 || mtName == null){
		Swal.fire({
					icon: 'error',
					title: '치료중인 환자가 없습니다.',
					})
				return;
			}
	
	let romRange = $("[name=mtRom]").val();
	let mmtRange = $("[name=mtMmt]").val();
	let bbsRange = $("[name=mtBbs]").val();
	let PainRange = $("[name=mtPain]").val();

	if(!romRange || !mmtRange || !bbsRange || !PainRange){
		Swal.fire({
					icon: 'error',
					title: '점수를 모두 체크해주세요.',
					})
		return;
	}
	
	let assassData = {
		mtRom : mmtRange,
		mtMmt : romRange,
		mtBbs : bbsRange,
		mtPain : PainRange,
		orderKey : orderKey
	}
	let patientKey = mtAssessform.find("[name=patientKey]").val();

	$.ajax({
		method : "POST",
		url : "${pageContext.request.contextPath}/mtAssessmentUpdate.do",
		data : JSON.stringify(assassData),
		contentType : 'application/json; charset=utf-8',
		dataType : "text",
		beforeSend: function (xhr) {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		}, 
		success : function(resp) {
			console.log(resp);
			// patientKey 가져와야 한다.
			fn_chartMt(patientKey);

			// 치료 히스토리 다시 가져오기
			$("#accordionPanelsStayOpenExample").empty();
			fn_mtRecHistoryList(patientKey);
		},
		error: function (request, status, error) {
			console.log("code: " + request.status);
			console.log("message: " + request.responseText);
			console.log("error: " + error);
		}
	});
	return false;
});

// ----------------------------------------------------------------------------------------------


// 도수치료기록지 SOAP 업데이트 ------------------------------------------------------------------
const mtSOAPform = $("#mtSOAPform")

mtSOAPform.on("submit", function(event){
	event.preventDefault();

	let mtName = $("#mtStartPatientName").text();
	if(mtName.length == 0 || mtName == null){
		Swal.fire({
					icon: 'error',
					title: '치료중인 환자가 없습니다.',
					})
				return;
			}

	let mtPlanS = $("[name=mtPlanS]").val();
	let mtPlanO = $("[name=mtPlanO]").val();
	let mtPlanA = $("[name=mtPlanA]").val();
	let mtPlanP = $("[name=mtPlanP]").val();

	let orderKey = mtSOAPform.find("[name=orderKey]").val();
	let patientKey = mtSOAPform.find("[name=patientKey]").val();
	// console.log("SOAPorderKey", orderKey);

	if(!mtPlanS || !mtPlanO || !mtPlanA || !mtPlanP){
		Swal.fire({
					icon: 'error',
					title: '내용을 모두 입력해주세요.',
					})
		return;
	}		

	let planData = {
		mtPlanS : mtPlanS,
		mtPlanO : mtPlanO,
		mtPlanA : mtPlanA,
		mtPlanP : mtPlanP,
		orderKey : orderKey
	}

	console.log("planData : ", planData);
	// console.log("patientKey 왓나요? : ", patientKey);  // 아니요.
	$.ajax({
		method : "POST",
		url : "${pageContext.request.contextPath}/mtPlanUpdate.do",
		data : JSON.stringify(planData),
		contentType : 'application/json; charset=utf-8',
		dataType : "text",
		beforeSend: function (xhr) {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		}, 
		success : function(resp) {
			console.log(resp);

			$("#accordionPanelsStayOpenExample").empty();
			fn_mtRecHistoryList(patientKey);
		},
		error: function (request, status, error) {
			console.log("code: " + request.status);
			console.log("message: " + request.responseText);
			console.log("error: " + error);
		}
	});
	return false;
});

// ----------------------------------------------------------------------------------------------


// 도수치료기록지  액팅 코멘트 업데이트 ------------------------------------------------------------------
const mtActingForm = $("#mtActingForm")

mtActingForm.on("submit", function(event){
	event.preventDefault();

	let mtName = $("#mtStartPatientName").text();
	if(mtName.length == 0 || mtName == null){
		Swal.fire({
					icon: 'error',
					title: '치료중인 환자가 없습니다.',
					})
				return;
			}

	let mtRecordContent = $("[name=mtRecordContent]").val();

	if(!mtRecordContent){
		Swal.fire({
					icon: 'error',
					title: '코멘트를 입력하세요.',
					})
		return;
	}		

	let orderKey = mtActingForm.find("[name=orderKey]").val();
	let receiptKey =  $("#actingBtn").data("receiptkey");

	let commentData = {
		mtRecordContent : mtRecordContent,
		orderKey : orderKey
	}

	let patientKey = mtActingForm.find("[name=patientKey]").val();
	// console.log("patientKey 오셨나요? : ", patientKey);
	$.ajax({
		method : "POST",
		url : "${pageContext.request.contextPath}/mtCommentUpdate.do?receiptKey="+receiptKey,
		data : JSON.stringify(commentData),
		contentType : 'application/json; charset=utf-8',
		dataType : "text",
		beforeSend: function (xhr) {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		}, 
		success : function(resp) {
			console.log(resp);

			Swal.fire({
					icon: 'success',
					title: '액팅완료!',
					text: '도수치료를 완료했습니다.',
					})

			// 평가 내용 비우기		
			$("[name=mtPlanS]").val("");
			$("[name=mtPlanO]").val("");
			$("[name=mtPlanA]").val("");
			$("[name=mtPlanP]").val("");
			$("[name=mtRom]").val("0");
			$("[name=mtMmt]").val("0");
			$("[name=mtBbs]").val("0");
			$("[name=mtPain]").val("0");
			$("[name=mtRecordContent]").val("");
			$("#romValPtag").text("0");
			$("#mmtValPtag").text("0");
			$("#bbsValPtag").text("0");
			$("#painValPtag").text("0");

			// 대기환자 조회 다시 불러오기
			mtWaitingListBody.empty();
			mtWaitingList();
			
			// 치료진행 환자 비우기
			$("#mtStartPatientName").text("");
			$("#mtDiagnosis").text("");
			$("#mtRecodeCode").text("");
			$("#mtRecodeDate").text("");
			
			// 그래프 비우기
			$("#canvasDiv").empty();
			$("#canvasDiv").append(
				$("<h5 id='chartHTag'  style='text-align:center;'>").text("선택한 환자가 없습니다.")
			);

			// 치료 히스토리 비우기
			$("#accordionPanelsStayOpenExample").empty();
			$("#accordionPanelsStayOpenExample").append(
				$("<h5 style='text-align:center;'>").text("선택한 환자가 없습니다.")
			);
			
			// 치료 부위 지우기
			$("#bodyCheck").remove();

			// 진료차트 비우기
			$("#chChartKey").text("");
			$("#chEmpName").text("");
			$("#chPatientName").text("");
			$("#chPatientRegno").text("");
			$("#chDx").text("");
			$("#chComment").text("");
		},
		error: function (request, status, error) {
			Swal.fire({
					icon: 'error',
					title: '액팅실패!',
					text: '다시시도해주세요.',
			})
			console.log("code: " + request.status);
			console.log("message: " + request.responseText);
			console.log("error: " + error);
		}
	});
	return false;
});
// ----------------------------------------------------------------------------------------------


// 환자 도수치료 히스토리 리스트 --------------------------------------------------------------------------

const fn_mtRecHistoryList = (patientKey) =>{
	$("#accordionPanelsStayOpenExample").empty();
	$.getJSON("${pageContext.request.contextPath}/mtRecHistoryList.do?patientKey=" + patientKey).done(function(resp){
		let historyResp = resp;
		console.log("히스토리response: ", historyResp);
		console.log("patientKey response: ", patientKey);

		if(historyResp.length > 0){
			$.each(historyResp, function(idx, history){
				var accordionId = "accordion" + idx;
				
				console.log("histoy.rownum : ", history.rownum);	

				$("#accordionPanelsStayOpenExample").append(
					$("<div class='accordion-item'>").append(
						$("<h2 class='accordion-header' id='" + accordionId + "-heading'>").append(
						$("<button class='accordion-button collapsed' type='button' data-bs-toggle='collapse' data-bs-target='#" + accordionId + "-collapse' aria-expanded='false' aria-controls='" + accordionId + "-collapse'>").html("No." + history.rownum +" "+ history.mtRecordDate)
						)
					),
					$("<div id='" + accordionId + "-collapse' class='accordion-collapse collapse' aria-labelledby='" + accordionId + "-heading' data-bs-parent='#accordionPanelsStayOpenExample'>").append(
						$("<div class='accordion-body'>").append(
							$("<div id='soapDiv'>").append(
								$("<table class='table table-bordered' style='text-align:center;'>").append(
									$("<tr>").append(
										$("<th colspan='2'>").html("PLAN<br/>[치료계획]")
									)
									,$("<tr>").append(
										$("<th style='width:20px;'>").text("Subject")
										, $("<td>").html(history.mtPlanS)		
									),
									$("<tr>").append(
										$("<th>").text("Oject")
										, $("<td>").html(history.mtPlanO)		
									),
									$("<tr>").append(
										$("<th>").text("Assassment")
										, $("<td>").html(history.mtPlanA)		
									),
									$("<tr>").append(
										$("<th>").text("Plan")
										, $("<td>").html(history.mtPlanP)		
									)
								)
							),
							$("<div id='assassDiv'>").append(
								$("<table class='table table-bordered' style='text-align:center;'>").append(
									$("<tr>").append(
										$("<th colspan='3'>").html("ASSESSMENT<br/>[평가]")
									)
									,$("<tr>").append(
										$("<th style='width:100px;'>").html("ROM<br/>[관절가동범위]")
										, $("<td style='width:80px;'>").html(history.mtRom)	
										,$("<th>").html("Comment<br/>[치료 코멘트]")	
										
									),
									$("<tr>").append(
										$("<th>").html("MMT<br/>[근력]")
										, $("<td>").html(history.mtMmt)	
										, $("<td rowspan='3'>").html(history.mtRecordContent)			
									),
									$("<tr>").append(
										$("<th>").html("BBS<br/>[균형]")
										, $("<td>").html(history.mtBbs)		
									),
									$("<tr>").append(
										$("<th>").html("Pain<br/>[통증]")
										, $("<td>").html(history.mtPain)		
									)
							),
						)
					)
					)
					).addClass("datatr").data("source", history);
				
				});
		}else{
			$("#accordionPanelsStayOpenExample").append(
				$("<h5 style='text-align:center;'>").text("도수치료 히스토리가 없습니다.")
			)
		}
	});
	
} 

// ----------------------------------------------------------------------------------------------


// 환자 기능 그래프 ----------------------------------------------------------------------------------
let myChart; 
const fn_chartMt = (patientKey) => {

  let romData = [];
  let mmtData = [];
  let bbsData = [];
  let painData = [];
  let dateData = [];

  $.getJSON("${pageContext.request.contextPath}/mtChartDataList.do?patientKey=" + patientKey).done(function(resp) {
    let chartData = resp;
    // console.log("chartData: ", chartData);

    $.each(chartData, function(idx, data) {
      romData.push(data.mtRom);
      mmtData.push(data.mtMmt);
      bbsData.push(data.mtBbs);
      painData.push(data.mtPain);
      dateData.push(data.mtRecordDate);
    });

    createChart();
  });
  
  function createChart() {
    if ($("#mtChart").length) {
      $("#mtChart").remove();
	  $("#chartHTag").remove();
      if (myChart) {
        myChart.destroy();
      }
    }
  
    $("#canvasDiv").append(
      $("<canvas id='mtChart'>")
    );
  
    let ctCtx = document.querySelector('#mtChart');
    // 데이터 정의
    const data = {
      labels: dateData,
      datasets: [
        {
          label: '관절가동범위',
          data: romData,
          borderColor: '#00425A',
          backgroundColor: '#00425A',
          tension: 0.1
        },
        {
          label: '근력',
          data: mmtData,
          borderColor: '#1F8A70',
		  backgroundColor: '#1F8A70',
          tension: 0.1
        },
        {
          label: '유연성',
          data: bbsData,
          borderColor: '#BFDB38',
		  backgroundColor: '#BFDB38',
          tension: 0.1
        },
        {
          label: '통증',
          data: painData,
          borderColor: '#FC7300',
		  backgroundColor: '#FC7300',
          tension: 0.1
        }
      ]
    };
  
    // 그래프 옵션 설정
    const options = {
      responsive: true,
      scales: {
        y: {
          beginAtZero: true,
          max: 180
        }
      }
    };
  
    // 라인 그래프 생성
    myChart = new Chart(ctCtx, {
      type: 'line',
      data: data,
      options: options
    });
  }
};
// ----------------------------------------------------------------------------------------------


// 환자 진료 차트 조회 ----------------------------------------------------------------------
const fn_medicalChart = (orderKey) =>{
	console.log("차트 orderKey", orderKey);
	$.getJSON("${pageContext.request.contextPath}/mtPatientChartDetail.do?orderKey="+orderKey).done(function(resp){
		console.log("차트resp : ",resp);
		let chartResp = resp;
		$("#chChartKey").html(chartResp.patientKey);
		$("#chEmpName").html(chartResp.mchartList[0].empName);
		$("#chPatientName").html(chartResp.patientName);
		$("#chPatientRegno").html(chartResp.patientRegno1);
		$("#chDx").html("- "+chartResp.mchartList[0].dianosis.diease.diseaseNmEn + "<br>&nbsp&nbsp(" + chartResp.mchartList[0].dianosis.diease.diseaseNmKr+")");
		$("#chComment").html("- " + chartResp.mchartList[0].chartCont);
	});
}
// ------------------------------------------------------------------------------------ 

const fn_preInputSOAP = () =>{
	console.log("soap test");
	$("#subjectInput").val("c.c - Lt.Shoulder pain");
	$("#objectInput").val("Lt.Sholder abduction decrease");
	$("#assassInput").val("Lt U/E muscle strength, ADL assist dependent level");
	$("#planInput").val("shoulder joint AROM exercise");
}

const fn_preInputComment = () =>{
	console.log("test");
	$("#floatingTextarea2").val("Lt.Shoulder rotator cuff muscle Strengthening 위주 진행. 환자 motivation 높아 치료 호전적인 모습 보임.");
}

</script>