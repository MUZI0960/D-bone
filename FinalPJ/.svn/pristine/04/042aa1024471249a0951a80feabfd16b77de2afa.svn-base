<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
            <!DOCTYPE html>
            <html lang="en" data-layout="horizontal" data-layout-style="" data-layout-width="fluid"
                data-preloader="enable" data-layout-position="fixed" data-topbar="dark">
            <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

            <style>
                :root {
                    --vz-body-bg: white;
                }

                .grid-stack-item-content::-webkit-scrollbar {
                    width: 5px;
                    overflow-y: auto;
                }

                .grid-stack-item-content::-webkit-scrollbar-thumb {
                    height: 30%;
                    /* 스크롤바의 길이 */
                    background: #d0d0d0a9;
                    /* 스크롤바의 색상 */
                    border-radius: 10px;
                }

                .grid-stack-item-content {
                    background-color: white;
                    padding: 25px;
                    border-radius: 15px;
                    box-shadow: 0 3px 6px rgba(0, 0, 0, 0.16), 0 3px 6px rgba(0, 0, 0, 0.23);
                }
            </style>



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
                <!-- meta-title -->
                <meta charset="utf-8" />
                <!-- 	<title>@@title | Velzon - Admin & Dashboard Template</title> -->
                <title>
                    <tiles:getAsString name="title" />
                </title>
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <meta content="Premium Multipurpose Admin & Dashboard Template" name="description" />
                <meta content="Themesbrand" name="author" />

                <!-- App favicon -->
                <link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/images/favicon.ico">


                <!-- pretestScript -->
                <tiles:insertAttribute name="preScript" />

            </head>

            <body>

                <!-- Begin page -->
                <div id="layout-wrapper">
                    <tiles:insertAttribute name="topbar" />
                    <tiles:insertAttribute name="sidebar" />

                    <!-- partials/menu.html -->



                    <!-- ============================================================== -->
                    <!-- Start right Content here -->
                    <!-- ============================================================== -->
                    <div class="main-content">
                        <div class="page-content">
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-10 mainBody" style="width:100%;">
                                        <!-- Main Content 영역 -->
                                        <tiles:insertAttribute name="patientDetail" />
                                        <tiles:insertAttribute name="body" />
                                    </div> <!-- end col -->
                                </div>
                            </div>
                            <!-- container-fluid -->
                        </div><!-- page 컨텐츠 -->

                        <!-- footer -->
                        <tiles:insertAttribute name="footer" />
                    </div> <!-- main 컨텐츠 -->
                </div> <!-- layout-wrapper -->



                <%-- <tiles:insertAttribute name="customizer" /> --%>
                <tiles:insertAttribute name="postScript" />


            </body>
            </html>