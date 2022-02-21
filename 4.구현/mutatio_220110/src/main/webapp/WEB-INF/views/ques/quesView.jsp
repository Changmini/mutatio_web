<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<%@include file="/WEB-INF/inc/frame.jsp" %>
<%@include file="/WEB-INF/inc/onload.jsp" %>
<link rel="stylesheet" type="text/css" href="/resources/css/style_quesView.css">
<title> View </title>
</head>
<body>
<div id="wrap">
	<!-- go -->
	<form action="quesEdit.do" name="setDataForm" method="post">
		<sec:csrfInput/>
		<input type="hidden" name="quesNo" value="1">
	</form>
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
						<td>${quesBoard.quesNo }</td>
						<th>글분류</th>
						<td>[ ${quesBoard.commNm } ]</td>
						<th>조회수</th>
						<td>${quesBoard.quesHit }</td>
					</tr>
					<tr>
						<th>작성자명</th>
						<td>${quesBoard.quesWriter }</td>
						<th>논문번호</th>
						<td><a href="<%=request.getContextPath()%>/thesisView.do?thesNo=${quesBoard.quesThesisNo}"
							>${quesBoard.quesThesisNo }</a></td>
						<th>최근등록일자</th>
						<td>${quesBoard.quesModDate eq null  ? quesBoard.quesRegDate : quesBoard.quesModDate}</td>
					</tr>
					<tr>
						<th>글제목</th>
						<td colspan="5">${quesBoard.quesTitle}</td>
					</tr>
					<tr>
						<th>내용</th>
						<td colspan="5" class="td_center">
							<div id="textarea_content"
							>${quesBoard.quesContent}
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="6">
							<div class="pull-left">
								<button type="button" class="btn btn-sea"
									onclick="location.href='quesList.do'">목록으로</button>
							</div>
							
							<c:if test="${sessionScope.USER_INFO.username == quesBoard.quesWriter }">
								<div class="pull-right">
									<form action="quesEdit.do" method="post">
										<sec:csrfInput/>
										<input type="hidden" name="quesNo" value="${quesBoard.quesNo}">
										<button type="submit" class="btn btn-sea"
											>수정하기
										</button>
									</form>
								</div>
							</c:if>
							
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- div_table -->
	</div>
	<!-- contents -->
	<div class="container_reply"> <!-- reply container -->
	
		<!-- // START : 댓글 등록 영역  -->		
		<div class="tota_reply_div"> <!-- 바뀐 부분 -->
	        <form name="frm_reply" action="<c:url value='/reply/replyRegist'/>" 
	              method="post" onclick="return false;" >
	            <sec:csrfInput/>
		        <input type="hidden" name="quesNo" value="${quesBoard.quesNo}">
		        <div class="form-group">	
					<div class="label_div">
		              	<p>댓글 :<p>
					</div>	
		            <div class="text_reply_div"> <!-- 댓글 들어가는 영역 -->
		                <textarea class="textarea_reply" rows="3" name="quesReContent"
		                ></textarea>
		            </div>
		            <div class="label_div">
		            	<input type="hidden" name="quesReLevel" value="0">
		                <button id="btn_reply_regist"class="btn btn-sea" type="button">등록</button>
		            </div>
		        </div> <!-- form-group -->
	        </form><!-- frm_reply -->
		</div>	
		<!-- // END : 댓글 등록 영역  -->
	
	
		<!-- // START : 댓글 목록 영역  -->		
		<div id="id_reply_list_area">
			<!-- 
				등록된 댓글이 들어오는 곳           등록된 댓글이 들어오는 곳              등록된 댓글이 들어오는 곳              등록된 댓글이 들어오는 곳               등록된 댓글이 들어오는 곳
			-->
		</div>
		<div class="row text-center" id="id_reply_list_more">
		    <a id="btn_reply_list_more" class="btn btn-sm btn-default col-sm-10 col-sm-offset-1">
		       <label class="label_reply"> 더보기</label> 
		    </a>
		</div>
		<!-- // END : 댓글 목록 영역  -->
		<br>
	
		<!-- START : 댓글 수정용 Modal -->
		<div class="modal fade" id="id_reply_edit_modal" role="dialog">
			<!-- Modal content-->
			<div class="modal-content modify-position">
				<form name="frm_reply_edit" action="<c:url value='/reply/replyModify'/>" 
					method="post" onclick="return false;">
					<sec:csrfInput/>
					<div class="modal-header">
						<h4 class="modal-title">댓글수정</h4>
					</div>
					<div class="modal-body">
						<input type="hidden" name="quesReNo" value="">
						<input type="hidden" name="levelComment" value="">
						<textarea rows="3" name="quesReContent" class="form-control"></textarea>
					</div>
					<br>
					<div class="modal-footer">
						<button id="btn_reply_modify" type="button"
							class="btn btn-sea">댓글 수정</button>
						<button type="button" class="btn btn-sea btn_modal_close"
							data-dismiss="modal">닫기</button>
					</div>
				</form>
			</div>
		</div>
		<!-- END : 댓글 수정용 Modal -->
		
		<!-- START : 대댓글 Modal -->
		<div class="modal fade" id="id_reply_reply_modal" role="dialog">
			<!-- Modal content-->
			<div class="modal-content reply-position">
				<form name="frm_reply_reply" action="<c:url value='/reply/replyReply'/>" 
					method="post" onclick="return false;">
					<sec:csrfInput/>
					<input type="hidden" name="quesNo" value="${quesBoard.quesNo}">
					<input type="hidden" name="quesReLevel" value="">
					<div class="modal-header">
						<h4 class="modal-title">댓글작성</h4>
					</div>
					<div class="name_area">
					 <label id="mem_name"></label>님의 댓글 :
					</div> 
						<div class="modal-body original">
						<input type="hidden" name="quesReParentNo" value="">
						<textarea rows="4" id="original_content" class="form-control" disabled="true"></textarea>
					</div>
					<br>
					<div class="name_area">
					<label>답글 작성 :</label>
					</div>
					<div class="modal-body">
						<input type="hidden" name="quesReParentNo" value="">
						<textarea rows="4" name="quesReContent" class="form-control"></textarea>
					</div>
					<br>
					<div class="modal-footer">
						<button id="btn_reply_reply" type="button"
							class="btn btn-sea"> 답글등록 </button>
						<button type="button" class="btn btn-sea btn_modal_close"
							data-dismiss="modal">닫기</button>
					</div>
				</form>
			</div>
		</div>
		<!-- END : 댓글 수정용 Modal -->
	</div>
</div>
<!-- container -->
<footer id="page_footer"></footer><!-- footer -->

</div>
<!-- wrap -->
</body>
<script type="text/javascript">
let header = $('meta[name="_csrf_header"]').attr("content");
let token = $('meta[name="_csrf"]').attr("content");

var params = { // 댓글 설정(현재페이지, 출력 댓글 수, 게시판번호) 
	 "curPage":1
	,"rowSizePerPage":10
	,"quesNo":"${quesBoard.quesNo}"
};

// 글 등록버튼
$('#btn_reply_regist').on('click', function (e) {
	e.preventDefault();
	$button=$(this); // event button (Regiest)
	$form=$button.closest('form[name=frm_reply]'); // tag form
	let content = $('.text_reply_div > textarea[name=quesReContent]').val(); // 댓글 내용
	if (content == null || content == "" || content == undefined ) {
		alert("댓글 작성 오류");
		return ;
	}
	if( confirm("댓글 등록하시겠습니까?") ){
		$.ajax({
			 url : "<c:url value='/reply/qReplyRegist'/>"
			,type : "POST"
			,dataType : "json"
			,data : $form.serialize() //reContent, reParentNo, reCategory
			,beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			}
			,success : function(map) {
				// 초기화
				$form.find("textarea[name=quesReContent]").val('');
				$('#id_reply_list_area').html('');
				params.curPage=1;
				fn_reply_list();
			}
			,error : function(req, st, err) {
				alert("로그인 확인");
			}
		});
	} // if
});


//수정버튼
$('#id_reply_list_area').on('click','button[name=btn_reply_edit]',function(e) {
	e.preventDefault();
	$modal = $("#id_reply_edit_modal");
	$modal.fadeIn(); // 천천히 요소를 띄움

	$button = $(this);
	$div = $button.closest("div.row"); // #id_reply_list_area
	
	// get data
	$modal_content = $div.find('pre').html(); // reply content
	var reNo = $div.data("re-no"); // reply number
	
	// set data
	$modal.find("textarea[name=quesReContent]").val($modal_content);
	$modal.find("input[name=quesReNo]").val(reNo);
});//수정버튼


//모달창의 닫기버튼 클릭
$(".btn_modal_close").on('click', function(e) {
	e.preventDefault();
	$modal = $("#id_reply_edit_modal");
	$modal2 = $("#id_reply_reply_modal");
	$modal.hide();
	$modal2.hide();

});

//모달창의 댓글 수정(저장)버튼 클릭
$('#btn_reply_modify').on('click',function(e) {
	e.preventDefault();
	$modal = $("#id_reply_edit_modal");
	$form = $modal.find("form[name=frm_reply_edit]");
	if (confirm("저장하시겠습니까?")) {
		$.ajax({
			url : "<c:url value='/reply/qReplyModify'/>",
			type : "POST",
			dataType : "json",
			data : $form.serialize(), //reContent, reParentNo, reCategory
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			},
			success : function(map) {
				alert("댓글이 수정됐습니다.");
				$modal = $("#id_reply_edit_modal");
				$modal.find("textarea[name=reContent]").val("");
				$modal.find("input[name=reNo]").val("");
				$("div.row").remove();
				params.curPage = 1;
				fn_reply_list();
				$modal.hide();
			},
			error : function(req, st,err) {
				alert("수정 오류");
			}
		});
	}

});//모달 저장 버튼


//삭제
$('#id_reply_list_area').on('click','button[name=btn_reply_delete]',function(e) {
	e.preventDefault();
	if (confirm("삭제하시겠습니까?")) {
		$button = $(this);
		$div = $button.closest("div.row");
		let reNo = $div.data("re-no");

		$.ajax({
			url : "<c:url value='/reply/qReplyDelete'/>",
			type : "post",
			dataType : "JSON",
			data : {"quesReNo" : reNo},
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			},
			success : function(map) {
				$div.remove();
			},
			error : function(req, st,err) {
				alert("삭제 실패");
			}

		});
	}
});


// 답글 버튼
$('#id_reply_list_area').on('click','button[id=btn_reply_re]', function(e) {
	e.preventDefault();
	$('textarea[name="quesReContent"]').val(''); // 댓글 내용 초기화
	
	$modal=$("#id_reply_reply_modal");
	$modal.fadeIn(); // 모달 띄우기
	
	$button=$(this); // 이벤트 버튼
	$div=$button.closest("div.row"); // div.row (댓글) -> fn_reply_list()에서 생성
	
	// get data
	$memName = $div.find('input[name=quesReMemName]').val(); // member name
	$modal_content=$div.find('pre').text() // content
	let reNo = $div.data("re-no"); // parent number
	
	// set data
	$modal.find("label[id=mem_name]").html($memName) // member name
	$modal.find("textarea[id=original_content]").val($modal_content); // content
	$modal.find("input[name=quesReParentNo]").val(reNo); // parent number
	
	// 대댓글을 위한 세팅
	// reLevel -> parent
	// reLevel+1 -> children
	let reLevel = parseInt( $div.find('input[name=quesReLevel]').val() );
	reLevel += 1;
	$modal.find("input[name=quesReLevel]").val(reLevel);
	
});//답글버튼


// 대댓글 작성하기
$('#btn_reply_reply').on('click', function (e) {
	e.preventDefault();
	// modal, form 객체 선언ㄴ
	$modal=$("#id_reply_reply_modal");
	$form=$modal.find("form[name=frm_reply_reply]");
	if(confirm("대댓글 작성하시겠습니까?")){
		// 모달창 내용 초기화
		$("textarea[name=reContent]").val("");
		$("input[name=quesReNo]").val("");
		$.ajax({
			 url : "<c:url value='/reply/qReplyRegist'/>"
			,type : "POST"
			,dataType : "json"
			,data : $form.serialize() // reContent, reParentNo, reCategory
			,beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			}
			,success : function(map) {
				// 화면 초기화
				$modal.hide();
				params.curPage=1;
				$("#id_reply_list_area").html(''); // 댓글 영역 초기화
				fn_reply_list();
			}
			,error : function(req, st, err) {
				alert("대댓글 작성 오류");
			}
		});			
	}
	
});//대댓글작성 모달버튼  


//더보기 버튼
$('#btn_reply_list_more').on('click', function moreBtn(e) {
	e.preventDefault();
	fn_reply_list();
});

function fn_reply_list() {
	// DB에서 10개 가져오고 나서 id_reply_list_area에 댓글 10개 append
	// 다음 10개를 봐야되니까 curPage += 1
	$.ajax({
		url : "/reply/qReplyList",
		type : "post",
		dataType : "JSON",
		data : params,
		beforeSend : function(xhr){
			xhr.setRequestHeader(header, token);
		},
		success : function(map) {
			if (map.result) {
				// 10개 이상일 경우만 <더보기> 등장
				if (map.isToCloseMoreBtn) {
					$('#id_reply_list_more').css('display','none');
				} else {
					$('#id_reply_list_more').css('display','inline-block');
				}
				
				var str = "";
				$.each(map.data, function(i, elt) {
					// i -> index
					// elt -> replyVO
					// quesReLevel -> 대댓글 단계
					if (elt.quesReLevel == 0) {
						str += ' <div class="row" data-re-no="'+ elt.quesReNo +'">                                         ';
						str += ' <div class="space"></div>                                                                 ';
					} else if (elt.quesReLevel == 1) {                                                                    
						str += ' <div class="row re_row1" data-re-no="'+ elt.quesReNo +'">                                 ';
						str += ' <div class="space"></div>                                                                 ';
						str += ' <div class="space">ㄴ</div>                                                                ';
					} else if (elt.quesReLevel == 2) {
						str += ' <div class="row re_row2" data-re-no="'+ elt.quesReNo +'">                                 ';
						str += ' <div class="space"></div>                                                                 ';
						str += ' <div class="space"></div>                                                                 ';
						str += ' <div class="space">ㄴ</div>                                                                ';
					} else {                                                                                               
						str += ' <div class="row re_row2" data-re-no="'+ elt.quesReNo +'">                                 ';
						str += ' <div class="space"></div>                                                                 ';
						str += ' <div class="space"></div>                                                                 ';
						str += ' <div class="space"></div>                                                                 ';
						str += ' <div class="space">ㄴ</div>                                                                ';
					}
					str +=     '    <div class="col-sm-2 text-right">'+elt.quesReMemName+' : </div>                        ';
					str +=     '    <div class="col-sm-6"><pre>'+elt.quesReContent+'</pre></div>                           ';
					str +=     '    <div class="col-sm-2">'+elt.quesReRegDate+'</div>                                      ';
					str +=     '    <input type="hidden" name="quesReLevel" value="'+elt.quesReLevel+'">                   ';
					str +=     '    <input type="hidden" name="quesReMemId" value="'+elt.quesReMemId+'">                   ';
					str +=     '    <input type="hidden" name="quesReMemName" value="'+elt.quesReMemName+'">               ';
					// 작성자에게만 수정/삭제 버튼 출력
					if ('${sessionScope.USER_INFO.username}' == elt.quesReMemId) {
						str += '    <div class="edit_btns">                                                                 ';
						str += '        <button name="btn_reply_edit" type="button" class="btn btn-sea">수정</button>        ';
						str += '        <button name="btn_reply_delete" type="button" class="btn btn-sea">삭제</button>      ';
						str += ' 	</div> 																				    ';
					// 일반 사용자
					} else {
						str += ' 	<div class="edit_btns"> ';
						str += '    	<button id="btn_reply_re" class="btn btn-sea" type="button">답글</button>            ';
						str += ' 	</div> ';
					}
					str +=     ' </div>';

				});
				// 댓글 이어붙이기
				$('#id_reply_list_area').append(str);
				params.curPage += 1;
			}
		}, // success
		error : function(err, st, req) {
			alert("에러났다.");
		}
	});
} // fn_reply_list







fn_reply_list(); // 댓글 출력

</script>
</html>




















