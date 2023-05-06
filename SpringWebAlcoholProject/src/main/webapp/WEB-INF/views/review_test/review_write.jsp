<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Review Write</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <!-- Favicons -->
    <link href="#" rel="icon">
    <link href="#" rel="apple-touch-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.gstatic.com" rel="preconnect">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
          rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">


    <link href="${pageContext.request.contextPath}/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css"
          rel="stylesheet">


    <!-- Template Main CSS File -->
    <link href="${pageContext.request.contextPath}/resources/css/main_css/main.css" rel="stylesheet">

    <script src="https://cdn.tiny.cloud/1/no-api-key/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
    <script>
        tinymce.init({
            selector: '#myTextArea'
        });
    </script>
</head>
<body>
<%-- header --%>
<header>
    <jsp:include page="../main/header.jsp"></jsp:include>
</header>

<main id="main" class="main">
    <div class="row"><br><br><br></div>
    <div class="container border border-primary">
        <div class="row">
            <div class="col-1"></div>
            <div class="col-10">
                <div class="card text-center">
                    <div class="card-body">
                        <div class="card-title fs-2 fw-bold text-primary">감악산_산머루주</div>
                        <img class="img-fluid"
                             src="${pageContext.request.contextPath}/resources/alcohol_image/감악산_산머루주_thumb.jpg"/>
                    </div>
                </div>
            </div>
            <div class="col-1"></div>
        </div>
        <div class="row">
            <div class="col-1"></div>
            <div class="col-10">
                <div class="card">
                    <div class="card-header">
                        <span class="fs-2 fw-bold text-success bg-white">리뷰쓰기</span>
                    </div>
                    <div class="card-body">
                        <div class="card-title">sdfsdf</div>
                        <textarea id="myTextArea">
                        <p>Hello World!</p>
                        <p>This is TinyMCE <strong>full</strong> editor</p>
                         </textarea><!-- End TinyMCE Editor -->
                    </div>
                    <div class="card-footer text-end ">sdsd
                        <button class="btn btn-primary">등록하기</button>
                        <button class="btn btn-secondary">취소</button>
                    </div>
                </div>
            </div>
            <div class="col-1"></div>
        </div>
    </div>

</main><!-- End #main -->

<%-- footer --%>
<jsp:include page="../main/footer.jsp"></jsp:include>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<!-- Vendor JS Files -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/resources/js/review_js/impactReview.js"></script>

</body>
</html>
