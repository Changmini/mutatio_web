<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<%request.setCharacterEncoding("utf-8"); %>
<meta charset="UTF-8">
<script>
	function fn_submit() {
		let tempForm = document.getElementById("tempForm");
		tempForm.submit();
	}
</script>
</head>
<body onload="fn_submit()">
	<form action="<%=request.getContextPath()%>/member/quesEdit.do" method="post"
			id="tempForm">
		<sec:csrfInput/>
		<input type="hidden" name="quesNo" value="${quesVO.quesNo}">
		<input type="hidden" name="quesCategory" value="${quesVO.quesCategory}">
		<input type="hidden" name="quesTitle" value="${quesVO.quesTitle}">
		<input type="hidden" name="quesContent" value="${quesVO.quesContent}">
		<input type="hidden" name="errClass" value="${quesVO.errClass}">
	</form>
</body>
</html>




