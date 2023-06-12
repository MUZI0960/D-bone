<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!doctype html>
<html lang="en" data-layout="vertical" data-topbar="light" data-sidebar="dark" data-sidebar-size="sm-hover" data-sidebar-image="none" data-preloader="disable">
<head>

    <meta charset="utf-8" />
    <title>D-Bone Login Page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="Premium Multipurpose Admin & Dashboard Template" name="description" />
    <meta content="Themesbrand" name="author" />
    <!-- App favicon -->
    <link rel="shortcut icon" href="${cPath }/resources/images/favicon.ico">
    <!-- Layout config Js -->
    <script src="${cPath }/resources/js/layout.js"></script>
    <!-- Bootstrap Css -->
    <link href="${cPath }/resources/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Icons Css -->
    <link href="${cPath }/resources/css/icons.min.css" rel="stylesheet" type="text/css" />
    <!-- App Css-->
    <link href="${cPath }/resources/css/app.min.css" rel="stylesheet" type="text/css" />
    <!-- custom Css-->
    <link href="${cPath }/resources/css/custom.min.css" rel="stylesheet" type="text/css" />
	
	<!-- sweetalert2 -->
	<script type="text/javascript" src="${cPath }/resources/libs/sweetalert2/sweetalert2.all.min.js"></script>
    <link rel="stylesheet" href="${cPath }/resources/libs/sweetalert2/sweetalert2.min.css"><!--min css-->
	
    <!-- 제이쿼리 -->
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
	
</head>

<body>

    <div class="auth-page-wrapper pt-5">
        <!-- auth page bg -->
        <div class="auth-one-bg-position auth-one-bg" id="auth-particles">
            <div class="bg-overlay"></div>

            <div class="shape">
                <svg xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 1440 120">
                    <path d="M 0,36 C 144,53.6 432,123.2 720,124 C 1008,124.8 1296,56.8 1440,40L1440 140L0 140z"></path>
                </svg>
            </div>
        </div>

        <!-- auth page content -->
        <div class="auth-page-content">
            <div class="container">
               
                <!-- end row -->

                <div class="row justify-content-center">
                    <div class="col-md-8 col-lg-6 col-xl-5">
                        <div class="card mt-4">
	                        <!-- 로고 -->
	                        <div class="text-center mt-sm-5 ">
	                                <a href="${cPath }/login.do" class="d-inline-block auth-logo">
	                                    <img src="${cPath }/resources/images/logo_bone.png" alt="" height="100" >
	                                </a>
	                            <!-- <p class="mt-3 fs-15 fw-medium">D-bone 정형외과</p> -->
	                        </div>
	                        <!-- 로고 -->

                            <div class="card-body p-4">
<!--                                 <div class="text-center mt-2"> -->
<!--                                     <h5 class="text-primary">로그인 해주세요</h5> -->
<!--                                 </div> -->
                                <div class="p-2">
                                    <form id="loginForm" method="post" action="${cPath }/login.do">
										<security:csrfInput/>
                                        <div class="mb-3">
                                            <label for="username" class="form-label">ID</label>
                                            <input type="text" class="form-control" id="username" name="empId" placeholder="Enter username">
                                        </div>

                                        <div class="mb-3">
                                            <label class="form-label" for="password-input">Password</label>
                                            <div class="position-relative auth-pass-inputgroup mb-3">
                                                <input type="password" class="form-control pe-5 password-input" placeholder="Enter password" name="empPass"  id="password-input">
                                                <button class="btn btn-link position-absolute end-0 top-0 text-decoration-none text-muted password-addon" type="button" id="password-addon"><i class="ri-eye-fill align-middle"></i></button>
                                            </div>
                                            <div class="float-end" style="margin-bottom: 10px;">
                                                <a href="#" class="text-muted">비밀번호 찾기</a>
                                            </div>
                                        </div>

<!--                                         <div class="form-check"> -->
<!--                                             <input class="form-check-input" type="checkbox" value="" id="auth-remember-check"> -->
<!--                                             <label class="form-check-label" for="auth-remember-check">Remember me</label> -->
<!--                                         </div> -->

                                        <div class="mt-4">
<!--                                             <button class="btn btn-success w-100" type="submit">Login In</button> -->
                                            <input type="submit" value="로그인" class="btn btn-success w-100" />
                                        </div>
                                    </form>
                                </div><!-- form 태그 -->
                                
                                
                                <br><br>
                                
                                <div>
                                	<select id="idSettings" class="form-control">
                                		<option value="">아이디 셋팅 선택</option>
                                		<option value="master">MASTER계정</option>
                                		<option value="test8">원무과(admin)계정</option>
                                		<option value="drtest">의사계정</option>
                                		<option value="test1">간호사(간호사)</option>
                                		<option value="test7">영상학과(영상)</option>
                                		<option value="test3">치료(물리치료)</option>
                                		<option value="test6">치료(도수치료)</option>
                                	</select>
                                </div>
                                
                            </div>
                            <!-- end card body -->
                        </div>
                        <!-- end card -->


                    </div>
                </div>
                <!-- end row -->
            </div>
            <!-- end container -->
        </div>
        <!-- end auth page content -->
    </div>
    <!-- end auth-page-wrapper -->


<script>
let loginForm = $('#loginForm')
$('#idSettings').on('change', function() {
	let selectId = $(this).val();
	loginForm.find('[name=empId]').val(selectId);
	loginForm.find('[name=empPass]').val('test');
})

</script>

    <!-- JAVASCRIPT -->
    <script src="${cPath }/resources/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="${cPath }/resources/libs/feather-icons/feather.min.js"></script>

    <!-- particles js -->
    <script src="${cPath }/resources/libs/particles.js/particles.js"></script>
    <!-- particles app js -->
    <script src="${cPath }/resources/js/pages/particles.app.js"></script>
    <!-- password-addon init -->
    <script src="${cPath }/resources/js/pages/password-addon.init.js"></script>
</body>

</html>