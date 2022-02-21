<%@page import="org.springframework.security.taglibs.csrf.CsrfInputTag"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Info</title>
<%@include file="/WEB-INF/inc/frame.jsp" %>
<%@include file="/WEB-INF/inc/onload.jsp" %>
<link rel="stylesheet" type="text/css" href="/resources/css/style_memberInfo.css">
</head>
<body>


	<div id="wrap">

		<div class="header"></div>
		<!-- header -->

		<!-- ================================================================== -->

		<div id="sub_title_div"></div>
		<!-- sub_title_div -->

		<!-- ================================================================== -->

		<div class="contents">
			<div class="center">
				<div class="textArea">
					<c:if test="${not empty error}">
						<div class="warning">${error}</div>
					</c:if>
					<section class="myInfo_form">
						<h1>회원정보</h1>
							
							<!--아이디-->
							<div class="id-area">
								<label for="mem_id"><h5>ID</h5></label>
								<p>${member.memId }<p>					
							</div>
							
							<!-- 이름 -->
							<div class="nm-area">
								<label for="mem_name"><h5>회원명</h5></label>
								<p>${member.memName }<p>	
							</div>
							
							<!-- 생년월일 -->
							<div class="bir-area">
								<label for="mem_bir"><h5>생년월일</h5></label>
								<p>${member.memBir }<p>
							</div>
							
							<!-- 직업 -->
							<div class="job-area">
								<label for="mem_job"><h5>직업</h5></label>
								<p>${member.memJobNm}</p>
							</div>
							
							<!-- 관심분야 -->
							<div class="cc-area">
								<label for="mem_cc"><h5>관심분야</h5></label>			
								<p>${member.conCodeName[0]},&nbsp;&nbsp;${member.conCodeName[1]}</p>				
								</div>
								<!-- 관심분야 E -->

							<!-- 이메일 -->
							<div class="ma-area">
								<label for="mem_mail"><h5>이메일</h5></label>
								<p>${member.memMail }<p>
							</div>
							
							<form action="/member/memberEdit.do" method="post">
								<sec:csrfInput/>
								<!-- 회원정보 수정 버튼 -->
								<div class="btn-area">
									<button type="submit" id="revise" name="revise">REVISE</button>
								</div>
							</form>
					</section>
				</div>
				<!-- textArea -->
			</div>
			<!-- center -->
		</div>
		<!-- contents -->

	<footer id="page_footer">
    </footer><!-- footer -->

</div> <!-- wrap -->
</body>
</html>