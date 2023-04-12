<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1" align="center">
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
	
	
</body>
</html>