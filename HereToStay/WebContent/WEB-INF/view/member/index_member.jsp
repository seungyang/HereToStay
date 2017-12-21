<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html> 
<head>
  <title>Sparrow | Travel Agency PIG </title>
  <meta name="description" content="" />
  <meta name="keywords" content="" />
  <link rel="shortcut icon" href="/favicon.ico" />
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
  <link rel="stylesheet" href="/css/jquery-ui.css"> 
  <link rel="stylesheet" href="/css/owl.carousel.css">
  <link rel="stylesheet" href="/css/idangerous.swiper.css">
  <link rel="stylesheet" href="/css/style.css" />
  <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
  <link href='http://fonts.googleapis.com/css?family=Lora:400,400italic' rel='stylesheet' type='text/css'>
  <link href='http://fonts.googleapis.com/css?family=Raleway:300,400,500,700' rel='stylesheet' type='text/css'>  
  <link href='http://fonts.googleapis.com/css?family=PT+Sans:400,700&amp;subset=latin,cyrillic' rel='stylesheet' type='text/css'>	
  <link href='http://fonts.googleapis.com/css?family=Lato:400,700&amp;subset=latin,latin-ext' rel='stylesheet' type='text/css'>
  <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600,700&amp;subset=latin,cyrillic' rel='stylesheet' type='text/css'>

<!-- // scripts // -->
<script src="/js/jquery-1.7.1.js" type="text/javascript"></script>
  <script src="/js/idangerous.swiper.js"></script>
  <script src="/js/slideInit.js"></script>
  <script src="/js/owl.carousel.min.js"></script>
  <script src="/js/bxSlider.js"></script>
  <script src="/js/jqeury.appear.js"></script>  
  <script src="/js/custom.select.js"></script>
  <script src="/js/jquery-ui.min.js"></script>
  <script type="text/javascript" src="/js/twitterfeed.js"></script>
  <script src="/js/script.js"></script>
<!-- \\ scripts \\ -->

<style type="text/css">
@media screen and (max-width: 660px){
	.romsize{min-height:143px;}
	
}

@media screen and (max-width: 778px){
	.romsize{min-height:219.45px;}
	
}
 
 
 </style>  
</head>  

<body>  
<jsp:include page="/WEB-INF/view/include/header.jsp"/>

<!-- main-cont -->
<div class="main-cont">
<div class="">
	<div class="mp-slider search-only">
		<!-- // slider // -->
		<div class="mp-slider-row">
			<div class="swiper-container">
				<a href="#" class="arrow-left"></a>
				<a href="#" class="arrow-right"></a>
				<div class="swiper-pagination"></div>				
  				<div class="swiper-wrapper">
      				<div class="swiper-slide"> 
						<div class="slide-section" style="background:url(/img/member/MyMain1.jpg) center top no-repeat;">
							<div class="mp-slider-lbl">여행의 첫 걸음인 펜션예약을 '여기없대 ' 와 함께하세요</div>
							<div class="mp-slider-lbl-a">펜션예약 뿐만 아니라 주변 관광지, 편의시설 정보까지 받아보세요. 더 편리한 여행이 여러분을 기다립니다 !</div>
							<div class="mp-slider-btn"><a href="/member/pensionSearch.do?page=1&opt=what" class="btn-a">Here To Stay</a></div>
						</div>      
      				</div>
      				<div class="swiper-slide"> 
						<div class="slide-section slide-b" style="background:url(/img/member/MyMain4.jpg) center top no-repeat;">
							<div class="mp-slider-lbl">도심에서 자연까지. 지역적 한계가 없는 '여기없대'</div>
							<div class="mp-slider-lbl-a">전국 각지에 있는 펜션이 등록 되어있어  예약을 위해 여러 사이트를 찾을 필요가 없습니다. '여기없대' 에서 한번에 해결하세요 !</div>
							<div class="mp-slider-btn"><a href="/member/pensionSearch.do?page=1&opt=what" class="btn-a">Here To Stay</a></div>
						</div>
      				</div>
      				<div class="swiper-slide"> 
						<div class="slide-section slide-b" style="background:url(/img/member/MyMain7.jpg) center top no-repeat;">
							<div class="mp-slider-lbl">무인화 시스템으로 운영되는 펜션을 체험해보세요</div>
							<div class="mp-slider-lbl-a">늦은 도착시간을 두려워 하지 마세요. 자기만의 비밀번호만 가지고 있다면, 도착 시간이 나의 Check In 시간이 됩니다 !</div>
							<div class="mp-slider-btn"><a href="/member/pensionSearch.do?page=1&opt=what" class="btn-a">Here To Stay</a></div>
						</div>      
      				</div>            
  				</div>
			</div>
		</div>
		<!-- \\ slider \\ -->
	</div>	
	
	<div class="wrapper-a-holder full-width-search">
	<div class="wrapper-a">
	
		<!-- // search // -->
		<div class="page-search full-width-search search-type-b">
		  <div class="search-type-padding">
			<nav class="page-search-tabs">
				<div class="search-tab">펜션</div>
				<div class="clear"></div>	
			</nav>		
			<div class="page-search-content">
			
				<!-- // tab content hotels // -->
			
				<div class="search-tab-content">
				<form id='fr' action='/member/pensionSearch.do'>
					<div class="page-search-p">
					<!-- // -->
						<div class="search-large-i">
						<!-- // -->
					<input type ='hidden' name='page' value='1'/>
						<div class="srch-tab-line no-margin-bottom">
							<label>장소 / 펜션 이름</label>
							<div class="input-a"><input name='place' type="text" value="" placeholder="ex)풀빌라"></div>
						</div>
						<!-- // -->							
						</div>
					<!-- \\ -->
					<!-- // -->
						<div class="search-large-i">
						<!-- // -->
						<div class="srch-tab-line no-margin-bottom">
							<div class="srch-tab-left">
								<label>Check in</label>
								<div class="input-a"><input id='in' name='in' type="text" value="" class="date-inpt" placeholder="mm/dd/yy"> <span class="date-icon"></span></div>	
							<script>
								var today= new Date();
								var month=today.getMonth()+1;
								var date =today.getDate();
								if((""+month).length ==1)
									month = "0" + month;
								if((""+date).length ==1)
									date = "0" + date;
								var day= month+"/"+date+"/"+today.getFullYear();
								$("#in").val(day);
								</script>
							</div>
							<div class="srch-tab-right">
								<label>Check out</label>
								<div class="input-a"><input id='out' name='out' type="text" value="" class="date-inpt" placeholder="mm/dd/yy"> <span class="date-icon"></span></div>	
							<script>
								var tomorrow= new Date();
								tomorrow.setDate(tomorrow.getDate()+1);
								var tmonth=tomorrow.getMonth()+1;
								var tdate =tomorrow.getDate();
								if((""+tmonth).length ==1)
									tmonth = "0" + tmonth;
								if((""+tdate).length ==1)
									tdate = "0" + tdate;
								var day2= tmonth+"/"+tdate+"/"+tomorrow.getFullYear();
								$("#out").val(day2);
								</script>
							</div>
							<div class="clear"></div>
						</div>
						<!-- \\ -->						
						</div>
					<!-- \\ -->
					<!-- // -->
						<div class="search-large-i">
						<!-- // -->
						<div class="srch-tab-line no-margin-bottom">
							<div class="srch-tab-3c">
								<label>인원수</label>
								<div class="select-wrapper">
								<select name = 'sel' class="custom-select">
								<c:forEach var ='k' begin='2' end='20' step='1'>
								<c:choose>
								<c:when test="${k eq 2}">
									<option selected="selected">${k}</option>
								</c:when>
								<c:otherwise>
								<option >${k}</option>
								</c:otherwise>
								</c:choose>
								</c:forEach>
								</select>
								</div>
							</div>
							<input type="button" class="srch-btn" id="srch-btn" value="검색">
							<div class="clear"></div>
						</div>
						<!-- \\ -->						
						</div>
					<!-- \\ -->
					<div class="clear"></div>

					<!-- // advanced // -->
<!-- 					<div class="search-asvanced"> -->
<!-- 						// -->
<!-- 						<div class="search-large-i"> -->
<!-- 							// -->
<!-- 							<div class="srch-tab-line no-margin-bottom"> -->
<!-- 								<div class="srch-tab-left"> -->
<!-- 									<label>hotel stars</label> -->
<!-- 									<div class="input-a"><input type="text" value="" placeholder="--"></div>	 -->
<!-- 								</div> -->
<!-- 								<div class="srch-tab-right"> -->
<!-- 									<label>Price</label> -->
<!-- 									<div class="input-a"><input type="text" value="" placeholder="--"></div>	 -->
<!-- 								</div> -->
<!-- 								<div class="clear"></div> -->
<!-- 							</div> -->
<!-- 							\\							 -->
<!-- 						</div> -->
<!-- 						\\ -->
<!-- 						// -->
<!-- 						<div class="search-large-i"> -->
<!-- 							// -->
<!-- 							<div class="srch-tab-line no-margin-bottom"> -->
<!-- 								<label>Property type</label> -->
<!-- 								<div class="select-wrapper"> -->
<!-- 									<select class="custom-select"> -->
<!-- 										<option>--</option> -->
<!-- 										<option>1</option> -->
<!-- 										<option>2</option> -->
<!-- 										<option>3</option> -->
<!-- 										<option>4</option> -->
<!-- 									</select> -->
<!-- 								</div>	 -->
<!-- 							</div> -->
<!-- 							\\							 -->
<!-- 						</div> -->
<!-- 						\\ -->
<!-- 						// -->
<!-- 						<div class="search-large-i"> -->
<!-- 							// -->
<!-- 							<div class="srch-tab-line no-margin-bottom"> -->
<!-- 								<label>Rating</label> -->
<!-- 								<div class="select-wrapper"> -->
<!-- 									<select class="custom-select"> -->
<!-- 										<option>--</option> -->
<!-- 										<option>1</option> -->
<!-- 										<option>2</option> -->
<!-- 										<option>3</option> -->
<!-- 										<option>4</option> -->
<!-- 									</select> -->
<!-- 								</div>	 -->
<!-- 							</div> -->
<!-- 							\\								 -->
<!-- 						</div> -->
<!-- 						\\ -->
<!-- 						<div class="clear"></div>	 -->
<!-- 					</div> -->
					<!-- \\ advanced \\ -->
					</div>
					</form>
<!-- 					<footer class="search-footer"> -->
<!-- 						 <input type="button" class="srch-btn" id='srch-btn' value='검색'></input>  -->
<!-- 						<div class="clear"></div> -->
<!-- 					</footer> -->
				</div>
				<!-- // tab content hotels // -->						
			</div>
		</div>
		</div>
		<!-- \\ search \\ -->

		<div class="clear"></div>	
	 </div>
	</div>
		
	<div class="mp-pop">
		<div class="wrapper-padding-a">
			<div class="mp-popular popular-destinations">
				<header class="fly-in">
					<b>고객님에게 사랑받는 펜션 TOP 3</b>
					<p>이번 달. '여기없대 '에서 가장 많이 예약이 된 펜션 TOP 3를 보여줍니다.</p>
				</header>
				<div class="fly-in mp-popular-row" >
				
				<c:forEach var="pension" items="${popular}" varStatus="status"> 
					<!-- // -->
						<div class="offer-slider-i">
							<a class="offer-slider-img" href="/member/pensionDetail.do?id=${pension.penId}">
								<img id='index_img'  src="/uploadPhoto/${pension.phothList[0].fullname}" />
								<span class="offer-slider-overlay">
									<span class="offer-slider-btn">view details</span>
								</span>
							</a>
							<div class="offer-slider-txt">
								<div class="offer-slider-link"><a href="/member/pensionDetail.do?id=${pension.penId}">${pension.penName}</a></div>
								<div class="offer-slider-l">
									<div class="offer-slider-location" style="width: 200px;">${pension.penAddr2}</div>
									<div class="offer-slider-link"><a>총 예약된 횟수 : &nbsp;&nbsp; ${pension.avgStar}</a></div>
								</div>
								<div class="offer-slider-r align-right">
									<fmt:formatNumber var='popMinCost' value="${pension.minCost}" type="number"/>			                            			
			                       		<b>&#8361; ${popMinCost}</b>
									<span>price</span>
								</div>
								<div class="offer-slider-devider"></div>								
								<div class="clear"></div>
							</div>
						</div>
					<!-- \\ -->
					
					</c:forEach>
				</div>
				<div class="clear"></div>						
			</div>
			
			<br/><br/><br/>

			<div class="mp-popular">
				<header class="fly-in">
					<b>Here To Stay & 여기없대 의 특별함</b>
					<p>'여기없대 ' 는 고객님의 선택에 후회없도록 최고의. 최상의 서비스를 제공할 것을 약속합니다.</p>
				</header>
				<div class="fly-in advantages-row">
					<div class="advantages-i">
						<div class="advantages-a"><img alt="" src="/img/adv-01.png" /></div>
						<div class="advantages-b">다른 타 사이트와 다릅니다.</div>
						<div class="advantages-c">'여기없대' 는 무인화 시스템을 도용함으로써 고객님은 틀에 잡힌 Check In 시간에서 자유로와질 수 있습니다.</div>
					</div>
					<div class="advantages-i">
						<div class="advantages-a"><img alt="" src="/img/adv-02.png" /></div>
						<div class="advantages-b">비교가능한 합리적인 가격</div>
						<div class="advantages-c">무인화 시스템이기 때문에 다른 타 펜션과 달리 인권비가 확연히 줄게됩니다. 조금 더 저렴한 가격으로 펜션 예약을 시작해보세요</div>
					</div>
					<div class="advantages-i">
						<div class="advantages-a"><img alt="" src="/img/adv-03.png" /></div>
						<div class="advantages-b">다양한 장소에서의 예약 가능</div>
						<div class="advantages-c">한정적인 지역에만 펜션이 등록되어 있는것이 아닙니다. 전국각지 어느 장소에도 펜션을 예약할 수 있습니다.</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<br/>
	<br/>
<br/>
	<div class="mp-offesr no-margin">
		<div class="wrapper-padding-a">  
			<div class="offer-slider duble-margin">
				<header class="fly-in page-lbl">
					<div class="offer-slider-lbl">최저가 룸을 예약하길 원하시나요?</div>
					<p>저희 '여기없대 ' 에 등록되어있는 펜션 중 최저가 룸을 보여드립니다. 가장 합리적인 가격에서 펜션 예약을 성공하세요. '여기없대 ' 가 도와드리겠습니다.</p>
				</header>
				<div class="fly-in offer-slider-c">
					<div id="offers-a" class="owl-slider">
					
					<c:forEach var="room" items="${minCostRoom}" varStatus="status"> 
					
					<!-- // -->
						<div class="offer-slider-i">
							<a class="offer-slider-img" href="/member/pensionDetail.do?id=${room.penId}">
								<img class="romsize" style="width:100%; height:auto; min-height:184.65px;" src="/uploadPhoto/${room.photoList[0].fullname}" />
								<span class="offer-slider-overlay">
									<span class="offer-slider-btn">view details</span>
								</span>
							</a>
							<div class="offer-slider-txt">
								<div class="offer-slider-link"><a href="offer-slider-img" href="/member/pensionDetail.do?id=${room.penId}">${room.penName}</a></div>
								<div class="offer-slider-l" style="width: 110px;">
									<div class="offer-slider-location">객실명 : ${room.romName}</div>
								<div class="offer-slider-link"><a>수용인원 : &nbsp;&nbsp; ${room.romPeople}</a></div>
								</div>
								<div class="offer-slider-r">
								<fmt:formatNumber var='minCostRoom' value="${room.romCost}" type="number"/>
									<b>&#8361;${minCostRoom}</b>
									<span>avg/night</span>
								</div>
								<div class="offer-slider-devider"></div>								
								<div class="clear"></div>
							</div>
						</div>
					<!-- \\ -->
					
					</c:forEach>
					</div>
				</div>
			</div>  
			</div>
		</div>
      	
  </div>

</div>

<br/><br/><br/>
<!-- /main-cont -->

<jsp:include page="/WEB-INF/view/include/footer.jsp"/>


<script type="text/javascript">
	$(document).ready(function() {
		// 로그인 없이 마이페이지 갈 경우
// 		if( $('#goMyPage').val() == "goLogin") {
// 			$('.overlay').fadeIn(function(){
// 				$('.autorize-popup2').animate({top: '50%'}, 300).find('input:text').eq('0').focus();
// 			});
// 		}
	});
  	$("#srch-btn").click(function(){

	
  		var In =$('#in').val();
		var InYY= In.substring(6,10);
		var InMM=In.substring(0,2);
		if(InMM.substring(0,1)=='0')
			InMM=InMM.substring(1,2);
		var InDD =In.substring(3,5);
		if(InDD.substring(0,1)=='0')
			InDD=InDD.substring(1,2);
		
		var Out =$('#out').val();
		var OutYY= Out.substring(6,10);
		var OutMM=Out.substring(0,2);
		if(OutMM.substring(0,1)=='0')
			OutMM=OutMM.substring(1,2);
		var OutDD =Out.substring(3,5);
		if(OutDD.substring(0,1)=='0')
			OutDD=OutDD.substring(1,2);
				
  		var InDate =new Date(InYY,InMM-1,InDD);
  		var OutDate = new Date(OutYY,OutMM-1,OutDD);
  		
  		var today =new Date(); 
  		var compareToday= new Date(today.getFullYear(),today.getMonth(),today.getDate());
  		
  		if(InDate.getTime()<compareToday.getTime())
  		{
  			alert('오늘 이 전 날짜를 선택할 수 없습니다.');
  			return;
  		}
  		
		if(InDate.getTime()>=OutDate){
		
			alert("checkIn 날짜는 checkOut날짜와 같거나 클 수 없습니다. 다시 입력해주세요");
			return;
		}
		
		var gap= (OutDate.getTime()-InDate.getTime())/1000/60/60/24;
		
		if(gap>=10){
			alert('10일 이상은 예약이 불가합니다.');
			return;
		}
		$("#fr").submit();  		
	
  	});
  	
	
  	

</script>
 
 <style>

  .srch-btn {
  	display:inline;
    cursor: pointer;
    font-family: 'Montserrat';
    font-size: 11px;
    font-weight: normal;
    padding-top: 2px;
    float: none;
    margin-top: 21px;
    height: 34px;
}
 </style>
</body>  
</html> 