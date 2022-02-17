<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>SIS</title>
<link rel="stylesheet" type="text/css" href="resources/css/style_login.css">
<%@include file="/WEB-INF/inc/frame.jsp" %>
<%@include file="/WEB-INF/inc/onload.jsp" %>
</head>
<body>
    <div class="totArea">
    <div class="imageArea"></div>
    <div class="textArea">
        <section class="login_form">
            <h1><a href="home.do">Sharing Information Site</a></h1>
            <div class="msg-area">
            	${error}	
            </div>
            <form class="loginForm" action="login.do" method="post">
            	<sec:csrfInput/>
                <!--아이디  autocomplete="off" 속성을 통해서 아이디 이력 창을 없앨 수 있음-->
                <div class="int-area">
                    <input type="text" id="mem_id" name="memId" value="" required>
                    <label for="mem_id" >USER ID</label>
                </div>
                <!--비번-->
                <div class="int-area">
                    <input type="password" id="mem_pass" name="memPass" required>
                    <label for="mem_pass" >PASSWORD</label>
                </div>
                <div class="btn-area">
                    <button type="submit" id="btn_id" name="btn_id">LOGIN</button>
                </div>
            </form>
            <div class="caption">
                <ul class="caption_ul">
                    <li>
                        <a href="<%=request.getContextPath()%>/join.do">Join</a>
                    </li>
                    <li>
                        <a href="#">ForgotPassword</a>
                    </li>
                </ul>
            </div>
        </section>  
    </div>

</div>
<footer id="page_footer"></footer><!-- footer -->
</body>
</html>












