/**
 * 진료차트 js
 */


var today = new Date();
let mChartDate = $('#mChartDate'); let mChartNo = $('#mChartNo');
let fn_date = (daySet) =>{
	var year = daySet.getFullYear();
	var month = ('0' + (daySet.getMonth() + 1)).slice(-2);
	var day = ('0' + daySet.getDate()).slice(-2);
	var dateString = `${year}-${month}-${day}`;
	return dateString; //날짜 반환
}
let bodyListAll = []; let diseaseListAll = []; let therapyEqListAll = [];
let surgeryListAll = []; let prescriptListAll = [];
let addModalBody = $('#addModalBody');
// 그리드스택 생성
var grid = GridStack.init({});
let skey = ""; let sval = ""; // 검색어
let disListForm = $('#disListForm');
let inputForm = $('[name=inputForm]');
let preCheckModal = $('#preCheckModal');// 예진표 모달
let radDiv = $('#radDiv');
let radViewBtn = $(document).on('click', '.radViewBtn', function(){
	radiologyCheckModal.show();
	let radTbl ="";
	let radiology =  $(this).data('radiology');
	$.ajax({
		url : `${cPath}/radiology/radiologyDataView`
		, type: 'get'
		, data : {"attGroupNo" : radiology.attGroupNo}
		, dataType: 'json'
		, async : false
		, success : function(resp){// 조회할때.. orderKey에 의한.. 자료를.. 확인하는게....
			let fileList = resp;
			let orderKind = radiology.orderKind == "O004" ? 'MRI' : 'x-Ray';
			let date = fn_date(new Date(radiology.radRecordDate));
			radTbl = `<table class="table table-bordered">`;
			radTbl += `<thead><tr><th>오더번호</th><th>촬영종류</th><th>촬영날짜</th><th>담당자</th></tr></thead><tbody>`;
			radTbl += `<tr><td>${radiology.orderKey}</td><td>${orderKind}</td><td>${date}</td><td>${radiology.radEmpName}</td></tr>`;
			radTbl += `<tr><th>의료진 코멘트</th><td colspan="3">${radiology.radCont?? ""}</td></tr><tr><td colspan="4">`;
			// 사진 내용 반복
			let fileTags = ``; 
			let filedata = "";
			let aTags = ``;
			if(fileList.length > 0){
				for(let i=0; i < fileList.length; i ++){
					let file = fileList[i];
					let fileURL = `${cPath}/${file.attPath}/${file.saveName}`
					if(file.attType.startsWith('image')){
						filedata += `<img src='${fileURL}'/>`;
					}else if(file.attType.startsWith('video')){
						filedata += `<video src='${fileURL}' controls></video>`;
					}
					aTags +=  `<a href="${fileURL}" style='float:left;' download='${file.orignName}'>${file.orignName}</a><br>`;
				}
				fileTags += filedata 
			}else{ fileTags += `<p>등록된 파일이 없습니다.</p>`}
			radTbl += `${fileTags}<br><br>${aTags}`;
			radTbl += `</td></tr></tbody></table>`
			radDiv.empty().append(radTbl);
		}
	});
});
let radiologyCheckModal = $('#radiologyCheckModal')



let addsurgeryModal = $('#addsurgeryModal').on('show.bs.modal', function(){
	fn_surgeyList(surgeryListAll); // 수술 목록 셋팅
})


// 질병목록 출력-----------------------------------------------------------
let Dislist = $('.Dislist');
let fn_disease = (list, trClass, listBody) =>{
    if (list.length == 0) {
        getDisList(); 
        list = JSON.parse(localStorage.getItem("diseaeList"));
		diseaseListAll = list;
    }
	let Dis_trTags = [];
	if(list.length > 0){
		$.each(list, function(i, diseaseData){
			let trs =  $('<tr>').append(
						$('<td>').html(diseaseData.diseaseKey)
						,$('<td>').html(diseaseData.diseaseNmKr)
			).addClass(trClass).data("source", diseaseData);
			Dis_trTags.push(trs);
		});
	}else{
		Dis_trTags = `<tr><td colspan='2'>상병목록이 없습니다.</td></tr>`;
	}
	return listBody.empty().append(Dis_trTags);
}
// 진단목록 모달 셋팅
let addDisModal = $('#addDisModal').on('show.bs.modal', function(){
	fn_disease(diseaseListAll, 'Dtr', Dislist); 
});

let pInfo = $('#pInfo');
let patientInfoTable = () =>{
	let tbl = `<table class="table table-bordered"><thead><tr><th>이름</th><th>생년월일</th><th>나이</th><th>환자유형</th></tr></thead>
				<tbody id='PInfoTbody'><tr><td></td><td></td><td></td><td></td></tr>
				<tr><th stlye="background-color : #405189c7; color: white;">증상</th><td colspan='3'></td></tr></tbody></table>`
	return pInfo.empty().append(tbl);
}
patientInfoTable();// 환자 기본정보 셋팅
let DisIngBtn = $(document).on('click', '.DisIngBtn', function(){ // 호출 해제하면 기존의 환자 정보 지우기
	preCheckBtn.hide();
	patientInfoTable(); preChartDiv.hide(); 
	mChartNo.html(""); orderList.empty();
	ck_disease.empty().next().show();
	ck_mediList.empty().next().show();
	preOrderTable.hide(); orderTable.show();
	closeChartBtn.hide();
	saveChartBtn.show().prop('disabled', true);
	let readyText = "대기중"; 
	if(waitingstutas == 'WS05') readyText = '영상결과대기'
	$(this).parents('.Wtr').find('td').eq(2).text(readyText);
	$(this).attr({'Class' : 'btn btn-outline-primary btn-sm callBtn'}).html('호출')
			.css({'border' : '1px solid #405189', 'color' : '#405189'});
	$(".callBtn").prop('disabled', false);
})
let delOrderList = [];
let dels = $(document).on('click', '.dels', function(){// 약품 옆에 있는 삭제버튼 클릭시 // 삭제오더키 있다면
	let delPrescriptNo = $(this).parents('.selectedPrescript').data('prescriptionkey');
	let delOrderKey = $(this).parents('.selectOrderList').data('orderkey');
	let delOrderObj = {};
	delOrderObj.orderKey = delOrderKey;
	let delPrescriptionObj = {};
	delPrescriptionObj.prescriptionKey = delPrescriptNo;
	if(delPrescriptNo) prscriptDelList.push(delPrescriptionObj);
	if(delOrderKey) delOrderList.push(delOrderObj);
	$(this).parents('tr').remove();
});
let orderCk =  $('.orderCk').on('click', function(){
	let selectOrderTr = $(this).parents("tr"); // tr선택
	let orderKind = selectOrderTr.find('th').text();
	let trs = orderMakeTr(orderKind);
	orderList.append(trs);
})

let orderMakeTr = (orderKind, order) =>{
	let bodyOpt = fn_bodyPartOpt(bodyListAll, order);
	let therapyOpt = fn_therapyOpt(therapyEqListAll, order);
	let	inputbodyTag = `<select class='form-select selectBodyPart' name='bodyPartKey'>${bodyOpt}</select>`
	let selectTherapyTags = `<select class='form-select selectTherapy' name='equipmentKey'>${therapyOpt}</select>`
	let Tags = '';	
		switch(orderKind){
			case "x-Ray" : Tags += inputbodyTag; break; 
			case "MRI" : Tags += inputbodyTag; break;
			case "물리치료" : Tags += selectTherapyTags + inputbodyTag; break; 
			case "도수치료" : Tags += inputbodyTag; break;}
	let dataOrderKey = "";
	let orderkey = "";
	if(order != null) orderkey = order.orderKey;
	let trs = $('<tr class ="selectOrderList">').append($('<th name="orderKind">').html(orderKind), $('<td>').html(Tags), $('<td>').html(`<i class="bx bx-minus-circle fs-22 dels" ></i>`))
					.data('orderkey',orderkey );
	// `<tr class='selectOrderList' ${dataOrderKey} ><th name='orderKind'>${orderKind}</th><td>${Tags}</td><td><i class="bx bx-minus-circle fs-22 dels" ></i></td>`
	return trs;
}

let S_orderCk= $(document).on('click', '.S_orderCk', function(){
	let surgery = $(this).parent().prev().parent().data('source');
	let trTags = $('<tr>').append($('<th name="orderKind">').html("수술")
				, $('<td>').html(`수술코드 : ${surgery.surgeryKindKey}<br>수술명 : ${surgery.surgeryKindName}`)
				, $('<td>').html(`<i class="bx bx-minus-circle fs-22 dels"></i>`)).data('source', surgery).addClass('selectOrderList');
	orderList.append(trTags);
})
let surgeryTf = $('#surgeryTf');
// 예진표 조회
let preDisIngfoPatient = $('#preDisIngfoPatient')
let preDisInfotable = $('#preDisInfotable')
let preCheckBtn = $('#preCheckBtn').on('click', function() {
	let patient = preCheckBtn.data('patient');
	let preDisagnosis = patient.preDiagnosis;

	let trTags1 = [];
	let preDiagnosisPregnancy = preDisagnosis.preDiagnosisPregnancy == 'N' ? '없음' : '있음';
	let tr1 = $('<tr>').append(
					$('<td>').html(patient.patientKey)
					, $('<td>').html(patient.patientName)
					, $('<td>').html(patient.patientAge))
	trTags1.push(tr1);
					
	let trTags2 = [];				
	if( preDisagnosis.preDiagnosisKey != null){
		let tr2 = [
			$('<tr>').append($('<th>').html("수술경험"), $('<td>').html(preDisagnosis.preDiagnosisExperience))
			, $('<tr>').append($('<th>').html("질환여부"), $('<td>').html(preDisagnosis.preDiagnosisDisease))
			, $('<tr>').append($('<th>').html("특이체질/알러지"), $('<td>').html(preDisagnosis.preDiagnosisAllergy))
			, $('<tr>').append($('<th>').html("임신여부"), $('<td>').html(preDiagnosisPregnancy))
			, $('<tr>').append($('<th>').html("병원선택 이유"), $('<td>').html(preDisagnosis.preDiagnosisChoice))
			]
		trTags2 =tr2;
	}else{ trTags2 = `<tr><td colspan='2'>해당환자의 예진표가 등록되지 않았습니다.<td></tr>` }
	// 환자정보 입력 // 예진표 정보 입력
	preDisIngfoPatient.empty().append(trTags1); preDisInfotable.empty().append(trTags2);
}).hide();


mChartDate.empty().append(fn_date(today));
let preOrderTable = $('#preOrderTable').hide();
let patientKey = "";
// 진료차트 저장 누르기
let saveChartBtn = $('#saveChartBtn').on('click', function(){
	let reDisChart = waitingstutas == 'WS05' ? '재진료' : '신규진료'
	let url = `${cPath}/medicalChart/insertChart`;
	// 진단내역 값
	let diseaseCode = inputForm.eq(0).find('[name=diseaseKey]').val();
	if(waitingstutas == 'WS05' && diseaseCode == null){
		Swal.fire('경고!', '진료차트를 작성을 완료하려면 상병을 선택해주세요!', 'warning');
		return;
	}
	// diseaseCode = diseaseCode.length > 0 ? diseaseCode : null;
	let diagnosis = {};
	diagnosis.diseaseKey = diseaseCode;
	let prescriptList = inputForm.eq(1).find('.selectedPrescript');
	let prescriptdata = [];
	
	$.each(prescriptList, function(idx, prescript){
		let prescriptionKey = $(prescript).data('prescriptionkey');
		let prescriptVO = {}
		prescriptVO.prescriptionKey = prescriptionKey;
		prescriptVO.prescriptionNo = $(prescript).find('[name=prescriptionNo]').text();
		prescriptVO.prescriptionName = $(prescript).find('[name=prescriptionName]').text();
		prescriptVO.prescriptionEa = $(prescript).find('[name=prescriptionEa]').text();
		prescriptVO.prescriptionDay = $(prescript).find('[name=prescriptionDay]').val();
		prescriptVO.prescriptionTotal = $(prescript).find('[name=prescriptionTotal]').val();

		if(prescriptListAll.length == 0){
			fn_medicine(prescriptListAll, 'medicneTr', mediList);
		}

		if(prescriptListAll.length > 0){
			$.each(prescriptListAll, function(idx, medicine){
				if(medicine['제품코드'] == prescriptVO.prescriptionNo) prescriptVO.prescriptionRoute = medicine['투여'];
				if(medicine['제품코드'] == prescriptVO.prescriptionNo) {
					prescriptVO.prescriptionCost 
						= medicine['상한금액'] * prescriptVO.prescriptionDay * prescriptVO.prescriptionTotal
				}
			})
		}
		
		prescriptdata.push(prescriptVO);
	})

	let radiOrderCnt = 0;
	let orderData = [];
	let selectOrderList = inputForm.eq(2).find('.selectOrderList');
	$.each(selectOrderList, function(idx, order){
		let orderKey = $(order).data('orderkey');
		let surery = $(order).data('source');
		let selectTh = $(order).find('[name=orderKind]').text();
		let orderkind = ""; let eqKey = $(order).find('[name=equipmentKey]').val();
		switch(selectTh){// 영상학과 오더가 있는경우 => 재진료 할 수 있음
			case "x-Ray" : orderkind = 'O003'; radiOrderCnt ++; eqKey = 12; break; 
			case "MRI" : orderkind = 'O004'; radiOrderCnt ++; eqKey = 13; break;
			case "물리치료" : orderkind = 'O001'; break; case "도수치료" : orderkind = 'O002'; break; 
			case "수술" : orderkind = surery.surgeryKindKey; break;}
		let orderHistoryVO = {}
		orderHistoryVO.orderKey = orderKey;
		orderHistoryVO.orderKind = orderkind;
		orderHistoryVO.bodyPartKey = $(order).find('[name=bodyPartKey]').val();
		orderHistoryVO.equipmentKey = eqKey;
		orderData.push(orderHistoryVO); 
	})
	let mChartVO = {}
	mChartVO.receiptKey = receiptKey;
	mChartVO.patientKey = patientKey;
	mChartVO.empKey =  authEmpKey;
	mChartVO.chartCont =  chartCont.val();
	mChartVO.chartKey =  mChartNo.text(); // 기존차트번호
	mChartVO.delChartPrescriptionList = prscriptDelList; // 재진료시 삭제시킬 약품리스트
	mChartVO.delChartOrderList = delOrderList; // 재진료시 삭제시킬 오더리스트(영상학과 제외)
	// 진료차트 내용
	let model = JSON.stringify({ "diagnosis" : diagnosis, "prescription" : prescriptdata
	, "orderHistory" : orderData , "mChartVO" : mChartVO , "reDisChart" : reDisChart });
	if(radiOrderCnt == 0 && diseaseCode == null ){// 영상학과 오더가 없고 진단명이 없으면 진단하도록 경고
		Swal.fire('경고!', '진료차트를 작성을 완료하려면 상병을 선택해주세요!', 'warning');
		return;
	}
	//-------------ajax 보내기
	
	$.ajax({
		url : url
		, method : 'post'
		, dataType : 'text'
		, contentType: 'application/json; charset=utf-8'
		, data : model
		, beforeSend: function (xhr) {  
            xhr.setRequestHeader(`${headerName}`, `${token}`);
        }
		, success : function(resp){
			if(resp == '성공'){
				Swal.fire('등록 성공', '진료차트를 저장했습니다!', 'success');
				newChartNo = ""; // 차트번호 리셋
				settingChart();// 차트 rest
				getWaiting(); // 대기환자목록 다시 조회
				preChartDiv.hide(); patientInfoTable(); preCheckBtn.hide();// 과거차트 비우고 hide , 환자 정보 내용 비우기
			}else{  Swal.fire('등록 실패', '진료차트 등록에 실패했습니다!', 'error'); }
		}
	})// ajax 끝
	
}).prop('disabled', true);

let del_surgey = $(document).on('click', '#del_surgey', function(){
	$(this).parents('.Str_order').empty(); surgeryTf.show();
});

let settingChart = () =>{ // 리셋
	ck_disease.empty().next().show();
	ck_mediList.empty().next().show();
	chartCont.val("").prop('readonly', false);
	// 기존 오더 목록 비우기
	preOrderTable.hide(); 
	// find('#preOrderList').empty().hide(); 
	orderList.empty(); orderTable.show(); 
	mChartDate.empty().append(fn_date(today));
	// 신규차트 번호 
	mChartNo.empty().append(newChartNo); // 차트번호 보이기
	saveChartBtn.show(); closeChartBtn.hide(); // 
	surgeryTBody.empty(); surgeryTf.show(); // 수술 선택 비우기
}

//------------------------------------------
let waitingTB = $('#waitingTB')
let waitingCont = $('#waitingCont'); // 대기환자 명수
let getWaiting = () =>{
	$.ajax({
		url : `${cPath}/medicalChart/mywaitingList`
		, dataType : 'json'
		, type : 'get'
		, data : {"officeKey" : authOffice}
		, success : function(resp){
			let waitingList = resp;
			let trTags = [];
			waitingCont.html(`대기환자 수 : ${waitingList.length} 명`);
			if(waitingList.length > 0){
				$.each(waitingList, function(idx, waiting){
					let patient = waiting.receipt.patient;
					// 대기환자 확인
					let trs = $('<tr>').append(
					$('<td>').html(idx+1)
					, $('<td>').html(patient.patientName)
					, $('<td>').html(waiting.waitingStatusName)
					, $('<td>').html($('<input:button>').addClass('btn btn-outline-primary btn-sm callBtn').css({'border' : '1px solid #33416d', 'color' : '#33416d', 'background-color':'white'}).html('호출'))
					).addClass('Wtr').data("source", patient).data("waiting",waiting)
					trTags.push(trs);
				});
			}else{ trTags = `<tr><td colspan='4'>대기중인 환자가 없습니다.</td></tr>`; }
			waitingTB.empty().append(trTags);
		}
	})
}
getWaiting();
let closeChartBtn = $('#closeChartBtn').on('click', function(){ settingChart(); }).hide();
let orderList = $('#orderList'); let orderTable = $('#orderTable');  let orderDiv = $('#orderDiv');
let chartCont = $('[name=chartCont]');
let receiptStatus = ""; // 접수상태
let prscriptDelList = [];
$(document).on('click', '.showPreChartBtn', function(){
	let preCTr = $(this).parents('.preCTr').data('source');
	receiptStatus = preCTr.receiptStatus;
	
	mChartDate.empty().append(fn_date(new Date(preCTr.chartDate)));// 날짜 셋팅
	mChartNo.empty().append(preCTr.chartKey) // 차트번호 셋팅
	chartCont.empty().append(preCTr.chartCont).prop('readonly', true); // 차트 내용 출력
	// 진단 내역
	let dianosis = preCTr.dianosis;
	// 처방 내역
	let prescriptList = preCTr.prescriptList;
	// 오더 내역
	let orderHistoryList = preCTr.orderHistoryList;

	let PtrTags = ""; let delIcon = "";
	let day = ""; let total = "";
	let prescriptionDay = ""; let prescriptionTotal = "";
	let OtrTags = [];
	// 1. 접수상태가 완료된 상태 receiptStatus == 'RS02' : 모든 차트가 수정 불가능
	if(receiptStatus == 'RS02'){
		makePreChart(dianosis,prescriptList,orderHistoryList, receiptStatus,waitingstutas );
	}else{// 접수상태 RS01인경우
		if(waitingstutas == 'WS01'){// 신규진료의.. 기존차트..?
			makePreChart(dianosis,prescriptList,orderHistoryList, receiptStatus,waitingstutas);
		}else{// 재진료 : 수정 가능 =>  // 접수상태 RS01이고 waitingstutas == 'WS05'인경우
			//1) 진단 진단코드가 있으면 수정가능
			chartCont.empty().append(preCTr.chartCont).prop('readonly', false);
			if(dianosis.diseaseKey !=null){
				makeDisTr(dianosis.diease.diseaseKey,dianosis.diease.diseaseNmKr, dianosis.diagnosisKey);
				ck_disease.next().hide();
			}else{
				ck_disease.empty().next().show();
			}
			//2) 처방 수정 가능
			if(prescriptList.length > 0){
			$.each(prescriptList, function(idx, prescript){
				if(prescript.prescriptionKey != null){ // 처방 내역이 있는경우
					day = prescript.prescriptionDay  ? prescript.prescriptionDay : "";
					total = prescript.prescriptionTotal ? prescript.prescriptionTotal : "";

					delIcon = `<i class='bx bx-minus-circle fs-22 dels' style='float : right'></i>`

					prescriptionDay = `<td><input type='number' name='prescriptionDay' required style='width : 30px;' value='${day}'></td>`;
					prescriptionTotal = `<td><input type='number' name='prescriptionTotal' required  style='width : 30px;' value='${total}'> ${delIcon}</td>`;

					PtrTags += `<tr class='selectedPrescript' data-prescriptionKey='${prescript.prescriptionKey}'><td name="prescriptionNo">${prescript.prescriptionNo}</td><td name="prescriptionName">${prescript.prescriptionName}</td>
							<td name="prescriptionEa">${prescript.prescriptionEa}</td>${prescriptionDay}${prescriptionTotal}
							</tr>`
				}
			})// 처방 each
		}
		ck_mediList.empty().append(PtrTags).next().show();

		// 오더 확인
		if(orderHistoryList.length > 0){
			for(let i=0; i<orderHistoryList.length; i ++){
				let order = orderHistoryList[i];
				if(order.orderKey != null){// 오더 내역이 있다면
					let orderKind = order.orderKind;
					let bodyPart = "";
					for(let i=0;  i < bodyListAll.length; i ++){
						if(order.bodyPartKey == bodyListAll[i]['code']) bodyPart =  "치료부위 : " + bodyListAll[i]['codeName'];
					}
					if(orderKind.startsWith('S') > 0) {
						orderKind = "수술예약"
						for(let i=0; i<surgeryListAll.length; i ++){
							if(order.orderKind == surgeryListAll[i]['surgeryKindKey']) bodyPart = '수술명 : ' + surgeryListAll[i]['surgeryKindName'];
						}
					}
					switch(orderKind){
						case "O001" : orderKind = "물리치료" ; break; case "O002" : orderKind = "도수치료" ; break;
						case "O003" : orderKind = "x-Ray"; break; case "O004" : orderKind = "MRI"; break;
					}
					let equipmentName = order.equipmentName ?? "해당사항 없음" ;
					if(orderKind == 'x-Ray' || orderKind == 'MRI') {
						let radResultBtn = "";
						if(order.radiology.radRecode != null){
							let radiology = order.radiology;
							let radAttGroupNo = order.radiology.attGroupNo;
							radResultBtn = $('<input:button class="btn btn-outline-primary btn-sm rtBtn radViewBtn">').html('영상자료 확인')
												.attr({'data-bs-target' : '#radiologyCheckModal', 'data-bs-toggle' : 'modal'
											,  'style' : 'width : 100px;'}).data('radiology', radiology);
						}
						let trs = $('<tr class="selectOrderList">').append($('<th name="orderKind">').html(orderKind)
											,$('<td colspan="2">').append(bodyPart, radResultBtn)).data('orderkey', order.orderKey)
						OtrTags.push(trs);				
					}else{
						let trs = orderMakeTr(orderKind, order);
						OtrTags.push(trs);
					}
				}
			}// for 끝
		}// 오더 내역 끝

		preOrderTable.hide();
        orderList.empty().append(OtrTags);
		orderTable.show();
        closeChartBtn.hide(); saveChartBtn.prop('disabled', false);

        if(receiptStatus == 'RS02') { // 접수 완료차트라면
            saveChartBtn.hide();// 저장버튼 안보이기
            closeChartBtn.show(); // 닫기버튼 보이기
			}
		}
	}
});

// 기존 수정할 수 없는 과거차트
let makePreChart = (dianosis,prescriptList,orderHistoryList, receiptStatus, waitingstutas)=>{
	let PtrTags = ""; let delIcon = "";
	let day = ""; let total = "";
	let prescriptionDay = ""; let prescriptionTotal = "";
	let OtrTags = [];
		// 1) 진단
		// 병명 수정할 수 없음
		if(dianosis.diagnosisKey !=null){// 진단코드가 있으면
			ck_disease.empty().append($('<tr>').append($('<td name="diseaseKey">').html(dianosis.diease.diseaseKey), 
						$('<td>').html(dianosis.diease.diseaseNmKr))).next().hide();
		}else{
			ck_disease.empty().append(`<tr><td colspan='2'>해당 환자의 진단 내역이 없습니다.</td></tr>`).next().hide();
		}

		// 2) 처방 수정할수 없음
		if(prescriptList.length > 0){
			$.each(prescriptList, function(idx, prescript){
				if(prescript.prescriptionKey != null){ // 처방 내역이 있는경우
					PtrTags += `<tr><td name="prescriptionNo">${prescript.prescriptionNo}</td><td name="prescriptionName">${prescript.prescriptionName}</td>
							<td name="prescriptionEa">${prescript.prescriptionEa}</td><td>${prescript.prescriptionDay}</td><td>${prescript.prescriptionTotal}</td></tr>`
				}else{// 처방내역이 없는경우
					PtrTags += `<tr><td colspan='5'> 해당 환자의 처방 내역이 없습니다.</td></tr>`;
				}
			})// 처방 each
		}else{
			PtrTags += `<tr><td colspan='5'> 해당 환자의 처방 내역이 없습니다.</td></tr>`;
		}

		// 처방 출력
		ck_mediList.empty().append(PtrTags).next().hide();
		let noOrder = "";
		// 3) 오더 수정할 수 없음
		for(let i=0; i<orderHistoryList.length; i ++){
			let order = orderHistoryList[i];
			if(order.orderKey != null){// 오더 내역이 있다면
				let orderKind = order.orderKind;
				let bodyPart = "";
				for(let i=0;  i < bodyListAll.length; i ++){
					if(order.bodyPartKey == bodyListAll[i]['code']) bodyPart =  "치료부위 : " + bodyListAll[i]['codeName'];
				}
				if(orderKind.startsWith('S') > 0) {
					orderKind = "수술예약"
					for(let i=0; i<surgeryListAll.length; i ++){
						if(order.orderKind == surgeryListAll[i]['surgeryKindKey']) bodyPart = '수술명 : ' + surgeryListAll[i]['surgeryKindName'];
					}
				}
				switch(orderKind){
					case "O001" : orderKind = "물리치료" ; break; case "O002" : orderKind = "도수치료" ; break;
					case "O003" : orderKind = "x-Ray"; break; case "O004" : orderKind = "MRI"; break;
				}
				let equipmentName = order.equipmentName ?? "해당사항 없음" ;
				if(orderKind == 'x-Ray' || orderKind == 'MRI'){
					let resultBtn= "";
					if(order.radiology.radRecode != null){
						let radiology = order.radiology;
						let radAttGroupNo = order.radiology.attGroupNo;
						resultBtn = $('<input:button class="btn btn-outline-primary btn-sm rtBtn radViewBtn">').html('영상자료 확인')
											.attr({'data-bs-target' : '#radiologyCheckModal', 'data-bs-toggle' : 'modal'
										,  'style' : 'width : 100px; display:block;'}).data('radiology', radiology);
					}
					let trs = $('<tr>').append($('<td>').html(order.orderKey), $('<td>').html(orderKind)
											, $('<td>').html(bodyPart), $('<td>').append(equipmentName, resultBtn));
					OtrTags.push(trs);	
				}else{
					let trs = $('<tr>').append($('<td>').html(order.orderKey), $('<td>').html(orderKind)
											, $('<td>').html(bodyPart), $('<td>').append(equipmentName));
					OtrTags.push(trs);	
				}
			}else{// 오더 내역이 없음
				noOrder = `<tr><td colspan='4'>해당 환자의 오더 내역이 없습니다.</td></tr>`;
			}
			if(OtrTags.length == 0) OtrTags = noOrder;
		}// for 끝
		orderTable.hide(); 
        preOrderTable.show();
        preOrderTable.find('#preOrderList').empty().append(OtrTags);
        closeChartBtn.show(); saveChartBtn.hide();
}



let PInfoTbody = $('#PInfoTbody');

$(document).on('click', '.xBg', function() {
	$(this).parents('.selectPtr').remove();
})
let receiptKey = "";
let newChartNo = null;
let preChartListTB = $('#preChartList');
let preChartDiv = $('#preChartDiv').hide();
let waitingstutas = null;
let callBtn = $(document).on('click', '.callBtn', function(){

	$(this).attr('Class' , 'btn btn-outline-danger btn-sm DisIngBtn').css({
		'border' : '1px solid #f06548' , 'color' : '#f06548' });
		
	$('.callBtn').prop('disabled', true);// 호출버튼을 다시 찾아서 다른 호출 버튼 disabled 해주기
	$(this).parents('.Wtr').find('td').eq(2).text('진료중')
	let waiting = $(this).parents('.Wtr').data("waiting")
	waitingstutas = waiting.waitingStatus;
	if(waitingstutas == 'WS01') saveChartBtn.prop('disabled', false);
	let patient = waiting.receipt.patient;
	receiptKey = waiting.receiptKey;
	patientKey = patient.patientKey;
	preChartDiv.show();
	preCheckBtn.data('patient', patient);
	preCheckBtn.show();
	
	let type = "";
	switch(patient.patientType){ case "PK01" : type= "VIP"; break; case "PK02" : type= "일반환자"; break; case "PK01" : type= "관심환자" ; break; };
	let Ptr = `<tr><td>${patient.patientName ?? ""}</td><td>${patient.patientRegno1 ?? ""}</td><td>${patient.patientAge ?? ""}</td><td>${type ?? ""}</td></tr><tr><th stlye="background-color : #405189c7; color: white;">증상</th><td colspan="3">${waiting.receipt.receiptReason ?? ""}</td></tr>`;
	$('#PInfoTbody').empty().append(Ptr);
	
	//------------과거 진료차트
	$.ajax({
		url : `${cPath}/medicalChart/preChartList`
		, type : 'get'
		, dataType : 'json'
		, data : {"patientKey" : patient.patientKey}
		, success : function(resp){
			let preChartTags = [];
			if(resp.length > 0){
				$.each(resp, function(idx, preChart) {
					let radChartCk = ""
					if(waitingstutas == 'WS05' && idx == 0) { // 영상결과 대기환자고 차트의 0번째라면
						radChartCk = $('<span>').css({'color' : 'red', 'display' : 'block'}).html(preChart.radOrderCheck);
					}
					
					let preChartTrs = $('<tr>').append(
							$('<td>').html(preChart.receiptKey)
							, $('<td>').html(preChart.chartKey)
							, $('<td>').html(fn_date(new Date(preChart.chartDate)))
							, $('<td>').append(radChartCk, $('<input:button>').addClass('btn btn-outline-primary btn-sm showPreChartBtn').html("조회"))
						).addClass('preCTr').data('source', preChart)
					preChartTags.push(preChartTrs)

				});
			}else{ preChartTags = `<tr><td colspan='4'>과거 진료차트 내역이 없습니다.</td></tr>`; }
			preChartListTB.empty().append(preChartTags);
		}
	})// ajax 끝
	// 해당 환자가 영상결과 대기환자가 아니라면 - 가장 최근의 차트의 차트번호로 가져오기
	if(waiting.waitingStatusName != "영상결과대기"){ // 해당환자의 진료차트번호 생성하는 것.
		$.ajax({
			url : `${cPath}/medicalChart/createChartNo`
			, type : 'post'
			, contentType: 'application/json; charset=utf-8'
			, dataType : 'text'
			, beforeSend: function (xhr) {  
				xhr.setRequestHeader(`${headerName}`, `${token}`);
			}
			,success : function(resp){
				newChartNo = resp; // 환자의 차트번호 생성
				mChartNo.empty().html(newChartNo); // 생성된 차트번호넣어주기
			}
		});
	}
})



// list 검색 조건
let fn_serchData = (arrDataList, sKey , sVal)=>{
	let searchList = [];
	if(sVal != null){
		if(arrDataList.length > 0){
			$.each(arrDataList, function(idx, data){
				if(arrDataList[idx][sKey].indexOf(sVal) != -1){
					searchList.push(arrDataList[idx]);
				}
			})
		} // if 끝
		return searchList;
	}else{ return arrDataList; } // 검색키워드가 없으면 전체 목록 출력
}



// 신체부위 출력-----------------------------------------------------------
let selectBodyPart = $('.selectBodyPart');
fn_bodyPartOpt = (list, order)=>{
	let selected = ""
	let bodyOpt = `<option value=''>신체부위 선택</option>`;
			if(list.length > 0){
				$.each(list, function(idx,body) {
					if(order != null){
						if(order.orderKey != null) selected = "selected";
					}
					bodyOpt += `<option ${selected} value='${body.code}'>${body.codeName}</option>`;
				})
			}
	return bodyOpt;
}

// 물리치료 종류 출력--------------------------------------------------------
let selectTherapy = $('.selectTherapy');
fn_therapyOpt = (list, order)=>{
	let selected = "";
	let therapyOpt = `<option value=''>치료장비종류 선택</option>`;
			if(list.length > 0){
				$.each(list, function(idx,therapyEq) {
					if(order != null){
						if(order.orderKey != null) selected = "selected";
					}
					therapyOpt += `<option ${selected} value='${therapyEq.equipmentKey}'>${therapyEq.equipmentName}</option>`;
				})
			}
	return therapyOpt;
}

//수술 종류 출력----------------------------------------------------------
let surgeryTB =  $('#surgeryTB'); 
fn_surgeyList = (list)=>{
	let S_trTags = [];
	if(list.length > 0){
		$.each(list, function(i, surgeryData){
			let trs = $('<tr>').append(
					$('<td>').html(surgeryData.surgeryKindKey)
					, $('<td>').html(surgeryData.surgeryKindName)
					, $('<td>').html(surgeryData.surgeryKindPrice)
				).addClass("Str").data("source", surgeryData);
			S_trTags.push(trs);
		});
	}else{
		S_trTags = `<tr><td colspan='3'>수술목록이 없습니다.</td></tr>`;
	}
	return surgeryTB.empty().append(S_trTags);
}




let getinitList = ()=>{
	let url = `${cPath}/medicalChart/initList`
	$.ajax({
		url : url
		, type : 'get'
		, async:false
		, dataType : 'json'
		, success : function(resp){
			bodyListAll = resp.bodyList;
			therapyEqListAll = resp.therapyEqList;
			surgeryListAll = resp.surgeryList;

			fn_bodyPartOpt(bodyListAll) // 신체부위 셋팅
			fn_therapyOpt(therapyEqListAll)// 물리치료 셋팅
		}
	}) // ajax
}
getinitList();// 초기셋팅

// 질병 목록 불러오기
let getDisList = () =>{
    $.ajax({
        url : `${cPath}/medicalChart/getDisList`
        , type : 'get'
        , dataType : 'json'
        , success : function(resp){
            localStorage.setItem("diseaeList", JSON.stringify(resp));
        }
    })
}

// 질병 검색어
let Dis_serchKeyWord = $(document).on('keyup', '.Dis_serchKeyWord',function(){
	let word = $(this).val();
	let disTbody = $(this).next().find('tbody');
    let trClass =  $(this).next().find('tbody tr').attr('class')

	let serchList = fn_serchData(diseaseListAll, 'diseaseNmKr', word);
	fn_disease(serchList, trClass, disTbody);
})

if (!localStorage.getItem('diseaeList')) {
    getDisList();
}
//------------------진단내역 작성
let ck_disease = $('#ck_disease');
let makeDisTr = (diseaseKey, diseaseNmKr, diagnosisKey) =>{
	let mIcon = `<i class="bx bx-minus-circle fs-22" style='float : right' id='del_dis'></i>`;
	let tr2 = $('<tr>').append($('<td>').append($('<input type="text" name="diseaseKey" readonly>').val(diseaseKey).css({'border' : 'none', 'text-align' : 'center'})
				, $('<input type="hidden" name="diagnosisKey">').val(diagnosisKey)) 
				,$('<td>').append(diseaseNmKr, mIcon)
			).addClass('selectDis');
	return ck_disease.empty().append(tr2);
}
$(document).on('click', '.Dtr', function(){
	let disease = $(this).data('source');
	makeDisTr(disease['diseaseKey'], disease['diseaseNmKr']);
	ck_disease.next().hide();
	Dis_serchKeyWord.val("");
	addDisModal.modal('hide')
});
// -버튼을 누르면
let del_dis = $(document).on('click', '#del_dis', function(){
	ck_disease.empty().next().show();
})



//-------------------------------------------------------------------약물목록 조회
let page = 1; // 페이지 
let perPage = 1000; // 데이터 건수 
let serviceKey = "hjrDSW8kN1sERV%2BtQKchOkMSP39IBxM4A4xXlZCClkyx409T4po1rJNFUCNT8D40KczhcuDeI11tEmMmgbvIkw%3D%3D"; // 서비스 키

// 약물목록 불러오기
let getMedicineList = ()=>{
	$.ajax({
			url: `http://api.odcloud.kr/api/15067459/v1/uddi:f5a51b29-f3ee-4a30-8b8e-ce1492561e23?page=${page}&perPage=${perPage}&serviceKey=${serviceKey}`
			, method: 'GET'
			, dataType: 'json'
			, async : false
			, success: (resp) => {
				let data = resp.data;
				// medicineList라는 이름의 리스트를 localStorage에 저장한다.
				localStorage.setItem("medicineList", JSON.stringify(data));
			}
	})
}


// localStorage에 약물목록이 없다면
if (!localStorage.getItem('medicineList')) {
	getMedicineList();  // 비동기면 제어가 안 끝났는데 아래가 제어가 넘어감
}

let mediList = $('.mediList'); // 모달 약물 리스트 tbody
// 약물 목록 불러오기
let fn_medicine = (dataList, trClass, appendList)=>{
	 if (dataList.length == 0) {
         getMedicineList();
         dataList = JSON.parse(localStorage.getItem("medicineList"));
         prescriptListAll = dataList;
     } 
	 
	let trTags = [];
	 $.each(dataList, function (idx, medicine) {
         let tr =
             $('<tr>').append(
                 $('<td>').html(medicine['제품코드']),
                 $('<td>').html(medicine['제품명']),
                 $('<td>').html(medicine['투여'])
             ).addClass(trClass).data('medicine', medicine);
         trTags.push(tr);
     });
	return appendList.empty().append(trTags);
}
// 약물 검색
const regExp = /^[0-9]+$/;

//keyup 이벤트에서 검색 함수 호출
let searhMedicineInput = $('.searhMedicineInput').on('keyup', function(){
    let mediTbody = $(this).next().find('tbody');
    let mediClass =  $(this).next().find('tbody tr').attr('class')
    let searchData = $(this).val();
    searchMedicine(searchData, mediClass, mediTbody);
});

function searchMedicine(searchData, mediClass, mediTbody) {
    // 검색창 초기화
    if (searchData.length == 0 || searchData == null) {
        fn_medicine(prescriptListAll, mediClass, mediTbody);
        return;
    }
    let result = [];
    let data = JSON.parse(localStorage.getItem("medicineList"));

    $.each(data, function (idx, medicine) {
        let target;
        if (regExp.test(searchData)) { //숫자로만 검색 --> 의약품코드 검색
            target = medicine['제품코드'].toString();
        } else {  // 그외 --> 의약품명 검색
            target = medicine['제품명'];
        }
        if (target.indexOf(searchData) != -1) {
            result.push(medicine);
        }
    });
    fn_medicine(result, mediClass, mediTbody);
}
let selectMedicineList = $('#selectMedicineList');
let addMedicineModal = $(document).on('show.bs.modal', '#addMedicineModal',function(){
	// 기존에 선택된 요소들 가져와서 붙이기
	let originList = ck_mediList.children().clone(true);
	selectMedicineList.empty().append(originList);
    if($(this).find('.mediList tr').length == 0){
        let dataList = prescriptListAll;
        fn_medicine(dataList, 'medicneTr', mediList);
    }
});

let okMediBtn = $('#okMediBtn').on('click', function(){
	let trsArr = selectMedicineList.children().clone(true);
	if(trsArr.length > 0){
		ck_mediList.empty().append(trsArr);
	}
    $(this).find('[name=keword]').val("");
})

// 약물을 눌렀을때
let medicneTr = $(document).on('click','.medicneTr', function(){
		let mIcon = `<i class="bx bx-minus-circle fs-22 dels" style='float: right'></i>`;
		let medicine = $(this).data('medicine');
		let trs =[ $('<tr>').append(
			$('<td>').html(medicine['제품코드']).attr('name', 'prescriptionNo')
			, $('<td>').html(medicine['제품명']).attr('name', 'prescriptionName'), $('<td>').html(medicine['단위']).attr('name', 'prescriptionEa')
			, $('<td>').append($('<input>').attr({'name' : 'prescriptionDay', 'type' : 'number', 'style' : 'width : 30px;', 'required' : 'required', 'min' : '1'}))
			, $('<td>').append($('<input>').attr({'name' : 'prescriptionTotal', 'type' : 'number', 'style' : 'width : 30px; display:inline;', 'required' : 'required', 'min' : '1'}), mIcon)).addClass('selectedPrescript').data('medicine', medicine)];
		selectMedicineList.append(trs);
})
let ck_mediList = $('#ck_mediList')

//----------------------------------------------------------수술 종류 목록
let surgeryTBody = $('#surgeryTBody')
let Str =  $(document).on('click', '.Str', function() {
	let selectSurgery = $(this).data('source');
	let iconText = `<i class="bx bx-minus-circle fs-22" id='del_surgey'></i><br><i class='bx bx-check-circle fs-22 S_orderCk'></i>`
	let trs = [ $('<tr>').append(
		$('<td>').html(selectSurgery.surgeryKindKey), $('<td>').html(selectSurgery.surgeryKindName)
			,$('<td>').html(iconText)
			).addClass('Str_order').data('source', selectSurgery)];
	surgeryTBody.empty().append(trs); surgeryTf.hide();
	Sur_serchKeyWord.val(""); // 검색어 초기화
	addsurgeryModal.modal('hide');
})

let Sur_serchKeyWord = $("#Sur_serchKeyWord").on('keyup', function(){
	let word = $(this).val();
	let serchList = fn_serchData(surgeryListAll, 'surgeryKindName', word);
	fn_surgeyList(serchList);
});

let groupOrderList = [];
let groupOrderListDiv = $('.groupOrderListDiv');

let findDisName = (diseaseKey) =>{
	let disName = "";
	if(diseaseListAll.length > 0){
		$.each(diseaseListAll, function(idx, dis){
				if(diseaseKey == dis.diseaseKey) {
					disName = dis.diseaseNmKr
			}
		})
	}
	return disName;
}
let groupDislist = $('.groupDislist');
let groupmediList = $('.groupmediList');
let getGroupOrder = ()=> {
	let empKey =authEmpKey;
	$.ajax({
		url: `${cPath}/medicalChart/getGroupOrder`
		, data: {"empKey" : empKey}
		, type: 'get'
		, dataType: 'json'
		, async : false
		, success : function(resp){
			groupOrderList = resp;
			let Ptag = [];
			if(diseaseListAll.length == 0){
				fn_disease(diseaseListAll, 'groupDtr',groupDislist);
			}
			if(prescriptListAll.length == 0){
				fn_medicine(prescriptListAll, 'groupPtr', groupmediList);
			}
			if(groupOrderList.length > 0){
				$.each(groupOrderList, function(idx, groupOrder){
					let pTags = $('<div>').append(
						$('<span  tabindex="0">').append($('<i>').addClass('ri-subtract-line'), " ",
						groupOrder.groupOrderName, " ").addClass('groupList').data('groupOrder', groupOrder)
						, '&nbsp;&nbsp;', $('<i>').addClass('bx bx-minus-circle fs-20 delGroupOrder').css('display', 'none')
						).css('text-align', 'left');
					Ptag.push(pTags);
				})
			}else{ Ptag = `<p> 등록된 그룹오더 목록이 없습니다. </p>`;}
				groupOrderListDiv.empty().append(Ptag);
		}
	});
}
getGroupOrder();


let GOmodifyBtn = $('#GOmodifyBtn');
let selectPList =$('#selectPList');
let div_Divselect = $('#div_Divselect');
let groupDisName = $('#groupDisName');
let div_Prescriptselect = $('#div_Prescriptselect');
let groupOrderKey = $('[name=groupOrderKey]');
let groupList = $(document).on('click', '.groupList', function(){
	let groupOrderInfo = $(this).data('groupOrder');
	if(groupOrderModal.is(":visible") == true){ // 모달창이 뜬상태라면
		GOmodifyBtn.show();
		let groupPList = groupOrderInfo.groupOrderPrescritionList;
		groupOrderKey.val(groupOrderInfo.groupOrderKey);
		addGroupOrderForm.find('[name=groupOrderName]').val(groupOrderInfo.groupOrderName);
		addGroupOrderForm.find('[name=groupOrderContent]').val(groupOrderInfo.groupOrderContent);
		addGroupOrderForm.find('[name=diseaseKey]').val(groupOrderInfo.diseaseKey);
		let disName = findDisName(groupOrderInfo.diseaseKey);
		groupDisName.empty().html(disName);
		let groupPrescritpName = "";
		if(groupPList.length > 0){
			selectgoPrescriptList.empty();
			$.each(groupPList, function(idx, groupPrescript){
				let medicineName = "";
				if(prescriptListAll.length > 0){
					$.each(prescriptListAll, function(idx, medicine){
						if(groupPrescript.goPrescriptionNo == medicine['제품코드']) medicineName = medicine['제품명'];
					})
				}
				if(medicineName.length > 10) medicineName = medicineName.substring(0,10);
					medicineName +=  "...";
				makegroupPrescriptInputTags(groupPrescript.goPrescriptionNo, medicineName,groupPrescript.goPrescriptkey );
			})
		}
	}else{
		// 모달창이 뜬상태가 아니라면
		if(diseaseListAll.length == 0){
			fn_disease(diseaseListAll, 'groupDtr',groupDislist);
		}
		if(prescriptListAll.length == 0){
			fn_medicine(prescriptListAll, 'groupPtr', groupmediList);
		}
		let diseaseName = findDisName(groupOrderInfo.diseaseKey);
		makeDisTr(groupOrderInfo.diseaseKey, diseaseName);
		ck_disease.next().hide();
		let gPList = groupOrderInfo.groupOrderPrescritionList;
		let medicineObj = {}; let trTags = [];
		if(gPList.length > 0){
			$.each(gPList, function(idx, prescrition){
				medicineObj = getMediObject(prescrition.goPrescriptionNo);
				let PdelIcon = `<i class="bx bx-minus-circle fs-22 dels" style='float: right'></i>`;
				let trs = $('<tr>').append(
					$('<td name="prescriptionNo">').html(medicineObj.prescriptionNo)
					,$('<td name="prescriptionName">').html(medicineObj.prescriptionName)
					,$('<td name="prescriptionEa">').html(medicineObj.prescriptionEa)
					,$('<td>').append(`<input name='prescriptionDay' min='1' required type='number' style='width : 30px; display : inline;'>`)
					,$('<td>').append(`<input name='prescriptionTotal' min='1' required type='number' style='width : 30px; display : inline;'>`, PdelIcon)
				).data('medicine', medicineObj).addClass('selectedPrescript');
				trTags.push(trs);
			})
		}
		ck_mediList.empty().append(trTags);
	}
});


let getMediObject = (prescritionNo) =>{
	let medicineObj = {};
	if(prescriptListAll.length > 0){
		$.each(prescriptListAll, function(idx, medi){
			if(prescritionNo == medi['제품코드']){
				medicineObj.prescriptionNo = medi['제품코드'];
				medicineObj.prescriptionName = medi['제품명'];
				medicineObj.prescriptionEa = medi['단위'];
			}
		})
	}
	return medicineObj;
}
let delGroupOrder = $(document).on('click','.delGroupOrder',  function(){
	let groupOrder = $(this).prev().data('groupOrder');

	Swal.fire({
		  title: '그룹오더를 삭제하시겠습니까??',
		  text: "삭제하시면 다시 복구시킬 수 없습니다.",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: '삭제',
		  cancelButtonText: '취소'
		}).then((result) => {
		  if (result.value) {
              //"삭제" 버튼을 눌렀을 때 작업할 내용을 이곳에 넣어주면 된다.
			  $.ajax({
				url : `${cPath}/medicalChart/deleteGroupOrder`
				, dataType : 'text'
				, type : 'get'
				, data : {"groupOrderKey" : groupOrder.groupOrderKey}
				, success : function(resp){
					if(resp == '성공'){
						Swal.fire('삭제성공', '해당 그룹오더를 삭제했습니다!', 'success');
						groupOrderListSet();
						groupOrderModal.find('.delGroupOrder').css('display', 'inline');
					}
				}
			  })
		  }
		});
})

let medicineListAll = [];
let groupOrderModal = $('#groupOrderModal').on('show.bs.modal', function(){
	$(this).css('--vz-modal-width' , '900px;');  
	$(this).find('.delGroupOrder').css('display', 'inline');

	// 진단 목록 조회groupDislist
    if($(this).find('.groupDislist tr').length == 0){
        fn_disease(diseaseListAll, 'groupDtr',groupDislist); //목록 셋팅 - 모달창
    }

    if($(this).find('.groupmediList tr').length == 0){
        fn_medicine(prescriptListAll, 'groupPtr', groupmediList); // 약물 목록 조회 
    }

}).on('hide.bs.modal', function(){
    delGroupOrder.hide();
	GOmodifyBtn.hide();
    $(this).find('[type=text] , [name=groupOrderContent]').val(""); groupDisName.empty();
    selectgoPrescriptList.empty();
})

let groupOrderDisKey = $('[name=diseaseKey]');// 그룹오더 상병 목록 등록
let groupDtr = $(document).on('click', '.groupDtr', function(){
	let disData =  $(this).data('source');
	groupOrderDisKey.val(disData.diseaseKey);
	groupDisName.empty().append(disData.diseaseNmKr);
});
let selectgoPrescriptList = $('#selectgoPrescriptList');

let groupPtr = $(document).on('click', '.groupPtr', function(){
	let medicine =  $(this).data('medicine');
	let medicineName = medicine['제품명'];
	if(medicine['제품명'].length > 10) {
		medicineName = medicine['제품명'].substr(0, 10);
		medicineName += "..."
	}
	makegroupPrescriptInputTags(medicine['제품코드'], medicineName, "");
});

let makegroupPrescriptInputTags = (medicineCode, medicineName, goPrescriptkey) =>{
	let inputTag = `<div class='group'><input type='text' name='goPrescriptionNo' data-goprescriptkey='${goPrescriptkey}'
					style="width: 150px; float: left;" readonly class="form-control" value='${medicineCode}'>
					<p style="margin-top: 10px; float: left; vertical-align:middle;" id="groupPName">
						${medicineName}<i class="bx bx-minus-circle fs-22 groupPdels"></i></p><br></div>`;

	return selectgoPrescriptList.append(inputTag);
}
let delPrescriptList = [];
let groupPdels = $(document).on('click', '.groupPdels', function(){
	let delPrescriptNo = $(this).parents('.group').find('[name=goPrescriptionNo]').data('goprescriptkey');
	let groupPdelsList = {}
	groupPdelsList.goPrescriptkey = delPrescriptNo;
	if( delPrescriptNo ) delPrescriptList.push(groupPdelsList);

	$(this).parents('.group').remove();
})
let GOresetBtn = $('#GOresetBtn').on('click', function(){
	addGroupOrderForm[0].reset();
	selectgoPrescriptList.empty(); groupDisName.html(''); GOmodifyBtn.hide();
});
let addGroupOrderForm = $('#addGroupOrderForm').on('submit', function(event){
	event.preventDefault();
	
	// 신규등록일 경우 그룹오더키 비우기
	let btnName = event.originalEvent.submitter.id;
	let active = ""
	if(btnName == "GOsaveBtn") {
		groupOrderKey.val(null);
		active = "등록"
	}else{
		active = "수정"
	}
	
	let dataForm = $(this).find('[type=text], textarea, hidden');
	let groupVO = {}
	let groupOrderPrescritionList = []
	for(let i=0; i<dataForm.length; i ++){
		if(dataForm[i]['name'] == "goPrescriptionNo") {
			groupOrderPrescritionList.push({'goPrescriptionNo' : dataForm[i]['value'], "goPrescriptkey" :  dataForm[i].dataset['goprescriptkey'].length > 0 ? dataForm[i].dataset['goprescriptkey'] : null });
		}else{
			groupVO[dataForm[i]['name']] = dataForm[i]['value'];
		}
	} 
	groupVO['groupOrderKey'] = groupOrderKey.val();
	groupVO['empKey'] = authEmpKey;
	groupVO['groupOrderPrescritionList'] = groupOrderPrescritionList;
	groupVO['delPrescriptList'] = delPrescriptList;
	$.ajax({
		url: `${cPath}/medicalChart/createGroupOrder`
		, data: JSON.stringify(groupVO)
		, type: 'post'
		, contentType: 'application/json'
		, dataType: 'text'
		, beforeSend: function (xhr) {
			xhr.setRequestHeader(`${headerName}`, `${token}`);
		} 
		, success : function(resp){
			if(resp == "성공"){
				Swal.fire(`${active} 성공`, `해당 그룹오더를 ${active}했습니다!`, 'success');
				groupOrderListSet(); GOmodifyBtn.hide();
				groupOrderModal.find('.delGroupOrder').css('display', 'inline');
			}else{
				alert("그룹오더 등록 실패")
			}
		}
	}); // ajax 끝
	return false;
});

let groupOrderListSet = () =>{
	$('input[name], textarea').val(""); // 입력태그 초기화
	groupDisName.empty();
	selectgoPrescriptList.empty();
	getGroupOrder(); // 목록 다시 불러오기
	delPrescriptList = []; // 삭제목록 비우기 
} 

let autoComent = $('#autoComent').on('click', function(){
	chartCont.val('오더 수행 시 통증 유의 바람.');
});

// 내부 스크롤 바 - 제이쿼리가 안먹혀요
var myElement = document.getElementById('mySimplebar');
new SimpleBar(myElement, { autoHide: true });


var myDisbar = document.getElementById('Disbar');
new SimpleBar(myDisbar, { autoHide: true });

var myElement3 = document.getElementById('Medibar');
new SimpleBar(myElement3, { autoHide: true });

var myElement4 = document.getElementById('sugerybar');
new SimpleBar(myElement4, { autoHide: true });

var myElement5 = document.getElementById('waitingSimplebar');
new SimpleBar(myElement5, { autoHide: true });

// var myElement6 = document.getElementById('cardbar');
// new SimpleBar(myElement6, { autoHide: true });

var myElement7 = document.getElementById('groupDisbar');
new SimpleBar(myElement7, { autoHide: true });

var myElement8 = document.getElementById('groupMedibar');
new SimpleBar(myElement8, { autoHide: true });
 