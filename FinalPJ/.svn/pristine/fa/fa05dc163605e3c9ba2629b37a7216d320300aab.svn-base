<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
      <%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
        <script src="${cPath }/resources/js/ckeditor/ckeditor.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

        <style type="text/css">
          .datatr:hover {
            background-color: #c1d3ba;
          }

          .datatr.active {
            background-color: #9aede3;
          }

          .grid1 {
            border-bottom: 2px solid black;
          }

          .grid1,
          .grid2 {
            padding: 10px;
            margin: 0px;
          }

          .grid-stack {
            height: 100hv;
          }

          #searchHead {
            text-align: center;
            font-size: 5em;
          }

          #empBoardBtn {
            float: right;
            margin: 10px;
          }

          #empBoardSubmitBtn {
            margin: 10px;
            float: right;
          }

          #empBoardTB {
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

          .jobSelect {
            width: 150px;
            height: 35px;
            background-size: 20px;
            padding: 5px 30px 5px 10px;
            border-radius: 4px;
            outline: 0 none;
          }
        </style>

        <!-- 직원 추가하기 모달 -->
        <div class="modal fade" id="addEmpModal" tabindex="-1" aria-labelledby="exampleModalgridLabel"
          aria-modal="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalgridLabel">직원 추가</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                <form id="empAddForm" enctype="multipart/form-data">
                  <div class="row g-3">
                    <div class="col-xl-12">
                      <div>
                        <label for="empKeyLabel" class="form-label">사원ID</label>
                        <!-- 나중에 중복검사하기 -->
                        <input type="text" class="form-control" name="empId" id="" value="inserttest" />
                      </div>
                    </div>
                    <div class="col-xl-12">
                      <div>
                        <label for="empKeyLabel" class="form-label">비밀번호</label>
                        <!-- 나중에 input	타입 pass로 바꾸기 -->
                        <input type="text" class="form-control" name="empPass" id="" value="java" />
                      </div>
                    </div>
                    <div class="col-xl-12">
                      <div>
                        <label for="empKeyLabel" class="form-label">사원이름</label>
                        <input type="text" class="form-control" name="empName" id="" value="인서트테스트" />
                      </div>
                    </div>
                    <div class="col-xl-12">
                      <div>
                        <label for="empKeyLabel" class="form-label">직업구분</label>
                        <br />
                        <select name="empJob" class="jobSelect" id="">
                          <option value="">선택하기</option>
                          <option value="J001">원무과</option>
                          <option value="J002">의사</option>
                          <option value="J003">간호사</option>
                          <option value="J004">물리치료사</option>
                          <option value="J005">도수치료사</option>
                          <option value="J006">영상촬영</option>
                        </select>
                      </div>
                    </div>

                    <div class="col-xl-6">
                      <div>
                        <label for="empKeyLabel" class="form-label">주민번호 앞자리</label>
                        <input type="text" class="form-control" name="empRegno1" id="" value="" />
                      </div>
                    </div>

                    <div class="col-xl-6">
                      <div>
                        <label for="empKeyLabel" class="form-label">주민번호 뒷자리</label>
                        <!-- 나중에 input	타입 pass로 바꾸기 -->
                        <input type="text" class="form-control" name="empRegno2" id="" value="1222222" />
                      </div>
                    </div>
                    <div class="col-xl-12">
                      <div>
                        <label for="empKeyLabel" class="form-label">전화번호</label>
                        <input type="text" class="form-control" name="empPhone" id="" value="01012345678" />
                      </div>
                    </div>
                    <div class="col-xl-12">
                      <div>
                        <label for="empKeyLabel" class="form-label">주소</label>
                        <input type="text" class="form-control" name="empAddr" id="" value="대전" />
                      </div>
                    </div>
                    <div class="col-xl-12">
                      <div>
                        <label for="empKeyLabel" class="form-label">상세주소</label>
                        <input type="text" class="form-control" name="empAddrDetail" id="" value="서구" />
                      </div>
                    </div>

                    <div class="col-xl-12">
                      <div>
                        <label for="empKeyLabel" class="form-label">퇴사일</label>
                        <input type="text" class="form-control" name="empRetireDate" id="" />
                      </div>
                    </div>
                    <div class="col-xl-12">
                      <div>
                        <label for="empKeyLabel" class="form-label">퇴사여부</label>
                        <br />
                        <input type="radio" name="empRetireCheck" value="N" /> 퇴사
                        <input type="radio" name="empRetireCheck" value="Y" checked="checked" />
                        재직중
                      </div>
                    </div>
                    <div class="col-xl-12">
                      <div>
                        <label for="empKeyLabel" class="form-label">프로필 사진</label>
                        <input class="form-control" accept="image/*" type="file" name="filename"><br>
                      </div>
                    </div>
                    <div class="col-xl-12">
                      <div>
                        <label for="empKeyLabel" class="form-label">면허번호</label>
                        <input type="text" class="form-control" name="empLicenseNo" id="" />
                      </div>
                    </div>

                    <div class="col-lg-12">
                      <div class="hstack gap-2 justify-content-end">
                        <button type="button" class="btn btn-light" data-bs-dismiss="modal" onclick="">
                          등록취소
                        </button>
                        <!-- 등록취소하면 작성중인 내용 지우기 -->
                        <button type="submit" class="btn btn-primary" data-bs-dismiss="modal">
                          저장
                        </button>
                      </div>
                    </div>
                  </div>
                  <!--end row-->
                </form>
              </div>
            </div>
          </div>
        </div>

        <div class="grid-stack">
          <!-- <div class="grid-stack-item" gs-x="0" gs-y="0" gs-w="12" gs-h="1">
              <div class="grid-stack-item-content">
              <div id="">
                <div id="searchHead">
                  <img alt="" src="${cPath }/resources/ajm/images/ddd.png" style="
              height: 150px;
              width: 372px;
              margin-bottom: -20px;
              margin-left: 40px;
            " />
                </div>
              </div>
            </div>
          </div> -->
          <div class="grid-stack-item" gs-x="1" gs-y="4" gs-w="10" gs-h="5">
            <div class="grid-stack-item-content">
              <div>
                <div id="empBoardHeader">
                  <h5 id="empH4">인사관리</h5>
                  <hr>
                  <div>
                    <input type="text" id="inputId"
                      style="width: 65%; float: left; height: 32px; margin-right: 5px; margin-bottom: 10px;"
                      class="form-control input-sm" placeholder="사원 검색">
                    <security:authorize access="hasAnyRole('ADMIN', 'MASTER')">
                      <button data-bs-toggle="modal" data-bs-target="#addEmpModal" class="btn btn-primary"
                        style="height: 32px; float:right; font-size: 11px; padding-top: 7px;">
                        직원 추가하기
                      </button>
                    </security:authorize>
                  </div>
                </div>
                <table id="empBoardTB" class="table table-bordered">
                  <thead>
                    <tr>
                      <th>사원번호</th>
                      <th>사원ID</th>
                      <th>사원명</th>
                      <th>나이</th>
                      <th>직업구분</th>
                      <th>주민번호</th>
                      <th>전화번호</th>
                      <th>주소</th>
                      <th>상세주소</th>
                      <th>입사일</th>
                      <th>면허번호</th>
                    </tr>
                  </thead>
                  <tbody id="listBody">
                    <!-- 공지사항 리스트 들어오는 위치 -->
                  </tbody>

                </table>
              </div>
            </div>
          </div>
        </div>

        <script>
          // GridStack ----------------------------------------------------------------------
          var grid = GridStack.init({});
          $("tbody:not(.disable)").on("click", ".datatr", function (event) {
            $(this).siblings(".datatr").removeClass("active");
            $(this).toggleClass("active");
          });
          //------------------------------------------------------------------------------------

          let fn_makeTr = function (emp) {
            let trs = $(
              "<tr data-bs-toggle='modal' data-bs-target='#exampleModalgrid'>"
            )
              .on("click", function () {
                trClick(emp);
              })
              .addClass("empTrtags")
              .append(
                $("<td>").addClass("dataValue1").html(emp.empKey),
                $("<td>").addClass("dataValue2").html(emp.empId),
                $("<td>").addClass("dataValue3").html(emp.empName),
                $("<td>").addClass("dataValue4").html(emp.empAge),
                $("<td>").addClass("dataValue5").html(emp.empJob),
                $("<td>").addClass("dataValue6").html(emp.empRegno1),
                $("<td>").addClass("dataValue7").html(emp.empPhone),
                $("<td>").addClass("dataValue8").html(emp.empAddr),
                $("<td>").addClass("dataValue9").html(emp.empAddrDetail),
                $("<td>").addClass("dataValue10").html(emp.empHireDate),
                $("<td>").addClass("dataValue11").html(emp.empRetireDate),
                $("<td>").addClass("dataValue12").html(emp.empLicenseNo)
              );

            return trs;
          };

          //<검색------------------------------------
          const inputId = $("#inputId");
          const tfootId = $("#tfootId");
          inputId.on("keyup", function () {
            if (inputId.val().length > 0) {
              tfootId.hide();
            }
            let inputValue = inputId.val().toUpperCase();
            let empTrtags = $(".empTrtags");

            $.each(empTrtags, function (i, v) {
              let dataValue1 = $(this).find(".dataValue1").html();
              let dataValue2 = $(this).find(".dataValue2").html();
              let dataValue3 = $(this).find(".dataValue3").html();
              let dataValue4 = $(this).find(".dataValue4").html();
              let dataValue5 = $(this).find(".dataValue5").html();
              let dataValue6 = $(this).find(".dataValue6").html();
              let dataValue7 = $(this).find(".dataValue7").html();
              let dataValue8 = $(this).find(".dataValue8").html();
              let dataValue9 = $(this).find(".dataValue9").html();
              let dataValue10 = $(this).find(".dataValue10").html();
              let dataValue11 = $(this).find(".dataValue11").html();
              let dataValue12 = $(this).find(".dataValue12").html();
              if (dataValue1.toUpperCase().indexOf(inputValue) > -1) {
                $(this).show();
                return;
              } else {
                $(this).hide();
              }
              if (dataValue2.toUpperCase().indexOf(inputValue) > -1) {
                $(this).show();
                return;
              } else {
                $(this).hide();
              }
              if (dataValue3.toUpperCase().indexOf(inputValue) > -1) {
                $(this).show();
                return;
              } else {
                $(this).hide();
              }
              if (dataValue4.toUpperCase().indexOf(inputValue) > -1) {
                $(this).show();
                return;
              } else {
                $(this).hide();
              }
              if (dataValue5.toUpperCase().indexOf(inputValue) > -1) {
                $(this).show();
                return;
              } else {
                $(this).hide();
              }
              if (dataValue6.toUpperCase().indexOf(inputValue) > -1) {
                $(this).show();
                return;
              } else {
                $(this).hide();
              }
              if (dataValue7.toUpperCase().indexOf(inputValue) > -1) {
                $(this).show();
                return;
              } else {
                $(this).hide();
              }
              if (dataValue8.toUpperCase().indexOf(inputValue) > -1) {
                $(this).show();
                return;
              } else {
                $(this).hide();
              }
              if (dataValue9.toUpperCase().indexOf(inputValue) > -1) {
                $(this).show();
                return;
              } else {
                $(this).hide();
              }
              if (dataValue10.toUpperCase().indexOf(inputValue) > -1) {
                $(this).show();
                return;
              } else {
                $(this).hide();
              }
//               if (dataValue11.toUpperCase().indexOf(inputValue) > -1) {
//                 $(this).show();
//                 return;
//               } else {
//                 $(this).hide();
//               }
//               if (dataValue12.toUpperCase().indexOf(inputValue) > -1) {
//                 $(this).show();
//               } else {
//                 $(this).hide();
//               }
            });
            if (inputId.val() == 0) {
              tfootId.show();
            }
          });
          //------------------------------------검색>



          // 회원 리스트 조회용 --------------------------------------------------------------------
          const empList = () => {
            const listBody = $("#listBody");
            $.ajax({
              url: "${cPath}/empList",
              dataType: "json",
              method: "get",
              success: function (empList) {
                console.log(empList);
                $.each(empList, function (i, emp) {	// 대기목록환자 반복문 돌려서 tr, td태그 만들기

                  let empJob = emp.empJob;

                  switch (empJob) {
                    case "J001":
                      empJob = "원무과";
                      break;
                    case "J002":
                      empJob = "의사";
                      break;
                    case "J003":
                      empJob = "간호사";
                      break;
                    case "J004":
                      empJob = "물리치료사";
                      break;
                    case "J005":
                      empJob = "도수치료사";
                      break;
                    case "J006":
                      empJob = "영상촬영사";
                      break;
                  }

                  let tr = $('<tr>').addClass("empTrtags").append(
                    $("<td>").addClass("dataValue1").html(emp.empKey),
                    $("<td>").addClass("dataValue2").html(emp.empId),
                    $("<td>").addClass("dataValue3").html(emp.empName),
                    $("<td>").addClass("dataValue4").html(emp.empAge),
                    $("<td>").addClass("dataValue5").html(empJob),
                    $("<td>").addClass("dataValue6").html(emp.empRegno1),
                    $("<td>").addClass("dataValue7").html(emp.empPhone.substr(0, 3) + "-" + emp.empPhone.substr(3, 4) + "-" + emp.empPhone.substr(7, 4)),
                    $("<td>").addClass("dataValue8").html(emp.empAddr),
                    $("<td>").addClass("dataValue9").html(emp.empAddrDetail),
                    $("<td>").addClass("dataValue10").html(emp.empHireDate.substr(0, 10)),
                    $("<td>").addClass("dataValue12").html(emp.empLicenseNo)
                  )

                  listBody.append(tr);
                })
              }
            })
          };

          empList();

          //------------------------------------------------------------------------------------

          // 회원 추가하기
          const empAddForm = $("#empAddForm");

          empAddForm.on("submit", function (event) {
            event.preventDefault();
            console.log("넘어가지마!");
            let formData = new FormData(empAddForm[0]);
            $.ajax({
              type: "post",
              url: "${cPath}/addEmp",
              data: formData,
              dataType: "text",
              cache: false,
              contentType: false,
              processData: false,
              beforeSend: function (xhr) {
                /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
              },
              success: function (rslt) {
                console.log("인서트 아작스", rslt);
                Swal.fire("회원추가가 완료되었습니다.", "success");
                empList();
              },
            });
          });

    //------------------------------------------------------------------------------------
        </script>
        </div>