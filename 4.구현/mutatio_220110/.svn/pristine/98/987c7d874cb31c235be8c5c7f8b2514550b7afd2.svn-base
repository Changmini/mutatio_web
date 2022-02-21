<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="java.net.URL"%>
<!--  JSP에서 jsoup을 사용하기 위해 import -->
<%@ page import="org.jsoup.Jsoup" %> 
<%@ page import="org.jsoup.nodes.Document" %>
<%@ page import="org.jsoup.nodes.Element" %>
<%@ page import="org.jsoup.select.Elements" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<title>NextIT</title>
<%@include file="/WEB-INF/inc/frame.jsp" %>
<%@include file="/WEB-INF/inc/onload.jsp" %>
<link rel="stylesheet" type="text/css"  href="/resources/css/style_newsAPI.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
<%
	Elements title[] =new Elements[2];
	Elements txt[] =new Elements[2];
	Elements time[] =new Elements[2];
	String urls[] = new String[2];
	String links[] =new String[2];
	// String str = (String)request.getAttribute("interest");
	List<String> str = (List<String>)request.getAttribute("interest");
	for(int i = 0 ; i < 2 ; i++){
		Document url = Jsoup.connect(
				"https://search.naver.com/search.naver?query="+str.get(i)+"&where=news&ie=utf8&sm=nws_hty")
				.get();
		Elements postsTitle = url.getElementsByAttributeValue("class", "news_tit");
		Element postTitle = postsTitle.get(i);
		title[i] = postTitle.select("a");
		
		Elements postsTxt = url.getElementsByAttributeValue("class", "api_txt_lines dsc_txt_wrap");
		Element postTxt = postsTxt.get(i);
		txt[i] = postTxt.select("a");
		
		Elements postsImg = url.getElementsByAttributeValue("class", "thumb api_get");
		Element postImg = postsImg.get(i);
		Elements img = postImg.select("img");
		for (Element e : img) {
            urls[i] = e.getElementsByAttribute("src").attr("src");
            URL imgUrl = new URL(urls[i]);
            BufferedImage jpg = ImageIO.read(imgUrl);
		}
		
		Elements postsLink = url.getElementsByAttributeValue("class", "news_tit");
		Element postLink = postsLink.get(i);
		Elements link = postLink.select("a");
		for (Element e : link) {
       		links[i] = e.getElementsByAttribute("href").attr("href");
		}
		
	}
%>
	
    <div id="wrap">
    	<!-- header -->
       <div class="header"></div>
   		<!-- sub_title_div -->
		<div id="sub_title_div"></div>
		
		
       <!-- chart -->
		<div class="contents">
			<div id="chart_div">
				<a class="txtBox0">SIS 회원 관심 주제분야</a>
				<canvas id="myChart"></canvas>
			</div>
			<div class="news_div">
				<a class="txtBox1">키워드 시사 & 뉴스</a>
				<div class="news0">
					<div class="top">
						<a href="<%=links[0] %>"><font size="5"><%=title[0].text() %></font></a>
					</div>
					<div class="container">
						<div class="img"><img src="<%=urls[0] %>"></div>
						<div class="content"><%=txt[0].text() %></div>
					</div>
				</div>
				<div class="news1">
					<div class="top">
						<a href="<%=links[1] %>"><font size="5"><%=title[1].text() %></font></a>
					</div>
					<div class="container">
						<div class="img"><img src="<%=urls[1] %>"></div>
						<div class="content"><%=txt[1].text() %></div>
					</div>
				</div>
			</div>
			<div>
				<a class="txtBox2">인기논문 top10</a>
				<div class="conbox con3">
					<table class="table-design">
						<colgroup>
							<col width="5%" />
							<col width="45%" />
							<col width="10%" />
							<col width="15%" />
							<col width="15%" />
							<col width="10%" />
						</colgroup>
						<thead>
							<tr>
								<th>No</th>
								<th>논문이름</th>
								<th>저자</th>
								<th>발행기관</th>
								<th>발행년월</th>
								<th>페이지</th>
							</tr>
						</thead>
						<tbody>
						  <!-- 추천논문 list -->
					  </tbody>
					</table>
				</div>
			</div>
		</div>
		
		<!-- footer -->
		<footer id="page_footer"></footer>
   </div>
</body>
<script>
let header = $('meta[name="_csrf_header"]').attr("content");
let token = $('meta[name="_csrf"]').attr("content");


$.ajax({
	 url: 'chartData.do'
	,type: 'post'
	,dataType:'json'
	,beforeSend : function(xhr){
		xhr.setRequestHeader(header, token);
	}
	,success: function(data) {
		console.log(data)
		let datakey = []
		let dataset = []
		$.each(data,function(key, item){
			datakey.push(key);
			dataset.push(item);
		});
		dataset.reverse();
		let ctx = document.getElementById('myChart').getContext("2d");
		let myChart = new Chart(ctx, {
			type: 'bar'
			, data: {
				labels: ['인문학', '사회과학', '자연과학', '공학', '의약학', '농수해양','예술체육','교육']
				, datasets: [{ 
					label: '# of Votes'
					, data: dataset
					, backgroundColor: [ 
						'rgba(255, 99, 132, 0.2)'
						, 'rgba(54, 162, 235, 0.2)'
						, 'rgba(255, 206, 86, 0.2)'
						, 'rgba(75, 192, 192, 0.2)'
						, 'rgba(153, 102, 255, 0.2)'
						, 'rgba(255, 159, 64, 0.2)'
						]
					, borderColor: [
						'rgba(255, 99, 132, 1)'
						, 'rgba(54, 162, 235, 1)'
						, 'rgba(255, 206, 86, 1)'
						, 'rgba(75, 192, 192, 1)'
						, 'rgba(153, 102, 255, 1)'
						, 'rgba(255, 159, 64, 1)'
						]
					, borderWidth: 1
				}]
			}
				, options: {
					scales: {
						yAxes: [{
							ticks: {
								beginAtZero: true
							}
						}]
					} 
				}
	
		});
	}
	,error: function(e) {
		alert("error"+e.status);
	}
});

let i = 0;
$.ajax({
	url: 'rankedAPI.do'
	,type: 'post'
	,contentType:"application/x-www-form-urlencoded; charset=UTF-8;"
	,dataType:'xml'
	,beforeSend : function(xhr){
		xhr.setRequestHeader(header, token);
	}
	,success: function(data) {
		console.log("api 불러오기 성공::");
		console.log(data);
		$(data).find('item').each(function(){
			let title = $(this).find("title").text(); // 논문이름
			let link_url = $(this).find("link_url").text(); // 논문이름
			let name = $(this).find("authors name").text(); // 저자
			let publisher = $(this).find("publisher name").text(); // 발행기관
			let issue_yymm = $(this).find("issue yymm").text(); // 발행일
			let pages = $(this).find("pages").text(); // 페이지 수
				i = i + 1
				let innerText ="";
	        	innerText +="<tr>";
	        	innerText +="<th>"+(i)+"</th>";
	        	innerText +='<td title='+title+'>'+'<a href="'+link_url+'" target="_blank">'+title+'</a></td>';
	        	innerText +="<td title="+name+">"+name+"</td>";
	        	innerText +="<td title="+publisher+">"+publisher+"</td>";
	        	innerText +="<td>"+issue_yymm+"</td>";
	        	innerText +="<td>"+pages+"</td>";
	        	innerText +="</tr>";
		       $(".con3 > table > tbody").append(innerText);
		});
		}
	,error: function(e) {
		alert("error"+e.status);
	}
});    


                            

</script>
</html>
