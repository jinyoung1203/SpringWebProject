<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link href="${pageContext.request.contextPath}/resources/css/event_css/event.css"
	rel="stylesheet">
	<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
		
	</head>
	
	<body>
		
		<div class="head_title d-flex justify-content-center align-items-center">

			<img class="downdown"  src="/alcohol/resources/event_image/막걸리_2.png">
			<span class="namename">특별한 날, 주당들과 함께해요</span>
			<img class="downdown" src="/alcohol/resources/event_image/전통주.png">

		</div>
		
		<c:forEach var="list" items="${ event_list }" varStatus="status">
			<div >
				<a href="event_detail.do?event_idx=${ list.event_idx }">
					<img class="imgimg" alt="${ list.event_thumbnail }" src="/alcohol/resources/event_image/${ list.event_thumbnail }">
				</a>
			</div>
		
		</c:forEach>
	</body>
</html>