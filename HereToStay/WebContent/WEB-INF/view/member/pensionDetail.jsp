<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<% String memId =(String)session.getAttribute("memId");%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Sparrow | Travel Agency</title>
  <meta name="description" content="" />
  <meta name="keywords" content="" />
  <meta charset="utf-8" /><link rel="icon" href="favicon.png" />
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"> 
  <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.3/themes/smoothness/jquery-ui.css" />
  <link rel="stylesheet" href="/css/style.css" />
  <link rel="stylesheet" href="/css/member/roomOpt.css">
  <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
  <link href='http://fonts.googleapis.com/css?family=Lora:400,400italic' rel='stylesheet' type='text/css'>    
  <link href='http://fonts.googleapis.com/css?family=Raleway:300,400,500,700' rel='stylesheet' type='text/css'>  
  <link href='http://fonts.googleapis.com/css?family=PT+Sans:400,700&amp;subset=latin,cyrillic' rel='stylesheet' type='text/css'>
  <link href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700&amp;subset=latin,cyrillic' rel='stylesheet' type='text/css'>	
<link rel="stylesheet" href="/css/jquery.bxslider.css">
<!-- // scripts // -->
   <script src="/js/jquery-1.7.1.js" type="text/javascript"></script>
  <script src="/js/script.js"></script>
  <script src="/js/jqeury.appear.js"></script>  
  <script src="/js/jquery-ui.min.js"></script> 
  <script src="/js/member/detailSlide.js"></script>
  <script src="/js/owl.carousel.min.js"></script>
  <script src="/js/bxSlider.js"></script> 
  <script src="/js/custom.select.js"></script>    
  <script type="text/javascript" src="/js/twitterfeed.js"></script>
  <script type="text/javascript" src="/js/member/moment.min.js"></script>
 <script type="text/javascript" src="/js/member/fullcalendar.js"></script>
  <script src="/js/findRoad.js"></script>
  <script src="/js/jquery.ui.touch-punch.min.js"></script>
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2e42bd35fc94828358bb938f57f5801d&libraries=services"></script>
   <script type="text/javascript" src="https://api2.sktelecom.com/tmap/js?version=1&format=javascript&appKey=12d4d445-9969-4c83-a53e-fc7c41f185b3"></script>    
  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>	
<style type="text/css">

/* map & selectAddr *********************************/
#map1 {width:100%; height:546px; margin-bottom:30px;}
#map1 #Tmap_Control_Attribution_6 img{display:none;}
.contacts-map #map1 {height:457px;}
/*#7a8288*/
#selectAddr{
position:relative;
margin-top:20px; 
background: #fff;
padding: 15px 0 0 15px;
border: 1px solid #e5e5e5;
}
#hide{
cursor: pointer;
    font-size: 13px;
    width: 82px;
    background: #f4ac33;
    border: 1px solid #e6e6e6;
    border-radius: 3px;
    -webkit-border-radius: 3px;
    height: 30px;
    padding-left: 10px;
    padding-right: 10px;
    color: #fff;
    position:absolute;
    text-align:center;
    bottom:0;
    right:0;
    padding-top:8px;
}

.sAddr{margin-bottom:7px;}
.sAddr .map_start,
.eAddr .map_dochak{font-size:12px; font-weight:bold; color:#424242; margin-right:5px;}
.sAddr .btn-yeogi,
.eAddr .btn-yeogi{
cursor:pointer;
font-size:12px;
width:82px;
background:#f4ac33; 
border:1px solid #e6e6e6; 
border-radius:3px;
-webkit-border-radius:3px; 
height: 32px;
padding-left: 10px;
padding-right: 10px;
color:#fff;
}

.sAddr .btn-yeogi:hover,
.eAddr .btn-yeogi:hover{
background:#ffb935; 

}
#roadInfo{margin:5px 0;}
#detailAddr{list-style-position: inside; position:relative;}
#selectAddr input{border:1px solid #e6e6e6; padding:5px 0 0 9px; width:45%; height:20px;}
/* map & selectAddr *********************************/
.fc-future a{color:#000;}
.h-tab-item-04 i {display:block;  background:url(../img/map-icon.png) left top no-repeat; float:left; width:13px; height:16px;}
.available-price{ font-size :15px}
.room_detail{display:none; padding:10px; position:relative;}
.room_detail p{float:right; font-size:20px; font-weight:bold; cursor:pointer; position:absolute; right:0; margin-left:1%;}
.availabe-more,
.cat-icons{cursor:pointer;}
.abt{border-color:#455051; padding-top:8px; cursor:pointer; color:#667071;}
.availabe-more{border-color:#667071;}
.availabe-more:hover,
.abt:hover{border-color:#ff7200; transition:0.3s}

.preferences-list li{margin:0;}
</style>
	<link rel="stylesheet" href="/css/member/fullcalendar.css"/>
	<link rel="stylesheet" href="/css/member/fullcalendar.print.min.css" media='print'/>

<script>

	$(document).ready(function() {

		
		var today=new Date();
		$('#calendar').fullCalendar({
			header: {
				left: 'prev',
				center: 'title',
				right: 'next today'
			},
			defaultDate: today,
			navLinks: true, // can click day/week names to navigate views
			editable: true,
			selectable: true,
			eventLimit: true, // allow "more" link when too many events
			events: {
				url: 'php/get-events.php',
				error: function() {
					$('#script-warning').show();
				}
			},
			loading: function(bool) {
				$('#loading').toggle(bool);
			},
			eventRender: function(event, el) {
				// render the timezone offset below the event title
				if (event.start.hasZone()) {
					el.find('.fc-title').after(
						$('<div class="tzo"/>').text(event.start.format('Z'))
					);
				}
			},
			dayClick: function(date) {
				$('.fc-bg table tbody tr td').removeClass('fc-highlight');
				console.log('dayClick', date.format());
				var y=date.format().substring(0,4);
				var m=date.format().substring(5,7);
				if(m.substring(0,1)=='0')
					m=m.substring(1,2);
				var d=date.format().substring(8,10);
				if(d.substring(0,1)=='0')
					d=d.substring(1,2);
				
 				var tom =new Date(y,m-1,d);
 				var rtom =tom;
 				rtom.setDate(tom.getDate()+1);
 				var rm = String(Number(rtom.getMonth())+1);
 				if(rm.length==1)
 					rm="0"+rm;
 				var rd =String(rtom.getDate());
 				if(rd.length==1)
 					rd="0"+rd;
 				
 				var di = date.format().substring(0,4)+'-'+date.format().substring(5,7)+'-'+date.format().substring(8,10);
 				var r=rtom.getFullYear()+'-'+rm+'-'+rd;			
 				
 				$('#checkIn').val(date.format().substring(5,7)+"/"+date.format().substring(8,10)+"/"+date.format().substring(0,4));
	 			$('#out').val(rm+"/"+rd+"/"+rtom.getFullYear());
 				
	 			
	 			 $('.fc-bg table tbody tr td[data-date="'+di+'"]').addClass('fc-highlight');
 			    $('.fc-bg table tbody tr td[data-date="'+r+'"]').addClass('fc-highlight');
				 
			},
			select: function(startDate, endDate) {
				console.log('select', startDate.format(), endDate.format());
				
				//날짜를 비교가능하게 DATE로 바꾸기위한 작업
				var yyyy=startDate.format().substring(0,4);
				var mm=startDate.format().substring(5,7);
				var dd=startDate.format().substring(8,10);
				var yyyy2=endDate.format().substring(0,4);
				var mm2=endDate.format().substring(5,7);
				var dd2=endDate.format().substring(8,10);
				var mmDrag=mm;
				var ddDrag=dd;
				var mm2Drag=mm2;
				var dd2Drag=dd2;
				
				if(mmDrag.substring(0,1)=='0')
					mmDrag=mmDrag.substring(1,2);
				if(ddDrag.substring(0,1)=='0')
					ddDrag=ddDrag.substring(1,2);
				if(mm2Drag.substring(0,1)=='0')
					mm2Drag=mm2Drag.substring(1,2);
				if(dd2Drag.substring(0,1)=='0')
					dd2Drag=dd2Drag.substring(1,2);
				
				
				var start = new Date(yyyy,mmDrag-1,ddDrag);
				var end = new Date(yyyy2,mm2Drag-1,dd2Drag);//시간 계산을 위해
				
				var today=new Date();
				
				var compareToday= new Date(today.getFullYear(),today.getMonth(),today.getDate());
		  		
				//오늘 이전 날짜가 선택되지 않게 하는 것
				if(start.getTime()<compareToday.getTime())
		  		{
		  			alert('오늘 이 전 날짜를 선택할 수 없습니다.');
		  			$('td').removeClass('fc-highlight');
		  			return;
		  		}
		  		
				//날짜간에 차이를 구한것
		  		var gap= (end.getTime()-start.getTime())/1000/60/60/24;
				
				if(gap!=1)
				{			
					var endDrag = end;								
					var imsi=endDrag.getDate();
					endDrag.setDate(imsi-1);
				    var em = String(Number(endDrag.getMonth())+1);
				    if(em.length==1)
				    	em="0"+em;
				    var ed= String(endDrag.getDate());
					if(ed.length==1)
						ed="0"+ed;	
					
					//날짜간에 차이가 10일 이상이면 선택되지않게함
					if(gap>=10)
					{	alert('10일 이상은 예약이 불가합니다.');
						$('td').removeClass('fc-highlight');
					}
					else{
					$('#checkIn').val(mm+"/"+dd+"/"+yyyy);
		 			$('#out').val(em+"/"+ed+"/"+endDrag.getFullYear());
		 			
					}
				}
			else{
	 			$('#checkIn').val(mm+"/"+dd+"/"+yyyy);
	 			$('#out').val(mm2+"/"+dd2+"/"+yyyy2);
				}
			
				roomSearch();
			}
			
		});

		// load the list of available timezones, build the <select> options
		$.getJSON('php/get-timezones.php', function(timezones) {
			$.each(timezones, function(i, timezone) {
				if (timezone != 'UTC') { // UTC is already in the list
					$('#timezone-selector').append(
						$("<option/>").text(timezone).attr('value', timezone)
					);
				}
			});
		});

		// when the timezone selector changes, dynamically change the calendar option
		$('#timezone-selector').on('change', function() {
			$('#calendar').fullCalendar('option', 'timezone', this.value || false);
		});
	});
	$('td .fc-day').selectable();
	
	
</script>
<style>

	.left { float: left }
	.right { float: right }
	.clear { clear: both }

	#script-warning, #loading { display: none }
	#script-warning { font-weight: bold; color: red }

	#calendar {
		max-width: 900px;
		margin: 40px auto;
		padding: 0 10px;
	}

	.tzo {
		color: #000;
	}
	a {
	text-decoration:none;
	}
	#mtwrapper {
    padding-bottom: 110px;
    padding-top: 0px;
}
#breadcrumbs_inner {
    margin-bottom: 50px;
}

</style>
</head>  
<body style="background-color: white">  
<!-- // authorize // -->
<jsp:include page="/WEB-INF/view/include/header.jsp"/>


<!-- main-cont -->

<div class="main-cont">
  <!-- 해당 페이지 설명 start -->
   <div class="inner-page">
      <div class="inner-breadcrumbs" id='breadcrumbs_inner'>
         <div class="content-wrapper">
            <div class="page-title"><b>펜션 - 객실보기</b></div>
            <div class="breadcrumbs">
                 <a href="/member/index.do">Home</a> / <a href="/member/pensionSearch.do?page=1&opt=what">펜션찾기</a> / <span>객실보기</span>
               </div>
               <div class="clear"></div>
            </div>      
      </div>
   </div>
   <!-- 해당 페이지 설명 end -->  
  <div class="body-wrapper" id="mtwrapper">
    <div class="wrapper-padding">
    
   
    
	<div class="sp-page">
	    <input type="hidden" id='shot' value='${Pension.penShot }'>
      <input type="hidden" id='ehot' value='${Pension.penEhot }'>
<input type ="hidden" id = 'ad' value ="${Pension.penAddr2}"/>
<input type ="hidden" id = 'na' value ="${Pension.penName}"/>
		<div class="sp-page-a">
			<div class="sp-page-l">
  				<div class="sp-page-lb">
  				<div class="sp-page-p">
  					<div class="h-tabs">
  						<div class="h-tabs-left">
  							<div class="h-tab-i active">
  								<a href="#" class="h-tab-item-01">
  									<i></i>
  									<span>펜션 사진</span>
  									<span class="clear"></span>
  								</a>
  							</div>
  							<div class="h-tab-i">
  								<a href="#" class="h-tab-item-02 initMap">
  									<i></i>
  									<span>주변 정보</span>
  									<span class="clear"></span>
  								</a>
  							</div> 
  								<div class="h-tab-i">
  								<a href="#" class="h-tab-item-04 initMap">
  									<i></i>
  									<span>길 찾기</span>
  									<span class="clear"></span>
  								</a>
  							</div> 						
  							<div class="h-tab-i">
  								<a href="#" class="h-tab-item-03">
  									<i></i>
  									<span>일정</span>
  									<span class="clear"></span>
  								</a>
  							</div>  							
  						</div>
  						<div class="h-tabs-right">
  							<a href="#">
  								<i></i>
<!--   								<span id='conf'>more hotels</span> -->
  								<div class="clear"></div>
  							</a>
  						</div>
  						<div class="clear"></div>
  					</div>  					
  					<div class="mm-tabs-wrapper">
  					<!-- // tab item // -->
  						<div class="tab-item">
  							<div class="tab-gallery-big">
  								<img id='big' alt="" src="/uploadPhoto/${Pension.phothList[0].fullname}">
  							</div>
  							<div class="tab-gallery-preview">
  								<div id="gallery">
  									<!-- // -->
  									<div class="gallery-i active">
  										<a style="cursor:pointer" href="/uploadPhoto/${Pension.phothList[0].fullname}"><img class='small'  alt="" src="/uploadPhoto/${Pension.phothList[0].fullname}"><span></span></a>
  									</div>
  									<!-- \\ -->
  									<!-- // -->
  									<c:forEach var ="j" begin="2" end='${fn:length(Pension.phothList)}' step='1' >
  									<div class="gallery-i">
  										<a href="/uploadPhoto/${Pension.phothList[j-1].fullname}" style="cursor:pointer"><img class='small' alt="" src="/uploadPhoto/${Pension.phothList[j-1].fullname}"><span ></span></a>
  									</div>
  									</c:forEach>
  									<!-- \\ -->
  								</div>
  							</div>
  						</div>
  					<!-- \\ tab item \\ -->	
  					<!-- // tab item // -->
  						<div class="tab-item">
  						<div id="preloader">
			    			<div id="spinner"></div>
			    		</div>
  							<div class="tab-map">
  								<div class="contact-map">
                				<div class="map_wrap">
                					<div id="map" ></div>
                					 <ul id="category">
        <li id="BK9" data-order="0"> 
            <span class="category_bg bank"></span>
            은행
        </li>       
        <li id="MT1" data-order="1"> 
            <span class="category_bg mart"></span>
            마트
        </li>  
        <li id="PM9" data-order="2"> 
            <span class="category_bg pharmacy"></span>
            약국
        </li>  
        <li id="OL7" data-order="3"> 
            <span class="category_bg oil"></span>
            주유소
        </li>  
        <li id="CE7" data-order="4"> 
            <span class="category_bg cafe"></span>
            카페
        </li>  
        <li id="CS2" data-order="5"> 
            <span class="category_bg store"></span>
            편의점
        </li>
           <li id="AT4" data-order="6"> 
            <span class="category_bg attr"></span>
      관광명소
        </li> 
    </ul>
    </div>
              					</div>
              				</div>
  						</div>
  					<!-- \\ tab item \\ -->
  					<div class="tab-item">
  						<div id="preloader1">
			    			<div id="spinner"></div>
			    		</div>
  							<div class="tab-map">
  								<div class="contact-map" style="overflow:hidden;">
  						 <div id="map1"></div>		
  						 
                         <div id="selectAddr">
                                <div class="sAddr">
                                   <label for="input_roadAddress" class="map_start">출발 </label>
                                   <input class="form-control normal-size adr" id="startAddr" type="text" name="startAddr" readonly placeholder="출발주소를 입력해주세요." value="" />                    
                                        <button type="button" class="btn btn-yeogi btn-normal-layer" onclick="daumPostCode()" >주소검색</button>
                                        
                                     </div>
                                     <div class="eAddr">
                                        <label class="map_dochak">도착 </label>
                                        <input class="form-control normal-size adr" id="endAddr" type="text" name="endAddr" readonly value="${Pension.penAddr2}" />
                                        <button type="button" class="btn btn-yeogi btn-normal-layer" onclick="FindRoad()" >경로 검색</button>
                                     </div>
                                     <div class="detailAddr" style="margin-bottom:10px;">
											<p id='roadInfo'/><br/>
											<ol id='detailAddr' class='rounded-list'>
											
											</ol>

                            		</div>
                             </div>
                             
                               
                                 
                             </div>
              				</div>
  						</div>
  					<!-- // tab item // -->
  						<div class="tab-item" id='fullCal'>
  							<div class="calendar-tab">
								<div class="calendar-tab-select">
 									<label> 날짜를 선택해주세요.</label>

								</div>
								 
								 <div id='calendar'></div>
									<div class="clear"></div>
	
  							</div>
  						</div>
  					<!-- \\ tab item \\ -->	
  									
  				</div>
  				
  				<div class="content-tabs">
  					<div class="content-tabs-head last-item">
  						<nav>
  							<ul class='cal'>
  								<li><a class="active" href="#">펜션 정보</a></li>
  								<li><a id='viewRooms' href="#">객실 보기</a></li>
  								<li><a href="#">사용 옵션</a></li>
  								<li><a href="#">리뷰</a></li>
  							  <li><a href="#" class="tabs-lamp"></a></li>
                </ul>
  						</nav>
  						
  						<div class="clear"></div>
  					</div>
  					<div class="content-tabs-body" style="border:solid #d3d3d3">
  						<!-- // content-tabs-i // -->
  						<div class="content-tabs-i">
  							<h1>${Pension.penName}</h1>
  							<h2 class="title">펜션 주의사항 </h2>
  							<p>${Pension.penNoti} </p>
							<br/>
							<h2 class="title">펜션 취소 및 환불 규정</h2>
							<ul class="ruleList">
								<li>체크인 기준 8일 전 : 100% 환불</li>
								<li>체크인 기준 5~7일 전 : 90% 환불</li>
								<li>체크인 기준 4일 전 : 80% 환불</li>
								<li>체크인 기준 3일 전 : 70% 환불</li>
								<li>체크인 기준 2일 전 : 50% 환불</li>
								<li>체크인 기준 1일 전 : 30% 환불</li>
								<li>체크인 당일 및 No-show : 환불불가</li>
							</ul>
							<p>＊ 취소, 환불시 수수료가 발생할 수 있습니다.</p>
							<h2 class="title">기본 정보</h2>
							<ul class="ruleList2">
								<li>입실 : 15:00 | 퇴실 : 11:00</li>
								<li>무료 Wi-Fi</li>
								<li>전 객실 금연</li>
								<li>무료 주차</li>
							</ul>
  						</div>
  						<!-- \\ content-tabs-i \\ -->
  						<!-- // content-tabs-i // -->
  						<div id ='selCal'class="content-tabs-i">
  							<h2>예약 날짜 선택</h2>
  							<div class="rates-search">
                  <div class="rates-line">
        						<!-- // -->
        						<div class="srch-tab-line">
        							<div class="srch-tab-left">
        								<label>Check in</label>
        								<c:choose>
										<c:when test='${sessionScope.search.checkIn ne null }'>
										<div class="input-a"><input id='checkIn' type="text" value="${sessionScope.search.checkIn}" placeholder="mm/dd/yy" readonly></div>
										</c:when>
										<c:otherwise>
										<div class="input-a"><input id='checkIn'  type="text" value="" placeholder="mm/dd/yy" readonly></div>
										<script>
										var today= new Date();
										var month=today.getMonth()+1;
										var date =today.getDate();
										if((""+month).length ==1)
											month = "0" + month;
										if((""+date).length ==1)
											date = "0" + date;
										var day= month+"/"+date+"/"+today.getFullYear();
										$("#checkIn").val(day);
										</script>
										</c:otherwise>
										</c:choose>	        								
        							</div>
        							<div class="srch-tab-right">
        								<label>Check out</label>
        								<c:choose>
										<c:when test='${sessionScope.search.checkOut ne null }'>
										<div class="input-a"><input id='out' name='out' type="text" value="${sessionScope.search.checkOut}" placeholder="mm/dd/yy" readonly></div>	
										</c:when>
										<c:otherwise>
										<div class="input-a"><input id='out' name='out' type="text" value="" placeholder="mm/dd/yy" readonly></div>	
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
								</c:otherwise>
								</c:choose>
        							</div>
        							<div class="clear"></div>
        						</div>
        						<!-- \\ -->
                  </div>
                   
                  <div class="rates-line-right">
        						<!-- // -->
        						<div class="srch-tab-line no-margin-bottom">

        							<div class="srch-tab-3c">
        								<label>인원</label>
        								<div class="select-wrapper">
        								<select name='persons' id='persons' class="custom-select">
        								<c:forEach var="i" begin="2" end="20" step="1">
        								<c:choose>
        								<c:when test="${sessionScope.search.persons eq i}">
        									<option selected="selected">${i}</option>
        								</c:when>
        								<c:otherwise>
        									<option>${i}</option>
        								</c:otherwise>
        								</c:choose>
        								</c:forEach>
        								</select>
        								</div>
        							</div>
                       
        							<div class="clear"></div>
        						</div>
        						<!-- \\ --> 
                                  
                  </div>
								
							
							<div class="clear"></div>
							
							<div class="rates-devider"></div>
							
							<h2>Room Type</h2>
							
							<div class="available-row">
							<c:if test="${not empty Rooms}">
							<!-- // -->			
											
							<c:forEach var="i" begin="1" end="${fn:length(Rooms)}" step="1"  >
							<div class="cat-list-item">
			                     	<div class="cat-list-item-l">
			                      			<b><img style="width:167px;height:125px; cursor:pointer;" alt="" src="/uploadPhoto/${Rooms[i-1].photoList[0].fullname}"></b>
			                 			</div>
			                  		<div class="cat-list-item-r">
			                    			<div class="cat-list-item-rb">
			                      			<div class="cat-list-item-p">
			                        			<div class="cat-list-content">
			                          			<div class="cat-list-content-a">
			                            			<div class="cat-list-content-l">
			                              			<div class="cat-list-content-lb">
			                                			<div class="cat-list-content-lpadding">
			                                  			<div class="offer-slider-link"><a href="#">${Rooms[i-1].romName} / ${Rooms[i-1].romType} </a></div>
			                                  			<div class="offer-slider-location">최대 인원: ${Rooms[i-1].romPeople}  persons</div>
			                                  			<p>${Rooms[i-1].romIntro}</p>
			                                  			<p class="opt" style="display:none;">${Rooms[i-1].romOpt}</p>
			                                  			<div class="room-icons">
			                                  			 <c:if test="${fn:contains(Rooms[i-1].romOpt,'침대')}">
			                                    			<span class="romOpt bed active"></span>
			                                    			</c:if>
			                                    			<c:if test="${fn:contains(Rooms[i-1].romOpt,'TV')}">
			                                    			<span class="romOpt TV active"></span>
			                                    			</c:if>
			                                    			<c:if test="${fn:contains(Rooms[i-1].romOpt,'냉장고')}">
			                                    			<span class="romOpt ref active"></span>
			                                    			</c:if>
			                                    			<c:if test="${fn:contains(Rooms[i-1].romOpt,'쇼파')}">
			                                    			<span class="romOpt sofa active"></span>
			                                    			</c:if>
			                                    			<c:if test="${fn:contains(Rooms[i-1].romOpt,'옷장')}">
			                                    			<span class="romOpt dra active"></span>
			                                    			</c:if>	
			                                    			<c:if test="${fn:contains(Rooms[i-1].romOpt,'화장대')}">
			                                    			<span class="romOpt makeup active"></span>
			                                    			</c:if>				
			                                    			<c:if test="${fn:contains(Rooms[i-1].romOpt,'전기밥솥')}">
			                                    			<span class="romOpt rice active"></span>
			                                    			</c:if>
			                                    			<c:if test="${fn:contains(Rooms[i-1].romOpt,'전자레인지')}">
			                                    			<span class="romOpt micro active"></span>
			                                    			</c:if>	
			                                    			<c:if test="${fn:contains(Rooms[i-1].romOpt,'인덕션')}">
			                                    			<span class="romOpt induc active"></span>
			                                    			</c:if>	
			                                    			<c:if test="${fn:contains(Rooms[i-1].romOpt,'가스레인지')}">
			                                    			<span class="romOpt gas active"></span>
			                                    			</c:if>
			                                    			<c:if test="${fn:contains(Rooms[i-1].romOpt,'취사도구')}">
			                                    			<span class="romOpt che active"></span>
			                                    			</c:if>
			                                    			<c:if test="${fn:contains(Rooms[i-1].romOpt,'커피포트')}">
			                                    			<span class="romOpt coffee active"></span>
			                                    			</c:if>		
			                                    			<c:if test="${fn:contains(Rooms[i-1].romOpt,'헤어드라이기')}">
			                                    			<span class="romOpt hair active"></span>
			                                    			</c:if>	
			                                    			<c:if test="${fn:contains(Rooms[i-1].romOpt,'정수기')}">
			                                    			<span class="romOpt water active"></span>
			                                    			</c:if>	
			                                    			<c:if test="${fn:contains(Rooms[i-1].romOpt,'욕실용품')}">
			                                    			<span class="romOpt shower active"></span>
			                                    			</c:if>	
			                                    			<c:if test="${fn:contains(Rooms[i-1].romOpt,'스파')}">
			                                    			<span class="romOpt spa active"></span>
			                                    			</c:if>		           			                                    		
			                                    			<div class="clear"></div>
			                                  			</div>
			                                			</div>
			                              			</div>
			                              			<br class="clear">
			                            			</div>
			                          			</div>
			                          			<div class="cat-list-content-r">
			                            			<div class="cat-list-content-p">
			                            			<fmt:formatNumber var='Cost' value="${Rooms[i-1].romCost}" type="number"/>			                            			
			                              			<div class="available-price">￦ ${Cost}</div>
			                              			<div class="available-price-a">avg/night</div> 
<!-- 			                              			<div class="available-price-c">9 available</div>  -->
											<%if(memId!=null){ %>
			                              			<a id='preReserve' class="available-btn goReserve">예약 하기</a>
			                              			<input type="hidden" value='${Rooms[i-1].romId}'>
			                              			<input type="hidden" value='${Pension.penId}'>
			                              			<input type="hidden" value='${Rooms[i-1].romCost}'>			                              			
			                               		<%}else{%>
			                               		<a id='goLogin2' style="cursor:pointer;" class="available-btn" >예약 하기</a>
			      								 <% }%>
			                               			</div>
			                          			</div>
			                          			<div class="clear"></div>
			                        			</div>
			                      			</div>
		                    			</div>
		                    			<br class="clear">	                 			
		                  			</div>
		                  			<div class="room_detail">
			                  				<p>x</p>						  
					    					<div class="bxslider2">    
					    					<c:forEach var ="roomPhoto" begin="1" end="${fn:length(Rooms[i-1].photoList)}" step="1"> 
					    					  <div><img src="/uploadPhoto/${Rooms[i-1].photoList[roomPhoto-1].fullname}" ></div>
											</c:forEach>
											</div>										
										
			                  		</div>
		                  			<div class="clear"></div>
		            				
		            				</div>
		            				</c:forEach>
                			<span class="availabe-more">load more results</span>		
							   </c:if>
							   </div>					  
							
  							</div>
  						</div>
  						<!-- \\ content-tabs-i \\ -->
  						<!-- // content-tabs-i // -->
  						<div class="content-tabs-i">
  							<h2>펜션 옵션</h2>
  							<c:set var="penOpt" value="${Pension.penOpt}"/>    
  							<p>* 예약시 추가 요금이 붙는 옵션이 있습니다.</p>
  							<ul class="preferences-list">
  								<li class="internet">와이파이</li>
<!--   								<li class="conf-room">Conference room</li> -->
								<c:if test="${fn:contains(penOpt,'족구장')}">
  								<li class="play-place">족구장</li>
  								</c:if>
  								<c:if test="${fn:contains(penOpt,'레스토랑')}">
  								<li class="restourant">식당</li>
  								</c:if>
  								<c:if test="${fn:contains(penOpt,'카페')}">
  								<li class="bar">카페</li>
  								</c:if>
  								<c:if test="${fn:contains(penOpt,'갯벌체험')}">						
  								<li class="doorman">갯벌체험</li>
  								</c:if>						
 
  							<c:if test="${fn:contains(penOpt,'BBQ')}">
  								<li class="kitchen">BBQ</li>
  								</c:if>
							<c:if test="${fn:contains(penOpt,'바다낚시')}">
  								<li class="entertaiment">바다낚시</li>
  								</c:if>
							<c:if test="${fn:contains(penOpt,'수영장')}">
  								<li class="pool">수영장</li>
  								</c:if>
  								<li class="parking">무료주차</li>
							<c:if test="${fn:contains(penOpt,'반려견동반')}">
  								<li class="pets">반려견 동반</li>
  								</c:if>
  								<li class="secure">CCTV </li>
  							</ul>
  							<div class="clear"></div>
  							<div class="preferences-devider"></div>

  							<div class="clear"></div>
  						</div>
  						<!-- \\ content-tabs-i \\ -->
  						<!-- // content-tabs-i // -->
  						<div class="content-tabs-i">
  							<div class="reviews-a">

							<div class="reviews-c">
								<div class="reviews-l">
									<div class="reviews-total">${Pension.avgStar}.0/5.0</div>
									<nav class="reviews-total-stars">
										<ul>
											<c:forEach var="k" begin="1" end="5" step="1">            
            										<c:choose>
            										<c:when test="${k le Pension.avgStar}">
            											<li><a href="#"><img alt="" src="/img/r-stars-total-b.png"></a></li>
            										</c:when>
            										<c:otherwise>
            											<li><a href="#"><img alt="" src="/img/r-stars-total-a.png"></a></li>
            										</c:otherwise>
            										</c:choose>
            										</c:forEach>
            										</ul>
										<div class="clear"></div>
									</nav>
								</div>
							
							</div>
							<div class="clear"></div>
							
							<div class="reviews-devider"></div>
							

							
							<div class="guest-reviews">
								<h2>Guest Reviews</h2>
								 <c:forEach var="i" begin="1" end="${fn:length(Reviews)}" step="1"  >
								<div class="guest-reviews-row">
									<!-- // -->
										<div class="guest-reviews-i">
										<div class="guest-reviews-a">
											<div class="guest-reviews-l">
												<div class="guest-reviews-img">
													<span>${Reviews[i-1].revStar}</span>
													<img alt="" src="/img/guest-01.png">
												</div>
											</div>
											<div class="guest-reviews-r">
  												<div class="guest-reviews-rb">
												<div class="guest-reviews-b">
												<div class="guest-reviews-bl">
  													<div class="guest-reviews-blb">
														<div class="guest-reviews-lbl">${Reviews[i-1].revTitle}</div>
														<div class="guest-reviews-lbl-a">${Reviews[i-1].romName }</div>
														<div class="guest-reviews-txt">${Reviews[i-1].revContext}</div>
  													</div>
  													<br class="clear" />
												</div>
												</div>
												<div class="guest-reviews-br">  													
  													<div class="guest-reviews-padding">
  													<nav>
  														<ul>
  														<c:forEach var="k" begin="1" end="5" step="1">            
            											<c:choose>
            											<c:when test="${k le Reviews[i-1].revStar}">
            												<li><img alt="" src="/img/g-star-b.png"></li>
            											</c:when>
            											<c:otherwise>
            											<li><img alt="" src="/img/g-star-a.png"></li>
            											</c:otherwise>
            											</c:choose>
            											</c:forEach>
  														</ul>
  													</nav>
  													<div class="guest-rating">${Reviews[i-1].revStar}/5.0</div>
  													<div class="clear"></div>
  													<div class="guest-rating-txt">${Reviews[i-1].memId}</div>
  													</div>
												</div>
  												</div>
  												<br class="clear" />
												</div>
											</div>
											<div class="clear"></div>
										</div>
									<!-- \\ -->
									<!-- // -->
								</div>
								</c:forEach>
								<a href="#" class="guest-reviews-more">load more reviews</a>                      
							</div>		
  						</div>
  						</div>
  						<!-- \\ content-tabs-i \\ -->
  					</div>
  				</div>

  				</div>
  				
  				</div>
  				<div class="clear"></div>
			</div>
		</div>

		<div class="sp-page-r">
			<div class="h-detail-r" style="border:solid #d3d3d3">
				<div class="h-detail-lbl">
					<div class="h-detail-lbl-a" >${Pension.penName} </div>
					<div class="h-detail-lbl-b">${Pension.penAddr},${Pension.penAddr2}</div>
				</div>
				<div class="h-detail-stars">
					<ul class="h-stars-list">
					<c:forEach var="k" begin="1" end="5" step="1">            
            		<c:choose>
            		<c:when test="${k le Pension.avgStar}">
            		<li><a href="#"><img alt="" src="/img/hd-star-b.png"></a></li>
            		</c:when>
            		<c:otherwise>
            		<li><a href="#"><img alt="" src="/img/hd-star-a.png"></a></li>
            		</c:otherwise>
            		</c:choose>
            		</c:forEach>				
					</ul>
					<div class="h-stars-lbl">${Pension.revCnt} reviews</div>
<!-- 					<a href="#" class="h-add-review">add review</a> -->
					<div class="clear"></div>
				</div>
				<div class="h-details-text">
					<p>${Pension.penIntro} </p>
					
				</div>

			</div>
			
		<div class="h-help" style="border:solid #d3d3d3">
				<div class="h-help-lbl">질문 사항이 있으신가요?</div>
				<div class="h-help-lbl-a">'여기 없대' 가 도와드릴게요!</div>
				<div class="h-help-phone">031-548-1577</div>
				<div class="h-help-email">HereToStay@gmail.com</div>
			</div>
			
			
			<div class="h-liked" style="border:solid #d3d3d3">
				<div class="h-liked-lbl">이런 펜션은 어떠신가요?</div>
				<div class="h-liked-row">
					<!-- // -->
					
					
					<c:forEach var ="r" begin="1" end="${fn:length(recoPension)}" step="1">
				
					<div class="h-liked-item">
					<div class="h-liked-item-i">
						<div class="h-liked-item-l">
  							<a href="/member/pensionDetail.do?id=${recoPension[r-1].penId}"><img style="width:81px;height:61px" alt="" src="/uploadPhoto/${recoPension[r-1].phothList[0].fullname}"></a>
						</div>
					<div class="h-liked-item-c">
  						<div class="h-liked-item-cb">
    						<div class="h-liked-item-p">
								<div class="h-liked-title"><a href="/member/pensionDetail.do?id=${recoPension[r-1].penId}">${recoPension[r-1].penName}</a></div>
								<div class="h-liked-rating">
								 <nav class="stars">
									<ul>
										<c:forEach var="av" begin="1" end="5" step="1">            
            							<c:choose>
            							<c:when test="${av le recoPension[r-1].avgStar}">
            								<li><a href="/member/pensionDetail.do?id=${recoPension[r-1].penId}"><img alt="" src="/img/star-b.png" /></a></li>
            							</c:when>
            							<c:otherwise>
            								<li><a href="/member/pensionDetail.do?id=${recoPension[r-1].penId}"><img alt="" src="/img/star-a.png" /></a></li>
            							</c:otherwise>
            							</c:choose>
            							</c:forEach>
									</ul>
									<div class="clear"></div>
								 </nav>
								</div>
								<div class="h-liked-foot">
								<fmt:formatNumber var='recopenCost' value="${recoPension[r-1].minCost}" type="number"/>			                            			
			                        <span class="h-liked-price">￦ ${recopenCost} 원</span>
									<span class="h-liked-comment">avg/night</span>
								</div>
    						</div>
  						</div>
  					<div class="clear"></div>
					</div>
					</div>
					<div class="clear"></div>	
					</div>
					</c:forEach>
	
				</div>			
			</div>
			
			<div class="h-reasons" style="border:solid #d3d3d3">
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
  <script>
  	$(document).ready(function(){
		'use strict';
		$('.review-ranger').each(function(){    
		  var $this = $(this);
		  var $index = $(this).index();
		  if ( $index=='0' ) {
			var $val = '3.0'
		  } else if ( $index=='1' ) {
			var $val = '3.8'
		  } else if ( $index=='2' ) {
			var $val = '2.8'
		  } else if ( $index=='3' ) {
			var $val = '4.8'
		  } else if ( $index=='4' ) {
			var $val = '4.3'
		  } else if ( $index=='5' ) {
			var $val = '5.0'
		  }
		  $this.find('.slider-range-min').slider({
			range: "min",
			step: 1,
			value: $val,
			min: 0.1,
			max: 5.0,
			create: function( event, ui ) {
			  $this.find('.ui-slider-handle').append('<span class="range-holder"><i></i></span>');
			},
			slide: function( event, ui ) {
			  $this.find(".range-holder i").text(ui.value);
			}
		  });
		  $this.find(".range-holder i").text($val);
		});

    	$('#reasons-slider').bxSlider({
        	infiniteLoop: true,
        	speed: 500,
          mode:'fade',
        	minSlides: 1,
        	maxSlides: 1,
        	moveSlides: 1,
        	auto: true,
        	slideMargin: 0      
    	});
      
      $('#gallery').bxSlider({
        	infiniteLoop: true,
        	speed: 500,
        	slideWidth: 108,
        	minSlides: 1,
        	maxSlides: 6,
        	moveSlides: 1,
        	auto: false,
        	slideMargin: 7      
    	});
      
      Number.prototype.format = function(){
    	  if(this==0) return 0;
    	  var reg = /(^[+-]?\d+)(\d{3})/;
    	  var n = (this + '');
    	  while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');
    	  return n;
    	  };
    	  // 문자열 타입에서 쓸 수 있도록 format() 함수 추가
    	  String.prototype.format = function(){
    	  var num = parseFloat(this);
    	  if( isNaN(num) ) return "0";
    	  return num.format();
    	  };
  
  		<c:if test="${fn:length(Pension.phothList) lt 6}">
    	$('.bx-controls-direction .bx-next').attr('id','bx-next');
    	$('.bx-controls-direction .bx-prev').attr('id','bx-prev');
    	$('#bx-next').off();
    	$('#bx-prev').off();
  		$('.bx-controls-direction a').removeAttr('href');
  		</c:if>
  	
  	});	
 
	function roomSearch(){
		
		var Id = '${Pension.penId}';
		var cIn = $('#checkIn').val();
		var cOut = $('#out').val();
		var peo =$('#persons').val();
		
		  $.ajax({
			  type:'GET',
			  contentType:"application/x-www-form-urlencoded; charset=UTF-8",
			   data : {
             Id : Id,
             cIn:cIn,
             cOut:cOut,
             peo:peo
     	 },
        url:'/member/pensionDetailRooms.do',
        success:function(responsedata){ 
      	  
        	
      	  var data =JSON.parse(responsedata);      	  
      	  var contents="";      	
      	  if(data.rooms.length==0){
      		  
      		  contents+='<div><img src="/img/member/FAILroomsearch.png"></div><div class="clear"/>조건에 맞는 객실이 없습니다. 다시 검색해주세요.';
      			 
      	       $('.available-row').empty();
      	       $('.available-row').append(contents); 	
      		  
      	  }
      	  else{
      	  for(var i=0;i<data.rooms.length;i++){   
      		  //룸 정보를 새로 받아 동일 하게 append 하는 것
      	  contents+='<div class="cat-list-item">' +
      	  				'<div class="cat-list-item-l">'+
                  		'<b><img style="width:167px;height:125px" alt="" src="/uploadPhoto/'+data.phoList[i].fPhto[0].photo+'"></b>'
             			+'</div>'+
              			'<div class="cat-list-item-r">'+
                		   '<div class="cat-list-item-rb">'+
                  			'<div class="cat-list-item-p">'+
                    		  '<div class="cat-list-content">'+
                      			'<div class="cat-list-content-a">'+
                        		  '<div class="cat-list-content-l">'+
                          			'<div class="cat-list-content-lb">'+
                            		   '<div class="cat-list-content-lpadding">'+
                              		   '<div class="offer-slider-link"><a href="#">'+data.rooms[i].romName+' / '+ data.rooms[i].romType +'</a></div>'+
                              	     	'<div class="offer-slider-location">최대 인원:'+ data.rooms[i].romPeople +' persons</div>'+
                              			'<p>'+data.rooms[i].romIntro+'</p>'+
                              			'<p class="opt" style="display:none;">'+data.rooms[i].romOpt+'</p>'+                              		
                              			'<div class="cat-icons">'+
                                			'<span class="cat-icon-01 active"></span>'+
                                			'<span class="cat-icon-02"></span>'+
                                			'<span class="cat-icon-03"></span>'+
                                			'<span class="cat-icon-04"></span>'+
                                			'<span class="cat-icon-05"></span>'+
                                			'<span class="cat-icon-06"></span>'+
                                			'<div class="clear"></div>'+
                              			'</div>'+
                            			'</div>'+
                          			'</div>'+
                          			'<br class="clear">'+
                        			'</div>'+
                        			
                      			'</div>'+
                      			'<div class="cat-list-content-r">'+
                        			'<div class="cat-list-content-p">'+
                          			'<div class="available-price"> ￦ '+ (data.rooms[i].romCost).format()+'</div>'+
                          			'<div class="available-price-a">avg/night</div> '+
							<%if(memId!=null){ %>
                          			'<a id="preReserve" class="available-btn goReserve">예약 하기</a>'+
                          			'<input type="hidden" value='+data.rooms[i].romId +'>'+
                          			'<input type="hidden" value='+Id+'>'+
                          			'<input type="hidden" value='+data.rooms[i].romCost +'>'+	
                           		<%}else{%>
                           		'<a id="goLogin2" class="available-btn">예약 하기</a>'+  								 
                               		<% }%>	
                           			'</div>'+
                      			'</div>'+
                      			'<div class="clear"></div>'+
                    			'</div>'+
                  			'</div>'+
            			'</div>'+
            			'<br class="clear">'+
          			'</div>'+
          			'<div class="room_detail">'+
      				'<p>x</p>'+				  
					'<div class="bxslider2">';
					for(var j=0;j<data.phoList[i].fPhto.length;j++){
				contents+= '<div><img src="/uploadPhoto/'+data.phoList[i].fPhto[j].photo+'"></div>';
					}
				contents+='</div>'+										
					'</div>'+
          		'<div class="clear"></div>'+    				
    			'</div>';
      	  }
		contents+='<a href="#" class="availabe-more">load more results</a>';
	
      	  
      	  $('.available-row').empty();
      	  $('.available-row').append(contents); 	  
      	bx_add();
      	  
        	}
        }
        });		
	}	
	
	 $(document).on("click",'#goLogin2',function(){                       		
			
		 $('.autorize-popup2').animate({top: '50%'}, 300).find('input:text').eq('0').focus();
		$('.overlay').css('display','block');	
		
	 });      
	 $(document).on("click",".goReserve",function(){
		 var romId=$(this).next().val();
		 var penId=$(this).next().next().val();
		 var romCost=$(this).next().next().next().val();
		 var cIn =$('#checkIn').val();
		 var cOut=$('#out').val();	 
	     var peo=$('#persons').val();
		 
		 var h ='/member/reservation.do?romId='+romId+'&penId='+penId+'&romCost='+romCost+'&cIn='+cIn+'&cOut='+cOut+'&peo='+peo;
 		 $(this).attr('href',h);
	});	 
	$('#persons').change(function(){
		
		roomSearch();
		
	});
	
	function bx_add(){
		
		$('.bxslider2').bxSlider({
		    mode: 'fade',
		    captions: false,
		    slideWidth: 600
		});
		
	}		
	$(document).on("click","#hide",function(){
		$('#hide').toggle(function() {
			$(this).html('펼치기');
		  $("#detailAddr").children().slideUp();
		}, function() {
		  $(this).html('접기');
		  $("#detailAddr").children().slideDown();
	});
});
  </script>
  <style>
#preReserve{ cursor:pointer;}
#goLogin2{cursor:pointer;}
.map_wrap, .map_wrap * {margin:0; padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap {position:relative;}
#category {position:absolute;top:10px;left:10px;border-radius: 5px; border:1px solid #909090;box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);background: #fff;overflow: hidden;z-index: 2;}
#category li {float:left;list-style: none;width:50px;px;border-right:1px solid #acacac;padding:6px 0;text-align: center; cursor: pointer;}
#category li.on {background: #eee;}
#category li:hover {background: #ffe6e6;border-left:1px solid #acacac;margin-left: -1px;}
#category li:last-child{margin-right:0;border-right:0;}
#category li span {display: block;margin:0 auto 3px;width:27px;height: 28px;}
#category li .category_bg {background:url(/img/member/download1.png) no-repeat;}
#category li .bank {background-position: -10px 0;}
#category li .mart {background-position: -10px -36px;}
#category li .pharmacy {background-position: -10px -72px;}
#category li .oil {background-position: -10px -108px;}
#category li .cafe {background-position: -10px -144px;}
#category li .store {background-position: -10px -180px;}
#category li .attr {background-position: -10px -216px;}
#category li.on .category_bg {background-position-x:-46px;}
.placeinfo_wrap {position:absolute;bottom:28px;left:-150px;width:300px;}
.placeinfo {position:relative;width:100%;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;padding-bottom: 10px;background: #fff;}
.placeinfo:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
.placeinfo_wrap .after {content:'';position:relative;margin-left:-12px;left:50%;width:22px;height:12px;background:url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
.placeinfo a, .placeinfo a:hover, .placeinfo a:active{color:#fff;text-decoration: none;}
.placeinfo a, .placeinfo span {display: block;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
.placeinfo span {margin:5px 5px 0 5px;cursor: default;font-size:13px;}
.placeinfo .title {font-weight: bold; font-size:14px;border-radius: 6px 6px 0 0;margin: -1px -1px 0 -1px;padding:10px; color: #fff;background: #d95050;background: #d95050 url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
.placeinfo .tel {color:#0f7833;}
.placeinfo .jibun {color:#999;font-size:11px;margin-top:0;}

.available-price{ font-size :13px}

#big{
width:723px;
heigth:432px;
}
.small{
width:108px;
height:75px;
}

/*17-12-12 수정*/
.ruleList,
.ruleList2{list-style-position:inside;}
.ruleList li,
.ruleList2 li{margin-bottom:5px; color:#353535;}
.content-tabs-i > p{margin-bottom:10px; color:#353535;}
.title{color:#000;}

/*17-12-13*/


ol {
    counter-reset: li; /* Initiate a counter */
    list-style: none; /* Remove default numbering */
    *list-style: decimal; /* Keep using default numbering for IE6/7 */
    font: 15px 'trebuchet MS', 'lucida sans';
    padding: 0;
    margin-bottom: 4em;
    text-shadow: 0 1px 0 rgba(255,255,255,.5);
}
.rounded-list li{
    position: relative;
    display: block;
    padding: .4em .4em .4em 2em;
    *padding: .4em;
    margin: 17px 10px;
    background: #f9f9f9;
    color: #222;
    text-decoration: none;
    font-size: 13px;
    border-radius: .3em;
    transition: all .3s ease-out;   
    width:90%;
    
}

.rounded-list li:hover{
    background: #eee;
}

/* .rounded-list li:hover:before{ */
/*     transform: rotate(360deg);   */
/* } */

.rounded-list li:before{
    content: counter(li);
    counter-increment: li;
    position: absolute; 
    left: -1.3em;
    top: 50%;
    margin-top: -1.3em;
    margin-left: 3px;
    background: #87ceeb;
    height: 2em;
    width: 2em;
    line-height: 2em;
    border: .3em solid #fff;
    text-align: center;
    font-weight: bold;
    border-radius: 2em;
    color:#fff;
    transition: all .3s ease-out;
}





</style>
<!-- \\ scripts \\ --> 
 
</body>  
</html> 