<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="../../../resources/css/bootstrap.css">

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
<div class="row">
    <div class="col-3"></div>
    <div class="col-6">
        <table class="table table-bordered caption-top">
            <caption>User샘플 목록</caption>
            <tr>
                <th>번호</th>
                <th>이름</th>
                <th>비밀번호</th>
            </tr>
            <c:forEach var="vo" items="${ user_list }">
                <tr>
                    <td>${ vo.user_idx }</td>
                    <td>${ vo.user_name }</td>
                    <td>${ vo.user_pwd }</td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <div class="col-3"></div>
</div>

<script src="../../../resources/js/bootstrap.min.js"></script>
</body>
</html>