<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	.ptTableForm{
		text-align: center;
		font-size: smaller;
	}
	#equipmentModalDiv > div{
		/* border: 1px solid black; */
		width: 100%;
	}
	#equipmentModalDiv{
		display: flex;
		justify-content: center;
	}
	#equipmentDetailDiv{
		border-right: 1px solid #d9dce7;
	}
	.modal-content{
		border-radius: 30px;
	}
	
	#ptEqStatusApplyDiv{
		display: flex;
		justify-content: space-around;
		margin: 20px;
	}
	#ptEqApplySelect{
		width: 25%;
		height: 90%;
	}
    .grid-stack-item-content::-webkit-scrollbar {
         width: 5px;
         overflow-y: auto;
     }

     .grid-stack-item-content::-webkit-scrollbar-thumb {
         height: 30%;
         /* 스크롤바의 길이 */
         background: #d0d0d0a9;
         /* 스크롤바의 색상 */
         border-radius: 10px;
     }
     
     .bedImages{
     	width: 150px;
     	height: 60px;
     }
     .nowPtbedsStatusDiv{
     	display: flex;
     	justify-content: space-around;
     }
      .nowPtbedsStatusDiv > div:first-child{ 
      	margin-bottom: 0px; 
      }
      #ptStartModalBodyDiv{
      	display: flex;
      	justify-content: space-around;
      }

	  .table > thead{
		background-color: #405189c7;
		color: white;
	  }
	   #ptEqStatusTable{ 
		 font-size: smaller; 
	   } 
	  #ptEqStatusTBody > tr {
		height: 60px;
		text-align: center;
		vertical-align: middle;
	  }
	  #waitingTh{
		vertical-align: middle;
	  }
	  #ptEquipmentTbody{
		cursor: pointer;
	  }
	  #nowBedStatusList > .nowPtbedsStatusDiv > div{
		cursor: pointer;
	  }
</style>
<div class="grid-stack"> 

	<div class="grid-stack-item" gs-x="0" gs-y="0" gs-w="3" gs-h="3">
		<div class="grid-stack-item-content">
			<div class="item-header">
				<h5>물리치료 대기환자 조회</h5>
				<hr>
			</div> 
		<div class="item-body">
			<div id="ptWaitingListDiv" style="height: 300px;">
				<table class="table table-bordered ptTableForm">
					<!-- <thead class='table table-info table-striped'> -->
					<thead class='table-striped' id="waitingTh">
						<tr>
							<th style="width: 15%">환자코드</th>
							<th style="width: 20%">환자명</th>
							<th style="width: 12%">상태</th>
							<th style="width: 15%">처방시간</th>
							<th style="width: 15%">환자상세</th>
						</tr>
					</thead>
					<tbody id="waitingListBody" style="vertical-align: middle;">
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
							<th style="width: 20%;">환자명</th>
							<td id="chPatientName"><!-- 환자명 들어올 자리 --></td>
							<th style="width: 20%;">주민번호</th>
							<td id="chPatientRegno"><!-- 환자주민번호 들어올 자리 --></td>
						</tr>
						<tr>
							<th colspan=4">Dx.</th>
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
	
	<div class="grid-stack-item" gs-x="3" gs-y="0" gs-w="6" gs-h="3">
		<div class="grid-stack-item-content">
		<div class="item-header">
			<h5>치료실 침상 현황 조회</h5>
			<hr>
		</div>
		
		<div class="item-body">
			<div id="nowBedStatusList" style="text-align: center;">
				<div class="nowPtbedsStatusDiv" id="nowPtbedsStatusTop">
					<!-- 침상 1-4 들어오는 위치-->
					<div id="bedKey1">
					</div>
					<div id="bedKey2">
					</div>
					<div id="bedKey3">
					</div>
					<div id="bedKey4">
					</div>
				</div>
				<div class="nowPtbedsStatusDiv" id="nowPtbedsStatusbottom">
					<!-- 침상 5-8 들어오는 위치-->
					<div id="bedKey5">
					</div>
					<div id="bedKey6">
					</div>
					<div id="bedKey7">
					</div>
					<div id="bedKey8">
					</div>
				</div>
			</div>
		</div>
		
		</div>
	</div>
	
	<div class="grid-stack-item" gs-x="3" gs-y="5" gs-w="6" gs-h="2">
		<div class="grid-stack-item-content">
			<div class="item-header">
				<h5>물리치료 액팅</h5>
				<hr>
			</div>
			<div class="item-body">
				<div id="actingFormDiv" style="height: 230px;">
					<form id="actingForm" method="post" action="${pageContext.request.contextPath}/actingCommentUpdate.do">
						<table class="table table-bordered" style="vertical-align: middle;">
							<tr>
								<th style="width: 10%;">기록번호</th>
								<td id="acRecordKey"></td>

								<th style="width: 10%;">기록일자</th>
								<td id="acRecordDate"></td>

								<th id="acting" style="width: 10%;">환자명</th>
								<td id="acPatientName"><!-- 액팅할 환자명이 들어올 자리 --></td>
								<th style="width: 10%;">나이/성별</th>
								<td id="acPatientAge"><!-- 액팅할 환자 나이,성별이 들어올 자리 --></td>
							</tr>
							<tr>
								<th>진단명</th>
								<td id="acPatientDi" colspan="3"><!-- 액팅할 환자 진단명이 들어올 자리 --></td>
								<th>치료사명</th>
								<td id="acPTName"></td>
								<th>담당의</th>
								<td id="acDrName"><!-- 주치의 이름 들어올 자리 --></td>
							</tr>
							<tr>
								<td colspan=8">
									<div class="form-floating">
										 <textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 100px"></textarea>
										 <label for="floatingTextarea2">Comments</label>
									</div>
								</td>
							</tr>
							<tr>
								<td colspan="8"  style="text-align: center;">
									<input id="actingBtn" type="submit" class="btn btn-primary callBtn" value="액팅하기">
									<input id="preInputCommentBtn" type="button" class="btn btn-outline-primary callBtn btn-sm" onclick="fn_preInputComment();" value="자동입력" style="float: right;">
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<div class="grid-stack-item" gs-x="9" gs-y="0" gs-w="3" gs-h="3">
		<div class="grid-stack-item-content">
			<div class="item-header">
				<h5>치료기구 현재 사용현황</h5>
				<hr>	
			</div>
			<div class="item-body">
				<table class="table table-bordered" style="font-size: xx-small; text-align: center; width: auto; float: right;">
					<tr>
						<td>사용가능</td>
						<td style="background-color: #f0363657;">사용중</td>
						<td style="background-color: #34ccb566;">수리요청</td>
						<td style="background-color: #9190907a;">폐기요청</td>
					</tr>
				</table>
				<table class="table table-bordered ptTableForm" id="ptEqStatusTable">
					<thead>	
						<tr class="table table-striped">
							<th style="width: 20%; color: white;">기구명</th>
							<th colspan="5" style="color: white;">현재상태</th>
						</tr>
					</thead>
					<!-- 기구상태 현황 들어올 위치 -->
					<tbody id="ptEqStatusTBody">

					</tbody>
				</table>
			</div>
		</div>
	</div>
	
	<div class="grid-stack-item" gs-x="9" gs-y="5" gs-w="3" gs-h="2">
		<div class="grid-stack-item-content">
			<div class="item-header">
				<h5>치료기구 상태관리</h5>
				<hr>
			</div>
			<div class="item-body">
				<div id="ptEquipmentDiv" style="height: 230px;">
					<table class="table table-bordered ptTableForm" id="ptEquipmentTable">
					<thead>
						<tr class="table table-striped">
							<th style="color: white;">기구명</th>
							<th style="color: white;">모델명</th>
						</tr>
					</thead>
					<tbody id = "ptEquipmentTbody">
					<!-- 치료기구 상태관리 목록 들어오는 위치  -->
					</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	
	<!----------------------------------------------- 치료기구 상태관리 상세 모달창 ----------------------------------------------------->
		<!-- Grids in modals -->
		<div class="modal fade" id="ptEquipmentStatusModal" tabindex="-1" aria-labelledby="exampleModalgridLabel" aria-modal="true">
		    <div class="modal-dialog modal-xl">
		        <div class="modal-content">
		        		<div class="modal-header" id="noticeCardHeader">
							<h5 class="modal-title">물리치료기구 상세관리</h5>
		        			<button style="float: right;" type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" ></button>
		        		</div>
		        		<div class="modal-body">
		        			<div id="equipmentModalDiv">
			        			<div id="equipmentDetailDiv">
			        				<h4 style="text-align: center;">물리치료기구 상세정보</h4>
									<div id="equipmentDetailTableDiv">
										<!-- 물리치료기구 상세내용 들어오는 위치 -->
									</div>
									<div id="ptEqStatusApplyDiv">
										<select id="ptEqApplySelect" class="form-select" aria-label="Default select example">	
											<option id="defaultEqOpt">기구코드</option>
											<!-- 치료기구 목록 들어올 위치 -->
										</select>
										<div  id="eqDetailRadios">
											<input type="radio" class="btn-check ptEqStatusRadio" name="bedKey-outlined" id="info-outlined" autocomplete="off" value="US01">
											<label class="btn btn-outline-info btn-sm" for="info-outlined">사용가능</label>

											<input type="radio" class="btn-check ptEqStatusRadio" name="bedKey-outlined" id="warning-outlined" autocomplete="off" value="US02">
											<label class="btn btn-outline-warning btn-sm" for="warning-outlined">사용중</label>

											<input type="radio" class="btn-check ptEqStatusRadio" name="bedKey-outlined" id="success-outlined" autocomplete="off" value="US03">
											<label class="btn btn-outline-success btn-sm" for="success-outlined">수리</label>	
	
											<input type="radio" class="btn-check ptEqStatusRadio" name="bedKey-outlined" id="danger-outlined" autocomplete="off" value="US04">
											<label class="btn btn-outline-danger btn-sm" for="danger-outlined">폐기</label>
											
										</div>
										<form id="ptEqApplySubmit">
											<input type="hidden" name="ptEquipmentCode" value="" />
											<input type="hidden" name="ptEquipmentStatus" value="" />
											<input id="ptEqApplySubmitBtn" type="submit" class='btn btn-outline-primary' value="상태변경" />
										</form>
									</div>	

			        			</div>
			        			
								<div class="" id="equipmentStatusContentDiv">
									<h4 style="text-align: center;">물리치료기구 상태점검표</h4>
			        				<table class='table table-bordered' style='width: 90%; margin:auto; text-align: center;'>
			        					<thead class='table-primary'>
											<tr>
												<th colspan="4">상태점검표</th>	
											</tr>
											<tr>
												<th style="width: 18%">점검일</th>
												<th style="width: 10%">상태</th>
												<th>점검내용</th>
												<th style="width: 15%">작성자</th>
											</tr>
										</thead>	
									</table>
									<div id="equipmentStatusDiv"  style="height: 230px;">
										<table class='table table-bordered' style='width: 90%; margin:auto; text-align: center;'>
											<tbody id="equipmentStatusTbody">
												<!-- 점검내용 들어오는 위치 -->
											</tbody>
										</table>
									</div>
									<table class='table table-bordered' style='width: 90%; margin:auto; text-align: center;'>
										<tfoot>
												<tr>
													<td colspan="3">
														<div style="display:inline;">
															<form id="ptEqStatusInsertForm" method="post" action="${pageContext.request.contextPath}/ptEquipmentStatusInsert.do" style="display: flex; justify-content: space-around;">
																<select name="equipmentRecordStatus" class="form-select-sm" aria-label="Default select example" style="width: 22%;">
																	<option selected id="eqOptDefault">기구 상태</option>
																	<option value="EAS1">상</option>
																	<option value="EAS2">중</option>
																	<option value="EAS3">하</option>
																</select>
																<input class="form-control form-control-sm" type="text" name="equipmentRecordContent" style="width: 60%;" placeholder="점검사항을 입력하세요" aria-label=".form-control-sm example">
																<input id="eqStatsuBtn" class="btn btn-outline-primary callBtn" type="submit" value="작성"> 
															</form>
														</div>
													</td>
												</tr>
										</tfoot>
									</table>

			        			</div> <!-- equipmentStatusContentDiv 끝 -->
			        			
		        			</div>
		        		</div>
		        	</div>
		        </div>
		    </div>
		</div>
	<!------------------------------------------------------------------------------------------------------------------------->
	
	<!-- 침상선택 후 치료진행 모달 ----------------------------------------------------------------------------------------------------->
	<div id="ptStartBedModal" class="modal" tabindex="-1">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="ptStartModalTitle">번 침상 치료 진행하기</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	      	<div id="ptStartModalBodyDiv">
	      		<div id="patientDiv">
	      			<p>환자를 선택하세요.</p>
	      			<!-- 환자목록 -->
	      			<div id="ptStartPatientList">
	      				<select id="ptStartPatientSelect" class="form-select" aria-label="Default select example">
	      					<option>-- 치료환자 선택 --</option>
	      				</select>
	      			</div>
	      		</div>
	      		
	      		<div id="eqDiv">
			        <p>치료기구를 선택하세요.</p>
	     			<!-- 오더 내역에 있는 치료 도구 목록이 들어와야한다. -->
			        <div id="ptOrderEquipmentList">
						<select id="ptStartEquipmentSelect" class="form-select" aria-label="Default select example" style="width: 190px;">	
							<option>-- 치료기구 선택 --</option>
						</select>
		   			</div>
	      		</div>
	      	</div>
	      </div>
	      <div class="modal-footer">
	        <!-- <button type="button" class="btn btn-outline-danger" data-bs-dismiss="modal">Close</button> -->
	        <form id="ptStartForm" method="post" action="${pageContext.request.contextPath}/ptRoomStatusUpdate.do">
	      		<input type="hidden" value="" name="receiptKey">
	      		<input type="hidden" value="" name="orderKey">
	        	<input id="ptStartSubmit" type="submit" class="btn btn-primary" value="치료진행하기">
	        </form>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!------------------------------------------------------------------------------------------------------------------------->
	
</div>

<script>

// GridStack -------------------------------------------------------------------------
var grid = GridStack.init({});
$("tbody:not(.disable)").on("click", ".datatr", function(event){
	$(this).siblings(".datatr").removeClass("active");
	$(this).toggleClass("active");
});
//------------------------------------------------------------------------------------ 

// 대기환자 조회 리스트 --------------------------------------------------------------------- 
const waitingListBody = $("#waitingListBody");

const ptWaitingList = () =>{
	$.getJSON("${cPath}/ptWaitingPatientList.do").done(function(resp){
		let waitingList = resp;
		console.log("WaitingList: ", waitingList);
		// localStorage에 resp 저장
		let patientInfo = JSON.stringify(resp)
		localStorage.setItem("patientInfo",patientInfo);
		
		let waitingTrTags = [];
		
		if(waitingList.length > 0){
			$.each(waitingList, function(idx, waiting){
				 let waitingStatusTd;
				    if (waiting.waitingList[0].waitingStatusName == "치료중") {
				      waitingStatusTd = $("<td style='color:#BD5108'>").html(waiting.waitingList[0].waitingStatusName);
				    } else {
				      waitingStatusTd = $("<td>").html(waiting.waitingList[0].waitingStatusName);
				    }
				let trs = $("<tr class='patientTr'>").append(
					$("<td>").html(waiting.patientKey),
					$("<td>").html(waiting.patient.patientName + " [" + waiting.patient.patientSex + "/" + waiting.patient.patientAge + "]")
					.attr("onclick", "fn_medicalChart('" + waiting.mchartList[0].orderKey + "')")
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
						$("<input type='button' class='btn btn-outline-primary callBtn btn-sm' data-waitkey="+ waiting.waitingList[0].waitingKey + " value='조회'>")
						.attr({"data-bs-toggle": "modal", "data-bs-target": "#patientViewModal"})		
					),
				).addClass("datatr").data("patientInfo", waiting);
				waitingTrTags.push(trs);
			});
			
			
			
		}else{
			waitingTrTags.push(
				$("<tr>").html($("<td colspan='5'>").html("현재 대기환자가 없습니다."))		
			)
		}
		waitingListBody.empty();
		waitingListBody.append(waitingTrTags);
	})
}
ptWaitingList();
//------------------------------------------------------------------------------------------- 

//  침상 사용중 일때 ptStartBedModal 막는 함수 --------------------------------------------------------
const fn_offStartBedModal = () =>{
	 // --------------------------------- localStorage에서 침상 상태 데이터 꺼내기
	let bedStatusData = JSON.parse(localStorage.getItem("bedStatusData"));
    console.log("세션bedStatusData",bedStatusData);
    
    $.each(bedStatusData, function(idx, bedStatus){
    	if(bedStatus.ptBedStatus==="BS02"){
    		let ptBedKey = bedStatus.ptBedKey;
    		$("#bedKey"+ptBedKey).off("click");
    	}
    });
}
//-------------------------------------------------------------------------------------------- 

// 물리치료 치료진행 모달  ---------------------------------------------------------------------------
const ptStartBedModal = $("#ptStartBedModal");

let ptBedClick = () => {
	
	let bedStatusData = JSON.parse(localStorage.getItem("bedStatusData"));
    
  $('div[id^="bedKey"]').on("click", function(){
	  
    let thisID = $(this).attr('id');
    let bedKey = thisID.replace(/\D/g, '');
    $("#ptStartModalTitle").html(bedKey+"번 침상 치료 진행");
	
    $("#ptStartSubmit").data("bedkey", bedKey);
    $("[name=ptBedKey]").val(bedKey);
    
    let dataList = JSON.parse(localStorage.getItem("patientInfo"));
   	
    
   	
    // 치료진행 모달 열기
    $("#ptStartBedModal").modal('show');
    
    let ptStartPatientSelect = $("#ptStartPatientSelect");
    
    // 대기중 상태 환자 이름 셀렉트박스 옵션 리스트 생성
    let ptPatientList = [];
    if (dataList.length > 0) {
      $.each(dataList, function(idx, ptStartP){
    	  if(ptStartP.waitingList[0].waitingStatus == "WS01"){
    		  // 수정수정수정
		    	let tags = $("<option class='ptStartPOpt'>").html(ptStartP.patientName).data("orderkey", ptStartP.mchartList[0].orderKey);
		        ptPatientList.push(tags);
    	  }
      });
      ptStartPatientSelect.append(ptPatientList);
    } else {
      let tags = $("<option class='ptStartPOpt'>").text("대기중인 환자가 없습니다.");
      ptPatientList.push(tags);
      ptStartPatientSelect.append(ptPatientList);
    }
  });
	
  // 환자 옵션 셀렉트 변경 때 마다 기구옵션리스트 다시 가져온다.
  let eqSelect = () => {
    $("#ptStartPatientSelect").on("change", function(){
      let orderKey = $(this).find("option:selected").data("orderkey");
      console.log("orderkey test :", orderKey);

      // orderKey 넣어주면 됨
      $.getJSON("${cPath}/ptEquipmentSelectList.do?who="+orderKey).done(function(resp){
        let ptEqList = resp;
        console.log("ptEqList : ", ptEqList);

        let orderKey = ptEqList[0].orderKey;
        let eqKey = ptEqList[0].equipmentKey;

//         $("#ptStartEquipmentSelect").attr("data-patientkey", patientKey);
		$("#ptStartForm [name = orderKey]").val(orderKey);
        $("#ptStartEquipmentSelect").attr("data-orderkey", orderKey);
        $("#ptStartEquipmentSelect").attr("data-eqkey", eqKey);

        // form 안 hidden value에 넣기
        $("[name=receiptKey]").val(ptEqList[0].receiptKey);
        
        let ptStartEquipmentSelect = $("#ptStartEquipmentSelect");

        // 해당 환자마다 기구 셀렉트 옵션리스트 가져오기
        let orderEqList = [];
        if (ptEqList.length > 0) {
          $.each(ptEqList, function(idx, ptEq){
            let tags = $("<option class='ptEqOpt' data-pteqkey=" + ptEq.ptEquipmentKey + ">").html(ptEq.equipmentName+"["+ ptEq.ptEquipmentCode +"]");
            orderEqList.push(tags);
          });
          
          ptStartEquipmentSelect.empty().append(
        	$("<option>").text("-- 치료기구 선택 --")		  
          );
          ptStartEquipmentSelect.append(orderEqList);
        } else {
          let tags = $("<option class='ptEqOpt'>").text("해당 기구가 없습니다.");
          orderEqList.push(tags);
          ptStartEquipmentSelect.empty().append(orderEqList);
        }
      });
    });

    // 셀렉트 박스 닫으면 해당 옵션리스트 지운다. (다시 가져오기 위해서)
    $("#ptStartEquipmentSelect").on("show.bs.dropdown", function () {
      $('.ptEqOpt').remove();
    });
  };

  eqSelect();
  
  // 셀렉트 박스 옵션 변경때마다 선택값 다시 넣어주기
  $("#ptStartPatientSelect").on("change", function() {
	  let selectedPatient = $(this).val();
	  $(this).data("selected-patient", selectedPatient);
	});
  
  $("#ptStartEquipmentSelect").on("change", function() {
	  let selectedEq = $(this).val();
	  $(this).data("selected-eq", selectedEq);
	});
  
}
ptBedClick();


// 모달 닫으면 내용 초기화 -------------------------------------------------------------------
$("#ptStartBedModal").on('hide.bs.modal', function(event) {
	console.log("모달 닫았다.");
	$(".ptStartPOpt").remove();
	$(".ptEqOpt").remove();
});
//------------------------------------------------------------------------------------------- 

// 치료도구 목록 셀렉트 박스 -----------------------------------------------------------------
const fn_ptStartEqOptionList = (patientKey) =>{
	console.log("patientKey : ", patientKey);
	
	$.getJSON("${cPath}/ptEquipmentSelectList.do?who="+patientKey).done(function(resp){
		let ptEqList = resp;
		console.log("ptEqList : ",ptEqList);
		
		let orderKey = ptEqList[0].orderKey;
		let eqKey = ptEqList[0].equipmentKey;

		$("#ptEquipmentSelect").attr("data-patientkey", patientKey);
		$("#ptEquipmentSelect").attr("data-orderkey", orderKey);
		$("#ptEquipmentSelect").attr("data-eqkey", eqKey);

		let ptStartEquipmentSelect = $("#ptStartEquipmentSelect");
		
		let orderEqList = [];
		if(ptEqList.length>0){
			$.each(ptEqList, function(idx, ptEq){
				let tags = $("<option class='ptEqOpt' data-pteqkey=" + ptEq.ptEquipmentKey + ">").html(ptEq.equipmentName+"["+ ptEq.ptEquipmentCode +"]") // -------------- test
				orderEqList.push(tags);
			});
			ptStartEquipmentSelect.append(orderEqList);
		}else{
			let tags = $("<option class='ptEqOpt'>").text("해당 기구가 없습니다.")
				orderEqList.push(tags);	
		}
		ptStartEquipmentSelect.append(orderEqList);
	});
}
//------------------------------------------------------------------------------------ 
 
let ajaxExecuted = false;
// 치료 진행 하기 / 기록지 추가, 상태변경(치료중), 침상 현황 변경 ---------------------------------------
const ptStartForm = $("#ptStartForm");

	ptStartForm.on("submit", function(event){
		event.preventDefault();
		
		let bedKey = $("#ptStartSubmit").data("bedkey");
		
		bedKey = parseInt(bedKey);
		
		console.log("bedKey :", parseInt(bedKey));
		
		let selectPatient = $("#ptStartPatientSelect").data("selected-patient");
		let selectEq = $("#ptStartEquipmentSelect").data("selected-eq");
		let receiptKey = $("[name=receiptKey]").val();
		
		console.log("selectPatient",selectPatient);
		console.log("selectEq",selectEq);

		
		// let orderKey = $("#ptStartEquipmentSelect").data("orderkey");
		let orderKey = $("[name=orderKey]").val();
		
		let ptEqKey = $("#ptStartEquipmentSelect option:selected").data("pteqkey"); // -------------------------------- test
		// let ptEqKey = $("#ptStartEquipmentSelect option:selected").val();

		console.log("ptEqKey value : ", ptEqKey)

		console.log("orderKey ??? : ",orderKey);
		
		let data = {
			ptBedKey : bedKey,
			orderKey : orderKey,
			ptBedStatus : "BS02",
			ptEquipmentKey : ptEqKey

		}

		let bedDivId = "bedKey"+bedKey;
		let bedDivElement = $("#"+bedDivId);
		
		
 		// 침상상태 업데이트 (사용중) ----------------------------------------------------------- + orderKey 꽂아넣기 추가
		$.ajax({
			method : "post",
			url : "${pageContext.request.contextPath}/ptRoomStatusUpdate.do",
			data : JSON.stringify(data),
			contentType : 'application/json; charset=utf-8',
			dataType : "text",
			beforeSend: function (xhr) {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
            	xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
        	}, 
			success : function(resp) {
				console.log("침상 사용상태 업데이트 성공");
			},
			error: function (request, status, error) {
	        console.log("code: " + request.status)
	        console.log("message: " + request.responseText)
	        console.log("error: " + error);
	    	}
		});

		// let ptEqKey = $("#ptStartEquipmentSelect option:selected").data("pteqkey"); // -------------------------------- test
		// let ptEqKey = $("#ptStartEquipmentSelect option:selected").val();

		// console.log("ptEqKey value : ", ptEqKey)

		let patientkey = $("#ptStartEquipmentSelect").data("patientkey");
		
		let equipmentKey = $("#ptStartEquipmentSelect").data("eqkey");

		console.log("equipmentKey 혹시 너가 문제니 : ", equipmentKey); // 잘온다.
		
		console.log("ptEqKey 오니 ? :",ptEqKey); // 온다. 이거 어딘가 넣어줘야 한다.
		$("#bedKey"+equipmentKey).data("pteqkey",ptEqKey);


		let eqStatusChangeData = {
			ptEquipmentStatus : "US02"
			, ptEquipmentKey : ptEqKey
		}

 		// 장비 상태 변화 (사용중) ------------------------------------------------------------ 
		$.ajax({
			method : "post",
			url : "${pageContext.request.contextPath}/ptEuipmentStatusUpdate.do",
			data : JSON.stringify(eqStatusChangeData), 
			contentType : 'application/json; charset=utf-8',
			dataType : "text",
			beforeSend: function (xhr) {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
            	xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
        	}, 
			success : function(resp) {
				console.log("장비 상태 업데이트 성공");
			},
			error: function (request, status, error) {
				console.log("code: " + request.status)
				console.log("message: " + request.responseText)
				console.log("error: " + error);
	    	}
		});

		
		// 침상번호, 오더키, 징비키 가져와야함
		let ptRecordData = {
							    ptBedKey: bedKey,
								empKey: "${authEmp.empKey}",
							    orderKey: orderKey,
							    equipmentKey: equipmentKey,
							    receiptKey: receiptKey
							};
		
			// 테스트 중
			if(!ajaxExecuted){
			ajaxExecuted = true;
		
		// 치료 기록 추가, 상태 치료중으로 변경, 대기목록 리스트 다시 가져와야한다. ----------------------------------------------- 
		$.ajax({
				    method: "POST",
				    url: "${pageContext.request.contextPath}/ptRecordInsert.do?receiptKey=" + receiptKey,
				    data: JSON.stringify(ptRecordData),
				    contentType: 'application/json; charset=utf-8',
				    dataType: "text",
				    beforeSend: function (xhr) {
				        xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				    },
				    success: function (resp) {
				        console.log("치료 기록 인서트 성공");
				        
				        // 침상 현황 다시 가져와야 한다. -> 다시 가져오려면 ? 안에 지워야한다. bedDiv 셀렉해서 그 안에 내용 지우기
				        $("#ptStartBedModal").modal("hide");
				        $(".nowPtbedsStatusDiv").find("[id^='bedKey']").empty();
				        ptRoomStatusImgList();
				        
				        // 대기환자 리스트도 다시 가져와야한다.
				        $("#waitingListBody").empty();
				        ptWaitingList();

						// 치료기구 현황도 다시 가져와야한다.
						$("#ptEqStatusTBody").empty();
						ptEquStatusList();

						// 진료차트 가져오기
						fn_medicalChart(orderKey);
				    },
				    error: function (request, status, error) {
				        console.log("code: " + request.status);
				        console.log("message: " + request.responseText);
				        console.log("error: " + error);
				    },
					complete: function() {
						ajaxExecuted = false; // 실행 플래그를 다시 false로 설정하여 재실행 가능하도록 함
					}
				});

			}		
		return false;
	})
// -------------------------------------------------------------------------------------------------------- 


// 침상 상태 현황 ---------------------------------------------------------------------------------------------

const ptRoomStatusImgList = () =>{
	$.getJSON("${pageContext.request.contextPath}/ptRoomStatusSelect.do").done(function(resp){
		let bedStatus = resp;
		console.log("bedStatus : ",bedStatus);
		
		// bedStatus.ptBedStatus == "BS02" , bedStatus.ptBedKey == 같은 div의 모달은 열리지 않도록.... 
		// localStorage에 resp 저장 (침상키, 침상상태)
		let bedStatusData = JSON.stringify(resp)
		localStorage.setItem("bedStatusData",bedStatusData);
		
		$.each(bedStatus, function(idx, status){
			let bedKey = status.ptBedKey;
      		let bedKeyDiv = $("#bedKey" + bedKey);

				if(status.ptBedStatus=="BS01"){
					// bedKeyDiv.empty();
					bedKeyDiv.append(
						$("<p>").html("[No."+ status.ptBedKey +"]"),
						$("<img class='bedImages' src='${pageContext.request.contextPath}/resources/images/pt_bed_able.jpg'>"),
						$("<p>").text("사용가능")
					)
				}else if(status.ptBedStatus=="BS02"){
					bedKeyDiv.off("click");
					bedKeyDiv.css("cursor", "default");
					console.log("테스트");
					// bedKeyDiv.empty();
					bedKeyDiv.append(
						$("<p>").html("[No."+ status.ptBedKey +"]"),
						$("<img class='bedImages' src='${pageContext.request.contextPath}/resources/images/pt_bed_unable.jpg'>"),
						$("<p class='ptIngPatientName'>"),
						// 치료진행시간 계산 함수에서 데이터 넣어줌
						$("<p class='ptStartTime'>")
					).data("orderkey",status.orderKey);
					
					// 오더 넣어서 치료 진행 데이터 불러오는 ajax 호출
					let orderKey = status.orderKey;
					console.log("orderKey 있니 ......  : ",orderKey);
					$.getJSON("${pageContext.request.contextPath}/ptBedStatusDetail.do?orderKey="+orderKey).done(function(resp){
						let bedDetail = resp;
							console.log("bedDetail : ",bedDetail);
						// Date에 들어갈 시간데이터
						let sy = bedDetail.ptRecordDate[0];
						let smon = bedDetail.ptRecordDate[1];
						let sd = bedDetail.ptRecordDate[2];
						let sh = bedDetail.ptRecordDate[3];
						let smin = bedDetail.ptRecordDate[4];
						let ss = bedDetail.ptRecordDate[5];
						
						// 치료도구 다시 사용가능으로 변경할 때 필요함.
						let eqKey = bedDetail.equipmentKey;
						let ptEqKey = bedDetail.ptEquipmentKey;

						console.log("eqKey 어디있니 : ", eqKey);
						console.log("ptEqKey 오고있니 ? : ", ptEqKey);

						$("#bedKey"+bedDetail.ptBedKey).find("[class='ptIngPatientName']").html(bedDetail.patientName+" ["+ bedDetail.equipmentName +"]").css("text-align", "center");
						
						let ptBedKeyDiv = document.getElementById("bedKey" + bedDetail.ptBedKey);
						let ptBedKey = bedDetail.ptBedKey;
						// ptTimer(시간, 출력위치, 침상번호, 오더번호, 기구번호, 치료기구번호)
						// ptTimer(new Date(sy,smon,sd,sh,smin,ss), ptBedKeyDiv, ptBedKey, orderKey, eqKey);
						ptTimer(new Date(sy,smon,sd,sh,smin,ss), ptBedKeyDiv, ptBedKey, orderKey, eqKey, ptEqKey);
					})

				} // 침상 상태 사용중일때 끝
			})
		})
	}
ptRoomStatusImgList();
//------------------------------------------------------------------------------------------- 


//치료 진행시간 계산해서 침상현황에 출력하는 함수 ---------------------------------------------------------------------------------------------------------
// a: 치료시간, b:시간 나올 위치, c: 치료종료 버튼 이벤트 파라미터(침상번호) ->d  orderKey로 가져와야함., e : 치료도구키, ptEqKey : 물리치료도구키
const ptTimer = (a,b,c,d,e,f) =>{
	// console.log("타이머 실행", a, b, c, d, e);
	console.log("타이머 실행", a, b, c, d, e, f);

	// moment.js API 사용
	let ptStart = moment(a); // new Date()와 동일한 뜻을 가진다.
	let ptTime = ptStart.subtract(1, "months"); // - 1달 (월은 0부터 11까지의 정수(1월부터 12월)로 나타나기 때문에)
	let ptRealTime = ptTime.format();
			
		let intervalId = setInterval(()=>{
			// 1초씩 더한다.
			ptStart.add(1, "s");
		
			// 현재시간 - 치료시작시간 => 치료 진행시간 계산 : moment(기준시간).diff(이후시간, '계산 단위');
			let diffTime = moment().diff(ptRealTime, 'milliseconds');
			let duration = moment.duration(diffTime); 		// 계산한 시간을 밀리초 단위로 변환
			let formattedTime = moment.utc(duration.as('milliseconds')).format('mm:ss'); 	// duration값을 UTC 시간 기준으로 변환
		
				// let ptMin = moment().diff(ptRealTime, 'minutes'); 	// 분 단위 계산식
				let ptSec = moment().diff(ptRealTime, 'seconds');		// 초 단위 계산식
				
				if(ptSec >= 10){	// 치료 진행 10초가 지나면
					clearInterval(intervalId); 		// interval 종료

					if (!$(b).find("#ptEnd").length) { 		// 치료종료 버튼이 아직 없다면 (치료종료 버튼이 하나만 생성되도록)
					 
						$(b).find("[class='ptStartTime']").remove();	// 출력되던 치료진행시간 p 태그 제거
						$(b).append(
							// 치료종료 버튼 생성 (액팅 진행하는 함수 포함)
							// $("<button id='ptEnd' style='margin:0 40px 10px 40px;' class='btn btn-primary btn-sm' onclick='fn_actingDataInput(" + c + ", \"" + d + "\", \"" + e + "\")'>")
							$("<button id='ptEnd' style='margin:0 40px 10px 40px;' class='btn btn-primary btn-sm' onclick='fn_actingDataInput(" + c + ", \"" + d + "\", \"" + e + "\", \"" + f + "\")'>")
								.text("치료종료")
						);

					}

				}else{
					// 치료 진행시간 text로 출력한다.
					$(b).find("[class='ptStartTime']").text("진행시간 : "+formattedTime);
				}
		}, 1000); // 1초씩 갱신한다.
		return intervalId;
	}
//----------------------------------------------------------------------------------------------------------------------------------------------------------- 


// 치료기구 상태관리 목록 -------------------------------------------------------------------- 

const ptEquipmentTbody = $("#ptEquipmentTbody");

const ptEquipmentList = ()=>{
	$.getJSON("/FinalPJ/ptEquipmentList.do").done(function(resp){
		let equipmentList = resp;
		
		console.log("equipmentList:", equipmentList);
		let equipmentTrTags = [];
		
			$.each(equipmentList, function(idx, equipment){
				// 영상과 기구 제외하고 출력하기 
				if(!(equipment.equipmentKey==12 || equipment.equipmentKey==13)){
					let trs = $("<tr onclick='fn_openEquipmentModal( " + equipment.equipmentKey + " );'>").append(
								$("<td>").html(equipment.equipmentName),		
								$("<td>").html(equipment.equipmentModel)		
								).addClass("datatr").data("source", equipment);	
					equipmentTrTags.push(trs);
				}
			});
		ptEquipmentTbody.append(equipmentTrTags);
	})
}
ptEquipmentList();
//------------------------------------------------------------------------------------ 


// 치료 기구 상태관리 상세보기 ---------------------------------------------------------------- 

const equipmentDetailTableDiv = $("#equipmentDetailTableDiv");
const equipmentDetailTableDiv2 = $("#equipmentDetailTableDiv2");

//모달 열었을 때 해당기구 데이터 출력 ---------------------------------
const fn_openEquipmentModal = (equipmentKey) =>{
	console.log(equipmentKey);
	$("#ptEquipmentStatusModal").modal("show");
	fn_equipmentStatusDetail(equipmentKey);
	fn_equipmentStatusRec(equipmentKey);
	fn_eqDetailModalStatusUpdate(equipmentKey);
}

// 모달 닫히면 데이터 리셋 -----------------------------------------
const fn_closeEquipmentModal = () =>{
	$("#ptEquipmentStatusModal").modal("hide");
	$("#equipmentDetailTableDiv2").remove();
	$("#equipmentStatusTbody").empty();
	$("#ptEqApplySelect[class='ptEqOpt']").remove();
}

const fn_equipmentStatusDetail = (equipmentKey) =>{

	$.getJSON("/FinalPJ/ptEquipmentDetail.do?what=" + equipmentKey).done(function(resp){
		console.log(resp);
		let equipmentDetail = resp;
		let equipmentKey = resp.equipmentKey;

		if(equipmentDetail!=null){
			let equipmentDetailTags = equipmentDetailTableDiv.append(
				$("<div id='equipmentDetailTableDiv2'>").append(
					$("<input id='equipmentKeyInput' type='hidden' value=" + equipmentKey +">"),
					$("<table class='table table-bordered' style='width: 90%; text-align: center; margin:auto;'>").append(
							$("<thead>").append(
								$("<tr class='table-primary'>").append(
									$("<th colspan='2'>").html("기구정보")
								)
							),
	
							$("<tbody>").append(
								$("<tr>").append(
									$("<th class='table-light'>").html("기구명"),
									$("<td>").html(equipmentDetail.equipmentName)
								),
								$("<tr>").append(
									$("<th class='table-light'>").html("모델명"),
									$("<td>").html(equipmentDetail.equipmentModel)
								),
								$("<tr class='table-primary'>").append(
									$("<th colspan='2'>").html("거래처정보")
										),
								$("<tr>").append(
									$("<th class='table-light'>").html("거래처명"),
									$("<td>").html(equipmentDetail.buyerVO.buyerName)
								),
								$("<tr>").append(
									$("<th class='table-light'>").html("담당자"),
									$("<td>").html(equipmentDetail.buyerVO.buyerCharger)
								),
								$("<tr>").append(
									$("<th class='table-light'>").html("연락처"),
									$("<td>").html(equipmentDetail.buyerVO.buyerTel)
								)
							)
						)
					)
			)
		}else{
			let equipmentDetailTags = equipmentDetailTableDiv.append(
				$("<div id='equipmentDetailTableDiv2'>").append(
						$("<h4>").html("물리치료기구 정보가 없습니다.")
					)
				)
			}
	})
}
//----------------------------------------------------------------------------------------------- 


// 모달 창 닫히면 안에 내용 지우는 이벤트리스너 --------------------------------------------------------------- 
ptEquipmentStatusModal.addEventListener('hide.bs.modal', function (event) {
	console.log("모달 닫았다.");
	$("#equipmentDetailTableDiv2").remove();	
	$("#equipmentStatusTbody").empty();
	$("#ptEqApplySelect [class='ptEqOpt']").remove();
	$(".ptEqStatusRadio").prop("checked", false);
})
//----------------------------------------------------------------------------------------------- 


// 장비 상태 기록 목록 --------------------------------------------------------------------------------
const equipmentStatusTbody = $("#equipmentStatusTbody");

const fn_equipmentStatusRec = (equipmentKey) =>{
	
	$.getJSON("/FinalPJ/ptEquipmentStatusList.do?eqKey="+equipmentKey).done(function(resp) {
		let eqDetailList = resp;

		let equipmentStatusTags = [];
		if(eqDetailList.length > 0) {
			$.each(eqDetailList, function(idx, eqDetail){
				let trs = $("<tr>").append(
							$("<td style='width:18%'>").html(eqDetail.eqStatusRecVO.equipmentRecordDate),
							$("<td style='width:10%'>").html(eqDetail.eqStatusRecVO.equipmentRecordStatus),
							$("<td>").html(eqDetail.eqStatusRecVO.equipmentRecordContent),
							$("<td style='width:15%'>").html(eqDetail.eqStatusRecVO.equipmentRecordWriter)
						)
					equipmentStatusTags.push(trs);
			});
			equipmentStatusTbody.append(equipmentStatusTags);
		}else{
			let equipmentStatusTags = equipmentStatusTbody.append(
				$("<tr>").append(
					$("<td colspan='3'>").html("상태점검 기록이 없습니다.")
				)
			)
		}
		$("#eqStatsuBtn").data("equipmentKey",equipmentKey);
	});
}
//-------------------------------------------------------------------------------------------- 


// 장비 상태 기록 인서트 ----------------------------------------------------------------------------
let ptEqStatusInsertForm = $("#ptEqStatusInsertForm");

	ptEqStatusInsertForm.on("submit", function(event){
		event.preventDefault();
	
		let equipmentKey = $("#eqStatsuBtn").data("equipmentKey");
		
		let equipmentRecordStatus = $("select[name=equipmentRecordStatus] option:Selected").val();
		let equipmentRecordContent = $("input[name=equipmentRecordContent]").val();

		if(equipmentRecordStatus=="장비 상태"||equipmentRecordStatus==null ||equipmentRecordStatus.length == 0){
				Swal.fire({
					icon: 'error',
					title: '장비상태를 선택하세요.',
					})
					return;
			}

		if(equipmentRecordContent.length == 0 || equipmentRecordContent==null){
				Swal.fire({
					icon: 'error',
					title: '점검사항을 입력하세요.',
					})
					return;
			}

		

		let eqStatusRecData = {
			equipmentKey : equipmentKey,
			equipmentRecordWriter : "${authEmp.empKey}",
			equipmentRecordContent : equipmentRecordContent,
			equipmentRecordStatus : $("select[name=equipmentRecordStatus] option:Selected").val()
		}

		$.ajax({
			method : "POST",
			url : "${pageContext.request.contextPath}/ptEquipmentStatusInsert.do",
			data : JSON.stringify(eqStatusRecData),
			contentType : 'application/json; charset=utf-8',
			dataType : "text",
			beforeSend: function (xhr) {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
        	}, 
			success : function(resp) {
				console.log("성공");
				equipmentStatusTbody.empty();
				fn_equipmentStatusRec(equipmentKey);
				$("[name=equipmentRecordContent]").val("");
				$("[name=equipmentRecordStatus]").prop("selectedIndex", 0);
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




// 액팅화면에 데이터 넣기 / 치료 종료 버튼 눌렀다 -------------------------------------------------------------

let fn_actingDataInput = (bedKey, orderKey, eqKey, ptEqKey) =>{
	
	console.log("bedKey 어디있니 : ", bedKey);
	console.log("orderKey는 어디있니 : ", orderKey);
	console.log("eqKey 어디있니 : ", eqKey); 
	console.log("key: 와야해 : ", ptEqKey); // 와야한다.

	// 침상 변화
	$.getJSON("${pageContext.request.contextPath}/actingDetail.do?orderKey="+orderKey).done(function(resp){
		console.log(resp);
		
		let actingInfo = resp;
		
		$("#acPatientName").text(actingInfo.patientName);
		$("#acPatientAge").text(actingInfo.patientAge+"/"+actingInfo.patientSex);

		$("#acRecordKey").text(actingInfo.ptRecordCode);
		$("#acRecordDate").text(actingInfo.ptRecordDate[0]+"."+actingInfo.ptRecordDate[1]+"."+actingInfo.ptRecordDate[2]+" "+actingInfo.ptRecordDate[3]+":"+actingInfo.ptRecordDate[4]);

		$("#acPatientDi").text(actingInfo.diseaseNmEn);
		$("#acPTName").text(actingInfo.ptName);
		$("#acDrName").text(actingInfo.empName);
		
		let ptRecordKey = actingInfo.ptRecordKey;
		$("#actingBtn").data("ptrecordkey",ptRecordKey);
		let receiptKey = actingInfo.receiptKey;
		$("#actingBtn").data("receiptkey",receiptKey);
		
		$(".nowPtbedsStatusDiv").find("[id^='bedKey']").empty();
	    ptRoomStatusImgList();

		$("#ptEqStatusTBody").empty();
		ptEquStatusList();
	});

	// 침상 사용 업데이트 
	let bedData = {
				ptBedKey : bedKey,
				orderKey : "",
				ptEquipmentKey : "",
				ptBedStatus : "BS01"
			}
	
	$.ajax({
				method : "post",
				url : "${pageContext.request.contextPath}/ptRoomStatusUpdate.do",
				data : JSON.stringify(bedData),
				contentType : 'application/json; charset=utf-8',
				dataType : "text",
				beforeSend: function (xhr) {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
	            	xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	        	}, 
				success : function(resp) {
					console.log("침상 사용상태 사용가능으로 업데이트 성공");
					$("#bedKey"+bedKey).on("click");
					$("#bedKey"+bedKey).css("cursor", "pointer"); // 클릭은 되는데 모달은 안열림 ****************************************
				},
				error: function (request, status, error) {
		        console.log("code: " + request.status)
		        console.log("message: " + request.responseText)
		        console.log("error: " + error);
		    	}
			});

		// let pteqkey = $("#bedKey"+eqKey).data("pteqkey");
		// console.log("key: 와야해 ", pteqkey); // 안온다.
		

		let eqStatusChangeData = {
			ptEquipmentStatus : "US01"
			, ptEquipmentKey : ptEqKey
		}

		// 장비 상태 업데이트 (사용가능) ------------------------------------------------------------ 이게 안된다. 치료 동시에 여러명 진행 시 안됨
		$.ajax({
			method : "post",
			url : "${pageContext.request.contextPath}/ptEuipmentStatusUpdate.do",
			data : JSON.stringify(eqStatusChangeData), 
			contentType : 'application/json; charset=utf-8',
			dataType : "text",
			beforeSend: function (xhr) {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			}, 
			success : function(resp) {
				console.log("장비 상태 사용가능으로 업데이트 성공");
			},
			error: function (request, status, error) {
				console.log("code: " + request.status)
				console.log("message: " + request.responseText)
				console.log("error: " + error);
			}
		});	

		if($("#acRecordKey").text().length){
			$(document).on('click', 'a', function(e) {
				e.preventDefault(); // 링크 클릭 이벤트를 기본 동작으로 실행되지 않도록 막음
	
				Swal.fire({
					icon: 'warning',
					title: '페이지를 나가시겠습니까?',
					text: '액팅 정보를 잃게됩니다.',
					showCancelButton: true,
					confirmButtonText: '나가기',
					cancelButtonText: '취소'
				}).then((result) => {
					if (result.isConfirmed) {
					// 페이지 이동 처리
					window.location.href = $(this).attr('href');
					}
				});
			});
		}

}
//------------------------------------------------------------------------------------ 



// 코멘트 입력 후 업데이트하기 ---------------------------------------------------------

const actingForm = $("#actingForm");

actingForm.on("submit", function(event){
	event.preventDefault();
	
	console.log("액팅버튼눌렀다.")
	let acName = $("#acPatientName").text()
	if(acName.length == 0 || acName==null){
				Swal.fire({
					icon: 'error',
					title: '액팅대상 환자가 없습니다.',
					})
					return;
			}

	// let bedKey = $("#actingBtn").data("bedkey");
	
	// let ptEquipmentKey = $("#actingBtn").data("eqkey");
	// console.log("ptEquipmentKey 오세요 : ",ptEquipmentKey);
	
	let ptRecordKey = $("#actingBtn").data("ptrecordkey");
	let receiptKey = $("#actingBtn").data("receiptkey");
	let ptRecordContent = $("#floatingTextarea2").val();
	
	if(ptRecordContent.length == 0|| ptRecordContent==null){
				Swal.fire({
					icon: 'error',
					title: '코멘트를 입력하세요.',
					})
					return;
			}

	let data = {
			ptRecordKey : ptRecordKey,
			ptRecordContent : ptRecordContent 	
	}
	
	console.log(data);
	
	// 치료 종료 - 물리치료 기록(코멘트 추가해서) 업데이트, 대기상태 히스토리 업데이트, 대기환자 리스트 다시 가져오기, 치료기구 상태변경(사용가능으로 반납...)
	$.ajax({
		method : "POST",
		url : "${pageContext.request.contextPath}/actingCommentUpdate.do?receiptKey=" + receiptKey,
		data : JSON.stringify(data),
		contentType : 'application/json; charset=utf-8',
		dataType : "text",
		beforeSend: function (xhr) {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
        	xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
    	}, 
		success : function(resp){
			console.log(resp);
			$(".nowPtbedsStatusDiv").find("[id^='bedKey']").empty();
	        ptRoomStatusImgList();
	   		
			Swal.fire({
					icon: 'success',
					title: '액팅완료!',
					text: '물리치료를 완료했습니다.',
					})

	        // 대기환자 리스트도 다시 가져와야한다.
	        $("#waitingListBody").empty();
	        ptWaitingList();
			$("#acPatientName").text("");
			$("#acPatientAge").text("");
			$("#acPTName").text("");
			$("#acPatientDi").text("");
			$("#acDrName").text("");
			$("#floatingTextarea2").val("")

			// 환자 진료차트 비우기
			$("#acRecordKey").text("");
			$("#acRecordDate").text("");
			$("#chChartKey").text("");
			$("#chEmpName").text("");
			$("#chPatientName").text("");
			$("#chPatientRegno").text("");
			$("#chDx").text("");
			$("#chComment").text("");

		},
		error: function (request, status, error) {
	        console.log("code: " + request.status)
	        console.log("message: " + request.responseText)
	        console.log("error: " + error);
	    }
	});
	
	return false;
})

//------------------------------------------------------------------------------------------- 

// 치료기구 사용상태 ------------------------------------------------------------------------- 
const ptEqStatusTBody = $("#ptEqStatusTBody");

const ptEquStatusList = () =>{
	let eqArray = [];
	$.getJSON("${pageContext.request.contextPath}/ptEquipmentList.do").done(function(resp){
		let eqList = resp;
		$.each(eqList, function(idx, eq){
			ptEqStatusTBody.append(
				$("<tr id='eqTrKey"+ eq.equipmentKey +"'>").append(
					$("<td class='eqKey"+ eq.equipmentKey +"' class='table table-striped' >").html(eq.equipmentName)
				)
			);
			eqArray.push(eq.equipmentKey);
		});

		eqArray.forEach(function(eq, idx, eqArray){
			$.getJSON("${pageContext.request.contextPath}/nowPtEqStatusDetail.do?eqKey="+eq).done(function(resp){
				let eqStatus = resp;

					$.each(eqStatus, function(idx,eq){
						let statusTag;
						if(eq.ptEquipmentStatus == "US01"){
							statusTag = $("<td id='"+ eq.ptEquipmentStatus +"'>").append(eq.ptEquipmentCode).css("background-color", "white")
						}else if(eq.ptEquipmentStatus == "US02"){
							statusTag = $("<td id='"+ eq.ptEquipmentStatus +"'>").append(eq.ptEquipmentCode).css("background-color", "#f0363657")
						}else if(eq.ptEquipmentStatus == "US03"){
							statusTag = $("<td id='"+ eq.ptEquipmentStatus +"'>").append(eq.ptEquipmentCode).css("background-color", "#34ccb566")
						}else if(eq.ptEquipmentStatus == "US04"){
							statusTag = $("<td id='"+ eq.ptEquipmentStatus +"'>").append(eq.ptEquipmentCode).css("background-color", "#9190907a")
						}
						$("#eqTrKey" + eq.equipmentKey).append(
							statusTag
						)
					})

					
			});
		})
	});
}
ptEquStatusList();
// ------------------------------------------------------------------------------------ 


// 환자 진료 차트 조회 ----------------------------------------------------------------------

const fn_medicalChart = (orderKey) =>{

	$.getJSON("${pageContext.request.contextPath}/patientChartDetail.do?orderKey="+orderKey).done(function(resp){
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

// 물리치료 기구 상세관리 모달 상태변경  -----------------------------------------------------------

const fn_eqDetailModalStatusUpdate = (equipmentKey) =>{
	
	$.getJSON("${pageContext.request.contextPath}/nowPtEqStatusDetail.do?eqKey="+equipmentKey).done(function(resp){
		console.log("eq 옵션 내용 resp : ", resp);
		let eqResp = resp;
		let ptEqApplySelect = $("#ptEqApplySelect");
		$.each(eqResp, function(idx, eq){
			ptEqApplySelect.append(
				// $("<option class='ptEqOpt' value='"+ eq.ptEquipmentCode +"'>").html(eq.ptEquipmentCode)
				$("<option class='ptEqOpt' value='"+ eq.ptEquipmentStatus +"'>").html(eq.ptEquipmentCode)
			)
		});
	});

	// radio 버튼 selected value 가져오기
	let eqStatus;
	$(".ptEqStatusRadio").on("change", function() {
		eqStatus = $("input[name='bedKey-outlined']:checked").val();
		console.log("eqStatus : " + eqStatus);
		$("[name=ptEquipmentStatus]").val(eqStatus);
	});

	// select selected value 가져오기
	let ptEquipmentCode;
		$("#ptEqApplySelect").on("change", function() {
			// ptEquipmentCode = $(this).val();
			ptEquipmentStatus = $(this).val();
			let selectedOption = $(this).find("option:selected");
			ptEquipmentCode = selectedOption.text();
			console.log("ptEquipmentStatus : ", ptEquipmentStatus);
			console.log("ptEquipmentCode : ", ptEquipmentCode);
			$("[name=ptEquipmentCode]").val(ptEquipmentCode);
	
			if(ptEquipmentStatus=="US01"){
				$("#info-outlined").prop("checked", true);
			}else if(ptEquipmentStatus=="US02"){
				$("#warning-outlined").prop("checked", true);
			}else if(ptEquipmentStatus=="US03"){
				$("#success-outlined").prop("checked", true);
			}else if(ptEquipmentStatus=="US04"){
				$("#danger-outlined").prop("checked", true);
			}
		});

	$("#ptEqApplySelect").data("equipmentkey", equipmentKey);
	
}

// 기구 상세모달 상태 업데이트 --------------------------------------------------------------------- 
		
$("#ptEqApplySubmit").on("submit", function(event){
			event.preventDefault();
			
			let ptEquipmentStatus = $("[name=ptEquipmentStatus]").val();
			let ptEquipmentCode = $("[name=ptEquipmentCode]").val();

			let ptEqData = {
				ptEquipmentStatus : ptEquipmentStatus
				, ptEquipmentCode : ptEquipmentCode
			}

			console.log("ptEqData : ", ptEqData);

			$.ajax({
					method : "POST",
					url : "${pageContext.request.contextPath}/ptEqDetailStatusUpdate.do",
					data : JSON.stringify(ptEqData),
					contentType : 'application/json; charset=utf-8',
					dataType : "text",
					beforeSend: function (xhr) {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
						xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
					}, 
					success : function(resp){
						Swal.fire({
							icon: 'success',
							title: '장비상태를 변경했습니다.',
							})
							$("#ptEqStatusTBody").empty();
							ptEquStatusList();	
					},
					error: function (request, status, error) {
						console.log("code: " + request.status)
						console.log("message: " + request.responseText)
						console.log("error: " + error);
					}
				});
			
			let equipmentKey = $("#ptEqApplySelect").data("equipmentkey");	

			let eqData = {
				equipmentStatus : ptEquipmentStatus
				, equipmentKey : equipmentKey
			}	
	});
// ------------------------------------------------------------------------------------ 

const fn_preInputComment = () =>{
	console.log("test");
	$("#floatingTextarea2").val("supraspinatus 중점 치료 진행함. pain 유의하며 치료 진행, 1grade로 진행함. ");
}

// Scroll 생성 ------------------------------------------------------------------------- 

let ptEquipmentDiv = document.querySelector('#ptEquipmentDiv');
new SimpleBar(ptEquipmentDiv, { autoHide: true });

let equipmentStatusDiv = document.querySelector('#equipmentStatusDiv');
new SimpleBar(equipmentStatusDiv, { autoHide: true });

let ptWaitingListDiv = document.querySelector('#ptWaitingListDiv');
new SimpleBar(ptWaitingListDiv, { autoHide: true });

let patientChartDiv = document.querySelector('#patientChartDiv');
new SimpleBar(patientChartDiv, { autoHide: true });

let actingFormDiv = document.querySelector('#actingFormDiv');
new SimpleBar(actingFormDiv, { autoHide: true });

//------------------------------------------------------------------------------------ 


</script>











