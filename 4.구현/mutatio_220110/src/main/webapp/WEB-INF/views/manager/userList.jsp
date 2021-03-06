<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<%@include file="/WEB-INF/inc/frame.jsp" %>
	<%@include file="/WEB-INF/inc/onload.jsp" %>
	<link rel="stylesheet" type="text/css" href="../resources/css/style_userList.css">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=PT+Sans:700' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />
	<title> UserList </title>
</head>

<body>
<%
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma","no-cache");  
	response.setDateHeader("Expires",0);  
	if (request.getProtocol().equals("HTTP/1.1"))
	        response.setHeader("Cache-Control", "no-cache");
%>
<div id="wrap" style="text-align:center;">

	<div class="header"></div>
	<!-- header -->
	<!-- ===================================================================== -->
	<div id="sub_title_div"></div>
	<!-- sub_title_div -->
	<!-- ===================================================================== -->
		
	<div id="searchBackground">
		<div class="detailsList">
				<form name="search" action="userList.do" method="post">
					<sec:csrfInput/>
					<input type="hidden" name="curPage" value="${searchVO.curPage }">
					<div>
						<div>
							<h5>회원상태 :</h5>
							 <select id="id_memDelYn" name="memDelYn">
								<option value="N" ${searchVO.memDelYn eq 'N' ? "selected='selected'" : "" }>활동중</option>
								<option value="Y" ${searchVO.memDelYn eq 'Y' ? "selected='selected'" : "" }>정지중</option>
							</select>
						</div>
					
						<div>
							<h5>카테고리 :</h5>
							 <select id="id_searchJobCate" name=searchJobCate>
								<option value="">-- 전체 --</option>
								<c:forEach items="${jobCodeList}" var="code">
									<option value="${code.commCd}"
										${searchVO.searchJobCate eq code.commCd ? "selected='selected'" : "" }>${code.commNm}</option>
								</c:forEach>
							</select>
						</div>
						<!-- 카테고리 E -->
						<div>
							<h5>검색옵션 :</h5>
							&nbsp;&nbsp;- <select id="id_searchType" name="searchType"
								class="form-control input-sm">
								<option value="I"
									${searchVO.searchType eq "I"? "selected='selected'":"" }>아이디</option>
								<option value="N"
									${searchVO.searchType eq "N"? "selected='selected'":"" }>회원명</option>
							</select>
						</div>
						<!-- 검색옵션 E -->
					</div>
					<div class="searchArea_user">
						<input type="text" id="input_search" name="searchWord" value="${searchVO.searchWord }"
							placeholder="Search">
						<div class="col three">
							<button type="submit" class="btn btn-sea">검색</button>
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
                <h2>- 회원관리 -</h2>
            </div>
			<c:if test="${ddn != null }"><h1>존재하는 데이터가 없습니다.</h1></c:if>
						
              <!-- 리스트 -->
            <c:if test="${ddn == null }">
            <div id="div_table">
         <table cellspacing='0'> <!-- cellspacing='0' is important, must stay -->
			<colgroup>
					<col width="10%" />
					<col width="10%" />
					<col width="10%" />
					<col width="15%" />
					<col width="10%" />
	      </colgroup>				
						<thead>
					<tr>
						<th>Id</th>
						<th>회원명</th>
						<th>직업</th>
						<th>관심분야</th>
						<th>등록일</th>
					</tr>
			</thead><!-- Table Header -->
			<tbody>
				 <c:forEach items="${memberList}" var="member">
					<tr>
						<td><a href="userView.do?memId=${member.memId}"
							>${member.memId}</a></td>
						<td>${member.memName}</td>
						<td>${member.memJobNm}</td>
						<td>${member.conCodeName[0]},&nbsp;&nbsp;${member.conCodeName[1]}</td>
						<td>${member.memRegDate}</td>
					</tr><!-- Table Row -->
				</c:forEach>	
			</tbody>
        </table>
           </div>
            <nav class="text-center">
		      			<ul class="pagination">
						<!-- 첫 페이지  -->
						<li><a href="free_list.do?curPage=1" data-page="1"><span aria-hidden="true">&laquo;</span></a></li>
						<!-- 이전 페이지 -->
						<c:if test="${searchVO.startPageNum != 1 }">
							<li><a href="free_list.do?curPage=${searchVO.startPageNum-1 }" data-page="${searchVO.startPageNum-1 }"><span aria-hidden="true">[ 이전 ] </span></a></li>
						</c:if>
		
						<!-- 페이지 넘버링  -->
						<c:forEach begin="${searchVO.startPageNum }" end="${searchVO.endPageNum }" var="i">
						
							<c:if test="${searchVO.curPage == i }">
								<li class="active"><a href="free_list.do?curPage=${i }" class="numberColor">${i }</a></li>
							</c:if>
							
							<c:if test="${searchVO.curPage != i }">
								<li><a href="free_list.do?curPage=${i }" data-page="${i }">${i }</a></li>
							</c:if>
							
						</c:forEach>
		
						<!-- 다음  페이지  -->
						<c:if test="${(searchVO.endPageNum) != searchVO.totalPageCount}">
							<li><a href="free_list.do?curPage=${searchVO.endPageNum+1 }" data-page="${searchVO.endPageNum+1 }"><span aria-hidden="true"> [ 다음 ]</span></a></li>
						</c:if>
		
						<!-- 마지막 페이지 -->
						<li><a href="free_list.do?curPage=${searchVO.totalPageCount }" data-page="${searchVO.totalPageCount }"><span aria-hidden="true">&raquo;</span></a></li>
					</ul>
			</nav>
			</c:if>
        </div>  <!-- content01 -->

        
    </div> <!-- content -->
   </div>
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
			f.searchJobCate.options[0].selected = true;
		}); // #id_btn_reset.click
</script>
</html>
