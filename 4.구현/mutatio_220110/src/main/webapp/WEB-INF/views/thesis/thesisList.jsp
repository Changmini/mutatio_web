<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/inc/frame.jsp" %>
<%@include file="/WEB-INF/inc/onload.jsp" %>
<link rel="stylesheet" type="text/css" href="/resources/css/style_thesisList.css">
<title> Journals </title>
</head>

<body>
<%
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma","no-cache");  
	response.setDateHeader("Expires",0);  
	if (request.getProtocol().equals("HTTP/1.1"))
        response.setHeader("Cache-Control", "no-cache");
%>
<div id="wrap" style="">
	<div class="header"></div>
	<!-- header -->
	
	<!-- ===================================================================== -->

	<div id="sub_title_div"></div>
	<!-- sub_title_div -->

	<!-- ===================================================================== -->
	<div id="searchBackground">
		<div id="searchArea">
	        <div class="searchArea">
	        	<span><h4>논문품질수치:</h4></span>
  				<select id="id_searchQuality" name="searchQuality">
	        	<option value="">전체</option>
  				<c:forEach begin="0" end="5" varStatus="v" var="i">
					<option value="${i/2}"
						${searchVO.searchQuality eq i/2 ? "selected='selected'":""}>${i/2}~${(i/2)+0.5}</option>
				</c:forEach>
				</select>
				<select id="id_searchType" name="searchType">
					<option value="T"
						${searchVO.searchType eq "T"? "selected='selected'":""}>제목</option>
					<option value="W"
						${searchVO.searchType eq "W"? "selected='selected'":""}>작성자</option>
					<option value="C"
						${searchVO.searchType eq "C"? "selected='selected'":""}>내용</option>
				</select>
				
				<input type="text" id="input_search" name="searchWord" placeholder="Search"
					value="${searchVO.searchWord }">
				<button type="submit">검 색</button>
	        </div>
	    </div>
    </div>
    <!-- searchBackground -->
	<hr>
	<div class=topContainer>
		<div id="categoryBackground">
			<div class="detailsList">
				<form name="search" action="thesisList.do" method="post">
					<sec:csrfInput/>
					<input type="hidden" name="curPage" value="${searchVO.curPage }">
					<input type="hidden" name="rowSizePerPage" value="${searchVO.rowSize }">
					<input type="hidden" name="searchWord" value="${searchVO.searchWord }"/>
					<input type="hidden" name="searchType" value="${searchVO.searchType }"/>
					<input type="hidden" name="searchQuality" value="${searchVO.searchQuality }"/>
					<div>
						<div class="categoryBox">
							<nav>
								<ul id="menu_categ">
    								<li><a href="#" class="selec">분야 카테고리 v</a>
    								<ul class="snd_menu sub_menu">
										<c:forEach items="${conCodeList}" var="ci" varStatus="i">
										<li><p><label>
										<!-- 나중에  searchVO쪽을 forEach로 바꾸자 -->
										<input type='checkbox' name='searchCCode' value="${ci.commCd }"
											${searchVO.searchCCode[0] eq ci.commCd ||
												searchVO.searchCCode[1] eq ci.commCd ||
												searchVO.searchCCode[2] eq ci.commCd ||
												searchVO.searchCCode[3] eq ci.commCd ||
												searchVO.searchCCode[4] eq ci.commCd ||
												searchVO.searchCCode[5] eq ci.commCd ||
												searchVO.searchCCode[6] eq ci.commCd ||
												searchVO.searchCCode[7] eq ci.commCd
												? 'checked="checked"': ""}/>
											${ci.commNm }
										</label></p></li>
									</c:forEach>
						
									</ul>
					  			</ul>
							</nav>
						</div> <!-- categoryBox -->
						
						<div class="categoryBox">
							<nav>
								<ul id="menu_year" class="">
    								<li><a href="#" class="selec">발행연도(01~09) v</a>
    								<ul class="snd_menu sub_menu">
    									<c:forEach begin="1" end="9" varStatus="i">
										<li><p><label>
											<!-- 나중에  searchVO쪽을 forEach로 바꾸자 -->
											<input type='checkbox' name='searchDate' value="200${i.count}"
											  ${searchVO.searchDate[0] eq '200'+=i.count || 
												searchVO.searchDate[1] eq '200'+=i.count ||
												searchVO.searchDate[2] eq '200'+=i.count ||
												searchVO.searchDate[3] eq '200'+=i.count ||
												searchVO.searchDate[4] eq '200'+=i.count ||
												searchVO.searchDate[5] eq '200'+=i.count ||
												searchVO.searchDate[6] eq '200'+=i.count ||
												searchVO.searchDate[7] eq '200'+=i.count ||
												searchVO.searchDate[8] eq '200'+=i.count
												? 'checked="checked"': ""}
											    /> 200${i.count}
										</label></p></li>
										
    									</c:forEach>
    								</ul>
						  		</ul>
							</nav>
						</div> <!-- categoryBox -->
						
												<div class="categoryBox">
							<nav>
								<ul id="menu_year2" class="">
    								<li><a href="#" class="selec">발행연도(10~21) v</a>
    								<ul class="snd_menu sub_menu">
    									<c:forEach begin="10" end="21" var="i">
										<li><p><label>
											<!-- 나중에  searchVO쪽을 forEach로 바꾸자 -->
											<input type='checkbox' name='searchDate' value="20${i}"
											  ${searchVO.searchDate[0] eq '20'+=i || 
												searchVO.searchDate[1] eq '20'+=i ||
												searchVO.searchDate[2] eq '20'+=i ||
												searchVO.searchDate[3] eq '20'+=i ||
												searchVO.searchDate[4] eq '20'+=i ||
												searchVO.searchDate[5] eq '20'+=i ||
												searchVO.searchDate[6] eq '20'+=i ||
												searchVO.searchDate[7] eq '20'+=i ||
												searchVO.searchDate[8] eq '20'+=i
												? 'checked="checked"': ""}
											    /> 20${i}
										</label></p></li>
										
    									</c:forEach>
    								</ul>
						  		</ul>
							</nav>
						</div> <!-- categoryBox -->
					</div>
					
				</form>
				<!-- search -->
			</div>
			<!-- detailsList -->
		</div>
		<!-- categoryBackground -->
		
		
		<!-- ===================================================================== -->
	
		<div class="container">
			<div class="contents">
				<div class="c_h2">
					<h2>- Journals -</h2>
				</div>
				<div id="div_table">
					<table cellspacing='0'>
						<!-- cellspacing='0' is important, must stay -->
						<colgroup>
							<col width="60%" />
							<col width="15%" />
							<col width="10%" />
							<col width="15%" />
						</colgroup>
	
						<thead>
							<tr>
								<th>제 목</th>
								<th>저 자</th>
								<th>인용수</th>
								<th>출판일</th>
							</tr>
						</thead>
						<!-- Table Header -->
						<tbody>
							<c:if test="${thesisList.size()==0}">
								<td colspan="4">데이터 없음</td>
							</c:if>
							<c:forEach items="${thesisList}" var="i">
								<tr> 
									<td scope="row">
										<a href="thesisView.do?thesNo=${i.thesNo}">${i.thesTitle }</a>
									</td>
									<td>${i.thesAuth}</td>
									<td>${i.thesImpFactor}</td>
									<td>${i.thesPuDate}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<!-- div_table -->
				<nav class="text-center">
					<ul class="pagination">
						<!-- 첫 페이지  -->
						<c:if test="${searchVO.startPageNum != 1 }">
							<li><a href="#" data-page="1"><span aria-hidden="true">&laquo;</span></a></li>
						</c:if>
						<!-- 이전 페이지 -->
						<c:if test="${searchVO.startPageNum != 1 }">
							<li><a href="#" data-page="${searchVO.startPageNum-1 }">
								<span aria-hidden="true">[ 이전 ] </span>
							</a></li>
						</c:if>
	
						<!-- 페이지 넘버링  -->
						<c:forEach begin="${searchVO.startPageNum }" end="${searchVO.endPageNum }" var="i">
							<c:if test="${searchVO.curPage == i }">
								<li class="active"><a href="#">${i }</a></li>
							</c:if>
	
							<c:if test="${searchVO.curPage != i }">
								<li><a href="#" data-page="${i }">${i }</a></li>
							</c:if>
						</c:forEach>
	
						<!-- 다음  페이지  -->
						<c:if test="${(searchVO.endPageNum) != searchVO.totalPageCount}">
							<li><a href="#" data-page="${searchVO.endPageNum+1 }">
								<span aria-hidden="true"> [ 다음 ]</span>
							</a></li>
						</c:if>
	
						<!-- 마지막 페이지 -->
						<li><a href="#" data-page="${searchVO.totalPageCount }">
							<span aria-hidden="true">&raquo;</span>
						</a></li>
					</ul>
				</nav>
			</div>
			<!-- content -->
		</div>
	</div>
	<!-- topContainer -->
	<footer id="page_footer"> </footer>
	<!-- footer -->

</div>
<!-- wrap -->
</body>
<script type="text/javascript">
	// 변수 정의
	var f = document.forms['search'];
	
	$("#searchArea > div button").on('click', function (e) {
		e.preventDefault(); 
		f.searchWord.value = $('#input_search').val();
		f.searchType.value = $('#id_searchType > option:selected').val();
		f.searchQuality.value = $('#id_searchQuality > option:selected').val();
		f.curPage.value = 1;
		f.submit();
	})
	
	$('ul.pagination li a[data-page]').click(function(e) {
		e.preventDefault(); // 이벤트 전파 방지,  <a>의 기본 클릭이벤트를 막기위함
		// data-page에 있는 값을 f.curPage.value에 설정, 서브밋
		f.curPage.value = $(this).data('page');
		f.submit();
	}); // ul.pagination li a[data-page]s
	
	// 검색 버튼 클릭
	$(f).submit(function(e) {
		e.preventDefault();
		f.curPage.value = 1;
		f.submit();
	}); // f.submit
	
	// 목록 갯수 변경
	// id_rowSizePerPage 변경되었을 때
	// 페이지 1, 목록수 = 현재값 으로 변경 후 서브밋
	$('#id_rowSizePerPage').change(function(e) {
		f.curPage.value = 1;
		f.rowSizePerPage.value = this.value;
		f.submit();
	}); // '#id_rowSizePerPage'.change
	
	// 초기화 버튼 클릭
	$('#id_btn_reset').click(function() {
		f.curPage.value = 1;
		f.searchWord.value = "";
		f.searchType.options[0].selected = true;
		f.searchCategory.options[0].selected = true;
	}); // #id_btn_reset.click
	
	
	
	
	
	
	let isEven_categ = true;
	// 메뉴 슬라이드
	$('#menu_categ > li > a').click(function(e){
		e.preventDefault();
		$(this).next($('.snd_menu')).slideToggle('fast');
		
		if(isEven_categ) {
			// 버튼 클릭 시 스타일 변경
			$(this).removeClass('selec');
			$('#menu_categ > li > a').html('');
			$('#menu_categ > li > a').html('분야 카테고리 ^');
			isEven_categ = false;
		} else {
			// 버튼 클릭 시 스타일 변경
			$(this).addClass('selec');
			$('#menu_categ > li > a').html('');
			$('#menu_categ > li > a').html('분야 카테고리 v');
			isEven_categ = true;
		}
	});
	
	
	let isOneDigit_year = true;
	// 메뉴 슬라이드
	$('#menu_year > li > a').click(function(e){
		e.preventDefault();
		$(this).next($('.snd_menu')).slideToggle('fast');
		
		if(isOneDigit_year) {
			// 버튼 클릭 시 스타일 변경
			$(this).removeClass('selec');
			$('#menu_year > li > a').html('');
			$('#menu_year > li > a').html('발행연도(01~09) ^');
			isOneDigit_year = false;
		} else {
			// 버튼 클릭 시 스타일 변경
			$(this).addClass('selec');
			$('#menu_year > li > a').html('');
			$('#menu_year > li > a').html('발행연도(01~09) v');
			isOneDigit_year = true;
		}
	});
	
	
	let isTwoDigit_year = true;
	// 메뉴 슬라이드
	$('#menu_year2 > li > a').click(function(e){
		e.preventDefault();
		$(this).next($('.snd_menu')).slideToggle('fast');
		
		if(isTwoDigit_year) {
			// 버튼 클릭 시 스타일 변경
			$(this).removeClass('selec');
			$('#menu_year2 > li > a').html('');
			$('#menu_year2 > li > a').html('발행연도(10~21) ^');
			isTwoDigit_year = false;
		} else {
			// 버튼 클릭 시 스타일 변경
			$(this).addClass('selec');
			$('#menu_year2 > li > a').html('');
			$('#menu_year2 > li > a').html('발행연도(10~21) v');
			isTwoDigit_year = true;
		}
	});
</script>
</html>
