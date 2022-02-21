<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<sec:csrfMetaTags/>
<meta charset="UTF-8">
<%@include file="/WEB-INF/inc/frame.jsp" %>
<%@include file="/WEB-INF/inc/onload.jsp" %>
<title>SIS</title>
<link rel="stylesheet" type="text/css" href="/resources/css/style_memberJoin.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/style_footer.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<script>
window.onload = function() {
	$("#page_footer").load("<%=request.getContextPath() %>/frame/footer.do");
	
	let mem_id_tag = document.getElementById("memId"); 
	let mem_pass_tag = document.getElementById("memPass");
	
	mem_id_tag.onclick = function() {
		document.querySelector(".join_form label[for='memId']").classList.remove("warning");
	}
	mem_pass_tag.onclick = function() {
		document.querySelector(".join_form label[for='memPass']").classList.remove("warning");
	}
}

$(function() {
    $('#idCh').click(function(){
    	
    	let id = $('#memId').val();    	
    	$.ajax({
    		url:'idCheck.do',
    		type: "post",
    		data: {memId:id}, 
    		beforeSend: function(xhr) {
    			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
    		},
    		success: function(data){
    			if(data == '0') {
    				alert('사용 가능한 아이디입니다.');
    			} else {
    				alert("사용 불가능한 아이디입니다.");
    			}
    		},
    		error: function(){
    			alert("서버요청오류");
    		} 
    	});
    });	
}) 

const xhr = new XMLHttpRequest();
xhr.open("POST", "./idCh", true);
xhr.setRequestHeader("Content-Type", "application/json");
</script>
<body>
	<section class="join_section">
		<h1><a href="home.do">Sharing Information Site</a></h1>
		<form class="join_form" name="join_form" action="joinAction.do" method="post">
        	<sec:csrfInput />
        	<div class="join_content">

				<!-- 아이디 S -->
				<div class="join_rowId">
					<h3 class="join_title">
						<label for="memId">아이디</label>
					</h3>
					<span class="ps_box_int_id">
						<input id="memId" type="text" name="memId" class="form-control input-sm" maxlength="20"
							required="required" pattern="\w{4,}" title="알파벳과 숫자로 4글자 이상 입력">			
					</span>
					<button id="idCh">&nbsp;중복확인&nbsp;</button>
					<input type="hidden" name="req_ch_id" value="">
				</div> <!-- 아이디 E -->

		
				<!-- 비밀번호 S -->
				<div class="join_title">
      				<h3 class="join_title">
      					<label for="memPass">비밀번호</label>
      				</h3>
      				<span class="lbl">
      					<span id="memPassSpan" class="step_txt"></span>
      				</span>
					<span class="ps_box_int_pass" id="memPassImg">
						<input id="memPass" type="password" name="memPass" class="int" value=""
							required="required" pattern="\w{4,}" title="비밀번호 입력"
							aria-describedby="memPassMsg" maxlength="20">
					</span>
					<span class="error_next_box" id="memPassMsg" style="display:none"
					 	aria-live="assertive">5~12자의 영문 소문자, 숫자와 특수기호(_)만 사용 가능합니다.</span>
				 </div>
				<!-- 비밀번호 E --> 
			
				<!-- 비밀번호 재확인 S -->
				<div class="join_titleCh">
					<h3 class="join_titleCh">
      					<label for="memPassCh">비밀번호 재확인</label>
      				</h3>
					<span class="ps_box_int_passCh" id="memPassChImg">
						<input id="memPassCh" type="password" name="memPassCh" class="int" value=""
							required="required" pattern="\w{4,}" title="비밀번호 재확인"
							aria-describedby="memPassChMsg" maxlength="20">
						<span id="pswd2Blind" class="wa-blind">설정하려는 비밀번호가 맞는지 확인하기 위해 다시 입력해주세요.</span>
					</span>
					<span class="error_next_box" id="memPassChMsg" style="display:none"
					 	aria-live="assertive"></span> 
				 </div>
				 <!-- 비밀번호 재확인 E -->
					
				<!-- 이름 S -->
				<div class="join_rowNm">
	   				<h3 class="join_title">
	   					<label for="memName">이름</label>
	   				</h3>
					<span class="ps_box_right_space">
						<input id="memName" type="text" name="memName" value="" class="int" maxlength="4"
						 	pattern="[가-힣]{2,}" title="한글로 2글자 이상 입력">		
					</span>
					<span class="error_next_box" id="memNameMsg" style aria-live="assertive">
						필수 정보입니다.</span>
				</div><!-- 이름 E -->
				
				<!-- 생년월일 S -->
				<div class="join_rowBir">
					<h3 class="join_title">
						<label for="memBir">생년월일</label>
					</h3>   	     
					<!-- bir_wrap -->   	
					<div class="bir_wrap">
						<div class=" bir_box">
							<span class="bir_box">
								<input id="memBir" type="date" name="memBir" class="form-control input-sm" value="">
							</span>
						</div>
					</div>
				</div> <!-- 생년월일 E -->			

				<!-- 직업 S -->
				<div class="join_rowJb">
				<h3 class="join_title">
					<label for="memJob">직업</label>
				</h3>
				<div class="JbCode">
				<select id="memJob" name="memJob" title="직업" >       <!-- DB에서 쓰는 이름 name에 적기 -->
							<option value="" selected="selected">--선택하세요--</option>
							<option value="JB01">교수</option>
							<option value="JB02">박사과정</option>
							<option value="JB03">석사과정</option>
							<option value="JB04">대학생</option>
							<option value="JB05">연구원</option>
							<option value="JB06">공무원</option>
						</select>
					</div>
				</div> <!-- 직업 E -->
				
				<!-- 관심분야 S -->
				<div class="join_rowCc" id="mem_cc"> 
					<h3 class="join_title">
		        		<label for="memCc">관심분야</label>
		        	</h3>	

		        	<!-- 체크리스트 S -->
		        	<div class="checkList">
						<c:forEach items="${conCodeList}" var="i" varStatus="index">
							<c:if test="${index.count == 1}">
							<span class="checkList1">
							</c:if>
							
							<c:if test="${index.count <= 4 }">
								<input id="ChkList${index.count}" class="chkBoxType_input"
									type="checkbox" name="conCode" value="${i.commCd}"
									onclick="countChecked(this)">
								<label for="ChkList${index.count}" class="chkBoxType">
									<span class="checkBox">${i.commNm}</span>
								</label>
							</c:if>

							<c:if test="${index.count == 4 }">
							</span>	
							<span class="checkList2">
							</c:if>
								
							<c:if test="${index.count > 4 }">
								<input id="ChkList${index.count}" class="chkBoxType_input"
									type="checkbox" name="conCode" value="${i.commCd}"
									onclick="countChecked(this)">
								<label for="ChkList${index.count}" class="chkBoxType">
									<span class="checkBox">${i.commNm}</span>
								</label>
							</c:if>
						
							<c:if test="${index.count == 8 }">
							</span>
							</c:if>
						</c:forEach>
		        	</div> <!-- 체크리스트 E -->
					<span class="error_next_box" id="memNameMsg" style aria-live="assertive">
						최대 2개까지 선택 가능합니다.</span>
				</div><!-- 관심분야 E --> 
			
				
				<!-- 이메일 S -->
				<div class="row_group3">
					<div class="join_mail">
						<h3 class="join_title h3_email">
				      		<label for="memMail">이메일</label>
			       	</h3>
			       	<span class="ps_box_mail" >
			       		<input id="memMail" type="email" name="memMail" class="int" maxlength="100"
								 value="" aria-label="정확히 입력해주세요.">		
			       	</span>
					</div>
				</div>
				<!-- 이메일 E -->

				<!-- 회원가입 버튼 S -->
				<div class="join_btn">
				    <button type="button" id="btn_id" name="btn_id" onclick="javascript:join()">JOIN</button>
				</div>
				 <!-- 회원가입 버튼 E -->
			</div> <!-- join_content E -->
		</form>
	</section>
	
	<footer id="page_footer"> </footer>
	<!-- footer -->
    
</body>
<script>
let maxCount = 2;
let count = $('input.chkBoxType_input:checked').length;
function countChecked(field) {
	if (field.checked) {
		count += 1;
	} else {
		count -= 1;
	}
	if (count > maxCount) {
		alert("관심분야는 최대 2개 까지 선택해주세요.");
		field.checked = false;
		count -= 1;
	}
}
	
function join() {
	let mem_id_v = document.getElementById("memId").value;
	let mem_pass_v = document.getElementById("memPass").value;
	let mem_pass_ch_v = document.getElementById("memPassCh").value;
	let mem_name_v = document.getElementById("memName").value;
	let mem_bir_v = document.getElementById("memBir").value;
	let mem_jb_v = document.getElementById("memJob").value;
	let mem_cc_v = document.getElementById("ChkList1").value;
	let mem_mail_v = document.getElementById("memMail").value;
	
	const mem_id_label = document
			.querySelector(".join_form label[for='memId']");
	const mem_pass_label = document
			.querySelector(".join_form label[for='memPass']");
	const mem_pass_ch_label = document
			.querySelector(".join_form label[for='memPassCh']"); 
	const mem_name_label = document
			.querySelector(".join_form label[for='memName']");
	// 생년월일은 없어도 됨. date 내장메서드를 사용하기 때문
	const mem_Job_label = document
			.querySelector(".join_form label[for='memJob']");
	const mem_cc_label = document
			.querySelector(".join_form label[for='memCc']");
	const mem_mail_label = document
			.querySelector(".join_form label[for='memMail']");
	

	if (mem_id_v == null || mem_id_v == "" || mem_id_v == undefined) {
		mem_id_label.classList.add("warning");
		alert("아이디를 입력해주세요.");
		return false;
	} else if (mem_pass_v == null || mem_pass_v == "" || mem_pass_v == undefined) {
		mem_pass_label.classList.add("warning");
		alert("비밀번호를 입력해주세요.");
		return false;
	} else if (mem_pass_ch_v == null || mem_pass_ch_v == "" || mem_pass_ch_v == undefined  
			|| mem_pass_ch_v != mem_pass_v) {
		mem_pass_ch_label.classList.add("warning");
		alert("비밀번호가 일치하지 않습니다.");
		return false;
	} else if (mem_name_v == null || mem_name_v == "" || mem_name_v == undefined) {
		mem_name_label.classList.add("warning");
		alert("이름을 입력해주세요.");
		return false;
	} else if (mem_bir_v == null || mem_bir_v == "" || mem_bir_v == undefined) {
		alert("생년월일를 입력해주세요.");
		return false;
	} else if (mem_jb_v == null || mem_jb_v == "" || mem_jb_v == undefined) {
		mem_Job_label.classList.add("warning");
		alert("직업을 선택해주세요.");
		return false;
	} else if (mem_mail_v == null || mem_mail_v == "" || mem_mail_v == undefined) {
		mem_mail_label.classList.add("warning");
		alert("이메일을 입력해주세요.");
		return false;
	} else {
		if (count == 2) {
			join_form.submit();		
			alert("회원가입이 완료되었습니다.");
		} else {
			alert("관심분야를 2가지 선택해주세요.");
		}
	}
} // function join()
</script>
</html>














