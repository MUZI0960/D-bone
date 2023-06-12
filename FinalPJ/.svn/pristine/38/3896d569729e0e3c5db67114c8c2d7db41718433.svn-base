<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="security" %>


<style type="text/css">
	.orderCk, .S_orderCk{
		color : #0b670b;
	}
	.item-header {
            color: gray;
        }
	#mySimplebar {
		border: 1px solid rgb(190, 184, 184);
		width: 100%;
		max-height: 200px;
	}
	#waitingSimplebar{
		width: 100%;
		max-height: 650px;
	}
	#serchKeyWord, #SserchKeyWord{
		width: 130px;
		display: inline;
	}
	.rtBtn{
		float: right;
	}
	.pNum{
		width: 30px;
	}
	.nav-tabs .nav-link.active{
		background-color: #405189;
		color: white;
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
	
	.modal{
		--vz-modal-width: 1000px;
	}
	.form-select{
		width: 200px;
		display: inline;
		float: left;
	}
	#addGroupOrderTable th{
		width: 150px;
	}
	.groupList{
		font-size: 1.1em;
		display: inline-block;
	}
	#waitingCont{
		font-size: 0.8em;
	}
	.modal-body{
	 	padding: 30px;
	 }
	 video{
		width: 500px;
	}
	image{
		width: 500px;
		height: 500px;
	}
	#preCheckModal{
		--vz-modal-width: 600px;
	}
	#preDisInfotable th{
		width: 200px;
		background-color: #405189c7;
		color: white;
	}
</style>


 <div class="grid-stack">

	<div class="grid-stack-item  " gs-x="0" gs-y="0" gs-w="2" gs-h="5">
		<div class="grid-stack-item-content">
			<div class="item-header"><h5>대기환자목록</h5><hr></div>
			<div class="item-body">
				<div id="office waiting">
					<h6>- ${authEmp.officeName } <span id="waitingCont" style="float: right;"></span></h6><br>
					<div id="waitingSimplebar">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th style="width: 11%">No</th>
									<th style="width: 33%">환자명</th>
									<th style="width: 24%">상태</th>
									<th style="width: 32%">호출</th>
								</tr>
							</thead>
							<tbody id="waitingTB"></tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>


	<div class="grid-stack-item  " gs-x="2" gs-y="0" gs-w="3" gs-h="5">
		<div class="grid-stack-item-content">
				<div class="item-header"><h5>환자 정보 및 예진표</h5><hr></div>
				<div class="item-body">
			<h6>- 환자 정보
				<button type="button" class="btn btn btn-outline-success btn-sm rtBtn" id="preCheckBtn"
				data-bs-toggle="modal" data-bs-target="#preCheckModal" style="margin-bottom: 5px;">예진표 확인</button>
			</h6>
				<div id="pInfo"></div><hr>
					<div id="preChartDiv">
					<p>- 과거 진료차트 목록</p>
						<div id="mySimplebar">
							<table class="table table-bordered">
								<thead><th>접수번호</th><th>차트번호</th><th>작성일</th><th>차트조회</th></thead>
								<tbody id="preChartList"></tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
	</div>


	<div class="grid-stack-item  " gs-x="5" gs-y="0" gs-w="4" gs-h="5">
		<div class="grid-stack-item-content">
			<div class="item-header"><h5>진료차트</h5><hr></div>
			<div class="item-body">
				<div style="float: left; display: inline;">차트번호 : <span id="mChartNo"></span></div>
				<div style="float: right; display: inline;">작성날짜 : <span id="mChartDate"></span></div>
				<br><br>
				<h6>- 진단내역</h6>
			<form name="inputForm" method="post">
				<security:csrfInput/>
				<table class="table table-bordered">
					<thead><tr><th style="width: 20%;">상병코드</th><th>상병명</th></tr></thead>
					<tbody id="ck_disease"></tbody>
					<tfoot>
						<tr data-bs-toggle="modal" data-bs-target="#addDisModal" >
							<td colspan="2" ><i class="bx bx-plus-circle fs-22"></i></td>
						</tr>
					</tfoot>
				</table>
			</form>
				<hr><h6>-처방내역</h6>
				<form name="inputForm" method="post">
					<security:csrfInput/>
					<table class="table table-bordered">
						<thead><tr><th>약품코드</th><th>약품명</th><th>단위</th><th>일투</th><th style='width: 100px;'>총투</th></tr></thead>
						<tbody id="ck_mediList"></tbody>
						<tfoot><tr data-bs-toggle="modal" data-bs-target="#addMedicineModal" >
								<td colspan="5" ><i class="bx bx-plus-circle fs-22"></i></td>
								</tr></tfoot>
						</table>
				</form>
					<hr>
					<h6>-오더 내역</h6>
					<form name="inputForm" method="post">
						<div id="orderDiv">
						<table class="table table-bordered" id="preOrderTable">
							<thead><tr><th>오더번호</th><th>오더종류</th><th>치료부위/수술명</th><th>사용장비</th></tr></thead>
							<tbody id='preOrderList'></tbody>
						</table><!--기존 오더 테이블-->

						<table class="table table-bordered" id="orderTable">
							<thead><tr><th>오더종류</th><th colspan="2">오더내용</th></tr></thead>
							<tbody id="orderList"></tbody>
						</table>
						</div>
					</form>
					<div id="mChartBtns">
						<input type="button" value="저장" id="saveChartBtn" class="btn btn-outline-primary btn-sm rtBtn" >
						<input type="button" value="닫기" id="closeChartBtn" class="btn btn-outline-danger btn-sm rtBtn" >
					</div> 
				</div>
			</div>
	</div>
		<div class="grid-stack-item " gs-x="10" gs-y="0" gs-w="3" gs-h="2" >
			<div class="grid-stack-item-content">
				<div class="item-header"><h5>진단 의사 소견</h5><hr></div>
					<div class="item-body">
						<div>
							<h6>의사 소견 및 진단내용
								<input type="button" value="자동완성" id="autoComent" class="btn btn-outline-primary btn-sm rtBtn" style="margin-bottom: 10px;">
							</h6>
							<textarea class="form-control" name="chartCont" cols="2" rows="5"></textarea>
						</div>
					</div>
				</div>
		</div>
					
		<div class="grid-stack-item" gs-x="10" gs-y="3" gs-w="3" gs-h="3" >
			<div class="grid-stack-item-content">
				<div class="item-header"><h5>오더선택</h5><hr></div>
					<div class="item-body">
					<!-- Nav tabs -->
					<ul class="nav nav-tabs mb-3" role="tablist" style="font-size: 11px;">
						<li class="nav-item">
							<a class="nav-link active" data-bs-toggle="tab" href="#radiologyTb" role="tab" aria-selected="false">
								영상</a></li>
						<li class="nav-item">
							<a class="nav-link" data-bs-toggle="tab" href="#therapyTb" role="tab" aria-selected="false">
								치료</a></li>
						<li class="nav-item">
							<a class="nav-link" data-bs-toggle="tab" href="#surgeryTb" role="tab" aria-selected="false">
								수술
							</a></li>
						<li class="nav-item">
							<a class="nav-link" data-bs-toggle="tab" href="#groupOrderTb" role="tab" aria-selected="false">
								그룹오더
							</a></li>
					</ul>
					<!-- Tab panes -->
					<div class="tab-content  text-muted">
						<div class="tab-pane active" id="radiologyTb" role="tabpanel">
							<table class="table table-bordered">
								<thead><tr><th>종류</th><th>오더선택</th></tr></thead>
								<tbody>
									<tr><th>x-Ray</th>
										<td><i class="bx bx-check-circle fs-22 orderCk"></i></td></tr>
									<tr><th>MRI</th>
										<td><i class="bx bx-check-circle fs-22 orderCk"></i></td></tr>
									</tbody></table> 
						</div>
						
						<div class="tab-pane" id="therapyTb" role="tabpanel"><!-- 물리치료 -->
							<table class="table table-bordered">
								<thead><tr><th>종류</th> <th colspan="2">오더 선택</th></tr></thead>
								<tbody>
									<tr><th>물리치료</th>
										<td><i class="bx bx-check-circle fs-22 orderCk"></i></td>
									</tr>
									<tr><th>도수치료</th>
										<td><i class="bx bx-check-circle fs-22 orderCk"></i></td></tr>
								</tbody>
							</table>
						</div>
						<div class="tab-pane" id="surgeryTb" role="tabpanel">
							<table class="table table-bordered">
								<thead><tr><th>수술코드</th><th colspan="2">수술 명칭</th></tr></thead>
									<tbody id="surgeryTBody">
									</tbody>
									<tfoot id="surgeryTf">
										<tr data-bs-toggle="modal" data-bs-target="#addsurgeryModal" >
											<td colspan="3" ><i class="bx bx-plus-circle fs-22"></i></td>
										</tr>
									</tfoot>
							</table> 
						</div>
						<div class="tab-pane" id="groupOrderTb" role="tabpanel">
							<a href="#!" id="addGroupOrder" data-bs-toggle="modal" data-bs-target="#groupOrderModal" 
								onclick="return false;" ><i class="ri-folder-open-fill"></i>&nbsp;그룹오더 관리</a>
							<br>
							<div class="groupOrderListDiv"></div>
						</div>
					</div> 
				</div><!-- tabs content 끝-->
			</div>
		</div>

</div><!-- grid-stack 끝-->


<!-- 예진표 Modal -->
<div class="modal fade" id="preCheckModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">예진표</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" id="preDisModalBody">
		<table class="table table-bordered">
			<thead><th>번호</th><th>이름</th><th>나이</th></thead>
			<tbody id="preDisIngfoPatient"></tbody>
			<br>
		</table class="table table-bordered">
		<table class="table table-bordered">
			<tbody id="preDisInfotable"></tbody>
		</table>
      </div>
	  <div class="modal-footer">
        <button type="button" class="btn btn-outline-primary btn-sm" data-bs-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>

<!-- 영상자료 체크 Modal -->
<div class="modal fade" id="radiologyCheckModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">영상결과 확인</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div id="radDiv">
		</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-outline-primary btn-sm" data-bs-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>

<!-- 그룹오더 추가 수정 삭제 Modal -->
<div class="modal fade" id="groupOrderModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel" style="text-align: center;">그룹오더 관리</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
		<!-- <div class="container text-center"> -->
			<div class="row">
				<div class="col-4">
					<div>
						<h5 style="text-align: center;">- 그룹오더 목록</h5>
						<hr>
						<div style="border: 1px solid rgb(209, 207, 207); text-align: center;">
							<span>그룹오더 목록 선택시</span><br>
							<span>해당 그룹오더 내용 수정 가능합니다.</span>
						</div>
						<br>
						<div class="groupOrderListDiv"></div>
					</div>
				</div>
				<div class="col-8">
					<form  id="addGroupOrderForm" style="font-size: 10px;">
						<h5 style="text-align: center;">- 그룹오더 관리 -
							<input type="hidden" name="groupOrderKey">
							<input type="submit" value="신규등록"  id="GOsaveBtn"  style="float: right; margin-left: 10px;" class="btn btn-outline-success btn-sm">
							<input type="button" value="취소" id="GOresetBtn" style="float: right;  margin-left: 10px; " class="btn btn-sm btn-outline-info">
							<input type="submit" value="수정" id="GOmodifyBtn" style="float: right; display: none;" class="btn btn-outline-danger btn-sm">
						</h5>
						<br>
						<table class="table table-bordered" id="addGroupOrderTable">
							<tr>
							<th valign="middle">그룹오더 작성</th>
							<td>
								<input type="text" name="groupOrderName" class="form-control" style="font-size: 10px;" value="" placeholder="그룹오더명 입력"/><br>
									<input type="text" name="diseaseKey" style="width: 150px; float: left; font-size: 10px;"
									 readonly class="form-control input-sm" placeholder="상병코드"/>
									<p style="margin-top: 10px; float: left;" id="groupDisName"></p><br><br>
								<div id="selectgoPrescriptList" style="display: block; float: left;"></div>
								<div id="groupOrderContent" style="display: block; float: left;">
									<textarea name="groupOrderContent" style="display: flex;font-size: 10px;" placeholder="내용을 입력하세요." 
									 class="form-control" cols="70" rows="3"></textarea>
								</div>
							</td>
							</tr>
							<tr><th valign="middle">상병코드</th>
								<td id="div_Divselect">
									<input type="text" name="keword" style="font-size: 10px;" class="form-control Dis_serchKeyWord" placeholder="진단명 검색" >
									<div id="groupDisbar" style="height: 150px;">
										<table class="table table-bordered">
											<thead><tr><th>상병코드</th><th>상병명</th></tr></thead>
											<tbody class="groupDislist">
											</tbody>
										</table>
									</div>
								</td>
							</tr>
							<tr><th valign="middle">처방코드</th>
								<td id="div_Prescriptselect">
									<input type="text" name="keword" style="font-size: 10px;" class="form-control searhMedicineInput"  placeholder="의약품코드/의약품명으로 검색" >
									<div id="groupMedibar" style="height: 150px;">
										<table class="table table-bordered">
											<thead><tr><th>의약품코드</th><th>의약품명</th><th>투여</th></tr></thead>
											<tbody class="groupmediList">
											</tbody>
										</table>
									</div>
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		<!-- </div>그리드 컨테이너 -->
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-outline-primary btn-sm" data-bs-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>

<!-- 진단내역 추가 Modal -->
<div class="modal fade" id="addDisModal" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">진단내역 추가</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" id="addModalBody">
		<div id="disListForm">
			<input type="text" name="keword" class="form-control Dis_serchKeyWord" placeholder="진단명으로 검색">
				<div id="Disbar" style="height: 600px; margin-top: 10px;">
				<table class="table table-bordered">
					<thead><tr><th style="width: 20%;">상병코드</th><th>상병명</th></tr></thead>
					<tbody class="Dislist">
					</tbody>
				</table>
			</div>
		</div>
	  </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-outline-primary btn-sm" data-bs-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>

<!-- 수술 모달 Modal -->
<div class="modal fade" id="addsurgeryModal" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">수술예약 추가</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
		<div>
			<input type="text" name="keword" class="form-control" id="Sur_serchKeyWord" placeholder="수술명 검색" >
			</div>
			<div id="sugerybar" style="height: 600px;">
			<table class="table table-bordered">
				<thead>
					<tr><th>수술코드</th><th>수술명</th><th>금액</th></tr>
				</thead>
				<tbody id="surgeryTB">
				</tbody>
			</table>
		</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-outline-primary btn-sm" data-bs-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>


<!-- 처방내역 추가 Modal -->
<div class="modal fade" id="addMedicineModal" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">처방내역 추가</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" id="addPrescriptModalBody">
		<div id="prescriptForm">
			<input type="text" name="keword" class="form-control searhMedicineInput" placeholder="의약품코드/의약품명으로 검색" >
				<div id="Medibar" style="height: 400px; margin-top: 10px;">
					<table class="table table-bordered">
						<thead><tr><th>의약품코드</th><th>의약품명</th><th style="width: 8%;">투여</th></tr></thead>
						<tbody class="mediList">
						</tbody>
					</table>
				</div>
			<div id="selectPList">
				<hr>
				<p>선택 약품</p>
				<div>
					<table class="table table-bordered">
						<thead><tr><th>약품코드</th><th>약품명</th><th>단위</th><th>일투</th><th colspan="2">총투</th></tr></thead>
						<tbody id="selectMedicineList"></tbody>
					</table>
				</div>
			</div>
		</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-outline-primary btn-sm" data-bs-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-outline-secondary btn-sm" data-bs-dismiss="modal" id="okMediBtn">확인</button>
      </div>
    </div>
  </div>
</div>

<script>
	let cPath = '${cPath}';
	let authOffice  = `${authEmp.officeKey}`;
	let authEmpKey  = `${authEmp.empKey}`;
	let headerName =  `${_csrf.headerName}`;
	let token = `${_csrf.token}`;
</script>

<script src="${cPath}/resources/js/mainAppjs/medicalChart.js"></script>