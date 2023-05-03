<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>전체상품 보기</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <!-- Favicons -->
    <link href="#" rel="icon">
    <link href="#" rel="apple-touch-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.gstatic.com" rel="preconnect">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
          rel="stylesheet">

    <%-- 인텔리 제이 --%>
    <link href="${pageContext.request.contextPath}/resources/css/fullview.css?ver=1" rel="stylesheet"/>
    <%-- 이클립스 --%>
   <!--  <link href="/alcohol/resources/css/fullview.css?ver=1" rel="stylesheet"/> -->

    <!-- Vendor CSS Files -->

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">


    <link href="${pageContext.request.contextPath}/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css"
          rel="stylesheet">


    <!-- Template Main CSS File -->
    <link href="${pageContext.request.contextPath}/resources/css/fullview_css/main.css" rel="stylesheet">

</head>
<body>
<c:if test="${isUser1 ne null}">
    <!-- Button trigger modal -->
    <button type="hidden" id="modalBtn" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
        Launch demo modal
    </button>

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">로그인 정보 확인</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    로그인 중입니다.
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</c:if>

<!-- ======= Header ======= -->
<header id="header" class="header d-flex align-items-center">

    <div class="container-fluid container-xl d-flex align-items-center justify-content-between">
        <a href="main.do" class="logo d-flex align-items-center">
            <!-- Uncomment the line below if you also wish to use an image logo -->
            <!-- <img src="assets/img/logo.png" alt=""> -->
            <h1>주당들<span>.</span></h1>
        </a>

        <nav id="navbar" class="navbar">
            <ul>
                <li><a href="main.do">Home</a></li>
                <li class="nav-item dropdown"><a href="#"><span>상품보기</span></a>
                    <ul class="dropdown dropdown-menu-arrow profile">
                        <li>
                            <a href="fullview.do" class="dropdown-item"><span>전체상품</span>
                            </a></li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>
                        <li><a href="#">베스트</a></li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>
                        <li><a href="#">신상품</a></li>
                    </ul>
                    <%--<li><a href="fullview.do">전체상품</a></li>
                    <li><a href="#">신상품</a></li>
                    <li><a href="#">베스트</a></li>--%>
                <li><a href="#">담화배송</a></li>
                <li><a href="#">이벤트</a></li>
                <li><a href="#">구독</a></li>
                <li><a href="#">Contact</a></li>


                <c:if test="${user1 eq null}">
                    <li>
                        <a href="login.do">
                            로그인 해주세요.
                        </a>
                    </li>
                </c:if>

                <li class="nav-item dropdown">
                    <c:if test="${user1 ne null}">
                        <a class="nav-link nav-profile d-flex align-items-center pe-0 text-decoration-none" href="#"
                           data-bs-toggle="dropdown">
                            <span class="d-none d-md-block dropdown-toggle ps-2">${user1.user1_name}</span>
                        </a>

                        <%--<img src="${pageContext.request.contextPath}/resources/upload/Stephan.jpg" alt="Profile" class="rounded-circle">--%>
                        <!-- End Profile Iamge Icon -->

                        <ul class="dropdown-menu dropdown-menu-arrow profile">
                            <li>
                                <a class="dropdown-item" href="#">
                                    <span>My Profile</span>
                                </a>
                            </li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <span>Account Settings</span>
                                </a>
                            </li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li>
                                <a class="dropdown-item d-flex align-items-center" href="logout.do">
                                    <span>Sign Out</span>
                                </a>
                            </li>

                        </ul>
                        <!-- End Profile Dropdown Items -->
                    </c:if>
                </li><!-- End Profile Nav -->
            </ul>
        </nav><!-- .navbar -->

        <i class="mobile-nav-toggle mobile-nav-show bi bi-list"></i>
        <i class="mobile-nav-toggle mobile-nav-hide d-none bi bi-x"></i>

    </div>
</header><!-- End Header -->
<!-- End Header -->

<main id="main" class="main">
 		<div class="head">
			<h3 class="fullview">전체상품</h3>
			<h5 class="introduce">주당들의 모든 술을 만나보세요!</h5>
		</div>
		
		<!-- Search select -->
		
		<div class="head">
		<table align="left" class="search_table">
			<tr>
				<!-- 주종 -->
				<td>
					<div class="multiselect" id="type" multiple="multiple" data-target="multi-0">
					    <div class="title noselect"  onclick="text('주종');">
					        <span class="text" value="주종">주종</span>
					        <span class="close-icon">&times;</span>
					        <span class="expand-icon">&#9660;</span>
					    </div>
					    <div class="container">
					        <option value="탁주">탁주</option>
					        <option value="약&#183;청주">약&#183;청주</option>
					        <option value="과실주">과실주</option>
					        <option value="증류주">증류주</option>
					       
					    </div>
					</div>
				</td>
				
				<!-- 도수 -->
				<td>
				<div class="multiselect" id="alcohol_degree" multiple="multiple" data-target="multi-0">
				    <div class="title noselect"  onclick="text('도수');">
				        <span class="text" value="도수">도수</span>
				        <span class="close-icon">&times;</span>
				        <span class="expand-icon">&#9660;</span>
				    </div>
				    <div class="container" >
				        <option value="0% - 10%">0% - 10%</option>
				        <option value="10% - 20%">10% - 20%</option>
				        <option value="20% - 30%">20% - 30%</option>
				        <option value="30%이상">30%이상</option>
				       
				    </div>
				</div>
				</td>
				
				<!-- 가격 -->
				<td>
					<div class="multiselect" id="price" multiple="multiple" data-target="multi-0">
				    <div class="title noselect"  onclick="text('가격');">
				        <span class="text" value="가격">가격</span>
				        <span class="close-icon">&times;</span>
				        <span class="expand-icon">&#9660;</span>
				    </div>
				    <div class="container" >
				        <option value="1만원 이하">1만원 이하</option>
				        <option value="1만원 - 3만원">1만원 - 3만원</option>
				        <option value="3만원 - 5만원">3만원 - 5만원</option>
				        <option value="5만원 - 10만원">5만원 - 10만원</option>
				        <option value="10만원 이상">10만원 이상</option>
				       
				    </div>
				</div>
				</td>
				
				<!-- 단맛 -->
				<td>
					<div class="multiselect" id="sweet" multiple="multiple" data-target="multi-0">
				    <div class="title noselect"  onclick="text('단맛');">
				        <span class="text" value="단맛">단맛</span>
				        <span class="close-icon">&times;</span>
				        <span class="expand-icon">&#9660;</span>
				    </div>
				    <div class="container" >
				        <option value="약한">약한</option>
				        <option value="중간">중간</option>
				        <option value="강한">강한</option>
				    </div>
				</div>
				</td>
				
				<!-- 신맛 -->
				<td>
				<div class="multiselect" id="sour" multiple="multiple" data-target="multi-0">
				    <div class="title noselect"  onclick="text('신맛');">
				        <span class="text" value="신맛">단맛</span>
				        <span class="close-icon">&times;</span>
				        <span class="expand-icon">&#9660;</span>
				    </div>
				    <div class="container" >
				        <option value="약한">약한</option>
				        <option value="중간">중간</option>
				        <option value="강한">강한</option>
				    </div>
				</td>
				
				<!-- 탄산 -->
				<td>
				<div class="multiselect" id="sparkling" multiple="multiple" data-target="multi-0">
				    <div class="title noselect"  onclick="text('탄산');">
				        <span class="text" value="탄산">탄산</span>
				        <span class="close-icon">&times;</span>
				        <span class="expand-icon">&#9660;</span>
				    </div>
				    <div class="container" >
				        <option value="약한">약한</option>
				        <option value="중간">중간</option>
				        <option value="강한">강한</option>
				    </div>
				</td>
				
				<!-- 바디감 -->
				<td>
				<div class="multiselect" id="body" multiple="multiple" data-target="multi-0">
				    <div class="title noselect"  onclick="text('바디감');">
				        <span class="text" value="바디감">바디감</span>
				        <span class="close-icon">&times;</span>
				        <span class="expand-icon">&#9660;</span>
				    </div>
				    <div class="container" >
				        <option value="약한">약한</option>
				        <option value="중간">중간</option>
				        <option value="강한">강한</option>
				    </div>
				</td>
			
			</tr>
		</table>
		
		<div align="right" class="right">
		<input class="search" type="search" placeholder="검색어를 입력해주세요">
		<input class="search_button" type="button" value="search">
		</div>
		</div>
		
		<div class="head">
		<h5><span class="full">${ product_count }</span>건의 품목이 조회되었습니다!</h5>
		</div>
		
		
		<!-- Full view -->
		<table >
		<tr>
			<c:forEach var="list" items="${ product_list }" varStatus="status">
			<c:if test="${status.index%5==0}">
			</tr><tr>
			</c:if>
				<td>
				<a href="detailview.do?product_idx=${ list.product_idx }">
				<article class="allcard">
				  <img
				    class="card__background"
				    src="/alcohol/resources/alcohol_image/${ list.product_thumbnail_filename }"
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
				  	<h3 class="h3">${ list.product_name }</h3>
				  	<h4 class="h4"><span class="full">${ list.product_price }</span>원</h4>
				  	<hr>
				  </div>
				  </a>
				</td>
			</c:forEach>
		</tr>
		</table>

</main><!-- End #main -->

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

<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
        class="bi bi-arrow-up-short"></i></a>


<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/fullview_js/main.js"></script>
<!-- Vendor JS Files -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
<script>

  var txt;
     function text(param) {
		if(param == '주종'){
	      txt = "주종";
		}else if(param == '도수'){
		  txt = "도수";
		}else if(param == '가격'){
		  txt = "가격";
		}else if(param == '단맛'){
		  txt = "단맛";
		}else if(param == '신맛'){
		  txt = "신맛";
		}else if(param == '탄산'){
		  txt = "탄산";
		}else if(param == '바디감'){
		  txt = "바디감";
		}
    
     
     Array.prototype.search = function(elem) {
         for(var i = 0; i < this.length; i++) {
             if(this[i] == elem) return i;
         }
         
         return -1;
     };

     var Multiselect = function(selector) {
         if(!$(selector)) {
             console.error("ERROR: Element %s does not exist.", selector);
             return;
         }

         this.selector = selector;
         this.selections = [];

         (function(that) {
             that.events();
         })(this);
     };
     

     Multiselect.prototype = {

   		
         open: function(that) {
             var target = $(that).parent().attr("data-target");

             if(!this.selections) {
                 this.selections = [ ];
             }
             

             $(this.selector + ".multiselect").toggleClass("active");
         },

         close: function() {
             $(this.selector + ".multiselect").removeClass("active");
         },

         events: function() {
             var that = this;

             $(document).on("click", that.selector + ".multiselect > .title", function(e) {
                 if(e.target.className.indexOf("close-icon") < 0) {
                     that.open();
                 }
             });

             $(document).on("click", that.selector + ".multiselect option", function(e) {
                 var selection = $(this).attr("value");
                 var target = $(this).parent().parent().attr("data-target");

                 var io = that.selections.search(selection);

                 if(io < 0) that.selections.push(selection);
                 else that.selections.splice(io, 1);

                 that.selectionStatus();
                 that.setSelectionsString();
             });

             $(document).on("click", that.selector + ".multiselect > .title > .close-icon", function(e) {
                 that.clearSelections();
             });

             $(document).click(function(e) {
                 if(e.target.className.indexOf("title") < 0) {
                     if(e.target.className.indexOf("text") < 0) {
                         if(e.target.className.indexOf("-icon") < 0) {
                             if(e.target.className.indexOf("selected") < 0 ||
                                e.target.localName != "option") {
                                 that.close();
                             }
                         }
                     }
                 }
             });
         },

         selectionStatus: function() {
             var obj = $(this.selector + ".multiselect");

             if(this.selections.length) obj.addClass("selection");
             else obj.removeClass("selection");
         },

         clearSelections: function() {
             this.selections = [];
             this.selectionStatus();
             this.setSelectionsString();
            
         },

         getSelections: function() {
             return this.selections;
         },

         setSelectionsString: function() {
             var selects = this.getSelectionsString().split(", ");
             $(this.selector + ".multiselect > .title").attr("title", selects);

             var opts = $(this.selector + ".multiselect option");

             if(selects.length > 6) {
                 var _selects = this.getSelectionsString().split(", ");
                 _selects = _selects.splice(0, 6);
                 $(this.selector + ".multiselect > .title > .text")
                     .text(_selects + " [...]");
             }
             else {
                 $(this.selector + ".multiselect > .title > .text")
                     .text(selects);
             }

             for(var i = 0; i < opts.length; i++) {
                 $(opts[i]).removeClass("selected");
             }

             for(var j = 0; j < selects.length; j++) {
                 var select = selects[j];

                 for(var i = 0; i < opts.length; i++) {
                     if($(opts[i]).attr("value") == select) {
                         $(opts[i]).addClass("selected");
                         break;
                     }
                 }
             }
             
         },
         
       

         getSelectionsString: function() {
             if(this.selections.length > 0)
                 return this.selections.join(", ");
             else return txt;
         },

         setSelections: function(arr) {
             if(!arr[0]) {
                 error("ERROR: This does not look like an array.");
                 return;
             }
             alert(this.selections);
             this.selections = arr;
             this.selectionStatus();
             this.setSelectionsString();
         },
     };
     
            
   	
   	  if(txt == "주종"){
	     $(document).ready(function() {
        	 	var multi = new Multiselect("#type");
         });
   	  }else if(txt == "도수"){
	     $(document).ready(function() {
        		 var multi = new Multiselect("#alcohol_degree");
         });
   	  }else if(txt == "가격"){
		     $(document).ready(function() {
         		 var multi = new Multiselect("#price");
	         });
      }else if(txt == "단맛"){
		     $(document).ready(function() {
         		 var multi = new Multiselect("#sweet");
	         });
      }else if(txt == "신맛"){
		     $(document).ready(function() {
         		 var multi = new Multiselect("#sour");
	         });
      }else if(txt == "탄산"){
		     $(document).ready(function() {
         		 var multi = new Multiselect("#sparkling");
	         });
      }else if(txt == "바디감"){
		     $(document).ready(function() {
         		 var multi = new Multiselect("#body");
	         });
      }
     };


  
</script>

</body>
</html>
