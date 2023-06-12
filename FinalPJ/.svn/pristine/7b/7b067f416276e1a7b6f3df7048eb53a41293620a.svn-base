<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	.item-header {
            color: gray;
        }
	.rtBtn {
		float: right;
	}
	.nav-tabs .nav-link.active {
		background-color: #405189;
		color: white;
	}
	input[type=file] {
		width: 300px;
	}
	#mySimplebar {
		border: 1px solid gray;
		width: 100%;
		max-height: 200px;
	}
	table {
		text-align: center;
	}
	.saveBtn , .resetBtn{
		float: right;
	}
	video{
		width: 500px;
	}
	image{
		width: 500px;
		height: 500px;
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
	
</style>

<div class="grid-stack"><!-- grid 시작 -->

	<div class="grid-stack-item item" gs-x="0" gs-y="0" gs-w="3" gs-h="5">
		<div class="grid-stack-item-content">
				<div class="item-header"><h5>대기환자 목록</h5><hr></div>
				<div class="item-body">
					<h6>- 영상학과 <span id="waitingCont" style="float: right;"></span></h6>
				<table class="table table-bordered">
					<thead>
						<th style="width: 12%">번호</th>
						<th style="width: 22%">환자이름</th>
						<th style="width: 22%">대기상태</th>
						<th style="width: 22%">오더종류</th>
						<th style="width: 22%">호출</th>
					</thead>
					<tbody id="waitingTB"></tbody>
				</table>
			</div>
		</div>
	</div> <!-- x-Ray 대기환자 조회 -->

	<div class="grid-stack-item item" gs-x="3" gs-y="0" gs-w="4" gs-h="5">
		<div class="grid-stack-item-content">
				<div class="item-header"><h5>환자 정보 및 예진표</h5><hr></div>
				<div class="item-body">
				<h6>- 환자 정보
					<button type="button" class="btn btn-outline-primary btn-sm rtBtn" id="preCheckBtn" 
						data-bs-toggle="modal" data-bs-target="#preCheckModal">예진표확인</button>
				</h6><div id="pInfo"></div><hr>
				<div id="preChartListDiv">
					<hr>
					<h6>- 과거 진료차트 목록</h6>
						<div id="mySimplebar">
							<table class="table table-bordered">
								<thead><th>차트번호</th><th>작성일</th><th>담당의</th><th>차트조회</th></thead>
								<tbody id="preChartList"></tbody>
							</table>
						</div>
					</div>
				<hr>
				<h6>- 오더내역
					<div id="orderDate" style="float: right; display: inline;">
						작성날짜 : <span class="mChartDate"></span></div>
				</h6>
				<div id="orderTables">
					<table class="table table-bordered">
						<tbody>
							<tr>
								<th>차트번호</th><td></td><th>오더번호</th><td></td>
							</tr>
							<tr>
								<th>촬영종류</th><td></td><th>촬영부위</th><td></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div><!-- 환자정보 끝 -->


	<div class="grid-stack-item item" gs-x="8" gs-y="0" gs-w="5" gs-h="5">
		<div class="grid-stack-item-content">
				<div class="item-header"><h5>촬영업무</h5><hr></div>
				<div class="item-body">
					<div id="preChartDiv"></div><!-- 과거 진료차트 확인-->
					<div id="rsDiv"></div><!-- 결과 자료 조회 -->
					<div id="workContent">
						<!-- Nav tabs -->
						<ul class="nav nav-tabs mb-3" role="tablist" style="font-size: 10px;">
							<li class="nav-item">
								<a class="nav-link active" data-bs-toggle="tab" href="#xRayTab" role="tab"
									aria-selected="false" id="Xtab">
									x-Ray
								</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" data-bs-toggle="tab" href="#MRITab" role="tab"
									aria-selected="false" id="Mtab">
									MRI
								</a>
							</li>
						</ul>
						<!-- Tab panes -->
						<form class="insertForms" method="post" enctype="multipart/form-data">
						<div class="tab-content  text-muted">
							<div class="tab-pane active" id="xRayTab" role="tabpanel">
										<input type="hidden" value="" name="xRayOrderKind">
										<input type="hidden" value="${authEmp.empKey}" name="radEmp">
										<input type="hidden" value="" name="receiptKey">
										<div id='xRaybtngroup'>
											<input type="reset" class="btn btn-outline-danger btn-sm resetBtn" value="취소">
											<input type="button" value="전송" id='saveXray' style="margin-left: 5px;" class="btn btn-outline-primary btn-sm saveBtn">
										</div><br>
										<p>오더번호 : <input type="text" class="form-control input-sm" style="font-size:10px; width: 130px; display: inline; border: none;" readonly name="xRayorderKey"></p>
										<p>담당자 : ${authEmp.empName}</p>
										<div id="imgDiv"></div><br>
										<h6>- 의료진 코멘트
											<input type="button" value="자동완성" id="xRayautoCnt" class="btn btn-outline-primary btn-sm rtBtn">
										</h6>
										<div id="coment">
											<textarea rows="5" cols="50" class="form-control" name="xRayradCont"></textarea>
										</div>
										<br>
										<input class="form-control input-sm" accept="image/*" onchange="loadFile(this)" multiple type="file" name="xrayFile" style="font-size: 10px;"><br>
									<!-- </form> -->
							</div>

							<div class="tab-pane" id="MRITab" role="tabpanel">
									<!-- <form class="insertForms" method="post" enctype="multipart/form-data"> -->
										<input type="hidden" value="" name="MRIorderKind">
										<input type="hidden" value="" name="empKey">
										<input type="hidden" value="" name="receiptKey">
										<div id='MRIbtngroup'>
										<input type="reset" class="btn btn-outline-danger btn-sm resetBtn" value="취소"></div>
										<input type="button" value="전송" id='saveMRI' style="margin-left: 5px;" class="btn btn-outline-primary btn-sm saveBtn" >
										<br>
										<p>오더번호 : <input type="text" style="font-size:10px; width: 130px; display: inline; border: none;" class="form-control input-sm"  readonly name="MRIorderKey"></p>
										<p>담당자 : ${authEmp.empName}</p>
											<div id="videoDiv"></div><br>
										<h6>- 의료진 코멘트
											<input type="button" value="자동완성" id="MRIautoCnt" class="btn btn-outline-primary btn-sm rtBtn">
										</h6>
										<div id="coment">
											<textarea rows="5" cols="50" class="form-control" name="MRIradCont"></textarea>
										</div>
										<br>
										<input class="form-control" multiple accept="video/*" type="file" name="MRIFile" onchange="loadFile(this)" style="font-size: 10px;"><br>
									</div>
								</div><!-- tab 끝 -->
							</form>
				</div>
			</div>
		</div>
	</div><!-- 촬영 자료 업로드 끝 -->

</div><!-- grid stack끝-->


<div id="preChartForm">
	<h6>-진료차트 조회
		<input type="button" id="closepreChartBtn" class="btn btn-outline-danger btn-sm rtBtn" value="닫기">
	</h6>
	<div style="font-size: 11px;">&nbsp;&nbsp;&nbsp;차트번호 : <span class="mChartNo"></span></div>
	<div style="font-size: 11px;">&nbsp;&nbsp;&nbsp;작성날짜 : <span class="mChartDate"></span></div>
	<br>
	<h6>- 진단내역</h6>
		<table class="table table-bordered">
			<thead><tr><th>상병코드</th><th>상병명</th></tr></thead>
			<tbody id="ck_disease"></tbody>
		</table>
	<hr>
	<h6>-처방내역</h6>
		<table class="table table-bordered">
			<thead><tr><th>약품코드</th><th>약품명</th><th>단위</th><th>일투</th><th>총투</th></tr></thead>
			<tbody id="ck_mediList"></tbody>
		</table>
		<hr>
</div>


<div id="resultDiv">
	<h5>- 영상 자료 결과 조회
		<input type="button" id="closeBtn" class="btn btn-outline-danger btn-sm rtBtn" value="닫기">
	</h5>
	<div id="radInfo"></div>
	<p>- 의료진 코멘트</p>
	<textarea rows="3" cols="50" id="rsCont" class="form-control" readonly></textarea>
	<br>
	<div id="rsData"></div>
</div>


<!-- 예진표 Modal -->
<div class="modal fade" id="preCheckModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
	aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title fs-5" id="staticBackdropLabel">예진표</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body" id="preDisModalBody">
				<table class="table table-bordered">
					<thead>
						<th>번호</th>
						<th>이름</th>
						<th>나이</th>
					</thead>
					<tbody id="preDisIngfoPatient"></tbody>
					<br>
				</table>
				<table class="table table-bordered">
					<tbody id="preDisInfotable"></tbody>
				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-outline-secondary btn-sm" data-bs-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>


<script>
let cPath = '${cPath }';
let authEmpKey = `${authEmp.empKey}`;
let headerName =  `${_csrf.headerName}`;
let token = `${_csrf.token}`;
</script>

<script src="${cPath}/resources/js/mainAppjs/radiologyPage.js"></script>