<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- ========== App Menu ========== -->
<div class="app-menu navbar-menu">
    <!-- LOGO -->
    <div class="navbar-brand-box">
        <!-- Dark Logo-->
        <a href="${pageContext.request.contextPath }/" class="logo logo-dark">
            <span class="logo-sm">
                <img src="${pageContext.request.contextPath }/resources/images/logo-sm.png" alt="" height="22">
                
            </span>
            <span class="logo-lg">
                <img src="${pageContext.request.contextPath }/resources/images/logo-dark.png" alt="" height="17">
            </span>
        </a>
        <!-- Light Logo-->
        <a href="${pageContext.request.contextPath }/" class="logo logo-light">
            <span class="logo-sm">
                <img src="${pageContext.request.contextPath }/resources/images/logo-sm.png" alt="" height="22">
            </span>
            <span class="logo-lg">
                <img src="${pageContext.request.contextPath }/resources/images/logo_bone.png" height="17">
            </span>
        </a>
        <button type="button" class="btn btn-sm p-0 fs-20 1-item float-end btn-vertical-sm-hover" id="vertical-hover">
            <i class="ri-record-circle-line"></i>
        </button>
    </div>

    <div id="scrollbar">
        <div class="container-fluid">

            <div id="two-column-menu">
            </div>
            <ul class="navbar-nav" id="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link menu-link" href="<c:url value="/main/receiptPayPage.do"/>" >
                        <i class="ri-layout-3-line"></i> <span data-key="t-receipay">접수/수납</span> 
                    </a>
                </li> <!-- end Dashboard Menu -->

                <li class="nav-item">
                    <a class="nav-link menu-link" href="<c:url value="/main/reservationPage.do"/>" >
                        <i class="ri-account-circle-line"></i> <span data-key="t-reservation">예약</span>
                    </a>
                </li>


                <li class="nav-item">
                    <a class="nav-link menu-link" href="<c:url value="/main/chartPage.do"/>" >
                        <i class="ri-hospital-line"></i> <span data-key="t-landing">진료</span>
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link menu-link" href="<c:url value="/main/wardPage.do"/>" >
                        <i class="ri-mac-line"></i> <span data-key="t-ward">병동</span>
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link menu-link" href="<c:url value="/main/medicine"/>" >
                        <i class="ri-archive-drawer-line"></i> <span data-key="t-product">약품관리</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link menu-link" href="<c:url value="/main/productPage.do"/>" >
                        <i class="ri-mail-add-line"></i> <span data-key="t-product">발주</span>
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link menu-link" href="<c:url value="/main/surgeryPage.do"/>">
                        <i class="ri-hotel-bed-line"></i> <span data-key="t-surgery">수술</span>
                    </a>
                </li>

<!--                 <li class="nav-item"> -->
<%--                     <a class="nav-link menu-link" href="<c:url value="/main/therapyPage.do"/>" > --%>
<!--                         <i class="ri-medicine-bottle-line"></i> <span data-key="t-therapy">치료</span> -->
<!--                     </a> -->
<!--                 </li> -->
                
<!--                 <li class="nav-item"> -->
<!--                 	<a class="nav-link" href="#sidebarMore" data-bs-toggle="collapse" role="button" aria-expanded="false" aria-controls="sidebarMore"> -->
<!--                 		<i class="ri-briefcase-2-line"></i> -->
<!--                 		치료 -->
<!--                 	</a> -->
<!--                 	<div class="collapse menu-dropdown" id="sidebarMore"> -->
<!--                 		<ul class="nav nav-sm flex-column"> -->
<%-- 		                   <a class="nav-link menu-link" href="<c:url value="/main/therapyPage.do"/>" > --%>
<!-- 		                   		<i class="ri-medicine-bottle-line"></i> <span data-key="t-therapy">물리치료</span> -->
<!-- 		                   </a> -->
<!--                 		</ul> -->
<!--                 		<ul class="nav nav-sm flex-column"> -->
<%-- 		                   <a class="nav-link menu-link" href="<c:url value="/main/mTherapyPage.do"/>" > --%>
<!-- 		                   		<i class="ri-medicine-bottle-line"></i> <span data-key="t-therapy">도수치료</span> -->
<!-- 		                   </a> -->
<!--                 		</ul> -->
<!--                 	</div> -->
                	
<!--                 </li> -->
                <li class="nav-item">
                    <a class="nav-link menu-link" href="<c:url value="/main/therapyPage.do"/>" >
                        <i class="ri-medicine-bottle-line"></i> <span data-key="t-therapy">물리치료</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link menu-link" href="<c:url value="/main/mTherapyPage.do"/>" >
                        <i class="ri-medicine-bottle-line"></i> <span data-key="t-therapy">도수치료</span>
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link menu-link" href="<c:url value="/main/radiologyPage.do"/>" >
                        <i class="ri-camera-2-line"></i> <span data-key="t-radiology">영상학과</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link menu-link" href="<c:url value="/main/empPage.do"/>" >
                        <i class="ri-calendar-2-line"></i> <span data-key="t-emp">인사관리</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link menu-link" href="<c:url value="/main/noticeBoardPage.do"/>" >
                        <i class="ri-clipboard-line"></i> <span data-key="t-noticeBoard">공지/통계</span>
                    </a>
                </li>


            </ul>
        </div>
        <!-- Sidebar -->
    </div>

    <div class="sidebar-background"></div>
</div>
<!-- Left Sidebar End -->
<!-- Vertical Overlay-->
<div class="vertical-overlay"></div>