<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function go_write(f) {
		f.action = "review_write.do";
		f.submit();
	}
</script>

<style>
</style>

</head>
<body>
	<table>
		<caption>:::리뷰 목록:::</caption>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>내용</th>
			<th>별점</th>
			<th>이름</th>
			<th>제품명</th>
		</tr>
		<c:forEach var="review_board" items="${review_list}">
			<tr>
				<td>${review_board.review_idx}</td>
				<td>${review_board.review_filename}</td>
				<td>${review_board.review_content}</td>
				<td>${review_board.review_rating}</td>
				<td>${review_board.user1_idx}</td>
				<td>${review_board.product_idx}</td>
				
			</tr>
		</c:forEach>
	</table>
	<form>
		<input type="button" value="글쓰기" onclick="go_write(this.form);">
	</form>
</body>
</html>
