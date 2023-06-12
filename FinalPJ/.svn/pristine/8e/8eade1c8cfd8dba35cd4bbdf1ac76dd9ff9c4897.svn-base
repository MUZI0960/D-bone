/**
 * 영상학과 페이지 js파일
 */


var grid = GridStack.init({});

let waitingTB = $('#waitingTB');
let callBtn = $('.callBtn');
let preChartDiv = $('#preChartDiv')
let preChartListDiv = $('#preChartListDiv').hide();
let preChartForm = $('#preChartForm').hide();
let empKey = $('[name=empKey]');
let PInfoTbody = $('#PInfoTbody');
let preChartListTB = $('#preChartList');
let waitingCont = $('#waitingCont');
let orderChartNo = ""; // 해당 오더의 차트번호
let orderTables = $('#orderTables');
let workContent = $('#workContent');
let rsData = $('#rsData');
let radiologyData = null;
let resultDiv = $('#resultDiv').hide();
var today = new Date();
let orderDate = $('#orderDate').hide();
let mChartDate = $('.mChartDate'); let mChartNo = $('.mChartNo');
let receiptKey = $('[name=receiptKey]');

let fn_date = (daySet) => {
	var year = daySet.getFullYear();
	var month = ('0' + (daySet.getMonth() + 1)).slice(-2);
	var day = ('0' + daySet.getDate()).slice(-2);
	var dateString = `${year}-${month}-${day}`;
	return dateString; //날짜 반환
}
let fn_time = (daySet) =>{
	var hours = ('0' + today.getHours()).slice(-2); 
	var minutes = ('0' + today.getMinutes()).slice(-2);
	var seconds = ('0' + today.getSeconds()).slice(-2); 

	var timeString = hours + ':' + minutes  + ':' + seconds;
	return timeString;
}
let resetBtn = $('.resetBtn').on('click', function(){
	let divId = $(this).parent().attr('id')
	if(divId == 'xRaybtngroup'){ imgDiv.empty();
	}else{ videoDiv.empty(); }
});
let imgDiv = $('#imgDiv'); let videoDiv = $('#videoDiv');
let loadFile = (acc)=>{//업로드 파일 미리보기
	let fileList = acc.files;
	let mediaTags = [];
	let mediaDiv = null;
	if(fileList.length > 0){
		$.each(fileList, function(idx, file){
			let fileType = file.type;
			let mediadata = "";
			let fileURL = URL.createObjectURL(file);
			if(fileType.startsWith('image')){
				mediadata = $('<img>').attr('src', fileURL );
				mediaDiv = imgDiv;
			}else if(fileType.startsWith('video')){
				mediadata = $('<video controls>').attr('src', fileURL);
				mediaDiv = videoDiv;
			}
			mediaTags.push(mediadata);
		});
		mediaDiv.empty().append(mediaTags);
	}else{
		imgDiv.empty(); videoDiv.empty();
	}
}

let closepreChartBtn = $(document).on('click', '#closepreChartBtn', function(){
	preChartForm.hide();
	workContent.show();
})
let closeBtn = $(document).on('click', '#closeBtn', function(){
	rsData.empty(); resultDiv.hide();
	workContent.show();
})
let MRIorderKey = $('[name=MRIorderKey]');
let xRayorderKey = $('[name=xRayorderKey]');
// 파일 저장





let pInfo = $('#pInfo'); // 환자 정보 셋팅
let patientInfoTable = () =>{
	let tbl = `<table class="table table-bordered"><thead><tr><th>이름</th><th>생년월일</th><th>나이</th><th>환자유형</th></tr></thead>
				<tbody id='PInfoTbody'><tr><td></td><td></td><td></td><td></td></tr>
				<tr><th>증상</th><td colspan='3'></td></tr></tbody></table>`
	return pInfo.empty().append(tbl);
}
patientInfoTable();


let orderTableInfo = () =>{
	let tbl = `<table class="table table-bordered"><tbody><tr><th>차트번호</th><td></td><th >오더번호</th><td></td></tr>
				<tr><th>촬영종류</th><td></td><th>촬영부위</th><td></td></tr></tbody></table>`;
	return orderTables.empty().append(tbl);
}


// 대기환자 테이블 생성
let waitingmakeTr = (listBody, list) => {
	let trTags = [];
	waitingCont.html(`대기환자 수 : ${list.length} 명`);
	if (list.length > 0) {
		$.each(list, function (idx, waiting) {
			let radOrder = waiting.radOrder;
			let radOrderKind = ""
			$.each(radOrder, function(i, rad){
				if(i > 0) radOrderKind += `<br>`;
				radOrderKind += `${rad.orderKind}`;
			});
			let patient = waiting.receipt.patient;
			let trs = $('<tr>').append(
				$('<td>').html(idx + 1)
				, $('<td>').html(patient.patientName)
				, $('<td>').html(waiting.waitingStatusName)
				, $('<td>').html(radOrderKind)
				, $('<td>').html($('<input:button>').addClass('btn btn-outline-primary btn-sm callBtn').html('호출'))
			).addClass('Wtr').data("source", patient).data("waiting", waiting)
			trTags.push(trs);
		});
	} else { trTags = `<tr><td colspan='5'>대기중인 환자가 없습니다.</td></tr>`; }
	return listBody.empty().append(trTags);
}
// 대기환자 목록 출력
let getWaiting = () => {
	$.ajax({
		url: `${cPath}/radiology/getWaitingList`
		, dataType: 'json'
		, type: 'get'
		, async: false
		, success: function (resp) {
			let waitingList = resp;
			waitingmakeTr(waitingTB, waitingList);
		}
	})
}


getWaiting();
let bodyListAll = [];
let getBodyList = () => {
	$.ajax({
		url: `${cPath}/radiology/getBodyPartList`
		, type: 'get'
		, dataType: 'json'
		, async: false
		, success: function (resp) {
			bodyListAll = resp;
		}
	})
}
getBodyList(); // 신체부위 조회


let saveBtn = $('.saveBtn').on('click', function(event){
	let formData =new FormData(insertForms[0]);
	let fileCnt= 0;
	let inputfile = insertForms.find('[type=file]');
	$.each(inputfile, function(idx, file){
		let fileList = file.files;
		if(fileList.length > 0) fileCnt ++;
	});
	
	if(fileCnt != radOrderCont ){
		Swal.fire('누락된 데이터 있음!!', '파일 첨부 후 다시 시도해주세요!', 'warning');
		return;
	}
	$.ajax({
		url: `${cPath}/radiology/UploadData`
		, data: formData
		, type: 'post'
		, dataType: 'text'
		, cache: false
		, beforeSend: function (xhr) {
			xhr.setRequestHeader(headerName, token);
		}
		, contentType: false
		, processData: false
		, success : function(resp){
			if(resp == 'success'){
				Swal.fire('등록 성공!', '영상자료를 등록했습니다!', 'success');
				preChartDiv.hide();  
				preChartListDiv.hide(); preCheckBtn.hide();
				patientInfoTable(); orderTableInfo();// 환자 정보 초기화
				orderTables.find("td").html(""); $('#checkOk').remove();
				orderDate.hide(); Xtab.prop('disabled', false); 
				getWaiting();// 대기자 목록 재확인
				uploadreset();
				Mtab.attr('class', 'nav-link').prop('disabled', false);
				Xtab.attr('class', 'nav-link active').prop('disabled', false);

			}else{ Swal.fire('등록 실패!', '영상자료 등록에 실패했습니다!', 'error'); }
		}
	});
	

}).prop('disabled', true);
let insertForms = $('.insertForms')
let forms = $('form');
let uploadreset = () =>{
	saveBtn.prop('disabled', true); // 저장버튼 비활성화
	videoDiv.empty(); imgDiv.empty();
	forms.find('textarea, [type=file], [type=text]').val("");
}
let radInfo = $('#radInfo');
let rsDiv = $('#rsDiv');
let rsCont = $('#rsCont');
let showResultBtn = $(document).on('click', '.resultBtn', function(){
	preChartDiv.hide();
	let radiology = $(this).data('radiology');
	rsCont.val(radiology.radCont);
	let radDate = new Date(radiology.radRecordDate); let radKind = radiology.orderKind == "O003"? 'x-Ray' : 'MRI';
	let radInfotext = 	`<table class='table table-bordered'>
						<thead><th>촬영담당자</th><th>촬영시간</th><th>촬영 종류</th></thead>
						<tbody><td>${radiology.radEmpName}</td><td>${fn_date(radDate) + " " + fn_time(radDate)}</td><td>${radKind}</td></tbody></table>`;
	radInfo.html(radInfotext);
	$.ajax({
		url : `${cPath}/radiology/radiologyDataView`
		, type : 'get'
		, data : {'attGroupNo' : radiology.attGroupNo}
		, dataType: 'json'
		, success : function(resp){
			let fileList = resp;
			let fileTags = []; let aTags = [];
			if(fileList.length > 0){
				$.each(fileList, function(idx, file){
					let filedata = "";
					let fileURL = `${cPath}/${file.attPath}/${file.saveName}`
					if(file.attType.startsWith('image')){
						filedata = $('<img>').attr('src' , `${fileURL}`);
					}else if(file.attType.startsWith('video')){
						filedata = $('<video>').attr('src',  `${fileURL}`).prop('controls', true);
					}
					let atag = `<br><a href="${fileURL}" download='${file.orignName}'>${file.orignName}</a>`;
					aTags.push(atag);
					fileTags.push(filedata);
				})
			}else{ fileTags = `<p>등록된 파일이 없습니다.</p>`}
			rsData.empty().append(fileTags,'<br>',aTags );
			rsDiv.empty().append(resultDiv.show()).show();
			workContent.hide();
		}
	}) // ajax 끝
})
let DisIngBtn = $(document).on('click', '.DisIngBtn', function () {
	preCheckBtn.hide();
	preChartListDiv.hide();
	patientInfoTable(); preChartDiv.hide(); 
	$(this).parents('.Wtr').find('td').eq(2).text('대기중')
	$(this).attr({'Class' : 'btn btn-outline-primary btn-sm callBtn'}).html('호출')
	
	$(".callBtn").prop('disabled', false);

	orderTables.empty();
	orderTableInfo();
	orderDate.hide();
	Mtab.attr('class', 'nav-link').prop('disabled', false);
	Xtab.attr('class', 'nav-link active').prop('disabled', false);
})

let Xtab = $('#Xtab'); let xRayTab = $('#xRayTab');
let Mtab =  $('#Mtab'); let MRITab = $('#MRITab');
let xRayOrderKind = $('[name=xRayOrderKind]');
let MRIorderKind = $('[name=MRIorderKind]');
// form태그에 orderkey setting 하고 전송버튼 활성화
let checkOk = $(document).on('click', '#checkOk', function () {
	preChartDiv.hide();
	let orderKind = $(this).data('orderKind');
	let Btndata = $(this).data('orderKey');
	if(orderKind == 'O003'){// xray order
		if(radOrderCont<2){
			Mtab.prop('disabled', true);
		}
		xRayorderKey.val(Btndata); xRayOrderKind.val(orderKind);
		Mtab.attr('class', 'nav-link'); MRITab.attr('class', 'tab-pane');
		Xtab.attr('class', 'nav-link active'); xRayTab.attr('class', 'tab-pane active');
	}else{//mri order
		if(radOrderCont<2){
			Xtab.prop('disabled', true).attr('class', 'nav-link');
		}
		MRIorderKey.val(Btndata); MRIorderKind.val(orderKind)
		Xtab.attr('class', 'nav-link');  xRayTab.attr('class', 'tab-pane')
		Mtab.attr('class', 'nav-link active'); MRITab.attr('class', 'tab-pane active');
	}
	
	workContent.show(); rsDiv.hide();
	saveBtn.prop('disabled', false);

}).hide();


let getRadiologyData = (Key) => {
	$.ajax({
		url: `${cPath}/radiology/getradiologyData`
		, type: 'get'
		, dataType: 'json'
		, data: { "orderKey": Key }
		, async : false
		, success: function (resp) {
			radiologyData = resp;
			if (radiologyData.orderKey != null){
				return radiologyData;
			} else{
				return null;
			}
		}
	})
}
let radOrderCont = 0;
let ck_disease = $('#ck_disease');
let ck_mediList =$('#ck_mediList');
// 과거 차트 조회
$(document).on('click', '.showPreChartBtn', function () {
	radOrderCont = 0;// 영상 오더 개수 초기화
	uploadreset();
	let preCTr = $(this).parents('.preCTr').data('source');
	// 업로드 화면 초기화
	orderDate.show().css('font-size', '0.8rem');
	mChartDate.empty().append(fn_date(new Date(preCTr.chartDate)));// 날짜 셋팅
	mChartNo.empty().append(preCTr.chartKey) // 차트번호 셋팅
	let orderList = preCTr.orderHistoryList;
	let tableTags = [];

	let dis = "";
	if(preCTr.dianosis.diagnosisKey != null){
		dis = `<tr><td>${preCTr.dianosis.diagnosisKey}</td><td>${preCTr.dianosis.diease.diseaseNmKr}</td></tr>`;
	}else{
		dis = `<tr><td colspan='2'>해당 차트의 진단내역이 없습니다.</td></tr>`;
	}
	ck_disease.empty().append(dis);
	let prescriptList = preCTr.prescriptList
	let prescriptTags = [];
	if(prescriptList.length > 0){
		$.each(prescriptList, function(idx, prescript){
			if(prescript.prescriptionKey !=null){
				let trs = $('<tr>').append(
					$('<td>').html(prescript.prescriptionNo)
					, $('<td>').html(prescript.prescriptionName)
					, $('<td>').html(prescript.prescriptionEa)
					, $('<td>').html(prescript.prescriptionDay)
					, $('<td>').html(prescript.prescriptionTotal)
				)
				prescriptTags.push(trs);
			}else {prescriptTags = `<tr><td colspan='5'>해당 차트의 처방 내역이 없습니다.</td></tr>`; }
		})
	}
	ck_mediList.empty().append(prescriptTags);

	preChartDiv.empty().append(preChartForm.show()).show();
	resultDiv.hide();
	for(let i =0; i<orderList.length; i ++){
		let order = orderList[i];
		let radiology = order.radiology;
			if (order.orderKey != null) { // 오더리스트에 오더키가 있다면
				if(order.orderKind == "O003" || order.orderKind == "O004"){
					radOrderCont ++;
					let bodyPartName = "";
					$.each(bodyListAll, function (i, body) {
						if (body.code == order.bodyPartKey) bodyPartName = body.codeName
					})
					getRadiologyData(order.orderKey);// 데이터로 찾기
					
					let makeBtn = ""
					if(radiologyData.radRecode != null){
						if(radiologyData.attGroupNo != null){
							makeBtn = $('<button>').attr('class', 'btn btn-success btn-sm resultBtn').html('영상자료 조회').data('radiology', radiology);
						}
					}else{
						makeBtn = $('<button>').attr({'class' : 'btn btn-success btn-sm', 
										'id' : 'checkOk'}).html('영상자료 등록').data('orderKey', order.orderKey).data('orderKind', order.orderKind);
					}
					// 오더의 종류가 xray나 MRI라면
					let tables = $('<table>').append($('<tbody>').append(
											$('<tr>').append($('<th>').html('차트번호'), $('<td>').html(preCTr.chartKey)
															, $('<th>').html('오더번호'), $('<td>').html(order.orderKey))
											, $('<tr>').append($('<th>').html('촬영종류'), $('<td>').html(order.equipmentName)
															, $('<th>').html('촬영부위'), $('<td>').append(bodyPartName, '<br>',makeBtn))
											)).attr('class', 'table table-bordered');
					tableTags.push(tables);
				} else { continue; }
			} else {// 오더키가 없다면
				tableTags = `<p>해당 차트에 촬영 오더가 없습니다.</p>`;
			}
	}// for 끝;
	orderTables.empty().append(tableTags);
	workContent.hide();
});


// 예진표 조회
let preDisIngfoPatient = $('#preDisIngfoPatient')
let preDisInfotable = $('#preDisInfotable')
let preCheckBtn = $('#preCheckBtn').on('click', function () {
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
	if (preDisagnosis.preDiagnosisKey != null) {
		let tr2 = [
			$('<tr>').append($('<th>').html("수술경험"), $('<td>').html(preDisagnosis.preDiagnosisExperience))
			, $('<tr>').append($('<th>').html("질환여부"), $('<td>').html(preDisagnosis.preDiagnosisDisease))
			, $('<tr>').append($('<th>').html("특이체질/알러지"), $('<td>').html(preDisagnosis.preDiagnosisAllergy))
			, $('<tr>').append($('<th>').html("임신여부"), $('<td>').html(preDiagnosisPregnancy))
			, $('<tr>').append($('<th>').html("병원선택 이유"), $('<td>').html(preDisagnosis.preDiagnosisChoice))
		]
		trTags2 = tr2;
	} else { trTags2 = `<tr><td colspan='2'>해당환자의 예진표가 등록되지 않았습니다.<td></tr>` }
	// 환자정보 입력 // 예진표 정보 입력
	preDisIngfoPatient.empty().append(trTags1); preDisInfotable.empty().append(trTags2);
}).hide();
$(document).on('click', '.callBtn', function () {

	$(this).attr('Class' , 'btn btn-outline-danger btn-sm DisIngBtn');
	$(this).parents('.Wtr').find('td').eq(2).text('촬영중');
	$('.callBtn').prop('disabled', true);// 호출버튼을 다시 찾아서 다른 호출 버튼 disabled 해주기
	let waiting = $(this).parents('.Wtr').data("waiting")
	let patient = waiting.receipt.patient;
	let empName = waiting.receipt.empName;
	receiptKey.val(waiting.receiptKey); empKey.val(waiting.receipt.empKey);
	preChartListDiv.show();
	preCheckBtn.data('patient', patient);
	preCheckBtn.show();

	let type = "";
	switch (patient.patientType) { case "PK01": type = "VIP"; break; case "PK02": type = "일반환자"; break; case "PK01": type = "관심환자"; break; };
	let Ptr = `<tr><td>${patient.patientName?? ""}</td><td>${patient.patientRegno1?? ""}</td><td>${patient.patientAge?? ""}</td><td>${type}</td></tr><tr><th>증상</th><td colspan="3">${waiting.receipt.receiptReason ?? ""}</td></tr>`;
	$('#PInfoTbody').empty().append(Ptr);

	//-----과거 진료차트
	$.ajax({
		url: `${cPath}/medicalChart/preChartList`
		, type: 'get'
		, dataType: 'json'
		, data: { "patientKey": patient.patientKey }
		, success: function (resp) {
			let preChartTags = [];
			
			let radcheckcolor = "";
			if(resp.length > 0){
				$.each(resp, function(idx,preChart ){
					switch(preChart.radOrderCheck){
						case "촬영오더 수행필요" : radcheckcolor = 'red'; break;
						case "촬영오더 수행완료" : radcheckcolor = 'blue'; break;
						case "촬영오더 없음" : radcheckcolor = 'black'; break;
					}
					let radcheck = $('<span>').css('color', radcheckcolor).html(preChart.radOrderCheck);
					let preChartTrs = $('<tr>').append(
						 $('<td>').html(preChart.chartKey)
						, $('<td>').html(fn_date(new Date(preChart.chartDate)))
						, $('<td>').html(empName)
						, $('<td>').append( radcheck, '<br>'
									,$('<input:button>').addClass('btn btn-primary btn-sm showPreChartBtn').html("진료차트"))
					).addClass('preCTr').data('source', preChart)
					preChartTags.push(preChartTrs)

				});
			}else{ preChartTags = `<tr><td colspan='3'>과거 진료차트 내역이 없습니다.</td></tr>`;  }
			preChartListTB.empty().append(preChartTags);
		}
	})// ajax 끝
})
let xRayradCont = $('[name=xRayradCont]');
let xRayautoCnt = $('#xRayautoCnt').on('click', function(){
	xRayradCont.val('shoulder ac joint에 염증 관찰됨.');
});
let MRIradCont = $('[name=MRIradCont]');
let MRIautoCnt = $('#MRIautoCnt').on('click', function(){
	MRIradCont.val('L3 Intervertebral disc herniation 관찰됨.');
});


// 내부 스크롤 바 - 제이쿼리가 안먹혀요
var myElement = document.getElementById('mySimplebar');
new SimpleBar(myElement, { autoHide: true });