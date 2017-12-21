<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
  <title>Sparrow | Travel Agency</title>
  <meta name="description" content="" />
  <meta name="keywords" content="" />
  <meta charset="utf-8" /><link rel="icon" href="favicon.png" />
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"> 
  <link rel="stylesheet" href="/css/jquery.formstyler.css">  
  <link rel="stylesheet" href="/css/style.css" />
  <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
  <link href='http://fonts.googleapis.com/css?family=Lora:400,400italic' rel='stylesheet' type='text/css'>    
  <link href='http://fonts.googleapis.com/css?family=Raleway:300,400,500,700' rel='stylesheet' type='text/css'>  
  <link href='http://fonts.googleapis.com/css?family=PT+Sans:400,700&amp;subset=latin,cyrillic' rel='stylesheet' type='text/css'>
  <link href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700&amp;subset=latin,cyrillic' rel='stylesheet' type='text/css'>	
  <link rel="stylesheet" href="/css/w3.css">	
  <style>
		  html,body{height:100%;}
		.footer-b{position:absolute; bottom:0; width:100%;}
		.wrap{position:relative; min-height:52%; margin-bottom:-100px;}
		.solutions{padding-bottom:0;}
  </style>
</head>  
<body class="inner-body">

<!-- start footer -->
<jsp:include page="/WEB-INF/view/include/owner_header.jsp"></jsp:include>
<!-- end footer -->

<!-- main-cont -->
<div class="main-cont">  	
	
	<div class="inner-page">
						
		<div class="solutions">
			<div class="content-wrapper">
			<header class="page-lbl fly-in">
				<div class="offer-slider-lbl">문의사항</div>
				<p>지금까지 질문한 나의 문의사항을 확인해보세요</p>
			</header>		
			
			<c:forEach var="QnA" items="${QnAList}" varStatus="status">							
	            <c:choose>
					<c:when test="${(status.count)%3 eq 1}">
						<div class="services fly-in">
							<div class="solutions-row fly-in">
								<!-- // -->
									<div class="solutions-i">
										<div class="solution-icon-a"></div>
										<div class="solutions-over">
											<div class="solutions-over-a">
												<div class="solutions-over-b">
													<div class="solutions-over-c">
														<i class="solution-icon"></i>
														<div class="solution-lbl">${QnA.qnaTitle}</div>
														<br/><br/>
														<c:choose>
															<c:when test="${QnA.qnaStatus eq 'N'}">
																<b>답변대기</b>
															</c:when>
															<c:otherwise>
																<b>답변완료</b>
															</c:otherwise>
														</c:choose>
														<span>${QnA.qnaDate}</span>
													</div>
													<div class="solutions-over-d">
														<i class="solution-icon"></i>
														<div class="solution-txt"><a style="color: white;" href="/owner/qnaDetail.do?qnaId=${QnA.qnaId}">${QnA.qnaContext}</a></div>
													</div>
												</div>
											</div>
										</div>					
										<div class="solutions-img">
											<c:choose>
												<c:when test="${QnA.photoList[0].fullname ne null}">
													<img src="/uploadPhoto/${QnA.photoList[0].fullname}" style="height: 206px;">
												</c:when>
												<c:otherwise>
													<img src="/img/solution-01.jpg">
												</c:otherwise>
											</c:choose>		
										</div>
									</div>
								<!-- \\ -->
					</c:when>
					<c:otherwise>
						<!-- // -->
							<div class="solutions-i">
								<div class="solution-icon-a"></div>
								<div class="solutions-over">
									<div class="solutions-over-a">
										<div class="solutions-over-b">
											<div class="solutions-over-c">
												<i class="solution-icon"></i>
												<div class="solution-lbl">${QnA.qnaTitle}</div>
												<br/><br/>
												<c:choose>
													<c:when test="${QnA.qnaStatus eq 'N'}">
														<b>답변대기</b>
													</c:when>
													<c:otherwise>
														<b>답변완료</b>
													</c:otherwise>
												</c:choose>
												<span>${QnA.qnaDate}</span>
											</div>
											<div class="solutions-over-d">
												<i class="solution-icon"></i>
												<div class="solution-txt"><a style="color: white;" href="/owner/qnaDetail.do?qnaId=${QnA.qnaId}">${QnA.qnaContext}</a></div>
											</div>
										</div>
									</div>
								</div>					
								<div class="solutions-img">
									<c:choose>
										<c:when test="${QnA.photoList[0].fullname ne null}">
											<img src="/uploadPhoto/${QnA.photoList[0].fullname}" style="height:206px;">
										</c:when>
										<c:otherwise>
											<img src="/img/solution-01.jpg">
										</c:otherwise>
									</c:choose>																				
								</div>
							</div>
						<!-- \\ -->
					</c:otherwise>
				</c:choose>
	            
	            <c:if test="${(status.count)%3 eq 0}">
		            	</div>
						<div class="clear"></div>
					</div>
	            </c:if>
	            <c:if test="${fn:length(QnAList) eq (status.count)}"> 
	              	</div>
						<div class="clear"></div>
					</div>
	            </c:if>
			</c:forEach>
			
			
			<div class="clear"></div>
			</div>
		</div>
	</div>
</div>
<!-- /main-cont -->
<div class="w3-container">
	  <a href="/owner/realQnA.do"><button onclick="document.getElementById('id01').style.display='block'" class="w3-button w3-black w3-custum">Open Animated Modal</button></a>
</div>
<!-- start footer -->
<div class="wrap">	
<footer class="footer-b">
	<div class="wrapper-padding">
		<div class="footer-left">© Copyright 2017 by HereToStay. All rights reserved.</div>
		<div class="footer-social">
			<a class="footer-twitter"></a>
			<a class="footer-facebook"></a>
			<a class="footer-vimeo"></a>
			<a class="footer-pinterest"></a>
			<a class="footer-instagram"></a>
		</div>
		<div class="clear"></div>
	</div>	
</footer>
</div>
<!-- end footer -->

<!-- // scripts // -->
  <script src="/js/jquery-1.11.3.min.js"></script>
  <script src="/js/jqeury.appear.js"></script>  
  <script src="/js/jquery-ui.min.js"></script> 
  <script src="/js/owl.carousel.min.js"></script>
  <script src="/js/bxSlider.js"></script>
  <script src="/js/custom.select.js"></script>
  <script type="text/javascript" src="/js/twitterfeed.js"></script>
  <script src="/js/script.js"></script>
<!-- \\ scripts \\ --> 
 
</body>  
</html> 