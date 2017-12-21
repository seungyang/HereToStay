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
  <script src="/js/jquery-ui.min.js"></script> 
  <script src="/js/jqeury.appear.js"></script>  
  <script src="/js/owl.carousel.min.js"></script>
  <script src="/js/bxSlider.js"></script>
  <script src="/js/jquery.formstyler.js"></script> 
  <script src="/js/custom.select.js"></script>   
  <script src="/js/script.js"></script>
  <script type="text/javascript" src="/js/member/reserveDelete.js"></script>
<!--   <script> -->
<!-- //   	$(document).ready(function(){ -->
<!-- // 		'use strict'; -->
<!-- // 		(function($) { -->
<!-- // 			$(function() { -->
<!-- // 				$('.checkbox input').styler({ -->
<!-- // 					selectSearch: true -->
<!-- // 				}); -->
<!-- // 			}); -->
<!-- // 		})(jQuery); -->
		
<!-- //   	}); -->
<!--   </script> -->
</head>  
<body>  
<jsp:include page="/WEB-INF/view/include/header.jsp"/>

<!-- main-cont -->
<div class="main-cont">
  <div class="body-wrapper">
    <div class="wrapper-padding">
    <div class="page-head">
      <div class="page-title">펜션 - <span>펜션 상세보기</span></div>
      <div class="breadcrumbs">
        <a href="/member/index_member.do">Home</a> / <a href="/member/myPage.do?pageS=1&tag=2&sort1=1&sort2=1">예약리스트</a> / <span>펜션 상세보기</span>
      </div>
      <div class="clear"></div>
    </div>

	<div class="sp-page">
		<div class="sp-page-a">
			<div class="sp-page-l">
  				<div class="sp-page-lb">
  					<div class="sp-page-p">
						<div class="booking-left">
							<h2>예약 상세보기</h2>
							
							<div class="comlete-alert">
								<div class="comlete-alert-a">
									<b>${reservationDetail.penName}</b>
									<span>${reservationDetail.penAddr2}</span>
								</div>
							</div>
							
							<div class="complete-info">
								<h2>펜션 예약정보</h2>
								<div class="complete-info-table">
									<div class="complete-info-i">
										<div class="complete-info-l">객실 정보</div>
										<div class="complete-info-r">${reservationDetail.romName}</div>
										<div class="clear"></div>
									</div>
									<div class="complete-info-i">
										<div class="complete-info-l">체크 인</div>
										<div class="complete-info-r">${reservationDetail.resIndate}</div>
										<div class="clear"></div>
									</div>
									<div class="complete-info-i">
										<div class="complete-info-l">체크 아웃</div>
										<div class="complete-info-r">${reservationDetail.resOutdate}</div>
										<div class="clear"></div>
									</div>
									<div class="complete-info-i">
										<div class="complete-info-l">결제 금액</div>
										<div class="complete-info-r">&#8361;${reservationDetail.resTot}</div>
										<div class="clear"></div>
									</div>
									<div class="complete-info-i">
										<div class="complete-info-l">이용 인원</div>
										<div class="complete-info-r">${reservationDetail.romPeople}</div>
										<div class="clear"></div>
									</div>
									<div class="complete-info-i">
										<div class="complete-info-l">예약 상태</div>
										<div class="complete-info-r">${reservationDetail.resStatus}</div>
										<div class="clear"></div>
									</div>
								</div>
								
								<div class="complete-devider"></div>
								
								<div class="complete-txt">
									<h2>펜션 상세설명</h2>
									<p>${reservationDetail.penIntro}</p>
									<div class="complete-txt-link"><a href="/member/pensionDetail.do?id=${reservationDetail.penId}">펜션 보러가기</a></div>
								</div>
								
								<div class="complete-devider"></div>
								
								<div class="complete-txt final">
									<h2>주의사항</h2>
									<p>${reservationDetail.penNoti}</p>
									<br/>
									<span> 예약 취소 시 마일리지는 회수가 되며, 별도로 위약금이 추가로 발생하게 됩니다. </span>
								</div>
								
							</div>
							
							<br/>
							<c:if test="${reservationDetail.resStatus eq '예약완료'}">
								<div class="complete-txt final" style="text-align: right;">
									<div class="complete-txt">
										<div class="complete-txt-link" style="margin-right: 25px;"><a href="/member/delReserve.do?resId=${reservationDetail.resId}">예약 취소</a></div>
									</div>
								</div>
							 </c:if>
							
							<div class="complete-devider"></div>
							
							<form id="writeReview" action="/member/writeReview.do" method="post" enctype="multipart/form-data">
				                <div class="guest-reviews guest-reviews review-form">
					                  <h2>리뷰 작성하기</h2>
					                  <label>리뷰 제목 : </label>
					                  <div class="input-a"><input type="text" name="revTitle" id="revTitle"></div>
					                  
					                  <label>첨부파일 : </label>
					                  <div class="input-a"><input type="file" name="fileUpload"></div>
					                  
					                  <label>리뷰 내용 : </label>
					                  <div class="textarea-a"><textarea name="revContext" id="revContext"></textarea></div>
					
					                  <div class="review-rangers-row">
					                  <div class="review-ranger">
					                    <label>별점주기</label>
					                    <div class="search-select">
			    							<select name="revStar" id="revStar">
			    								<option>1</option>
			    								<option>2</option>
			    								<option>3</option>
			    								<option>4</option>
			    								<option selected="selected">5</option>
			    							</select>
						    		   </div>
						    		   <input type="hidden" name="resId" id="resId" value="${reservationDetail.resId}" />
					                    <div class="clear"></div>
					                  </div>
					                  </div>
					                  <br/><br/>
					                  
					                  <div class="complete-txt final" style="text-align: right;">
											<br/><br/><br/>
											<input class="contacts-send" type="button" value="작성하기" id="insertReview"/>
									  </div>
				                </div>
			                </form>
							

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