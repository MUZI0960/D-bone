<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
            <!DOCTYPE html>
            <html>



            <style>
                body {}

                .ggg {
                    display: grid;
                    grid-template-columns: 1fr 2fr;
                }

                .ddd,
                .fff {
                    display: grid;
                    height: 100vh;
                    place-content: center;
                    margin-left: 100px;
                }

                .ddd {
                    background-color: #516091;
                    height: 100vh;
                    width: 40vw;
                    margin: 0;
                    box-shadow: 10px 0 10px -10px #3333337a;
                }

                .mainImage {
                    /* margin-top: -200px; */
                    /* margin-left: 200px; */
                    height: 350px;
                    width: 400px;
                }

                .welcomeComment {
                    /* margin-left: 200px; */
                    text-align: center;
                    vertical-align: middle;
                    color: white;
                    /* margin-bottom: 0px; */
                }

                .grid-container {
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    flex-direction: column;
                    /* margin-top: -200px;        */
                    /* 그리드 높이 조절하기~~~~!!!*/
                }

                .grid-item {
                    font-size: 17px;
                    text-align: center;
                    height: 170px;
                    width: 180px;
                    margin: 20px;
                    background-color: #8DCBE6;

                }

                /* 버튼 css*/
                @import url("https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800,900&display=swap");

                body {
                    text-align: center;
                    /* padding: 100px; */
                    display: table-cell;
                }

                button {
                    margin: 20px;
                }

                .w-btn {
                    position: relative;
                    border: none;
                    display: inline-block;
                    border-radius: 15px;
                    font-family: "paybooc-Light", sans-serif;
                    box-shadow: 0 10px 35px rgba(0, 0, 0, 0.2);
                    text-decoration: none;
                    font-weight: 600;
                    transition: 0.25s;
                }

                .w-btn:hover {
                    letter-spacing: 2px;
                    transform: scale(1.2);
                    cursor: pointer;
                }

                .w-btn-outline:active {
                    transform: scale(1.5);
                }

                .w-btn-gra1 {
                    background: linear-gradient(-45deg, #d4adfc 0%, #569daa 100%);
                    color: white;
                }

                .w-btn-gra2 {
                    background: linear-gradient(-45deg, #ee7752, #e73c7e, #23a6d5, #23d5ab);
                    color: white;
                }

                .w-btn-gra3 {
                    background: linear-gradient(45deg,
                            #ff0000,
                            #ff7300,
                            #fffb00,
                            #48ff00,
                            #00ffd5,
                            #002bff,
                            #7a00ff,
                            #ff00c8,
                            #ff0000);
                    color: white;
                }

                .w-btn-gra-anim {
                    background-size: 400% 400%;
                    animation: gradient1 5s ease infinite;
                }

                @keyframes gradient1 {
                    0% {
                        background-position: 0% 50%;
                    }

                    50% {
                        background-position: 100% 50%;
                    }

                    100% {
                        background-position: 0% 50%;
                    }
                }

                @keyframes gradient2 {
                    0% {
                        background-position: 100% 50%;
                    }

                    50% {
                        background-position: 0% 50%;
                    }

                    100% {
                        background-position: 100% 50%;
                    }
                }

                @keyframes ring {
                    0% {
                        width: 30px;
                        height: 30px;
                        opacity: 1;
                    }

                    100% {
                        width: 300px;
                        height: 300px;
                        opacity: 0;
                    }
                }

                .pageBtnImage {
                    width: 70px;
                    height: 70px;
                    margin-bottom: 5px;
                }

                #loginInfoDiv {
                    display: flex;
                    justify-content: space-evenly;
                }

                .loginInfoATag {
                    color: white;
                    font-size: larger;
                    text-decoration-line: none;
                }

                .loginInfoATag:hover {
                    text-decoration-line: none;
                    font-weight: bold;
                }
                .noBtn{
                    border-radius: 15px;
                    border: none;
                    color: white;
                    background-color: #48546845;
                }
            </style>
            <!-- App favicon -->

            <!-- sweetalert2 -->
            <script type="text/javascript" src="${cPath }/resources/libs/sweetalert2/sweetalert2.all.min.js"></script>
            <link rel="stylesheet" href="${cPath }/resources/libs/sweetalert2/sweetalert2.min.css"><!--min css-->


            <link rel="shortcut icon" href="${cPath }/resources/images/favicon.ico">
            <script type="text/javascript"
                src="${pageContext.request.contextPath }/resources/js/jquery-3.6.3.min.js"></script>
            <script type="text/javascript"
                src="${pageContext.request.contextPath }/resources/js/jquery.serializeObject.min.js"></script>
            <link href="https://cdn.jsdelivr.net/npm/remixicon@2.2.0/fonts/remixicon.css" rel="stylesheet">

            <c:if test="${not empty message }">
                <script type="text/javascript">
                    window.addEventListener("DOMContentLoaded", function () {
                        Swal.fire({
                            icon: 'error',
                            title: 'Oops...',
                            text: '${message}'
                        })
                    });
                </script>
            </c:if>

            <head>
                <meta charset="UTF-8">
                <title>Insert title here</title>
            </head>

            <body>
                <div style="width: 500px; margin-left: 500px;">
                </div>
                <%-- <security:authorize></security:authorize> 인증관련 확인 --%>
                    <security:authorize access="isAuthenticated()"> <!-- 로그인 된다면 나오는 화면 -->
                        <security:authentication property="principal" var="authEmpUser" />
                        <div class="ggg">
                            <div class="ddd">
                                <img class="mainImage" src="${cPath }/resources/ajm/images/hospital1.png">
                                <br>
                                <h2 class="welcomeComment">[${authEmp.codeName}] ${authEmp.empName}선생님 환영합니다. </h2>
                                <form id="logoutForm" action="${cPath }/logout" method="post">
                                    <security:csrfInput />
                                </form>
                                <br>
                                <div id="loginInfoDiv">
                                    <i class="ri-account-circle-line" style='color: white;'><a class="loginInfoATag"
                                            href='${cPath}/main/myPage'>&nbsp;mypage</a></i>
                                    <i class="ri-logout-box-r-line" style='color: white;'><a class="loginInfoATag"
                                            href="javascript: $('#logoutForm').submit();">&nbsp;logout</a></i>

                                    <!-- <a class="w-btn w-btn-gra1 w-btn-gra-anim"  href='${cPath}/main/myPage'  style=" padding-top:10px; width: 110px; height:30px; font-size: 14px; ">마이페이지 </a> -->
                                    <!-- <a class="w-btn w-btn-gra1 w-btn-gra-anim" href="javascript: $('#logoutForm').submit();" class="logoutbutton" style="margin-left:10px; padding-top:10px; width: 110px; height:30px; font-size: 14px; ">로그아웃</a> -->
                                </div>
                            </div>
                            <div class="grid-container">
                                <div class="container">
                                    <button class="grid-item w-btn w-btn-gra1 w-btn-gra-anim receiptBtn" type="button"
                                        onclick="javascript: location.href='${cPath}/main/receiptPayPage.do'">
                                        <img class="pageBtnImage"
                                            src="${cPath }/resources/images/welcome/receipt.png"><br /><br />
                                        <span>접수/수납</span>
                                    </button>
                                    <button class="grid-item w-btn w-btn-gra1 w-btn-gra-anim reservationBtn" type="button"
                                        onclick="javascript: location.href='${cPath}/main/reservationPage.do'">
                                        <img class="pageBtnImage"
                                            src="${cPath }/resources/images/welcome/reservation.png"><br /><br />
                                        예약
                                    </button>
                                    <button class="grid-item w-btn w-btn-gra1 w-btn-gra-anim chartBtn" type="button"
                                        onclick="javascript: location.href='${cPath}/main/chartPage.do'">
                                        <img class="pageBtnImage"
                                            src="${cPath }/resources/images/welcome/diagnosis.png"><br /><br />
                                        진료
                                    </button>
                                </div>
                                <div class="container2">
                                    <button class="grid-item w-btn w-btn-gra1 w-btn-gra-anim wardBtn" type="button"
                                        onclick="javascript: location.href='${cPath}/main/wardPage.do'">
                                        <img class="pageBtnImage"
                                            src="${cPath }/resources/images/welcome/ward.png"><br /><br />
                                        병동
                                    </button>
                                    <button class="grid-item w-btn w-btn-gra1 w-btn-gra-anim medicineBtn" type="button"
                                        onclick="javascript: location.href='${cPath}/main/medicine'">
                                        <img class="pageBtnImage"
                                            src="${cPath }/resources/images/welcome/medicine.png"><br /><br />
                                        약품관리
                                    </button>
                                    <button class="grid-item w-btn w-btn-gra1 w-btn-gra-anim produceBtn" type="button"
                                        onclick="javascript: location.href='${cPath}/main/productPage.do'">
                                        <img class="pageBtnImage"
                                            src="${cPath }/resources/images/welcome/order.png"><br /><br />
                                        발주
                                    </button>
                                </div>
                                <div class="container3">
                                    <button class="grid-item w-btn w-btn-gra1 w-btn-gra-anim surgeryBtn" type="button"
                                        onclick="javascript: location.href='${cPath}/main/surgeryPage.do'">
                                        <img class="pageBtnImage"
                                            src="${cPath }/resources/images/welcome/surgery.png"><br /><br />
                                        수술
                                    </button>
                                    <button class="grid-item w-btn w-btn-gra1 w-btn-gra-anim therapyBtn" type="button"
                                        onclick="javascript: location.href='${cPath}/main/therapyPage.do'"
                                        onclick="fn_therapyPage">
                                        <img class="pageBtnImage"
                                            src="${cPath }/resources/images/welcome/pt.png"><br /><br />
                                        물리치료
                                    </button>
                                    <button class="grid-item w-btn w-btn-gra1 w-btn-gra-anim mTherapyBtn" type="button"
                                        onclick="javascript: location.href='${cPath}/main/mTherapyPage.do'">
                                        <img class="pageBtnImage"
                                            src="${cPath }/resources/images/welcome/mt.png"><br /><br />
                                        도수치료
                                    </button>
                                </div>
                                <div class="container4">
                                    <button class="grid-item w-btn w-btn-gra1 w-btn-gra-anim radiologyBtn" type="button"
                                        onclick="javascript: location.href='${cPath}/main/radiologyPage.do'">
                                        <img class="pageBtnImage"
                                            src="${cPath }/resources/images/welcome/radiology.png"><br /><br />
                                        영상의학과
                                    </button>
                                    <button class="grid-item w-btn w-btn-gra1 w-btn-gra-anim empBtn" type="button"
                                        onclick="javascript: location.href='${cPath}/main/empPage.do'">
                                        <img class="pageBtnImage"
                                            src="${cPath }/resources/images/welcome/emp.png"><br /><br />
                                        인사관리
                                    </button>
                                    <button class="grid-item w-btn w-btn-gra1 w-btn-gra-anim noticeBtn" type="button"
                                        onclick="javascript: location.href='${cPath}/main/noticeBoardPage.do'">
                                        <img class="pageBtnImage"
                                            src="${cPath }/resources/images/welcome/statistic.png"><br /><br />
                                        공지/통계
                                    </button>

                                </div>
                            </div>
                        </div>
                    </security:authorize>
                    <%-- <input class="grid-item w-btn w-btn-gra1 w-btn-gra-anim" type="button"
                        onclick="javascript: location.href='${cPath}/main/statisticsPage.do'" value="통계/실적"> --%>
                        <script>
                            let receiptBtn = $('.receiptBtn');
                            let reservationBtn = $('.reservationBtn');
                            let chartBtn = $('.chartBtn');
                            let wardBtn = $('.wardBtn');
                            let medicineBtn = $('.medicineBtn');
                            let produceBtn = $('.produceBtn');
                            let surgeryBtn = $('.surgeryBtn');
                            let therapyBtn = $('.therapyBtn');
                            let mTherapyBtn = $('.mTherapyBtn');
                            let radiologyBtn = $('.radiologyBtn');
                            let empBtn = $('.empBtn');
                            let noticeBtn = $('.noticeBtn');



                            const authEmpJob = '${authEmp.empJob}';
                            const loginEmpAuthBtn = (authEmpJob) => {
                                switch (authEmpJob) {
                                    case "J001":
                                        console.log("원무과 로그인");
                                        chartBtn.removeClass("w-btn w-btn-gra1 w-btn-gra-anim").addClass("noBtn").prop("onclick", false);
                                        reservationBtn.removeClass("w-btn w-btn-gra1 w-btn-gra-anim").addClass("noBtn").prop("onclick", false);
                                        wardBtn.removeClass("w-btn w-btn-gra1 w-btn-gra-anim").addClass("noBtn").prop("onclick", false);
                                        medicineBtn.removeClass("w-btn w-btn-gra1 w-btn-gra-anim").addClass("noBtn").prop("onclick", false);
                                        surgeryBtn.removeClass("w-btn w-btn-gra1 w-btn-gra-anim").addClass("noBtn").prop("onclick", false);
                                        therapyBtn.removeClass("w-btn w-btn-gra1 w-btn-gra-anim").addClass("noBtn").prop("onclick", false);
                                        mTherapyBtn.removeClass("w-btn w-btn-gra1 w-btn-gra-anim").addClass("noBtn").prop("onclick", false);
                                        radiologyBtn.removeClass("w-btn w-btn-gra1 w-btn-gra-anim").addClass("noBtn").prop("onclick", false);
                                        break;

                                    case "J002":
                                        console.log("의사 로그인");
                                        receiptBtn.removeClass("w-btn w-btn-gra1 w-btn-gra-anim").addClass("noBtn").prop("onclick", false);
                                        reservationBtn.removeClass("w-btn w-btn-gra1 w-btn-gra-anim").addClass("noBtn").prop("onclick", false);
                                        medicineBtn.removeClass("w-btn w-btn-gra1 w-btn-gra-anim").addClass("noBtn").prop("onclick", false);
                                        produceBtn.removeClass("w-btn w-btn-gra1 w-btn-gra-anim").addClass("noBtn").prop("onclick", false);
                                        therapyBtn.removeClass("w-btn w-btn-gra1 w-btn-gra-anim").addClass("noBtn").prop("onclick", false);
                                        mTherapyBtn.removeClass("w-btn w-btn-gra1 w-btn-gra-anim").addClass("noBtn").prop("onclick", false);
                                        radiologyBtn.removeClass("w-btn w-btn-gra1 w-btn-gra-anim").addClass("noBtn").prop("onclick", false);
                                        empBtn.removeClass("w-btn w-btn-gra1 w-btn-gra-anim").addClass("noBtn").prop("onclick", false);
                                        break;

                                    case "J003":
                                        console.log("간호사 로그인");
                                        receiptBtn.removeClass("w-btn w-btn-gra1 w-btn-gra-anim").addClass("noBtn").prop("onclick", false);
                                        chartBtn.removeClass("w-btn w-btn-gra1 w-btn-gra-anim").addClass("noBtn").prop("onclick", false);
                                        produceBtn.removeClass("w-btn w-btn-gra1 w-btn-gra-anim").addClass("noBtn").prop("onclick", false);
                                        surgeryBtn.removeClass("w-btn w-btn-gra1 w-btn-gra-anim").addClass("noBtn").prop("onclick", false);
                                        therapyBtn.removeClass("w-btn w-btn-gra1 w-btn-gra-anim").addClass("noBtn").prop("onclick", false);
                                        mTherapyBtn.removeClass("w-btn w-btn-gra1 w-btn-gra-anim").addClass("noBtn").prop("onclick", false);
                                        radiologyBtn.removeClass("w-btn w-btn-gra1 w-btn-gra-anim").addClass("noBtn").prop("onclick", false);
                                        empBtn.removeClass("w-btn w-btn-gra1 w-btn-gra-anim").addClass("noBtn").prop("onclick", false);
                                        break;

                                    case "J004":
                                        console.log("물리치료사 로그인");
                                        receiptBtn.removeClass("w-btn w-btn-gra1 w-btn-gra-anim").addClass("noBtn").prop("onclick", false);
                                        reservationBtn.removeClass("w-btn w-btn-gra1 w-btn-gra-anim").addClass("noBtn").prop("onclick", false);
                                        chartBtn.removeClass("w-btn w-btn-gra1 w-btn-gra-anim").addClass("noBtn").prop("onclick", false);
                                        wardBtn.removeClass("w-btn w-btn-gra1 w-btn-gra-anim").addClass("noBtn").prop("onclick", false);
                                        medicineBtn.removeClass("w-btn w-btn-gra1 w-btn-gra-anim").addClass("noBtn").prop("onclick", false);
                                        produceBtn.removeClass("w-btn w-btn-gra1 w-btn-gra-anim").addClass("noBtn").prop("onclick", false);
                                        surgeryBtn.removeClass("w-btn w-btn-gra1 w-btn-gra-anim").addClass("noBtn").prop("onclick", false);
                                        mTherapyBtn.removeClass("w-btn w-btn-gra1 w-btn-gra-anim").addClass("noBtn").prop("onclick", false);
                                        radiologyBtn.removeClass("w-btn w-btn-gra1 w-btn-gra-anim").addClass("noBtn").prop("onclick", false);
                                        empBtn.removeClass("w-btn w-btn-gra1 w-btn-gra-anim").addClass("noBtn").prop("onclick", false);
                                        break;

                                    case "J005":
                                        console.log("도수치료사 로그인");
                                        receiptBtn.removeClass("w-btn w-btn-gra1 w-btn-gra-anim").addClass("noBtn").prop("onclick", false);
                                        reservationBtn.removeClass("w-btn w-btn-gra1 w-btn-gra-anim").addClass("noBtn").prop("onclick", false);
                                        chartBtn.removeClass("w-btn w-btn-gra1 w-btn-gra-anim").addClass("noBtn").prop("onclick", false);
                                        wardBtn.removeClass("w-btn w-btn-gra1 w-btn-gra-anim").addClass("noBtn").prop("onclick", false);
                                        medicineBtn.removeClass("w-btn w-btn-gra1 w-btn-gra-anim").addClass("noBtn").prop("onclick", false);
                                        produceBtn.removeClass("w-btn w-btn-gra1 w-btn-gra-anim").addClass("noBtn").prop("onclick", false);
                                        surgeryBtn.removeClass("w-btn w-btn-gra1 w-btn-gra-anim").addClass("noBtn").prop("onclick", false);
                                        therapyBtn.removeClass("w-btn w-btn-gra1 w-btn-gra-anim").addClass("noBtn").prop("onclick", false);
                                        radiologyBtn.removeClass("w-btn w-btn-gra1 w-btn-gra-anim").addClass("noBtn").prop("onclick", false);
                                        empBtn.removeClass("w-btn w-btn-gra1 w-btn-gra-anim").addClass("noBtn").prop("onclick", false);
                                        break;
                                    case "J006":
                                        console.log("영상촬영사 로그인");
                                        receiptBtn.removeClass("w-btn w-btn-gra1 w-btn-gra-anim").addClass("noBtn").prop("onclick", false);
                                        reservationBtn.removeClass("w-btn w-btn-gra1 w-btn-gra-anim").addClass("noBtn").prop("onclick", false);
                                        chartBtn.removeClass("w-btn w-btn-gra1 w-btn-gra-anim").addClass("noBtn").prop("onclick", false);
                                        wardBtn.removeClass("w-btn w-btn-gra1 w-btn-gra-anim").addClass("noBtn").prop("onclick", false);
                                        medicineBtn.removeClass("w-btn w-btn-gra1 w-btn-gra-anim").addClass("noBtn").prop("onclick", false);
                                        produceBtn.removeClass("w-btn w-btn-gra1 w-btn-gra-anim").addClass("noBtn").prop("onclick", false);
                                        surgeryBtn.removeClass("w-btn w-btn-gra1 w-btn-gra-anim").addClass("noBtn").prop("onclick", false);
                                        therapyBtn.removeClass("w-btn w-btn-gra1 w-btn-gra-anim").addClass("noBtn").prop("onclick", false);
                                        mTherapyBtn.removeClass("w-btn w-btn-gra1 w-btn-gra-anim").addClass("noBtn").prop("onclick", false);
                                        empBtn.removeClass("w-btn w-btn-gra1 w-btn-gra-anim").addClass("noBtn").prop("onclick", false);
                                        break;
                                    default:
                                        break;
                                }
                            }
                            loginEmpAuthBtn(authEmpJob);

                        </script>

            </body>

            </html>