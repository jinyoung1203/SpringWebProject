<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>:::전체보기:::</title>
		<link href="/alcohol/resources/css/fullview.css?ver=1" rel="stylesheet"/>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.js"></script>
		<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/js/bootstrap-multiselect.js"></script>
	</head>
	
	
	
	<body>
		<div class="head">
			<h3>전체상품</h3>
			<h5>주당들의 모든 술을 만나보세요!</h5>
		</div>
		
		<!-- Search select -->
		
		<div class="head">
		<table align="left">
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
		
		<div align="right">
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
				
				<article class="card">
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
				  	<h3>${ list.product_name }</h3>
				  	<h4><span class="full">${ list.product_price }</span>원</h4>
				  	<hr>
				  </div>
				  
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