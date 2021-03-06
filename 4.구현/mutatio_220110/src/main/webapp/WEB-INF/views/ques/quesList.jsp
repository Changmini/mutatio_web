<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/inc/frame.jsp" %>
<%@include file="/WEB-INF/inc/onload.jsp" %>
<link rel='stylesheet' type='text/css' href='<%=request.getContextPath() %>/resources/css/style_quesList.css' >
<title> Question Board </title>
</head>

<body>
<%
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma","no-cache");  
	response.setDateHeader("Expires",0);  
	if (request.getProtocol().equals("HTTP/1.1"))
        response.setHeader("Cache-Control", "no-cache");
%>
<div id="wrap">
        <div class="header"> 
        </div> <!-- header -->
    
    <!-- ===================================================================== -->
    
        <div id="sub_title_div">
        </div> <!-- sub_title_div -->
    
    <!-- ===================================================================== -->
		<div id="searchBackground">
			<div class="detailsList">
				<form name="search" action="quesList.do" method="post"
					class="form-horizontal">
					<sec:csrfInput/>
					<input type="hidden" name="curPage" value="${searchVO.curPage }">
					<input type="hidden" name="rowSizePerPage"
						value="${searchVO.rowSize }">
					<div>
						<div>
							<h5>카테고리 :</h5>
							&nbsp;&nbsp; <select id="id_searchCategory" name="searchCategory"
								class="form-control input-sm">
								<option value="">-- 전체 --</option>
								<c:forEach items="${codeList}" var="code">
									<option value="${code.commCd}"
										${searchVO.searchCategory eq code.commCd ? "selected='selected'" : "" }>
										${code.commNm}</option>
								</c:forEach>
							</select>
						</div>
						<div>
							<h5>검색옵션 :</h5>
							&nbsp;&nbsp; <select id="id_searchType" name="searchType"
								class="form-control input-sm">
								<option value="T"
									${searchVO.searchType eq "T"? "selected='selected'":"" }>제목</option>
								<option value="W"
									${searchVO.searchType eq "W"? "selected='selected'":"" }>작성자</option>
								<option value="C"
									${searchVO.searchType eq "C"? "selected='selected'":"" }>내용</option>
							</select>
						</div>
					</div>
					<div class="searchArea_free">
						<input type="text" id="input_search" name="searchWord" value="${searchVO.searchWord }"
							placeholder="Search">
						<div class="col three">
							<button type="submit" class="btn btn-sea">검색</button>
						</div>
						<div class="col three">
							<button type="button" class="btn btn-sea"
								onclick="location.href='quesForm.do'">글쓰기</button>
						</div>
					</div>
				</form>
			</div>
		</div>


		<!-- ===================================================================== -->

<div class="container">
    <div class="contents">

        <div class="content01">

            <div class="c_h2">
                <h2>- 문의게시판 -</h2>
            </div>
			<c:if test="${ddn != null }"><h1>존재하는 데이터가 없습니다.</h1></c:if>
			
			
            <!-- 리스트 -->
            <c:if test="${ddn == null }">
            <div id="div_table">
         <table cellspacing='0'> <!-- cellspacing='0' is important, must stay -->
			<colgroup>
					<col width="1%" />
					<col width="6%" />
					<col width="30%" />
					<col width="10%" />
					<col width="10%" />
					<col width="3%" />
	      </colgroup>
				
			<thead>
				<tr>
					<th>No</th>
					<th>카테고리</th>
					<th>제목</th>
					<th>글쓴이</th>
					<th>DATE</th>
					<th>조회</th>
				</tr>
			</thead><!-- Table Header -->
			<tbody>
				 <c:forEach items="${quesList }" var="quesBoard">
					<tr>
						<td>${quesBoard.quesNo }</td>
						<td>[ ${quesBoard.commNm } ]</td>
						<td><a href="/member/quesView.do?quesNo=${quesBoard.quesNo }">
						    ${quesBoard.quesTitle }
						</a></td>
						<td>${quesBoard.quesWriter }</td>
						<td>${quesBoard.quesRegDate }</td>
						<td>${quesBoard.quesHit }</td>
					</tr><!-- Table Row -->
				</c:forEach>	
			</tbody>
        </table>
		</div> <!-- div_table -->
            <nav class="text-center">
	      			<ul class="pagination">
					<!-- 첫 페이지  -->
					<c:if test="${searchVO.startPageNum != 1 }">
						<li><a href="#" data-page="1"><span aria-hidden="true">&laquo;</span></a></li>
					</c:if>
					<!-- 이전 페이지 -->
					<c:if test="${searchVO.startPageNum-1 > 1 }">
						<li><a href="#" data-page="${searchVO.startPageNum-1 }"><span aria-hidden="true">[ 이전 ] </span></a></li>
					</c:if>
					
					<!-- 페이지 넘버링  -->
					<c:forEach begin="${searchVO.startPageNum }" end="${searchVO.endPageNum }" var="i">
					
						<c:if test="${searchVO.curPage == i }">
							<li class="active"><a href="#" class="numberColor">${i }</a></li>
						</c:if>
						
						<c:if test="${searchVO.curPage != i }">
							<li><a href="#" data-page="${i }">${i }</a></li>
						</c:if>
						
					</c:forEach>
					
					<!-- 다음  페이지  -->
					<c:if test="${searchVO.endPageNum+1 < searchVO.totalPageCount }">
						<li><a href="#" data-page="${searchVO.endPageNum+1 }"><span aria-hidden="true"> [ 다음 ]</span></a></li>
					</c:if>
					<!-- 마지막 페이지 -->
					<c:if test="${(searchVO.endPageNum) != searchVO.totalPageCount}">
						<li><a href="#" data-page="${searchVO.totalPageCount }"><span aria-hidden="true">&raquo;</span></a></li>
					</c:if>
				</ul>
			</nav>
			</c:if>
        </div>  <!-- content01 -->

        
    </div> <!-- content -->
   </div> <!-- container -->
    <footer id="page_footer">
    </footer><!-- footer -->

</div> <!-- wrap -->
</body>
<script type="text/javascript">
		// 변수 정의
		var f = document.forms['search'];

		// 함수 정의

		// 각 이벤트 등록
		// 페이지 링크 클릭
		$('ul.pagination li a[data-page]').click(function(e) {
			e.preventDefault(); // 이벤트 전파 방지,  <a>의 기본 클릭이벤트를 막기위함
			// data-page에 있는 값을 f.curPage.value에 설정, 서브밋
			f.curPage.value = $(this).data('page');
			f.submit();
		}); // ul.pagination li a[data-page]

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
</script>
</html>
