<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
	    <link rel="stylesheet" type="text/css" href="../resources/css/style_header.css">
	    <link rel="stylesheet" type="text/css" href="../resources/css/style_sub_title.css">
	    <link rel="stylesheet" type="text/css" href="../resources/css/style_footer.css">
		<link rel="stylesheet" href="../resources/css/summernote/summernote-lite.css">
       <link rel="stylesheet" type="text/css" href="../resources/css/style_freeEdit.css?dddd">
       <script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script src="../resources/js/summernote/summernote-lite.js"></script>
		<script src="../resources/js/summernote/lang/summernote-ko-KR.js"></script>

	<title>자유게시판 - 글 수정</title>
    <script>
        window.onload = function() {
           $(function() {
                $(".header").load("../frame/header.do");
                $("#sub_title_div").load("../frame/sub_title.do");
                $("#page_footer").load("../frame/footer.do");
            });
          // summernote
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
        }
    </script>

</head>
<body>

<div class="container">
	  <div class="header"> 
        </div> <!-- header -->
    <!-- ===================================================================== -->
        <div id="sub_title_div">
        </div> <!-- sub_title_div -->
    <!-- ===================================================================== -->
	<div class="page-header">
      <form:form action="freeModify.do" method="post" modelAttribute="freeBoard" enctype="multipart/form-data">
		<br>
		<h2>
			자유게시판 - <small>글 수정 </small>
		</h2>
		<br>
			<div id="div_cate"> 글 분류 : 
				<form:select path="freeCategory" name="freeCategory" cssClass="form-control input-sm">
						<form:option value="">-- 선택하세요 --</form:option>
						<form:options items="${codeList }" itemLabel="commNm" itemValue="commCd"/>
				</form:select>
			<form:hidden path="freeNo" name="freeNo" value="${freeBoard.freeNo }"></form:hidden>
			</div>
			<div class="div_title">
				제목  : &nbsp; 
				<form:input path="freeTitle" name="freeTitle" cssClass="form-control input-sm"/>
				<form:errors path="freeTitle"/>
			</div>
		<br>
		<br>
		<form:textarea path="freeContent" id="summernote" name="freeContent" cssClass="form-control input-sm" />
		<form:errors path="freeContent"/>
		<br>
		<div class="pull-left-file">
			첨부파일 : 
			 <input type="file" name="boFiles" class="form-control">
					<div id = "file_div">
				 기존 파일 : 
				<c:forEach var="f" items="${freeBoard.attaches}" varStatus="st">
					<c:if test="${st.index eq 0}">
							     ${f.atchOriginalName}
								 Size : ${f.atchFancySize} / Down : ${f.atchDownHit}
					</c:if>
					<c:if test="${st.index ne 0}">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;${f.atchOriginalName}
								Size : ${f.atchFancySize} / Down : ${f.atchDownHit}
					</c:if>
					&nbsp;
       			<button type="button" id="file_delete_btn" class="file_delete_btn btn btn-sea " data-atch-no="${f.atchNo}">삭제</button>
			  		<br>
			  </c:forEach>
				 </div>
		</div>
		<br>
		<br>
	        <div class="pull-left">
	             <button type="button"  onclick="location.href='${pageContext.request.contextPath }/freeList.do'" class="btn btn-sea"> 
	                   목록으로 
	             </button>
	          </div>
	        <div class="pull-right">
	             <button type="submit" class="btn btn-sea"> 
	                   수정하기
	             </button>
	          </div>
     </form:form>
	</div>
</div>
</body>
<script type="text/javascript">
$('.pull-left-file').on('click','.btn_delete', function(){ 
	$('input[type=file]').val(''); 
	});


//기존 첨부파일 삭제 클릭 
$('.file_delete_btn').click(function(){
	$btn = $(this);
	console.log("del-acheNo :::: " + $btn.data("atch-no"));
	$('.pull-left-file').append(
			 '<input type="hidden" name="delAtchNos" value="' + $btn.data("atch-no")  + '">'
			); 
	$('#file_div').remove();
	$btn.remove();
	$('.pull-left-file').append('<button type="button" id="btn_delete" class="btn btn-sea"> 삭제 </button>');
});   //
	
$('.pull-left-file').on('click','#btn_delete', function(){ 
	$('input[type=file]').val(''); 
	});
</script>
</html>






