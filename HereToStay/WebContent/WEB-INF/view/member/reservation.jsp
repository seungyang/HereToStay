<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
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
  <script src="/js/jquery.ui.touch.js"></script>
  <script src="/js/owl.carousel.min.js"></script>
  <script src="/js/bxSlider.js"></script>
  <script src="/js/jquery.formstyler.js"></script> 
  <script src="/js/custom.select.js"></script>    
  <script type="text/javascript" src="/js/twitterfeed.js"></script>
  <script src="/js/script.js"></script>
  <script srt="/js/member/jquery.number.js"></script>
 
</head>  
<body>  
<form id='fr' action='/member/reservationResult.do' method="post">
<input type="hidden" name='penName' value="${Pension.penName}"/>
<input type="hidden" name='penAddr2' value='${Pension.penAddr2}' />
<input type="hidden" name='romId' value ='${Room.romId}'/>
<input type="hidden" name='romName' value ='${Room.romName}'/>
<input type="hidden" name='in' value ='${sessionScope.search.checkIn }'/>
<input type="hidden" name='out' value ='${sessionScope.search.checkOut }'/>
<input type="hidden" id ='tot' name='tot'/>
<input type="hidden"  name='penId' value ='${Pension.penId }'/>
<input type="hidden" name='PenIntro' value ='${Pension.penIntro }' />
<input type="hidden" name='penNoti'  value ='${Pension.penNoti}'/>
<input type="hidden" name='romPersons' value ='${sessionScope.search.persons}'/>
<input name="useMig" id='useMig' type="hidden" value='0' />

</form>
<!-- // authorize // -->
<jsp:include page="/WEB-INF/view/include/header.jsp"/>
<!-- main-cont -->
<div class="main-cont">
  <div class="body-wrapper">
    <div class="wrapper-padding">
    <div class="page-head">
      <div class="page-title">펜션 - <span>예약하기</span></div>
      <div class="breadcrumbs">
        <a href="/member/index_member.do">HOME</a> / <a href="/member/pensionDetail.do?id=${Pension.penId}">객실 보기</a> / <span>예약하기</span>
      </div>
      <div class="clear"></div>
    </div>

	<div class="sp-page">
		<div class="sp-page-a">
			<div class="sp-page-l">
  				<div class="sp-page-lb">
  					<div class="sp-page-p">
						<div class="booking-left">
							<h2>예약자 정보</h2>
							<div class="booking-form">
								<div class="booking-form-i">
									<label>ID:</label>
									<div class="input"><input type="text" value="${sessionScope.memId}" readonly/></div>
								</div>
								<div class="booking-form-i">
									<label>이름:</label>
									<div class="input"><input type="text" value="${Member.memName}" readonly /></div>
								</div>
<!-- 								<div class="booking-form-i"> -->
<!-- 									<label>Book:</label> -->
<!-- 									<div class="input"><input type="text" value="" /></div> -->
<!-- 								</div> -->
<!-- 								<div class="booking-form-i"> -->
<!-- 									<label>Confirm Email Adress:</label> -->
<!-- 									<div class="input"><input type="text" value="" /></div> -->
<!-- 								</div> -->
								<div class="booking-form-i">
									<label>휴대폰 번호:</label>
									<div class="input"><input type="text" value="${Member.memTel}" readonly /></div>
								</div>
								<div class="booking-form-i">
									<label>추가 전화번호:</label>
									<div class="input"><input type="text" value="" /></div>
								</div>
								<div class="clear"></div>

              					<div class="booking-devider"></div>						
							</div>
							<h2>결제 방식</h2>
							
							<div class="payment-wrapper">
								<div class="payment-tabs">
									<a href="#" class="active">Credit Card <span></span></a>
									<a href="#">휴대폰 결제 <span></span></a>
								</div>
								<div class="clear"></div>
								<div class="payment-tabs-content">
									<!-- // -->
									<div class="payment-tab">
										<div class="payment-type">
											<label>카드 종류:</label>
											<div class="card-type"><img alt="" src="/img/paymentt-01.png"></div>
											<div class="card-type"><img alt="" src="/img/paymentt-02.png"></div>
											<div class="card-type"><img alt="" src="/img/paymentt-03.png"></div>
											<div class="clear"></div>
										</div>
										<div class="booking-form">
											<div class="booking-form-i">
												<label>카드 번호:</label>
												<div class="input"><input type="text" value=""></div>
											</div>
											<div class="booking-form-i">
												<label>카드주 이름:</label>
												<div class="input"><input type="text" value=""></div>
											</div>
											<div class="booking-form-i">
												<label>유효 기간:</label>
												<div class="card-expiration">
												<select class="custom-select">
													<option>Month</option>
													<option>01</option>
													<option>02</option>
													<option>03</option>
													<option>04</option>
													<option>05</option>
													<option>06</option>
													<option>07</option>
													<option>08</option>
													<option>09</option>
													<option>10</option>
													<option>11</option>
													<option>12</option>
												</select>
												</div>
												<div class="card-expiration">
												<select class="custom-select card-year">
													<option>Year</option>
													<option>2015</option>
													<option>2016</option>
													<option>2017</option>
													<option>2018</option>
													<option>2019</option>
													<option>2020</option>
												</select>
												</div>
												<div class="clear"></div>
											</div>
											<div class="booking-form-i">
												<label>카드 cvs 번호:</label>
												<div class="inpt-comment">
													<div class="inpt-comment-l">
  														<div class="inpt-comment-lb">
    														<div class="input"><input type="text" value=""></div>
  														</div>
  														<div class="clear"></div>
													</div>
												</div>
												<div class="inpt-comment-r">
  													<div class="padding">
														<a href="#">What’s This?</a>
  													</div>
  													<div class="clear"></div>
												</div>
												<div class="clear"></div>
											</div>
										</div>
										<div class="clear"></div>
										<div class="checkbox">
                							<label>
                  								<input type="checkbox" value="" />
                  								펜션의 모든 룰을 준수합니다.<a href="#">약관 보기</a>
                							</label>
              							</div> 
									</div>
									<!-- \\ -->
									<!-- // -->
									<div class="payment-tab">
										<div class="payment-alert">
											<span>휴대폰 번호를 입력해주세요. </span>
											<div class="payment-alert-close"><a href="#"><img alt="" src="/img/alert-close.png"></a></div>
										</div>
										<div style="margin-top:15px">
										<select style="width:50px;height:20px"><option>010</option><option>011</option><option>019</option>
										</select>-<input style="width:46px;height:13px;" type="text" />-<input style="width:46px;height:13px;" type="text" />
<!-- 									<a href="#" class="paypal-btn"></a> -->
									</div>
									</div>
									<!-- \\ -->
								</div>
							</div>
						<div class="booking-complete">

								<input type='button' id='reserve' class="booking-complete-btn" value ='예약 완료'/>
							</div>					
						</div>
  					</div>
  				</div>
  				<div class="clear"></div>
			</div>
		</div>

		<div class="sp-page-r">
			
			<div class="checkout-coll">
				<div class="checkout-head">
					<div class="checkout-headl">
 						<a href="/member/pensionDetail.do?id=${Pension.penId}"><img style="width:94px;height:60px" alt="" src="/uploadPhoto/${Pension.phothList[0].fullname}"></a>
					</div>
					<div class="checkout-headr">
  						<div class="checkout-headrb">
  							<div class="checkout-headrp">
    							<div class="chk-left">
    								<div class="chk-lbl"><a href="/member/pensionDetail.do?id=${Pension.penId}">${Pension.penName} </a></div>
    								<div class="chk-lbl-a">${Pension.penAddr2}</div>


    							</div>

    							<div class="clear"></div>
  							</div>
  						</div>
  						<div class="clear"></div>
					</div>
				</div>

				<div class="chk-lines">
					<div class="chk-line">
						<span class="chk-nights">${days} 일</span>
						<span class="chk-dates">${sessionScope.search.checkIn} ~ ${sessionScope.search.checkOut}</span>
					</div>
					<div class="chk-line">
						${Room.minPeople} 인 기준 , 선택 인원 <span class="chk-persons">${sessionScope.search.persons} 명</span>
					</div>
				</div>
				
				<div class="chk-details">
					<h2>상세보기</h2>
					<div class="chk-detais-row">
						<div class="chk-line">
							<span class="chk-l">룸 타입</span>
							<span class="chk-r">${Room.romName}</span>
							<div class="clear"></div>
						</div>
						<div class="chk-line">
						<fmt:formatNumber var='roomCost' value="${romCost}" type="number"/>
							<span class="chk-l">룸 가격</span>
							<span class="chk-r">￦  ${roomCost}</span>
							<div class="clear"></div>
						</div>
						<div class="chk-line">
							<span class="chk-l">${days} 일 예약</span>							
						<fmt:formatNumber var='nightCost' value="${romCost *days}" type="number"/>
							<span class="chk-r">￦ ${nightCost}</span>
							<div class="clear"></div>
						</div>
						<c:if test="${sessionScope.search.persons gt Room.minPeople}">
						<div class="chk-line">
						
						<c:set var='gapPerson' value='${sessionScope.search.persons -Room.minPeople}'/>
							<span class="chk-l">인원 추가 요금</span>
						<fmt:formatNumber var='personCost' value="${gapPerson * 10000}" type="number"/>
							<span class="chk-r">￦ ${personCost}</span>
							<div class="clear"></div>
						</div>
						</c:if>
					</div>
					<c:choose>
					<c:when test="${sessionScope.search.persons gt Room.minPeople}">
					<div class="chk-total">
						<div class="chk-total-l">총 요금</div>
						<fmt:formatNumber var='totalCo' value="${(romCost *days)+(gapPerson * 10000)}" type="number"/>
						<div class="chk-total-r">￦ ${totalCo} 원<input id='totalCost1' type="hidden" value="${totalCo}"/></div>
						<div class="clear"></div>
					</div>
					</c:when>
					<c:otherwise>
					<div class="chk-total">
						<div class="chk-total-l">총 요금</div>
						<fmt:formatNumber var='totalCo' value="${romCost *days}" type="number"/>
						<div class="chk-total-r">￦ ${totalCo}<input id='totalCost1' type="hidden" value="${romCost *days}"/></div>
						<div class="clear"></div>
					</div>	
					</c:otherwise>
					</c:choose>  
					<div class="chk-total">
						<div class="chk-total-l">마일리지</div>
						<fmt:formatNumber var='mig' value="${Member.memMig}" type="number"/>
						<div class="chk-total-r">${mig}<input id='mig' type="hidden" value="${Member.memMig}"/></div>
						<div class="clear"></div>
					</div>
					<div class="chk-total">
						<div class="chk-total-l">사용할 마일리지</div>
						<div class="chk-total-r"><input id='useMigText' style="width:50px;float:left;margin-right:5px" type="text"><input style="cursor:pointer" id='useMigBtn' type="button" value="사용"/></div>
						<div class="clear"></div>
					</div>
					<div class="chk-total">
						<div class="chk-total-l">결제할 금액</div>
						<div class="chk-total-r"><b>￦ ${totalCo}</b><input id='cost' type="hidden" value='${romCost *days}'/></div>
						<div class="clear"></div>
					</div>						
				</div>
				
			</div>
			
			<div class="h-help">
				<div class="h-help-lbl">질문 사항이 있으신가요?</div>
				<div class="h-help-lbl-a">'여기 없대' 가 도와드릴게요!</div>
				<div class="h-help-phone">031-548-1577</div>
				<div class="h-help-email">HereToStay@gmail.com</div>
			</div>
			
		</div>
		<div class="clear"></div>
	</div>
    </div>	
  </div>  
</div>
<!-- /main-cont -->

<jsp:include page="/WEB-INF/view/include/footer.jsp"/>

<!-- // scripts // -->


  <script>
  	$(document).ready(function(){
		'use strict';
// 		(function($) {
// 			$(function() {
// 				$('.checkbox input').styler({
// 					selectSearch: true
// 				});
// 			});
// 		})(jQuery);
  	
  	});   	
  </script>
     <script type="text/javascript">
	 $("#reserve").click(function(){  	
		 $("#tot").val($('#cost').val());  		
  		$('#fr').attr('action','/member/reservationResult.do').submit();  		
  	});
	 
	 $('#useMigBtn').mousedown(function(){
		
		 var trimText= $('#useMigText').val().trim();
		 var regNumber = /^[0-9]*$/;
		 
		 $(this).css('border-color','#ff7200');
		 if(Number($('#mig').val()) <Number(trimText))
		{
			 alert('사용할 마일리지보다 크게 입력할 수 없습니다.');
			 return;
		}
		else if(!regNumber.test(trimText))
		{		  
			alert('숫자만 입력해주세요.');
			$('#useMigText').val('');
			
			return;
		}
		 else{
		 $('#useMig').val($('#useMigText').val());
		 $('#cost').val(Number($('#totalCost1').val())-Number($('#useMigText').val()));
		 var totalCost = AddComma(Number($('#totalCost1').val())-Number($('#useMigText').val()));
		 $('.chk-total-r b').empty(); 
		$('.chk-total-r b').append("￦ "+ totalCost);
		 }

	 });
	 $('#useMigBtn').mouseup(function(){  
		 $(this).css('border-color','');
	 }); 
	 function AddComma(data_value) {
		 return Number(data_value).toLocaleString('en');
		 }
  </script>
  
<!-- \\ scripts \\ --> 
 <style>
 #useMigBtn {
    width: 50px;
    height: 21px;
    padding-top: 0px;
    font-size: 10px;
    text-transform: uppercase;
    font-weight: 700;
    color: #6a7880;
    background-color:white;
    display: block;
    text-decoration: none;
    text-align: center;
     border: outset; 
    border-radius: 2px;
}
#useMigBtn:hover {
    color: #ff7200;
}
 </style>
</body>  
</html> 