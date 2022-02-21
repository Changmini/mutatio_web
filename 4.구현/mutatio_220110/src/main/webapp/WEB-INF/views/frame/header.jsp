<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script>
	// 윈도우 스크롤 작동시 메뉴 감추기
	$(window).scroll(function(){ 
	    let menuicon = document.getElementById("menuicon");
	    menuicon.checked=false;
	});
	
	// logout
	$('#path_logout').on('click',function(e){
		e.preventDefault();
		$('form[name=logoutForm]').submit();
	});
</script>

<div class="emptyArea"></div> <!-- 3.3 -->


<div class="titleArea"> <!-- 3.3 -->
    <h1><a href="<%=request.getContextPath()%>/home.do">SIS</a></h1>
    <h4>Sharing Information Site</h4>
</div>


<div class="etc_icon"> <!-- 3.3 -->
	<div> <!-- first DIV -->
		<c:if test="${sessionScope.USER_INFO ne null}">
			<a id="myInfo" href="<%=request.getContextPath()%>/member/memberInfo.do"></a>
		</c:if>
	</div><!-- end first DIV -->
	
	<div> <!-- second DIV -->
		<c:if test="${sessionScope.USER_INFO eq null}">
			<a id="path_login" href="<%=request.getContextPath()%>/login.do"></a>
		</c:if>
		<c:if test="${sessionScope.USER_INFO ne null}">
			<form name="logoutForm" action="<%=request.getContextPath()%>/logout.do" method="get">
				<a id="path_logout" href="#"></a>
				<sec:csrfInput/>
			</form>
		</c:if>
    </div><!-- end second DIV -->
    
	<div> <!-- third DIV -->
		<div class="menuIconArea">
	        <input type="checkbox" id="menuicon">
	        <Label for="menuicon">
	            <span></span>
	            <span></span>
	            <span></span>
	        </Label>
	        
	        <div class="nav_icon">
	            <ul class="menu"> <!-- 카테고리 -->
	                <li><a href="<%=request.getContextPath()%>/home.do">Home</a></li>
	                <li><a href="<%=request.getContextPath()%>/introduction.do">Introduction</a></li>
	                <li><a href="<%=request.getContextPath()%>/member/hotNews.do">Today News</a></li>
	                <li><a href="<%=request.getContextPath()%>/member/recommend.do">Recommend</a></li>
	                <li><a href="<%=request.getContextPath()%>/thesisList.do">Journals</a></li>
	                <li><a href="<%=request.getContextPath()%>/freeList.do">Free Board</a></li>
	                <li><a href="<%=request.getContextPath()%>/member/quesList.do">Question Board</a></li>
	            	<c:if test="${sessionScope.USER_INFO eq null}">
		                <li><a href="<%=request.getContextPath() %>/login.do">Login</a></li>
		                <li><a href="<%=request.getContextPath()%>/join.do">Join</a></li>
	                </c:if>
	            </ul>
	        </div>  
	    </div>
    </div><!-- end third DIV -->
	<div> <!-- fourth DIV -->
    
    </div><!-- end fourth DIV -->
</div>