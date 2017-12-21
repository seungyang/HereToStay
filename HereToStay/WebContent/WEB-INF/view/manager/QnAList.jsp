<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.*"%>
<%@page import="hts.model.vo.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Sparrow | Travel Agency</title>
<meta name="description" content="" />
<meta name="keywords" content="" />
<meta charset="utf-8" />
<link rel="icon" href="favicon.png" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<link rel="stylesheet" href="/build/mediaelementplayer.min.css" />
<link rel="stylesheet" href="/css/jquery.formstyler.css">
<link rel="stylesheet" href="/css/style.css" />
<link href='http://fonts.googleapis.com/css?family=Montserrat:400,700'
	rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Lora:400,400italic'
	rel='stylesheet' type='text/css'>
<link
	href='http://fonts.googleapis.com/css?family=Raleway:300,400,500,700'
	rel='stylesheet' type='text/css'>
<link
	href='http://fonts.googleapis.com/css?family=PT+Sans:400,700&amp;subset=latin,cyrillic'
	rel='stylesheet' type='text/css'>
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700&amp;subset=latin,cyrillic'
	rel='stylesheet' type='text/css'>

<style type="text/css">
.solution-txt a {
	color: #fff;
	text-decoration: none;
}

.solution-txt b {
	font-family: 'Montserrat';
	font-weight: normal;
	letter-spacing: -0.03em;
	display: block;
	font-size: 20px;
	margin-bottom: 6px;
	color: #ff7200;
	line-height: 15px;
}
</style>
<script type="text/javascript">

</script>
</head>

<body class="gray-inner">
	<jsp:include page="/WEB-INF/view/include/mgr_header.jsp" />

	<!-- main-cont -->
	<div class="main-cont">

		<div class="inner-page">
			<div class="inner-breadcrumbs">
				<div class="content-wrapper">
					<div class="page-title">문의사항</div>
					<div class="breadcrumbs">
						<a href="/manager/pensionList.do">관리자페이지</a> / <span>문의사항</span>
					</div>
					<div class="clear"></div>
				</div>
			</div>

			<div class="content-wrapper">
				<div class="portfolio-filters">
					<nav>
						<ul>
							<li class="active"><a data-sort="all" href="#">전체</a></li>
							<li><a data-sort="countries" href="#">고객</a></li>
							<li><a data-sort="travel" href="#">사장님</a></li>
						</ul>
					</nav>
				</div>
			</div>
			<div class="portfolio-holder portfolio-holder-three">
				<div class="portfolio-three-colls">


					<!-- // -->
					<c:forEach var="QnA" items="${memlist}">
						<div class="portfolio-i countries">
							<div class="portfolio-i-img">
								<div class="portfolio-i-over">
									<div class="portfolio-i-over-a">

										<div class="portfolio-i-over-b">
											<i class="solution-icon"></i>
											<!-- 디테일페이지로 이동 -->
											<div class="solution-txt">
												<a href="qnaDetail.do?qnaId=${QnA.qnaId}">${QnA.qnaContext}</a>
												<br /> <br />
												<c:choose>
													<c:when test="${QnA.qnaStatus eq 'N'}">
														<b>답변대기</b>
													</c:when>
													<c:otherwise>
														<b>답변완료</b>
													</c:otherwise>
												</c:choose>
											</div>

										</div>
									</div>
								</div>
								<c:choose>
									<c:when test="${QnA.photoList[0].fullname ne null}">
										<img src="/uploadPhoto/${QnA.photoList[0].fullname}"
											style="height: 254px; width: 346px;">
									</c:when>
									<c:otherwise>
										<img src="/img/solution-01.jpg">
									</c:otherwise>
								</c:choose>
							</div>
							<div class="portfolio-i-text">
								<b>${QnA.qnaTitle}</b> <span>${QnA.qnaDate.substring(0,10)}</span>
							</div>
						</div>
					</c:forEach>
					<!-- \\ -->
					<!-- // -->
					<c:forEach var="QnA" items="${ownerlist}">
						<div class="portfolio-i travel">

							<div class="portfolio-i-img">

								<div class="portfolio-i-over">

									<div class="portfolio-i-over-a">


										<div class="portfolio-i-over-b">

											<i class="solution-icon"></i>
											<!-- 디테일페이지로 이동 -->
											<div class="solution-txt">
												<a href="qnaDetail.do?qnaId=${QnA.qnaId}">${QnA.qnaContext}</a>
												<br /> <br />
												<c:choose>
													<c:when test="${QnA.qnaStatus eq 'N'}">
														<b>답변대기</b>
													</c:when>
													<c:otherwise>
														<b>답변완료</b>
													</c:otherwise>
												</c:choose>

											</div>

										</div>
									</div>
								</div>
								<c:choose>
									<c:when test="${QnA.photoList[0].fullname ne null}">
										<img src="/uploadPhoto/${QnA.photoList[0].fullname}"
											style="height: 254px; width: 346px;">
									</c:when>
									<c:otherwise>
										<img src="/img/solution-01.jpg">
									</c:otherwise>
								</c:choose>
							</div>
							<div class="portfolio-i-text">
								<b id="title">${QnA.qnaTitle}</b> <span id="date">${QnA.qnaDate.substring(0,10)}</span>
							</div>
						</div>
					</c:forEach>
					<!-- \\ -->


				</div>

			</div>
		</div>
	</div>
	<!-- /main-cont -->
	<jsp:include page="/WEB-INF/view/include/footer2.jsp" />

	<!-- // scripts // -->
	<script src="/js/jquery-1.11.3.min.js"></script>
	<script src="/js/jqeury.appear.js"></script>
	<script src="/js/jquery-ui.min.js"></script>
	<script src="/js/owl.carousel.min.js"></script>
	<script src="/js/bxSlider.js"></script>
	<script src="/js/custom.select.js"></script>
	<script src="/js/isotope.js"></script>
	<script src="/source/jquery.fancybox.js"></script>
	<script type="text/javascript" src="/js/twitterfeed.js"></script>
	<script src="/js/script.js"></script>
	<script>
      $(document).ready(function(){
          'use strict';
            var $container = $('.portfolio-three-colls'); 
            $container.isotope({
                itemSelector: '.portfolio-i',
                columnWidth: 520,
                rowHeight: 220
            });  
            $(".fancybox").fancybox({
              helpers:  {
                overlay : {
                locked : false
              },
              title : { type : 'over' }
              },
              beforeShow : function() {
                this.title = (this.title ? '' + this.title + '' : '')  + (this.index + 1) + ' of ' + this.group.length;
              }
            });   
          
          $('.portfolio-filters li a').on('click', function(){
            var $sort = $(this).data('sort');
            if ($sort=='all') {
              var $sort = '*';
              $container.isotope({ filter: $sort }); 
            } 
            else {
              $container.isotope({ filter: '.'+$sort });      
            }   
            $('.portfolio-filters li').removeClass('active');    
            $(this).closest('li').addClass('active');
            return false;
          });      
      });

  </script>
	<!-- \\ scripts \\ -->

</body>
</html>