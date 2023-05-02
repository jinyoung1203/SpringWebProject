<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>:::전체보기:::</title>
		<%-- 인텔리 제이 --%>
		<link href="${pageContext.request.contextPath}/resources/css/fullview.css?ver=1" rel="stylesheet"/>
		<%-- 이클립스 --%>
		<%--<link href="/alcohol/resources/css/fullview.css?ver=1" rel="stylesheet"/>--%>
	</head>
	
	<body>
		
		
		<div class="head">
			<h3>전체상품</h3>
			<h5>주당들의 모든 술을 만나보세요!</h5>
			<h5><span>${ product_count }</span>건의 품목이 조회되었습니다!</h5>
		</div>
		
		<table>
		<tr>
			<c:forEach var="list" items="${ product_list }" varStatus="status">
			<c:if test="${status.index%5==0}">
			</tr><tr>
			</c:if>
				<td>
				<a href="#">
				<article class="card">
				  <img class="card__background"
				    <%-- 인텔리 제이 --%>
				    src="${pageContext.request.contextPath}/resources/alcohol_image/${ list.product_thumbnail_filename }"
					<%-- 이클립스 --%>
				    <%--src="/alcohol/resources/alcohol_image/${ list.product_thumbnail_filename }"--%>
				    alt="${ list.product_name }"
				    width="1920"
				    height="2193"
				  />
				  <div class="card__content | flow">
				    <div class="card__content--container | flow">
				      <h2 class="card__title">${ list.product_name }</h2>
				      <p class="card__description">
				        ${ list.product_simple_content }
				      </p>
				    </div>
				  </div>
				</article>
				  <div class="product">
				  	<h3>${ list.product_name }</h3>
				  	<h4><span>${ list.product_price }</span>원</h4>
				  	<hr>
				  </div>
				  </a>
				</td>
			</c:forEach>
		</tr>
		</table>
		
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
	</body>
</html>