<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <script>
        window.onload = function() {
            $(function() {
                $(".header").load("<%=request.getContextPath() %>/frame/header.do");
                $("#sub_title_div").load("<%=request.getContextPath() %>/frame/sub_title.do");
                $("#page_footer").load("<%=request.getContextPath() %>/frame/footer.do");
            });
        }
    </script>



