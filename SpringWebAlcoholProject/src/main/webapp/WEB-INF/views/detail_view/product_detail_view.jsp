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

<!-- ======= Header ======= -->
<jsp:include page="../main/header.jsp"></jsp:include>

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
                    <jsp:include page="buy.jsp?idx=${vo1.product_idx}"></jsp:include>
                    <%--<div class="sidebar border border-primary">

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

                    </div><!-- End Blog Sidebar -->--%>

                </div>
            </div>

        </div>
    </section><!-- End Blog Details Section -->


</main><!-- End #main -->

<!-- ======= Footer ======= -->
<jsp:include page="../main/footer.jsp"></jsp:include>

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
