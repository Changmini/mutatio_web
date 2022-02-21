<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
$(document).ready(function(){
	$('.sub_check_login').click(function(){
		if(${sessionScope.USER_INFO eq null}){
			alert("로그인 후 이용하실수 있는 서비스입니다. ");
			return false;
		}
	});
});
</script>
<ul class="sub_title">
    <li>
    	<c:if test='${sessionScope.USER_INFO.member.checkRoleList("ROLE_MANAGER")}'>
        <div>
            <h3><a class="sub_check_login"
            href="<%=request.getContextPath() %>/management/userList.do">MemberList</a></h3>
        </div>
        </c:if>
        
        <c:if test='${!sessionScope.USER_INFO.member.checkRoleList("ROLE_MANAGER")}'>
        <div>
            <h3><a
            href="<%=request.getContextPath() %>/introduction.do">Introduction</a></h3>
        </div>
        </c:if>
    </li>

    <li>
        <div>
            <h3><a class="sub_check_login"
            href="<%=request.getContextPath() %>/member/hotNews.do">News</a></h3>
        </div>
    </li>   
    <li>
        <div>
            <h3><a class="sub_check_login"
            href="<%=request.getContextPath() %>/member/recommend.do">Recommend</a></h3>
        </div>
    </li>
    
    <li>
        <div>
            <h3><a 
            href="<%=request.getContextPath() %>/thesisList.do">Journals</a></h3>
        </div>
    </li>
</ul>