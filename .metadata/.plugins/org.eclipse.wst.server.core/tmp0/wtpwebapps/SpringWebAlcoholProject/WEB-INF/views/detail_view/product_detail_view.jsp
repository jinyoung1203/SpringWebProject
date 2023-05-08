<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Product_list</title>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <meta content="" name="description">
    <meta content="" name="keywords">

    <!-- Google Fonts -->
    <%--<link href="https://fonts.gstatic.com" rel="preconnect">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
          rel="stylesheet">--%>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,600;1,700&family=Montserrat:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&family=Raleway:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
          rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

    <%-- DetailView CSS Files--%>
    <link href="${pageContext.request.contextPath}/resources/css/detailview_css/main.css" rel="stylesheet">
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
<header id="header" class="header d-flex align-items-center">

    <div class="container-fluid container-xl d-flex align-items-center justify-content-between">
        <a href="main.do" class="logo d-flex align-items-center">
            <!-- Uncomment the line below if you also wish to use an image logo -->
            <!-- <img src="assets/img/logo.png" alt=""> -->
            <h1>주당들<span>.</span></h1>
        </a>

        <nav id="navbar" class="navbar">
            <ul>
                <li><a href="main.do">Home</a></li>
                <li class="nav-item dropdown"><a href="#"><span>상품보기</span></a>
                    <ul class="dropdown dropdown-menu-arrow profile">
                        <li>
                            <a href="fullview.do" class="dropdown-item"><span>전체상품</span>
                            </a></li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>
                        <li><a href="#">베스트</a></li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>
                        <li><a href="#">신상품</a></li>
                    </ul>
                    <%--<li><a href="fullview.do">전체상품</a></li>
                    <li><a href="#">신상품</a></li>
                    <li><a href="#">베스트</a></li>--%>
                <li><a href="#">담화배송</a></li>
                <li><a href="#">이벤트</a></li>
                <li><a href="#">구독</a></li>
                <li><a href="#">Contact</a></li>

                <c:if test="${user1 eq null}">
                    <li>
                        <a href="login.do">
                            로그인 해주세요.
                        </a>
                    </li>
                </c:if>

                <li class="nav-item dropdown">
                    <c:if test="${user1 ne null}">
                        <a class="nav-link nav-profile d-flex align-items-center pe-0 text-decoration-none" href="#"
                           data-bs-toggle="dropdown">
                            <span class="d-none d-md-block dropdown-toggle ps-2">${user1.user1_name}</span>
                        </a>

                        <%--<img src="${pageContext.request.contextPath}/resources/upload/Stephan.jpg" alt="Profile" class="rounded-circle">--%>
                        <!-- End Profile Iamge Icon -->

                        <ul class="dropdown-menu dropdown-menu-arrow profile">
                            <li>
                                <a class="dropdown-item" href="#">
                                    <span>My Profile</span>
                                </a>
                            </li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <span>Account Settings</span>
                                </a>
                            </li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li>
                                <a class="dropdown-item d-flex align-items-center" href="logout.do">
                                    <span>Sign Out</span>
                                </a>
                            </li>

                        </ul>
                        <!-- End Profile Dropdown Items -->
                    </c:if>
                </li><!-- End Profile Nav -->
            </ul>
        </nav><!-- .navbar -->

        <i class="mobile-nav-toggle mobile-nav-show bi bi-list"></i>
        <i class="mobile-nav-toggle mobile-nav-hide d-none bi bi-x"></i>

    </div>
</header><!-- End Header -->
<!-- End Header -->

<main id="main" class="main">
    <section id="blog" class="blog">
        <div class="container" data-aos="fade-up">

            <div class="row g-5">

                <div class="col-lg-8">

                    <article class="blog-details">

                        <div class="post-img border border-primary">
                            <div class="row gx-4 gx-lg-5 align-items-center">
                                <div class="col-md-6 d-flex justify-content-center border border-primary">
                                    <img src="${pageContext.request.contextPath}/resources/alcohol_image/${vo1.product_thumbnail_filename}"
                                         alt="" class="img-fluid">
                                </div>
                                <div class="col-md-6">
                                    <h1 class="display-5 fw-bolder">${vo1.product_name}</h1>
                                        <p class="lead">${vo1.product_simple_content}</p>
                                    <div class="d-flex">
                                        <span>주종 : ${vo1.product_type}</span>
                                    </div>
                                    <div class="d-flex">
                                        <span>도수 : ${vo1.product_alcohol_degree}%</span>
                                    </div>
                                    <div class="d-flex">
                                        <span>용량 : ${vo1.product_capacity}</span>
                                    </div>
                                    <div class="d-flex">
                                        <br>
                                    </div>
                                    <div class="fs-5 mb-5">
                                        판매가격 :
                                        <span><fmt:formatNumber value="${vo1.product_price}" pattern="#,###"/>원</span>
                                    </div>
                                    <div class="d-flex">
                                        <span>유통기한 : ${vo1.product_expiration_date}</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="d-flex justify-content-center border border-primary">
                            <img class="img-fluid" src="${pageContext.request.contextPath}/resources/alcohol_image/${vo1.product_filename1}">
                        </div>
                        <div class="content border border-primary">
                            <p>
                                ${vo1.product_detail_content1}
                            </p>
                        </div><!-- End post content -->
                        <div class="d-flex justify-content-center border border-primary">
                            <img class="img-fluid" src="${pageContext.request.contextPath}/resources/alcohol_image/${vo1.product_filename2}">
                        </div>
                        <div class="content border border-primary">
                            <p>
                                ${vo1.product_detail_content2}
                            </p>
                        </div><!-- End post content -->
                        <div class="d-flex justify-content-center border border-primary">
                            <div>
                                <h2>어울리는 안주</h2>
                            </div>
                            <div>
                                <p>${vo1.product_point_snack}</p>
                            </div>
                        </div>


                    </article><!-- End blog post -->

                </div>

                <div class="col-lg-4">

                    <div class="sidebar border border-primary">

                        <div class="sidebar-item search-form">
                            <h3 class="sidebar-title">Search</h3>
                            <form action="" class="mt-3">
                                <input type="text">
                                <button type="submit"><i class="bi bi-search"></i></button>
                            </form>
                        </div><!-- End sidebar search formn-->

                        <div class="sidebar-item categories">
                            <h3 class="sidebar-title">Categories</h3>
                            <ul class="mt-3">
                                <li><a href="#">General <span>(25)</span></a></li>
                                <li><a href="#">Lifestyle <span>(12)</span></a></li>
                                <li><a href="#">Travel <span>(5)</span></a></li>
                                <li><a href="#">Design <span>(22)</span></a></li>
                                <li><a href="#">Creative <span>(8)</span></a></li>
                                <li><a href="#">Educaion <span>(14)</span></a></li>
                            </ul>
                        </div><!-- End sidebar categories-->

                    </div><!-- End Blog Sidebar -->

                </div>
            </div>

        </div>
    </section><!-- End Blog Details Section -->


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

<!-- Vendor JS Files -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>

<script src="${pageContext.request.contextPath}/resources/js/detailview_js/main.js"></script>

</body>
</html>
