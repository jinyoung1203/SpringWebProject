<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link href="${pageContext.request.contextPath}/resources/css/event_css/event.css"
	rel="stylesheet">
		
	</head>
	
	
	
	<body>
			<div>
				<img class="detaildetail" src="/alcohol/resources/event_image/${ event_detail.event_filename1 }">
			</div>
			<div>
				<img class="detaildetail" src="/alcohol/resources/event_image/${ event_detail.event_filename2 }">
			</div>
			<div>
				<img class="detaildetail" src="/alcohol/resources/event_image/${ event_detail.event_filename3 }">
			</div>
			<div>
				<img class="detaildetail" src="/alcohol/resources/event_image/${ event_detail.event_filename4 }">
			</div>
		 
	</body>
	
</html>