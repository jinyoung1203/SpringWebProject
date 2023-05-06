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
    <section id="blog">
        <div class="col-1">
            <jsp:include page="left_navbar.jsp"></jsp:include>
        </div>
        <div class="container border btn-primary">
            <div class="row">
                <br>
                <br>
            </div>
            <div class="row">
                <div class="col-9">

                    <article class="blog-details">

                        <div class="post-img border border-primary">
                            <div class="row gx-4 gx-lg-5 align-items-center">
                                <div class="col-6 text-center border border-primary">
                                    <img src="${pageContext.request.contextPath}/resources/alcohol_image/${vo1.product_thumbnail_filename}"
                                         alt="" class="img-fluid">
                                </div>
                                <div class="col-6">
                                    <h1 class="display-5 fw-bolder text-primary">${vo1.product_name}</h1>
                                    <p class="lead fst-italic fw-bold text-warning">${vo1.product_simple_content}</p>
                                    <div class="d-flex">
                                        <span class="fw-bold fst-italic ">주종 : ${vo1.product_type}</span>
                                    </div>
                                    <div class="d-flex">
                                        <span class="fw-bold fst-italic">도수 : ${vo1.product_alcohol_degree}%</span>
                                    </div>
                                    <div class="d-flex">
                                        <span class="fw-bold fst-italic">용량 : ${vo1.product_capacity}</span>
                                    </div>
                                    <div class="d-flex">
                                        <br>
                                    </div>
                                    <div class="fs-6 mb-5">
                                        <span class="fw-bold">판매가격 : <br></span>
                                        <h4 class="fw-bold">&nbsp;&nbsp;<fmt:formatNumber value="${vo1.product_price}"
                                                                                          pattern="#,###"/>원</h4>
                                    </div>
                                    <div class="d-flex">
                                        <span class="fst-italic">유통기한 : ${vo1.product_expiration_date}</span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="d-flex justify-content-center border border-primary">
                            <div class="col-10">
                                <jsp:include
                                        page="taste_rating.jsp?product_sweet_rating=${vo1.product_sweet_rating}&product_sourish_rating=${vo1.product_sourish_rating}&product_cleantaste_rating=${vo1.product_cleantaste_rating}&product_bodytaste_rating=${vo1.product_bodytaste_rating}&product_sparkling_rating=${vo1.product_sparkling_rating}"></jsp:include>
                            </div>
                        </div>

                        <div class="d-flex justify-content-center border border-primary">
                            <h1 class="fw-bold text-primary">[${vo1.product_name}]</h1>
                        </div>
                        <div class="d-flex justify-content-center border border-primary">
                            <img class="img-fluid"
                                 src="${pageContext.request.contextPath}/resources/alcohol_image/${vo1.product_filename1}">
                        </div>
                        <div class="content border border-primary">
                            <h2 class="fw-bold text-primary">[${vo1.product_name}] - 1</h2>
                            <p class="fw-bold fs-4 text-black-50 fst-italic">
                                ${vo1.product_detail_content1}
                            </p>
                        </div>
                        <div class="d-flex justify-content-center border border-primary">
                            <img class="img-fluid"
                                 src="${pageContext.request.contextPath}/resources/alcohol_image/${vo1.product_filename2}">
                        </div>
                        <div class="content border border-primary">
                            <h2 class="fw-bold text-primary">[${vo1.product_name}] - 2</h2>
                            <p class="fw-bold fs-4 text-black-50 fst-italic">
                                ${vo1.product_detail_content2}
                            </p>
                        </div>
                        <div class="d-flex justify-content-center border border-primary">
                            <div>
                                <h2 class="fw-bold text-primary">어울리는 안주</h2>
                            </div>
                        </div>
                        <div class="d-flex justify-content-center border border-primary">
                            <div>
                                <p class="fs-5 fst-italic">${vo1.product_point_snack}</p>
                            </div>
                        </div>
                        <div class="border border-primary">
                            <jsp:include page="product_review.jsp?review_list=${review_list}"></jsp:include>
                        </div>

                    </article><!-- End blog post -->

                </div>

                <%-- sidebar 결제하기 파트 --%>
                <div class="col-3">
                    <jsp:include page="buy.jsp?idx=${vo1.product_idx}"></jsp:include>
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
