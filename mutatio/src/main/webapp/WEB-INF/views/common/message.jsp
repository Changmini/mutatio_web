<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>error</title>
<link rel="stylesheet" type="text/css" href="/resources/css/style_message.css">
</head>
<body>
<div class="wrap">
    <div class="container">
        <div class="header">
            <h1>SIS</h1>
            <h2>Sharing Information Site</h2>
        </div>
        <div class="icon"></div>
        <div class="title">
            <h3>${resultMessageVO.title}</h3>
        </div>
        <div class="message">
           <h4>${resultMessageVO.message}</h4>
        </div>
        <div class="url_title">
            <button onclick="location.href='${pageContext.request.contextPath}/'">Home</button>
        </div>
        <div class="url_title">
            <button onclick="history.back()">뒤로가기</button>
        </div>
        <c:if test="${not empty resultMessageVO.url}">
        <div class="url_title">
            <button onclick="location.href='${pageContext.request.contextPath}${resultMessageVO.url}'">
            	${resultMessageVO.urlTitle}
            </button>
        </div>
        </c:if>
    </div>
</div>
</body>
</html>
