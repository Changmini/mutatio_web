<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/inc/frame.jsp" %>
<%@include file="/WEB-INF/inc/onload.jsp" %>
<link rel="stylesheet" type="text/css" href="/resources/css/style_quesForm.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/summernote/summernote-lite.css">
<script src="<%=request.getContextPath()%>/resources/js/summernote/summernote-lite.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/summernote/lang/summernote-ko-KR.js"></script>
<title> View </title>
</head>
<script>
if(${NFU eq "NotFoundUser"}) {alert("로그인 후 이용 가능합니다."); location.href='login.do';}
</script>
<body>
<div id="wrap">
	<div class="header"></div> <!-- header -->
    <!-- ===================================================================== -->
	<div id="sub_title_div"></div> <!-- sub_title_div -->
    <!-- ===================================================================== -->
	<div class="page-header">
		<div class="form-out">
			<form:form name="quReForm" action="quesRegist.do" method="post" modelAttribute="quesBoard">
				<h2>
					문의게시판 - <small>글 등록</small>
				</h2>
				<div class="elem-1">
					<div class="div_cate">
						<p>글 분류 :</p>
						<form:select path="quesCategory" name="quesCategory"
							cssClass="form-control input-sm">
							<form:option value="">-- 선택하세요 --</form:option>
							<form:options items="${codeList }" itemLabel="commNm"
								itemValue="commCd" />
						</form:select>
						<form:errors path="quesCategory" />
					</div>
					<div class="div_thesNo">
						<p>논문번호:</p>
						<form:input path="quesThesisNo" name="quesThesisNo"
							cssClass="form-control input-sm" 
							value="${quesThesisNo==null ? '':quesThesisNo}"/>
						<form:errors path="quesThesisNo" />
					</div>
					<div class="div_title">
						<p>제목 :</p>
						<form:input path="quesTitle" name="quesTitle"
							cssClass="form-control input-sm" />
						<form:errors path="quesTitle" />
					</div>
				</div>
				<!-- elem-1 -->
				
				<form:textarea path="quesContent" id="summernote" name="quesContent" 
					></form:textarea>
				<form:errors path="quesContent" />
				<div class="pull">
					<div class="div_left"><button type="button" 
						onclick="location.href='quesList.do'"class="btn btn-sea">목록으로</button></div>
					<div class="div_right"><button type="button" class="btn btn-sea">등록하기</button></div>
				</div>
			</form:form>
		</div>
		<!-- form-out -->
	</div>
		
	<footer id="page_footer"></footer><!-- footer -->
</div>
<!-- wrap -->
</body>
<script>

//summernote
$('#summernote').summernote({
	width : 1000,
	height: 300,                 // 에디터 높이
	minHeight: null,             // 최소 높이
	maxHeight: null,             // 최대 높이
	focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
	lang: "ko-KR",					// 한글 설정
	placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정,
	,toolbar: [
		// [groupName, [list of button]]
		['fontname', ['fontname']],
		['fontsize', ['fontsize']],
		['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
		['color', ['forecolor','color']],
		['table', ['table']],
		['para', ['ul', 'ol', 'paragraph']],
		['height', ['height']],
		['insert',['picture','link','video']],
		['view', ['fullscreen', 'help']]
	],
	fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
	fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
});
$('.div_right > button').on('click', function() {
	let st = $('#summernote').val();
	st = st.replace(/<p>/gi,"")
		.replace(/<\/p>/gi,"\n")
		.replace(/<br>/,"")
		.replace(/<br>/gi,"\n");
	$('#summernote').val(st);

	let f = document.forms['quReForm'];
	f.submit();
});
</script>
</html>











