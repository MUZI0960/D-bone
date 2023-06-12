<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>
<style>
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


	/* 정민 css 시작*/
	.jinryoTable{
		border: 2px solid greenyellow;
		font-size: 12px;
	}

	.jinryoTable > tbody > th, td {
		padding-top: 10px;
		padding-left: 30px;
		padding-right: 40px;
	}
</style>


<div class="grid-stack"><!-- 그리드스택 공간 -->

	
	<!-- 병원에 방문한 적이 있고 진료가 끝난 환자 목록 -->
	<div class="grid-stack-item" gs-x="1" gs-y="0" gs-w="3" gs-h="5">
		<div class="grid-stack-item-content">
			<div class="">
				<h5 style="display: inline-block; margin-right: 120px;">환자 목록</h5> 
				<input id="searchPatient" type="text" placeholder="검색할 환자를 입력하시오">
				<hr />
			</div>
			<div class="" id="">
				<span></span>
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>환자번호</th>
							<th>이름</th>
							<th>생년월일</th>
						</tr>
					</thead>
					<tbody id="jrcPatient"></tbody> <!-- 진료확인서 뽑기 위한 환자 목록 -->
				</table>
			</div>
		</div>
	</div>


	<!-- 환자목록에서 클릭했을 때 해당 환자에 대한 진료확인서 미리보기로 띄워주기 -->
	<div class="grid-stack-item" gs-x="4" gs-y="0" gs-w="7" gs-h="5">
		<div class="grid-stack-item-content">
			<div class="">
				<h5>진료 확인서</h5> 
				<hr />
			</div>
			<table class="table table-bordered">
				<tbody>
					<tr>
						<td>이름</td><td>하하하</td>
					</tr>

					<tr>
						<td>성별</td><td>M</td>
					</tr>
					<tr>
						<td>주민번호 앞자리</td><td>890101</td>
					</tr>
					<tr>
						<td>휴대폰 번호</td><td>010-7777-8888</td>
					</tr>
					<tr>
						<td>주소</td><td>세종특별자치시 가름로 194 </td>
					</tr>
					<tr>
						<td>차트 번호</td><td>C00122</td>
					</tr>
					<tr>
						<td>차트 내용</td><td></td>
					</tr>
					<tr>
						<td>진료 내용</td><td>폐렴알균성 관절염 및 다발관절염</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>


</div>
<script>
	// 그리드스택 기본설정
	var grid = GridStack.init({});




	// 수납을 기다리는 환자 대기목록 불러오기  waitingList()-------------------------정민-------------------------------------
	const jrcPatient = $("#jrcPatient");	// 대기목록 테이블 tbody 선택

	const waitingList = () => {

		$.ajax({
			type: "get",
			url: "${cPath}/patient/jinryoChartList",
			dataType: "json",
			success: function(jrcList){
				console.log("jrcList : ", jrcList);

				jrcPatient.empty();	// 데이터 잘 받아왔다면 초기화 한번 해주기

				$.each(jrcList, function(i, jrc){	// 대기목록환자 반복문 돌려서 tr, td태그 만들기

					let tr = $('<tr>')
						.on('click', function(){fn_jrcTrClick(this, jrc);}
						)
						.attr('class','trTags')
						.append(
							$('<td>').attr('class','dataValue1').html(jrc.patientKey),	// 환자키
							$('<td>').attr('class','dataValue2').html(jrc.patientName),	// 환자이름
							$('<td>').html(jrc.patientRegno1)
						)
						.data("waitingListData", jrcList);	// 다른데서 사용할 수 있으니 wpl 저장해두기

						jrcPatient.append(tr);

				})

			},
			error: function(request, status, error){
				console.log("code : ", request.state);
				console.log("message : ", request.responseText);
				console.log("error : ", error);
			}
		})

	};	waitingList();
	// ----------------------------------------------------------------------정민------------------------------------------

	// 환자목록에서 trTag 클릭 ---------------------------------------------------정민------------------------------------------
	const fn_jrcTrClick = () => {
		alert("클릭 체킁");
	}
	
	// 환자목록 검색기능 시작------------------------------------------------------정민------------------------------------------
	const searchPatient = $("#searchPatient");	// 검색 input창 셀렉

	searchPatient.on('keyup', function () {	// keyup 이벤트 추가하기

		let searchValue = searchPatient.val().toUpperCase();	// 입력받은 값 다 대문자화하기
		let trTags = $('.trTags');	// trTags클래스 선택

		$.each(trTags, function (i, v) {

			let dataValue1 = $(this).find(".dataValue1").html();
			let dataValue2 = $(this).find(".dataValue2").html();
			if (dataValue1.toUpperCase().indexOf(searchValue) > -1) {
				$(this).show();
				return;
			} else {
				$(this).hide();
			}
			
			if (dataValue2.toUpperCase().indexOf(searchValue) > -1) {
				$(this).show();
			} else {
				$(this).hide();
			}

		})
	})
	// 환자목록 검색기능 시작------------------------------------------------------정민------------------------------------------


	// 진료차트에 들어갈 내용! POI로 출력할 내용 보여주기
	$.ajax({
		url: "${cPath}/patient/medicalCertificate",
		type: "get",
		data: {"patientKey" : "P00045"},
		dataType: "json",
		success: function (res) {
			console.log(res);
		}
	})

</script>