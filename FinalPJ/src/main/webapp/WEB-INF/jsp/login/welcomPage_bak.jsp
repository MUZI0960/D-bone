<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>



<style>
    body {
        background-color: #E3F4F4;
    }

.ggg {
	display: grid;
	grid-template-columns: 1fr 2fr;
}

.ddd, .fff {
	display: grid;
	height: 100vh;
	place-content: center;
	margin-left: 100px;
}

.mainImage {
	margin-top: -200px;
	margin-left: 200px;
	height: 350px;
	width: 400px;
}
.welcomeComment{
	margin-left: 200px;
	text-align: center;
	vertical-align: middle;
	margin-bottom: 0px;
}
.grid-container {
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  margin-top: -200px;       /* 그리드 높이 조절하기~~~~!!!*/
}

.grid-item {
  font-size: 17px;
  text-align: center;
  height: 120px;
  width: 130px;
  margin: 20px;
  background-color: #8DCBE6;
  
}

.logoutbutton{

}
        /* 버튼 css*/
        @import url("https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800,900&display=swap");

        body {
            text-align: center;
            padding: 100px;
            background-color: #E3F4F4;
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
            background: linear-gradient(-45deg, #33ccff 0%, #ff99cc 100%);
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


</style>
<!-- App favicon -->

<!-- sweetalert2 -->
<script type="text/javascript" src="${cPath }/resources/libs/sweetalert2/sweetalert2.all.min.js"></script>
<link rel="stylesheet" href="${cPath }/resources/libs/sweetalert2/sweetalert2.min.css"><!--min css-->
	

<link rel="shortcut icon" href="${cPath }/resources/images/favicon.ico">
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-3.6.3.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery.serializeObject.min.js"></script>

<c:if test="${not empty message }">
   <script type="text/javascript">
      window.addEventListener("DOMContentLoaded", function(){
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
	<security:authentication property="principal" var="authEmpUser"/>
	<div class="ggg">
		<div class="ddd">
			<img class="mainImage" src="${cPath }/resources/ajm/images/hospital1.png">
            <br>
			<h3 class="welcomeComment">${authEmp.empName}님 환영합니다. (${authEmp.codeName})</h3>
			<form id="logoutForm" action="${cPath }/logout" method="post">
				<security:csrfInput/>
			</form>
            <br>
            <div style="margin-left: 35%;">
				<a class="w-btn w-btn-gra1 w-btn-gra-anim"  href='${cPath}/main/myPage'"  style=" padding-top:10px; width: 110px; height:30px; font-size: 14px; ">마이페이지 </a>
				<a class="w-btn w-btn-gra1 w-btn-gra-anim" href="javascript: $('#logoutForm').submit();" class="logoutbutton" style="margin-left:10px; padding-top:10px; width: 110px; height:30px; font-size: 14px; ">로그아웃</a>
			</div>
		</div>
		<div class="grid-container" style="margin-left: -110px;">
			<div class="container">
				<input class="grid-item w-btn w-btn-gra1 w-btn-gra-anim" type="button" onclick="javascript: location.href='${cPath}/main/receiptPayPage.do'" value="접수/수납">
				<input class="grid-item w-btn w-btn-gra1 w-btn-gra-anim" type="button" onclick="javascript: location.href='${cPath}/main/reservationPage.do'" value="예약">
				<input class="grid-item w-btn w-btn-gra1 w-btn-gra-anim" type="button" onclick="javascript: location.href='${cPath}/main/chartPage.do'" value="진료">
			</div>
			<div class="container2">
				<input class="grid-item w-btn w-btn-gra1 w-btn-gra-anim" type="button" onclick="javascript: location.href='${cPath}/main/wardPage.do'" value="병동">
				<input class="grid-item w-btn w-btn-gra1 w-btn-gra-anim" type="button" onclick="javascript: location.href='${cPath}/main/medicine'" value="약품관리">
				<input class="grid-item w-btn w-btn-gra1 w-btn-gra-anim" type="button" onclick="javascript: location.href='${cPath}/main/productPage.do'" value="발주">
			</div>
			<div class="container3">
				<input class="grid-item w-btn w-btn-gra1 w-btn-gra-anim" type="button" onclick="javascript: location.href='${cPath}/main/surgeryPage.do'" value="수술">
				<input class="grid-item w-btn w-btn-gra1 w-btn-gra-anim" type="button" onclick="javascript: location.href='${cPath}/main/therapyPage.do'" onclick="fn_therapyPage" value="물리치료">
				<input class="grid-item w-btn w-btn-gra1 w-btn-gra-anim" type="button" onclick="javascript: location.href='${cPath}/main/mTherapyPage.do'" value="도수치료">
			</div>
			<div class="container4">
				<input class="grid-item w-btn w-btn-gra1 w-btn-gra-anim" type="button" onclick="javascript: location.href='${cPath}/main/radiologyPage.do'"  value="영상의학과">
				<input class="grid-item w-btn w-btn-gra1 w-btn-gra-anim" type="button" onclick="javascript: location.href='${cPath}/main/empPage.do'" value="인사/일정">
				<input class="grid-item w-btn w-btn-gra1 w-btn-gra-anim" type="button" onclick="javascript: location.href='${cPath}/main/noticeBoardPage.do'" value="공지/통계">
				
			</div>
		</div>
	</div>
</security:authorize>
<%-- 				<input class="grid-item w-btn w-btn-gra1 w-btn-gra-anim" type="button" onclick="javascript: location.href='${cPath}/main/statisticsPage.do'" value="통계/실적"> --%>
<script>

</script>

</body>
</html>