<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<th>유저 이름</th>
			<th>제목</th>
			<th>내용</th>
		</tr>
		<tr>
			<td>${vo1.user1_idx}</td>
			<td>${review_filename}</td>
			<td>${review_content}</td>
		</tr>
	</table>
</body>
</html>