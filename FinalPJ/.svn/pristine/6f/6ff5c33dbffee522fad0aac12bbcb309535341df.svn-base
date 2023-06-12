<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html lang="en" data-layout="vertical" data-topbar="light" data-sidebar="dark" data-sidebar-size="lg" data-sidebar-image="none" data-layout-mode="dark" data-body-image="img-1" data-preloader="disable">

<head>

    <meta charset="utf-8" />
    <title>403 ErrorPage</title>
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

    <!-- <c:if test="${not empty message }">
   <script type="text/javascript">
      window.addEventListener("DOMContentLoaded", function(){
         Swal.fire({
              icon: 'error',
              title: 'Oops...',
              text: '${message}'
            })
      });
   </script>
</c:if> -->

</head>

<body>

    <div class="auth-page-wrapper pt-5">

        <!-- auth page content -->
        <div class="auth-page-content">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="text-center pt-4">
                            <div class="">
                                <img src="${cPath }/resources/images/error.svg" alt="" class="error-basic-img move-animation">
                            </div>
                            <div class="mt-n4">
                                <h1 class="display-1 fw-medium">500</h1>
                                <h3 class="text-uppercase">서버 오류!! 잠시후 다시 요청해주세요!😭</h3>
                                <p class="text-muted mb-4"> 3초 후 이전화면으로 이동합니다...</p>
                                <!-- <a href="index.html" class="btn btn-success"><i class="mdi mdi-home me-1"></i>Back to home</a> -->
                            </div>
                        </div>
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
    setTimeout(() => {
    	history.back();
    }, 3000);

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