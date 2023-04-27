<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>전체상품 보기</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <!-- Favicons -->
    <link href="#" rel="icon">
    <link href="#" rel="apple-touch-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.gstatic.com" rel="preconnect">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
          rel="stylesheet">

    <%-- 인텔리 제이 --%>
    <link href="${pageContext.request.contextPath}/resources/css/fullview.css?ver=1" rel="stylesheet"/>
    <%-- 이클립스 --%>
    <%--<link href="/alcohol/resources/css/fullview.css?ver=1" rel="stylesheet"/>--%>

    <!-- Vendor CSS Files -->

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">


    <link href="${pageContext.request.contextPath}/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css"
          rel="stylesheet">


    <!-- Template Main CSS File -->
    <link href="${pageContext.request.contextPath}/resources/assets/css/style.css" rel="stylesheet">

</head>
<body>
<c:if test="${isUser1 ne null}">
    <!-- Button trigger modal -->
    <button type="hidden" id="modalBtn" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
        Launch demo modal
    </button>

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">로그인 정보 확인</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    로그인 중입니다.
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</c:if>

<!-- ======= Header ======= -->
<header id="header" class="header fixed-top d-flex align-items-center back text-bg-success">

    <div class="d-flex align-items-center justify-content-between">
        <a href="#" class="logo d-flex align-items-center">

            <img src="${pageContext.request.contextPath}/resources/upload/logo.jpg" alt="">

            <span class="d-none d-lg-block">주당들</span>

        </a>
        <i class="bi bi-list toggle-sidebar-btn"></i>
    </div><!-- End Logo -->

    <div class="search-bar">
        <form class="search-form d-flex align-items-center" method="POST" action="#">
            <input type="text" name="query" placeholder="Search" title="Enter search keyword">
            <button type="submit" title="Search"><i class="bi bi-search"></i></button>
        </form>
    </div><!-- End Search Bar -->

    <nav class="header-nav ms-auto">
        <ul class="d-flex align-items-center">

            <li class="nav-item d-block d-lg-none">
                <a class="nav-link nav-icon search-bar-toggle " href="#">
                    <i class="bi bi-search"></i>
                </a>
            </li><!-- End Search Icon-->

            <li class="nav-item dropdown pe-3">

                <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">

                    <img src="${pageContext.request.contextPath}/resources/upload/Stephan.jpg" alt="Profile"
                         class="rounded-circle">
                    <c:if test="${user1 eq null}">
                        <span class="d-none d-md-block dropdown-toggle ps-2">로그인 해주세요.</span>
                    </c:if>
                    <c:if test="${user1 ne null}">
                        <span class="d-none d-md-block dropdown-toggle ps-2">${user1.user1_name}</span>
                    </c:if>

                </a><!-- End Profile Iamge Icon -->

                <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
                    <li class="dropdown-header">
                        <h6>Kevin Anderson</h6>
                        <span>Web Designer</span>
                    </li>
                    <li>
                        <hr class="dropdown-divider">
                    </li>

                    <li>
                        <a class="dropdown-item d-flex align-items-center" href="#">
                            <i class="bi bi-person"></i>
                            <span>My Profile</span>
                        </a>
                    </li>
                    <li>
                        <hr class="dropdown-divider">
                    </li>

                    <li>
                        <a class="dropdown-item d-flex align-items-center" href="#">
                            <i class="bi bi-gear"></i>
                            <span>Account Settings</span>
                        </a>
                    </li>
                    <li>
                        <hr class="dropdown-divider">
                    </li>

                    <li>
                        <a class="dropdown-item d-flex align-items-center" href="#">
                            <i class="bi bi-question-circle"></i>
                            <span>Need Help?</span>
                        </a>
                    </li>
                    <li>
                        <hr class="dropdown-divider">
                    </li>

                    <li>
                        <a class="dropdown-item d-flex align-items-center" href="logout.do">
                            <i class="bi bi-box-arrow-right"></i>
                            <span>Sign Out</span>
                        </a>
                    </li>

                </ul><!-- End Profile Dropdown Items -->
            </li><!-- End Profile Nav -->

        </ul>
    </nav><!-- End Icons Navigation -->

</header><!-- End Header -->

<!-- ======= Sidebar ======= -->
<aside id="sidebar" class="sidebar bg-success text-dark bg-opacity-50">

    <ul class="sidebar-nav" id="sidebar-nav">

        <li class="nav-item">
            <a class="nav-link " href="main.do">
                <i class="bi bi-grid"></i>
                <span>메인화면</span>
            </a>
        </li><!-- End Dashboard Nav -->

        <li class="nav-item">
            <a class="nav-link collapsed" href="login.do">
                <i class="bi bi-box-arrow-in-right"></i>
                <span>Login</span>
            </a>
        </li><!-- End Login Page Nav -->

        <li class="nav-item">
            <a class="nav-link collapsed" href="fullview.do">
                <i class="bi bi-menu-button-wide"></i><span>전체상품</span>
            </a>
        </li><!-- End 전체상품 Nav -->

        <li class="nav-item">
            <a class="nav-link collapsed" data-bs-target="#components-nav" data-bs-toggle="collapse" href="#">
                <i class="bi bi-menu-button-wide"></i><span>신상품</span>
            </a>
        </li><!-- End 신상품 Nav -->

        <li class="nav-item">
            <a class="nav-link collapsed" data-bs-target="#components-nav" data-bs-toggle="collapse" href="#">
                <i class="bi bi-menu-button-wide"></i><span>베스트</span>
            </a>
        </li><!-- End 베스트 Nav -->

        <li class="nav-item">
            <a class="nav-link collapsed" data-bs-target="#components-nav" data-bs-toggle="collapse" href="#">
                <i class="bi bi-menu-button-wide"></i><span>담화배송</span>
            </a>
        </li><!-- End 담화배송 Nav -->

        <li class="nav-item">
            <a class="nav-link collapsed" data-bs-target="#components-nav" data-bs-toggle="collapse" href="#">
                <i class="bi bi-menu-button-wide"></i><span>이벤트</span>
            </a>
        </li><!-- End 전체상품 Nav -->

        <li class="nav-item">
            <a class="nav-link collapsed" data-bs-target="#components-nav" data-bs-toggle="collapse" href="#">
                <i class="bi bi-menu-button-wide"></i><span>구독</span>
            </a>
        </li><!-- End 전체상품 Nav -->

    </ul>

</aside><!-- End Sidebar-->

<main id="main" class="main">
    <div class="head">
        <h3>전체상품</h3>
        <h5>주당들의 모든 술을 만나보세요!</h5>
        <h5><span>${ product_count }</span>건의 품목이 조회되었습니다!</h5>
    </div>

    <div>
        <table>
            <tr>
                <c:forEach var="list" items="${ product_list }" varStatus="status">
                <c:if test="${status.index%4==0}">
            </tr>
            <tr>
                </c:if>
                <td>
                    <a href="#">
                        <article class="card">
                            <img class="card__background"
                                <%-- 인텔리 제이 --%>
                                 src="${pageContext.request.contextPath}/resources/alcohol_image/${ list.product_thumbnail_filename }"
                                <%-- 이클립스 --%>
                                <%--src="/alcohol/resources/alcohol_image/${ list.product_thumbnail_filename }"--%>
                                 alt="${ list.product_name }"
                                 width="1920"
                                 height="2193"
                            />
                            <div class="card__content | flow">
                                <div class="card__content--container | flow">
                                    <h2 class="card__title">${ list.product_name }</h2>
                                    <p class="card__description">
                                            ${ list.product_simple_content }
                                    </p>
                                </div>
                            </div>
                        </article>
                        <div class="product">
                            <h3>${ list.product_name }</h3>
                            <h4><span>${ list.product_price }</span>원</h4>
                            <hr>
                        </div>
                    </a>
                </td>
                </c:forEach>
            </tr>
        </table>
    </div>

</main><!-- End #main -->

<!-- ======= Footer ======= -->
<footer id="footer" class="footer">
    <div class="copyright">
        &copy; Copyright <strong><span>GoodCheese by NiceAdmin.</span></strong>. All Rights Reserved
    </div>
    <div class="credits">
        <!-- All the links in the footer should remain intact. -->
        <!-- You can delete the links only if you purchased the pro version. -->
        <!-- Licensing information: https://bootstrapmade.com/license/ -->
        <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
        Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
    </div>
</footer><!-- End Footer -->

<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
        class="bi bi-arrow-up-short"></i></a>


<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/register/mainjs.js"></script>
<!-- Vendor JS Files -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>


</body>
</html>
