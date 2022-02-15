<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>introduction</title>
<link rel="stylesheet" type="text/css" href="resources/css/style_header.css">
<link rel="stylesheet" type="text/css" href="resources/css/style_sub_title.css">
<link rel="stylesheet" type="text/css" href="resources/css/style_footer.css">
<link rel="stylesheet" type="text/css" href="resources/css/style_introduction.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
    <div id="wrap">
        <!-- header start-->
    <div class="header">
        </div>
        <!-- sub_title_div start-->
        <div id="sub_title_div">
        </div>
        <div class="content">
            <div class="them_box">
                <h3 class="page-tit-h2">오픈액세스 정책의 의의</h3>
                <pre class="text">오픈액세스 정책은 정부, 연구기금기관, 연구기관(대학, 연구소 등)이 채택한 정책으로
연구기금 수령자, 대학교수, 소속 연구원이 연구성과물을 기관 리포지터리 또는 
주제 리포지터리에 셀프 아카이빙 하거나, OA 저널에 출판하도록 의무화 함.
                <br>
정부, 연구기금기관의 오픈액세스 정책은 공공기금으로 산출된 연구성과물은 
공공의 세금·예산으로 공공의 이익을 위해 생산되므로 공공의 영역에서 자유롭게 이용되어야 함을 전제로 하며, 
연구기관의 오픈액세스 정책은 연구성과물의 광범위한 확산과 사회와 학문의 발전에 기여함을 목적으로 함.
                </pre>
                <div class="indent_box">
                    <span>Open Access Policy, Mandate</span>
                    <ul class="inner_list">
                        <li>mandate는 의무사항을 강조하므로 policy 보다 좀 더 강력한 의미로 사용됨.</li>
                        <li>정부, 부처 차원의 오픈액세스는 public access로 표현되기도 함.</li>
                        <li>공적자금이 투입된 연구성과물(출판물, 데이터 등)을 디지털화하여 공개한다는 측면에서 오픈사이언스의 취지와 연관성이 높음.</li>
                    </ul>
                </div>
                <div class="crawling_box">
                    <h3 class="page-tit-h2">크롤링 된 논문 사이트</h3>
                    <ul>
                        <li>
                            <div class="site_logo">
                                <a href="http://www.riss.kr/index.do">
                                    <img src="http://www.riss.kr/commons/images/logo.png" alt="이미지가 없습니다.">
                                </a>
                            </div>
                            <div class="txt_box">
                                <h3>RISS</h3>
                                RISS(Research Information Sharing Service)는 전국 대학이 생산하고 보유하며 구독하는
                                <br>학술자원을 공동으로 이용할 수 있도록 개방된 대국민 서비스입니다.
                            </div>
                            <div class="crawling_cnt">
                                <span>${thesisCount }</span> 개
                                <br>논문 크롤링
                            </div>
                        </li>
                        <li>
                            <div class="site_logo">
                                <a href="https://www.science.org/">
                                    <img src="resources/images/logo_science.svg" alt="이미지가 없습니다.">
                                </a>
                            </div>
                            <div class="txt_box">
                                <h3>SCIENCE</h3>
                                	미국과학진흥회(American Association for the Advancement of Science)
                                <br>에서 발간하는 과학 학술지입니다.
                            </div>
                            <div class="crawling_cnt">
                                <span>1521</span> 개
                                <br>논문 크롤링
                            </div>
                        </li>
                        <li>
                            <div class="site_logo">
                                <a href="https://www.koar.kr/main/main.do">
                                    <img src="resources/images/logo_koar.svg" alt="이미지가 없습니다.">
                                </a>
                            </div>
                            <div class="txt_box">
                                <h3>KOAR</h3>
                                	한국과학기술정보연구원(KISTI)이 연구자들의 학술정보 접근성 증대를 위한
                                <br> 국가 오픈액세스 플랫폼(KOAR) 서비스입니다.
                            </div>
                            <div class="crawling_cnt">
                                <span>1891</span> 개
                                <br>논문 크롤링
                            </div>
                        </li>
                        <li>
                            <div class="site_logo">
                                <a href="https://kiss.kstudy.com/">
                                    <img src="https://kiss.kstudy.com/images/img-common/logo-top-is1.png" alt="이미지가 없습니다.">
                                </a>
                            </div>
                            <div class="txt_box">
                                <h3>KISS</h3>
                                KISS는 국내 학술지의 서지, 원문정보를 제공하는 통합검색 서비스입니다.
                                <br>1,400여 기관에서 발행하는 전 주제 분야 총 3,000여 종의 학술정보를 제공하고 있습니다.
                            </div>
                            <div class="crawling_cnt">
                                <span>1234</span> 개
                                <br>논문 크롤링
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>







        <!-- footer start-->
        <footer id="page_footer">
        </footer>
</div>
</body>
<script>
$(function(){
	$(".header").load("frame/header.do");
	$("#sub_title_div").load("frame/sub_title.do");
	$("#page_footer").load("frame/footer.do");
}); 

</script>
</html>

