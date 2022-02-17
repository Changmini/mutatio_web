<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/inc/frame.jsp" %>
<%@include file="/WEB-INF/inc/onload.jsp" %>
<link rel="stylesheet" type="text/css" href="/resources/css/style_quesView.css">
<title> View </title>
</head>
<body>

<div id="wrap">
	<div class="header"></div> <!-- header -->
    <!-- ===================================================================== -->
	<div id="sub_title_div"></div> <!-- sub_title_div -->
    <!-- ===================================================================== -->
    
	<div class="container">
		<div class="contents">
			<div class="content01">
				<div class="c_h2">
					<h2> 문의게시판 - <small>글 상세보기 </small></h2>
				</div>
	  		</div>
		<div id="div_table">
			<form action="quesModify.do" name="setDataForm" method="post">
				<!-- param -->
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				<input type="hidden" name="quesNo" value="${quesBoard.quesNo}">
				<table cellspacing='0'>
					<colgroup>
						<col width="10%">
						<col width="30%">
						<col width="10%">
						<col width="30%">
					</colgroup>
					<tbody>
						<tr>
							<th>글번호</th>
							<td>${quesBoard.quesNo}</td>
							<th>글분류</th>
							<td>
								<select id="id_quesCategory" name="quesCategory">
								<c:forEach items="${codeList}" var="i">
									<option value="${i.commCd}" 
									${i.commCd==quesBoard.quesCategory?'selected="selected"':"" }
									>${i.commNm}</option>
								</c:forEach>
								</select>
							</td>
							<th>조회수</th>
							<td>${quesBoard.quesHit }</td>
						</tr>
						<tr>
							<th>작성자명</th>
							<td>${quesBoard.quesWriter }</td>
							<th>논문번호</th>
							<td>
								<input type="text" name="quesThesisNo" value="${quesBoard.quesThesisNo }">
							</td>
							<th>최근등록일자</th>
							<td>${quesBoard.quesModDate eq null  ? quesBoard.quesRegDate : quesBoard.quesModDate}</td>
						</tr>
						<tr>
							<th id="err_title" class="test">글제목</th><!-- 여기~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
							<td colspan="5">
								<input type="text" name="quesTitle" value="${quesBoard.quesTitle}">
							</td>
						</tr>
						<tr>
							<th id="err_content">내용</th> <!-- 여기~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
							<td colspan="5" class="td_center"><textarea rows="10" id="textarea_content" 
							name="quesContent">${quesBoard.quesContent }</textarea></td>
						</tr>
						<tr>
							<td colspan="6">
								<div class="pull-left">
									<button type="button" class="btn btn-sea"
										onclick="location.href='quesList.do'">목록으로</button>
								</div>
								<div class="pull-right">
									<button type="submit" class="btn btn-sea"
										>저장하기
									</button>
									<button type="submit" formaction="quesDel.do" class="btn btn-sea del-btn"
										>삭제하기
									</button>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
		<!-- div_table -->
	</div>
	<!-- contents -->

</div>
<!-- container -->
<footer id="page_footer"></footer><!-- footer -->

</div>
<!-- wrap -->
</body>
<script>
	function fn_error() {
		if ( ${quesVO.errClass ne null} ) {
			alert("필수 입력란이 비어있습니다.");
			
			let err = '${quesVO.errClass}'
			let title = $('input[name=quesTitle]').val();
			let content = $('textarea[name=quesContent]').val();
			
			$('#err_title').removeClass(err);
			$('#err_content').removeClass(err);
			if (title == '' || title == null || title == undefined) {
				$('#err_title').addClass("errClass");
			}
			console.log(content);
			if (content == '' || content == null || content == undefined) {
				$('#err_content').addClass(err);			
			}
		} // El true, false
	} // fn_error
	fn_error();
</script>
</html>




















