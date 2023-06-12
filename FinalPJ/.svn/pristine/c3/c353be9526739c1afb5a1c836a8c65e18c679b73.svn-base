<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <meta id="_csrf" name="_csrf" th:content="${_csrf.token}" />
    <meta id="_csrf_header" name="_csrf_header" th:content="${_csrf.headerName}" />
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 <style>
 	.card{
 		background-color: #edf2f5;
 		width: 80%;
 		margin: 0 auto;
        box-shadow: 2px 2px 3px gray;
 	}
 	.table th{
 		width: 150px;
 		text-align: center;
 	}
    .updateButton {
        margin-right: 20px;
        float: right;
    }
    .empInfoDiv{
        margin: 0 auto;
    }
    .empImage{
    	width : 300px;
    	height : 350px;
    	margin-right : 10%;
    	float: right;
    }
    .empImageUpdateButton{
    	width: 100%;
    	margin-top: 10px;
    }
    .modal{
    --vz-modal-width : 900px;
    }
    h5{
		text-align: center;
		font-weight: bold;
	}
    .item-header {
            color: gray;
    }
    #empProfilDiv, #empProfilTitle{
        text-align: center;
        font-size: 1.1em;
    }
    #uploadImg{
        margin-top: 20px;
        width: 300px;
        float: right;
        margin-right: 60px;
    }
 </style>



<div class="grid-stack">
    <div class="grid-stack-item item" gs-x="1" gs-y="4" gs-w="10" gs-h="5">
        <div class="grid-stack-item-content">
            <h5 id="myPageHeader" style="float: left;">마이페이지</h5>
            <br>
            <hr>
            <div class="item-body">
                <input type="button" class="btn btn-outline-primary updateButton" value="정보수정">
                <br><br>
                <form id="empUpdateForm" method="post" enctype="multipart/form-data">
                    <div class="row empInfoDiv">
                        <div class="col-6">
                            <div id="empImgMypage"></div><br><br>
                            <input type="hidden" name="empFileGroupNo">
                            <input type="file" id="uploadImg" accept="image/*" name="filename" class="form-control" onchange="loadFile(this)">
                        </div>
                        <div class="col-6">
                            <div id="updateFormDiv"></div>
                            <div id="empInfoTable"></div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div id="myupdateFormDiv" style="width: 80%">
    <div class="row  g-3">
            <div class="col-xl-12">
                <div>
                    <label for="empKeyLabel" class="form-label">사원코드</label> 
                    <input type="hidden" class="form-control" name="empKey">
                    <input type="text" class="form-control" name="empKey" disabled>
                </div>
            </div>
            <br>
            <!--end col-->
            <div class="col-xl-12">
                <label for="empKeyLabel" class="form-label">아이디</label> 
                <input type="text" class="form-control" name="empId" id="formEmpId">
            </div> <br>
        <!--end col-->
        <div class="col-xxl-12">
            <div>
                <label for="empName" class="form-label">사원명</label> 
                <input type="text" class="form-control" name="empName" id="formEmpName" disabled>
            </div>
        </div> <br>
        <!--end col-->
        <div class="col-xxl-12">
            <div>
                <label for="empHireDate" class="form-label">입사일</label> 
                <input type="text" class="form-control" name="empHireDate"  disabled>
            </div>
        </div> <br>
        <!--end col-->
        <div class="col-xxl-12">
            <div>
                <label for="empRegno1" class="form-label">주민등록번호</label> 
                <input type="text" class="form-control" name="empRegno1" disabled>
            </div>
        </div> <br>
        <!--end col-->
        <div class="col-xxl-12">
            <div>
                <label for="empPn" class="form-label">연락처</label> 
                <input type="text" class="form-control" name="empPhone" placeholder=" ' - ' 없이 입력하시오." oninput="autoHyphen2(this)">
            </div>
        </div>
        <!--end col-->
        <div class="col-xxl-12">
            <div>
                <label for="empAddr" class="form-label">주소</label>
                <BUtton type="button" class="btn btn-outline-primary btn-sm" name="addressAPI"
                onclick="getAddressByAPI(this)" >주소 검색</BUtton> 
                <input type="text"  class="form-control" name="empAddr" placeholder="주소">
            </div>
        </div> <br>
        <!--end col-->
        <div class="col-xxl-12">
            <div>
                <label for="patientSignificant" class="form-label">상세주소</label>
                <input type="text" class="form-control" name="empAddrDetail"
                    placeholder="저장된 데이터가 없습니다">
            </div>
        </div> <br>
        <!--end col-->
        <div class="col-lg-12">
            <div class="hstack gap-2 justify-content-end">
                <input type="button" class="btn btn-light closeBtn"  value="등록취소">
                <input type="submit" class="btn btn-primary"  value="저장">
            </div>
        </div>
    </div>
</div>    



<script>
let myupdateFormDiv = $('#myupdateFormDiv').hide();
var grid = GridStack.init({});// 그리드스택
let empJopMap = {
                    "J001": { text: "원무과" },
                    "J002": { text: "의사" },
                    "J003": { text: "간호사" },
                    "J004": { text: "물리치료사" },
                    "J005": { text: "도수치료사" },
                    "J006": { text: "영상촬영사" },
                    "MASTER": { text: "마스터" }
                };
let empImgMypage = $('#empImgMypage');
let empProfilDiv = $('#empProfilDiv');
let empDetail = null;
let empInfoTable = $('#empInfoTable');
let makeEmpInfoTable = (empDetail) =>{
let empJob = empJopMap[empDetail.empJob].text;
let empAddress = `\${empDetail.empAddr} \${empDetail.empAddrDetail}`;
let empReg = `\${empDetail.empRegno1}-\${(empDetail.empRegno2 + "").substring(0, 1)}******`
let table = `<table class='table table-hover'>
                <tr><th>사원코드</th><td>\${empDetail.empKey}</td></tr>
                <tr><th>아&nbsp;이&nbsp;디</th><td>\${empDetail.empId}</td></tr>
                <tr><th>이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름</th><td>\${empDetail.empName}</td></tr>
                <tr><th>나&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이</th><td>\${empDetail.empAge}</td></tr>
                <tr><th>전화번호</th><td>\${empDetail.empPhone}</td></tr>
                <tr><th>주민번호</th><td>\${empReg}</td></tr>
                <tr><th>주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소</th><td>\${empAddress}</td></tr>
                <tr><th>직&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;무</th><td>\${empJob}</td></tr>
                <tr><th>입&nbsp;&nbsp;사&nbsp;&nbsp;일</th><td>\${empDetail.empHireDate.substring(0,10)}</td></tr>
                </table>`;
return empInfoTable.empty().append(table);
}


let fn_date = (daySet) => {
    var year = daySet.getFullYear();
    var month = ('0' + (daySet.getMonth() + 1)).slice(-2);
    var day = ('0' + daySet.getDate()).slice(-2);
    var dateString = `${year}-${month}-${day}`;
    return dateString; //날짜 반환
}
let loadFile = (acc)=>{//업로드 파일 미리보기
let fileList = acc.files;
let imgData = "";
let fileURL = "";
if(fileList.length > 0){
    let file = fileList[0];
    fileURL = URL.createObjectURL(file);
}else{
    fileURL = '${cPath}/upload/empProfil/noImage.jpg';
}
imgData = $('<img>').attr('src', fileURL ).addClass('rounded-circle empImage');
empImgMypage.empty().append(imgData);
}

let uploadImg = $('#uploadImg').hide();
let updateButton = $('.updateButton').on('click', function(){
    uploadImg.show();
    let empReg = `\${empDetail.empRegno1}-\${(empDetail.empRegno2 + "").substring(0, 1)}******`;
    empUpdateForm.find('#updateFormDiv').empty().append(myupdateFormDiv.show());
    empInfoTable.empty(); updateButton.hide();
    let ipList = empUpdateForm.find('[type=text], [type=hidden]');
    for(let i =0; i< ipList.length; i ++){
        let input = ipList[i];
        let inputName = input.name;
        if(inputName=='empRegno1' ) {
            $(input).val(empReg);
        }else if(inputName == 'empHireDate'){
            $(input).val(empDetail.empHireDate.substring(0, 10));
        }else{
            $(input).val(empDetail[inputName]);
        }
    }
});

let closeBtn = $(document).on('click', '.closeBtn',  function(){
    empUpdateForm[0].reset(); updateButton.show();
    data(); myupdateFormDiv.hide(); uploadImg.hide();
});
let getmyEmpProfil = (empDetail) =>{
    let empFileNo = empDetail.empFileGroupNo;
}
let empProTopfilDivforMypage = $('#empProTopfilDiv');
let textImage = $('#textImage');
const data = ()  => {
    let empKey = `${authEmp.empKey}`
    let empImage = null;
    $.ajax({
        method: 'get',
        url: '${cPath }/detail?empKey=' + empKey,
        dataType: 'json',
        success: function (rslt) {
            if(rslt !=null){
                empDetail = rslt;
                makeEmpInfoTable(empDetail);
                let imgSrc = "";
                let text ="";
                
                // 이미지 정보
                if(empDetail.empFileGroupNo != null){
                    $.ajax({
                            url : `${cPath}/empProfilView`
                            , type : 'get'
                            , data : {'attGroupNo' : empDetail.empFileGroupNo}
                            , dataType: 'json'
                            , success : function(resp){
                                let file = resp
                                if(file.length > 0){
                                    empImage = file[0];
                                    imgSrc = `${cPath}/\${empImage.attPath}/\${empImage.saveName}`;
                                }
                                let imgMypage = `<img src="\${imgSrc}" class='rounded-circle empImage'>`;
                                let imgTag = `<img src="\${imgSrc}" style='width: 350px; border: 1px solid gray; margin:'0 auto;'>`;
                                let topBar = `<img src="\${imgSrc}" class='rounded-circle header-profile-user'>`;
                                empProTopfilDivforMypage.empty().append(topBar); //topbar
                                empProfilDiv.empty().append(imgTag, text); // 모달창
                                empImgMypage.empty().append(imgMypage);// 메인화면
                            }
                        });
                }else{
                    imgSrc = "${cPath}/upload/empProfil/noImage.jpg";
                    text = "<p style='margin : 0 auto;'>프로필 사진을 등록 해주세요.</p>";
                    let imgMypage = `<img src="\${imgSrc}" class='rounded-circle empImage'>`
                    let imgTag = `<img src="\${imgSrc}" style='width: 350px; border: 1px solid gray; margin:'0 auto;'>`;
                    let topBar = `<img src="\${imgSrc}" class='rounded-circle header-profile-user'>`;
                    empProTopfilDivforMypage.empty().append(topBar); //topbar
                    empProfilDiv.empty().append(imgTag, text); //메인화면
                    empImgMypage.empty().append(imgMypage); // 모달창
                }
            }
        },
    });
}
data();
let empFileGroupNo = $('[name=empFileGroupNo]');

// 셀렉트
let empUpdateForm = $("#empUpdateForm").on("submit", function (event) {
    event.preventDefault();
    let formData = new FormData(this);
    $.ajax({
        type: "post",
        url: "${cPath}/empUpdate",
        data: formData,
        dataType: "text",
        cache: false,
        contentType: false,
        processData: false,
        beforeSend: function (xhr) {  
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
        },
        success: function (rslt) {
            if(rslt == 'success'){
                $('[type=file]').val("");
                updateButton.show(); myupdateFormDiv.hide();
                Swal.fire("회원 정보 수정이 완료되었습니다.", "success");
                data(); uploadImg.hide();
                getEmpProfil();
            }else{
                Swal.fire("수정 실패!", "error");
            }
        }
    })
}); 
    
    
// 주소 API ----------------------------------------------------------------------------------------------------------------
function getAddressByAPI(target) {
    let form = $(target).parents('form');
    new daum.Postcode(
        {
            oncomplete: function (data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if (data.userSelectedType === 'R') {
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if (data.bname !== ''
                        && /[동|로|가]$/g.test(data.bname)) {
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if (data.buildingName !== ''
                        && data.apartment === 'Y') {
                        extraAddr += (extraAddr !== '' ? ', '
                            + data.buildingName : data.buildingName);
                    }
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                $('[name=empAddr]').val(addr);
                // 커서를 상세주소 필드로 이동한다.
                $('[name=empAddrDetail]').focus();
            }
        }).open();
}
</script>