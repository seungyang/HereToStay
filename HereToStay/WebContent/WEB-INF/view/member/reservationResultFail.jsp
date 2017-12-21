<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.*"%>
<%@page import="hts.model.vo.*"%>
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
<script src="/js/jquery-1.7.1.js" type="text/javascript"></script>
 <script src="/js/jqeury.appear.js"></script>  
  <script src="/js/jquery-ui.min.js"></script> 
  <script src="/js/owl.carousel.min.js"></script>
  <script src="/js/bxSlider.js"></script>
  <script src="/js/jquery.formstyler.js"></script> 
  <script src="/js/custom.select.js"></script>   
  <script type="text/javascript" src="/js/twitterfeed.js"></script>  
  <script src="/js/script.js"></script>
  <script type="text/javascript" src="/js/member/reserveDelete.js"></script>
</head>  
<body>  
<jsp:include page="/WEB-INF/view/include/header.jsp"/>

<!-- main-cont -->
<div class="main-cont">
  <div class="body-wrapper">
    <div class="wrapper-padding">
    <div class="page-head">
      <div class="page-title">펜션 - 예약 실패</div>
      <div class="breadcrumbs">
        <a href="/member/index_member.do">Home</a> / <span>예약 실패</span>
      </div>
      <div class="clear"></div>
    </div>

	<div class="sp-page">
 		<div class="sp-page-a"> 
			<div class="sp-page-l"> 
  				<div class="sp-page-lb">
   					<div class="sp-page-p"> 
 						<div class="booking-left"> 
							<h2>앗 ! 예약에 실패하였습니다..</h2>
							<img src="/img/member/fail.gif"></img>
							<div class="comlete-alert">
							  이미 다른 이용자가 예약을 하였습니다.
							    <a href="/member/pensionSearch.do?page=1&opt=what" style="cursor:pointer;text-decoration:none;">다른 펜션을 보시려면 클릭</a><br/><br/>
 								<div class="comlete-alert-a">  
 								일정을 다시 잡으시려면 
									<a href ="/member/pensionDetail.do?id=${reservationDetail.penId}" style="text-decoration:none;"><b> 여기를 클릭 </b></a> 

 								</div>  
								
 							</div> 		

 						</div> 
  					</div> 
   				</div> 
  				<div class="clear"></div> 
 			</div>
 		</div> 

		<div class="sp-page-r">

			<div class="h-help">
				<div class="h-help-lbl">질문 사항이 있으신가요?</div>
				<div class="h-help-lbl-a">'여기 없대' 가 도와드릴게요!</div>
				<div class="h-help-phone">031-548-1577</div>
				<div class="h-help-email">HereToStay@gmail.com</div>
			</div>
			<div class="h-reasons">
				<div class="h-liked-lbl">좀더 많은 서비스를 받아볼 수 있습니다.</div>
				<div class="h-reasons-row">
				<!-- // -->
					<div class="reasons-i">
					<div class="reasons-h">
						<div class="reasons-l">
							<img alt="" src="/img/reasons-a.png">
						</div>
						<div class="reasons-r">
  						<div class="reasons-rb">
							<div class="reasons-p">
								<div class="reasons-i-lbl">마일리지 제공</div>
								<p>'여기없대'로 예약하고 펜션을 이용하셨다면 리뷰를 작성해보세요! 리뷰를 작성한 고객 100%에게 마일리지를 제공해드립니다.</p>
							</div>
  						</div>
  						<br class="clear">
						</div>
					</div>
					<div class="clear"></div>
					</div>
				<!-- \\ -->	
				<!-- // -->
					<div class="reasons-i">
					<div class="reasons-h">
						<div class="reasons-l">
							<img alt="" src="/img/reasons-b.png">
						</div>
						<div class="reasons-r">
  						<div class="reasons-rb">
							<div class="reasons-p">
								<div class="reasons-i-lbl">편리한 펜션 검색기능 제공</div>
								<p>각 펜션별로 옵션을 나눠났기 때문에 고객이 원하는 타입 별로 펜션을 검색할 수 있습니다. 지금 빠르고 손쉽게 펜션검색을 해보세요!</p>
							</div>
  						</div>
  						<br class="clear">
						</div>
					</div>
					<div class="clear"></div>
					</div>
				<!-- \\ -->	
				<!-- // -->
					<div class="reasons-i">
					<div class="reasons-h">
						<div class="reasons-l">
							<img alt="" src="/img/reasons-c.png">
						</div>
						<div class="reasons-r">
  						<div class="reasons-rb">
							<div class="reasons-p">
								<div class="reasons-i-lbl">전국적인 펜션 제공</div>
								<p>대한민국 어떤 곳이든 많은 펜션이 '여기없대'에 등록되어 있습니다. '여기없대'를 통해서 국내 여행에 한걸음 더 다가가세요!</p>
							</div>
  						</div>
  						<br class="clear">
						</div>
					</div>
					<div class="clear"></div>
					</div>
				<!-- \\ -->				
				</div>
			</div>
			
		</div>
		<div class="clear"></div>
	</div>

    </div>	
  </div>  
</div>
<!-- /main-cont -->

<jsp:include page="/WEB-INF/view/include/footer.jsp"/>


 
</body>  
</html> 